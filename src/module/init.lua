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

local playerChars = {}

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        table.insert(playerChars, character)
    end)
    player.CharacterRemoving:Connect(function(character)
        table.remove(playerChars, table.find(playerChars, character))
    end)
end)

local function coreLoop()
    for _, char in ipairs({table.unpack(playerChars), table.unpack(module.Settings.ExtraHumanoids)}) do
        for key, area in pairs(Areas) do
            if not metamethods[key] and not area.chars[char] and area.Area:isInArea(char.PrimaryPart.Position)  then --ignore metamethods
                area.onEnter:Fire(char)
                area.chars[char] = true
                break -- cant be in two areas at the same time
            elseif not metamethods[key] and area.chars[char] and not area.Area:isInArea(char.PrimaryPart.Position)  then
                area.onLeave:Fire(char)
                area.chars[char] = nil
                break -- cant be in two areas at the same time
            end
        end
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
