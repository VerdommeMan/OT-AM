local ServerScriptService = game:GetService("ServerScriptService")
--local Area = require(ServerScriptService.MPRE.Area)

-- local function printContent(tabled)
--     for _,child in pairs(tabled) do
--         print(child)
--     end
-- end


-- local Area1 = Area.new(Instance.new("Part"))
-- print(Area1)
-- printContent(Area1)
-- local Area2 = Area.new(Vector3.new(0,0,0),Vector3.new(5,5,5))
-- printContent(Area2)
-- local Area3 = Area.new(CFrame.new(5,2,3),Vector3.new(5,5,5))
-- printContent(Area3)

-- local success, ErrorStatement = pcall( Area.new )
-- if not success then
--   print("Error: "..ErrorStatement)
-- end

-- local newArea = Area.new(CFrame.new(0.50500083, 4.67000389, 27.7349968, 1, 0, 0, 0, 1, 0, 0, 0, 1),Vector3.new(13.87, 9.34, 13.23))
-- local newArea = Area.new(workspace:WaitForChild("Part"))
-- local Players = game:GetService("Players")

-- Players.PlayerAdded:Connect(function(player)
--    player.CharacterAdded:Connect(function(character)
--     wait(4)    
--     while true do 
--         print(newArea:isInArea(character.HumanoidRootPart.Position))
--         wait()
--         end 
--     end)

-- end)

local module = require(ServerScriptService.MPRE)

local test = module.addArea("test", workspace:WaitForChild("Part"))

test.OnEnter.Event:Connect(function()
    print("enter 1")
end)

test.OnLeave.Event:Connect(function() 
    print("leave 1")
end)

-- local success, errorStatement = pcall(function()
--     module.AddArea("test", workspace:WaitForChild("Part"))
-- end)

-- if not success then
--     print(errorStatement)
-- end

local test2 = module.addArea("test2", workspace:WaitForChild("Part2"))

test2.OnEnter.Event:Connect(function() 
    print("enter 2")
end)

test2.OnLeave.Event:Connect(function() 
    print("Goodbye event 2")
end)

local test3 = module.addArea("test3", workspace:WaitForChild("Part3"))

test3.OnEnter.Event:Connect(function() 
    print("enter 3")
end)

test3.OnLeave.Event:Connect(function() 
    print("Goodbye event 3")
end)
