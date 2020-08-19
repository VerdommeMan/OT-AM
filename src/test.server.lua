local ServerScriptService = game:GetService("ServerScriptService")
local ServerStorage = game:GetService("ServerStorage")
local Players= game:GetService("Players")
local Lighting = game:GetService("Lighting")
local skys = ServerStorage.Skys
local module = require(ServerScriptService.MPRE)

local testAreaV3 = require(ServerScriptService.MPRE.AreaV3)

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
local char = Players.PlayerAdded:Wait().CharacterAdded:Wait()
while true do
    print(testAreaV3.isInArea(char.PrimaryPart.Position))
    wait(5)
end
-- spawn(function()
    
-- end)

-- while true do
--     wait(10)
--     print("## Making the Areas (in)visible ##")
--     module.switchMakeAreasVisible()
-- end
