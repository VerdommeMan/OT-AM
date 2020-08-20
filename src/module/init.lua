local AreaV2 = require(script.AreaV2)
local AreaV7 = require(script.AreaV7)

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local module = {}

--settings, can be changed directly instead of using the setters (read/write)
module.Settings = {}
module.Settings.Heartbeat = 10 --max 60
module.Settings.FolderName = "MPRE: Areas" -- name used for the folder where the parts will be stored in for making Areas visible
module.Settings.Part = {  --contains the props of the part that will generated for that Area when its made visible
    Transparency = 0.7,
    Color = Color3.fromRGB(255, 85, 255),
    CastShadow = false,
    CanCollide = false,
    Anchored = true
}

--settings, cant be changed directly (read only)
module.Settings.AutoAddPlayersCharacter = true -- if this is set to false then the person must manually add the player characters he wants to track
module.Settings.TrackedCharacters = {} -- add models here that also need to be tracked next to the player, the model needs a PrimaryPart (this part will be tracked)

-- other stuff
local mtAreas = {} -- different mt table because i dont want to pollute Areas with metamethods
local Areas = {} -- a list of areas
mtAreas.__index = Areas

local function canUseAreaV2(CFrame) -- can only determine if i can use AreaV2 if they use the constructors with part or CFrame
   return false
end

local function checkIfAutoDetermineWhichArea(arg)
    if typeof(arg) == "Instance" then
        return canUseAreaV2(arg.CFrame)
    elseif typeof(arg) == "CFrame" then
        return canUseAreaV2(arg)
    end
    return false -- cant determine for these types
end

function module.addArea(uniqueName, ...) -- first param needs to be unique key for the area, then you add the constructor parameters and as last you have an optional override (by adding a bool at the end true is AreaV2 and false is AreaV7)
    local args = {...}

    if Areas[uniqueName] then
        error("That name already exists")
    elseif #args == 0 then
        error("Wrong given parameters")
    else
        local self = setmetatable({}, mtAreas) -- mt allows ppl to access other areas from this table

        if typeof(args[#args]) == "boolean" then -- the override
            table.remove(args)
            self.Area = args[#args] and AreaV2.new(args) or AreaV7.new(args)
        else
            self.Area = checkIfAutoDetermineWhichArea(args[1]) and AreaV2.new(...) or AreaV7.new(...)
        end
        self.enter = Instance.new("BindableEvent")
        self.leave = Instance.new("BindableEvent")
        self.onEnter = self.enter.Event
        self.onLeave = self.leave.Event
        self.chars = {}
        Areas[uniqueName] = self
        return self
    end
end

function module.removeArea(identifier)
    Areas[identifier] = nil
end

function module.getArea(indentifier)
    return Areas[indentifier]
end

local function isValidChar(char)
    return char and typeof(char) == "Instance" and char:IsA("Model") and char.PrimaryPart
end

function module.addCharacter(character, uniqueKey) --first param must be a model with a PrimaryPart set, second param is optional, it sets the key of the char (give here the player if you set it to manual) if second param is left empty then character will be used as key
    if character and isValidChar(character) then
        module.Settings.TrackedCharacters[uniqueKey or character] = character --ternary ftw
    else
        error("First parameter must be a model with a set PrimaryPart")
    end
end

function module.removeCharacter(key) -- give the key of the character that needs to be removed
    module.Settings.TrackedCharacters[key] = nil
end

local playerCharEvents = {} -- keeps a table of RBXScriptConnections
local players = {} -- table of keys so that these characters can be removed from the tracked list when autoCharacteradded turned off

local function addPlayerCharEvents()
    table.insert(playerCharEvents, Players.PlayerAdded:Connect(function(player)
        table.insert(players, player)
        table.insert(playerCharEvents, player.CharacterAdded:Connect(function(character)
            module.addCharacter(character, player)
        end))
    end))
end

local function removePlayerCharEvents()
    for _, event in ipairs(playerCharEvents) do
        event:Disconnect()
    end
    playerCharEvents = {}

    for _, player in ipairs(players) do 
        module.removeCharacter(player)
    end
    players = {}
end

addPlayerCharEvents()

function module.setAutoAddCharacter(bool) -- set this to false if you want to manually add the characters, you can turn it back on by setting it true again
    if bool == not module.Settings.AutoAddPlayersCharacter then
        if bool then
            addPlayerCharEvents()
        else
            removePlayerCharEvents()
        end
        module.Settings.AutoAddPlayersCharacter = bool
    else
        warn("The setting is already in this state")
    end
end

function module.switchMakeAreasVisible() -- call it to make the areas visible, call it again to make the areas invisible
    local folder = workspace:FindFirstChild(module.Settings.FolderName)
    if folder then
        folder:Destroy()
    else
        local newFolder = Instance.new("Folder")
        newFolder.Name = module.Settings.FolderName
        newFolder.Parent = workspace

        for key, area in pairs(Areas) do            
            local part = Instance.new("Part")

            for prop, value in pairs(module.Settings.Part) do
                part[prop] = value
            end
            part.Name = key
            part.CFrame , part.Size = area:getCF_Size()
            part.Parent = newFolder
        end
    end
end

local function coreLoop()
    for player, character in pairs(module.Settings.TrackedCharacters) do
        coroutine.wrap(function()
            for _, area in pairs(Areas) do
                local contains, currentChar = area.Area:isInArea(character.PrimaryPart.Position), area.chars[character]
                if not currentChar and contains then
                    area.enter:Fire(player, player == character) --returns true if its custom added character or false if its player (if true first param will be the character instead of player since a custom npc doesnt have a player object)
                    area.chars[character] = true
                    break
                elseif currentChar and not contains then
                    area.leave:Fire(player, player == character) --returns player and true if its custom added character or false if its player 
                    area.chars[character] = nil
                    break
                end
            end
        end)()
    end
end

local sumDt = 0
RunService.Heartbeat:Connect(function(dt)
    sumDt += dt
    if sumDt > 1 / module.Settings.Heartbeat then
        sumDt = 0
        coreLoop()
    end
end)

return module