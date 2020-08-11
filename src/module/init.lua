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

--settings
module.Settings = {}
module.Settings.Heartbeat = 5 --max 60
module.Settings.ExtraHumanoids = {} -- add models here that also need to be tracked next to the player, the model needs a PrimaryPart (this part will be tracked)

-- other stuff
local Areas = {} -- a list of areas
Areas.__index = Areas

function module.addArea(uniqueName, ...) 
    if Areas[uniqueName] then
        error("That name already exists")
    else
        local self = setmetatable({}, Areas)
        self.Area = Area.new(...)
        self.onEnter = Instance.new("BindableEvent")
        self.onLeave = Instance.new("BindableEvent")
        self.chars = {}
        Areas[uniqueName] = self
        return self
    end
end


-- function module.removeArea(uniqueName)
--     
-- end

local function getTableChars()
    local chars = {}
    for _, player in pairs(Players:GetPlayers()) do
        if player.Character then
            table.insert(chars, player.Character)
        end
    end
    return chars
end

local function coreLoop()
    for _, char in ipairs({table.unpack(getTableChars()), table.unpack(module.Settings.ExtraHumanoids)}) do
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
