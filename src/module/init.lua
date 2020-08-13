local Area = require(script.Area)

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local module = {}

-- Lookup table for metamethods
local metamethods = {
    __index = true,
    __newindex = true,
    __call = true,
    __concat = true,
    __unm = true,
    __add = true,
    __sub = true,
    __mul = true,
    __div = true,
    __mod = true,
    __pow = true,
    __tostring = true,
    __metatable = true,
    __eq = true,
    __lt = true,
    __le = true,
    __mode = true,
    __gc = true,
    __len = true
}

--settings, can be changed directly instead of using the setters
module.Settings = {}
module.Settings.Heartbeat = 5 --max 60
module.Settings.ExtraHumanoids = {} -- add models here that also need to be tracked next to the player, the model needs a PrimaryPart (this part will be tracked)
module.Settings.FolderName = "MPRE: Areas" -- name used for the folder where the parts will be stored in for making Areas visible
module.Settings.Part = {Transparency = 0.7, Color = Color3.fromRGB(255,85,255), CastShadow = false, CanCollide = false, Anchored = true} --contains the props of the part that will generated for that Area

--settings, cant be changed directly
module.Settings.AutoAddPlayersCharacter = true -- if this is set to false then the person must manually add the player characters he wants to track

-- other stuff
local Areas = {} -- a list of areas
Areas.__index = Areas

function module.addArea(uniqueName, ...) 
    if Areas[uniqueName] then
        error("That name already exists")
    else
        local self = setmetatable({}, Areas) -- mt allows ppl to access other areas from this table
        self.Area = Area.new(...)
        self.onEnter = Instance.new("BindableEvent")
        self.onLeave = Instance.new("BindableEvent")
        self.chars = {}
        Areas[uniqueName] = self
        return self
    end
end

function module.removeArea(identifier)
    if Areas[identifier] then
        Areas[identifier] = nil
    else
        error("That key doesnt exist or is already removed")
    end
end

function module.getArea(indentifier)
    return Areas[indentifier]
end

local function isValidChar(char)
    return char and typeof(char) == "Instance" and char:IsA("Model") and char.PrimaryPart
end

function module.addChar(char) -- must be a model with a PrimaryPart set
    if isValidChar(char) then
        table.insert(module.Settings.ExtraHumanoids, char)
    else
        error("Given paramter must be a model with a set PrimaryPart")
    end
end

function module.removeChar(char)
    if char and table.find(module.Settings.ExtraHumanoids, char) then
        table.remove(module.Settings.ExtraHumanoids,table.find(module.Settings.ExtraHumanoids, char))       
    else
        error("The char doesnt exist in the table") 
    end
end


local playerCharEvents = {} -- keeps a table of RBXScriptConnections
local playerChars = {}

local function addPlayerCharEvents() 
    local p = Players.PlayerAdded:Connect(function(player)
        local ca , cr
        ca = player.CharacterAdded:Connect(function(character)
            table.insert(playerChars, character)
        end)
        cr = player.CharacterRemoving:Connect(function(character)
            table.remove(playerChars, table.find(playerChars, character))
        end)
        table.insert(playerCharEvents, ca)
        table.insert(playerCharEvents, cr)
    end)
    table.insert(playerCharEvents, p)
end

local function removePlayerCharEvents()
    for _, event in ipairs(playerCharEvents) do 
        event:Disconnect()
    end
    playerCharEvents = {}
    playerChars = {}
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
    local folder  = workspace:FindFirstChild(module.Settings.FolderName)
    if folder then
        folder:Destroy()
    else
        local newFolder = Instance.new("Folder")
        newFolder.Name = module.Settings.FolderName
        newFolder.Parent = workspace

        for key, area in pairs(Areas) do
            if not metamethods[key] then
                local Region = Region3.new(area.Area.MinV, area.Area.MaxV)
                local part = Instance.new("Part")
                for prop, value in pairs(module.Settings.Part) do
                    part[prop] = value
                end
                part.Name = key
                part.CFrame = Region.CFrame
                part.Size = Region.Size
                part.Parent = newFolder
            end
        end
    end
    
end

local function coreLoop()
    for _, char in ipairs({table.unpack(playerChars), table.unpack(module.Settings.ExtraHumanoids)}) do
        coroutine.wrap(function()
            for key, area in pairs(Areas) do
                if not metamethods[key] and not area.chars[char] and area.Area:isInArea(char.PrimaryPart.Position)  then --ignore metamethods
                    area.onEnter:Fire(char)
                    area.chars[char] = true
                    --break
                elseif not metamethods[key] and area.chars[char] and not area.Area:isInArea(char.PrimaryPart.Position)  then
                    area.onLeave:Fire(char)
                    area.chars[char] = nil
                    --break
                end
            end
        end)()
    end
end

local sumDt = 0
RunService.Heartbeat:Connect(
    function(dt)
        sumDt += dt
        if sumDt > 1 / module.Settings.Heartbeat then
            sumDt = 0
            coreLoop()
        end
    end
)

return module