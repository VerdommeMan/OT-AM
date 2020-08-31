local ServerScriptService = game:GetService("ServerScriptService")
local ServerStorage = game:GetService("ServerStorage")
local Lighting = game:GetService("Lighting")
local skys = ServerStorage.Skys
local module = require(ServerScriptService:WaitForChild("OT&AM"))

local RR3 = require(ServerScriptService.RotatedRegion3)
local AV2 = require(ServerScriptService["OT&AM"].AreaV2)
local AV7 = require(ServerScriptService["OT&AM"].AreaV7)
local testPart = workspace.Part1
local testPos = Vector3.new(0,10,0)

local function benchmark(func, self, name,...)
    local sec = os.clock()
    func(self,...)
    print("This module "..name.. " Took: ".. os.clock() - sec)
end

local newRR3 = RR3.new(testPart.CFrame, testPart.Size)
local newAV2 = AV2.new(testPart.CFrame, testPart.Size)
local newAV7 = AV7.new(testPart.CFrame, testPart.Size)

benchmark(newRR3.CastPoint,newRR3, "RR3",testPos)
benchmark(newAV2.isInArea , newAV2, "AV2",testPos)
benchmark(newAV7.isInArea  , newAV7, "AV7",testPos)

local test = module.addArea("test", workspace:WaitForChild("Part1"))

local function emptyLightning()
    for _, light in ipairs(Lighting:GetChildren()) do 
        light:Destroy()
    end
end

test.onEnter:Connect(function()
    print("enter 1")
    skys.V1:Clone().Parent = Lighting
end)

test.onLeave:Connect(function() 
    print("leave 1")
    emptyLightning()
end)

local test2 = module.addArea("test2", workspace:WaitForChild("Part2"))

test2.onEnter:Connect(function() 
    print("enter 2")
    skys.V2:Clone().Parent = Lighting
end)

test2.onLeave:Connect(function() 
    print("leave 2")
    emptyLightning()
end)

local test3 = module.addArea("test3", workspace:WaitForChild("Part3"))

test3.onEnter:Connect(function() 
    print("enter 3")
    skys.V3:Clone().Parent = Lighting
end)

test3.onLeave:Connect(function()
    print("leave 3")
    emptyLightning()
end)

while true do
    wait(10)
    print("## Making the Areas (in)visible ##")
    module.switchMakeAreasVisible()
end
