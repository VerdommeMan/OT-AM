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

local test = module.AddArea("test", workspace:WaitForChild("Part"))

test.OnEnter.Event:Connect(function() 
    print("HEELL YEAH")
end)