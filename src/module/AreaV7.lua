wait()

--https://math.stackexchange.com/questions/1472049/check-if-a-point-is-inside-a-rectangular-shaped-area-3d
local part = workspace.TestV3.Part
local c1 = workspace.TestV3.Corner1
local c2 = workspace.TestV3.Corner2
local c3 = workspace.TestV3.Corner3
local c4 = workspace.TestV3.Corner4

local pos1 = (part.CFrame * CFrame.new(part.Size.X/-2, part.Size.Y/-2, part.Size.Z/-2)).Position
local pos2 = (part.CFrame * CFrame.new(part.Size.X/2, part.Size.Y/-2, part.Size.Z/-2)).Position
local pos3 = (part.CFrame * CFrame.new(part.Size.X/-2, part.Size.Y/2, part.Size.Z/-2)).Position
local pos4 = (part.CFrame * CFrame.new(part.Size.X/-2, part.Size.Y/-2, part.Size.Z/2)).Position

local u = pos1 - pos2
local v = pos1 - pos3
local w = pos1 - pos4

local module = {}

function module.isInArea(x)
    local ux = u:Dot(x)
    local vx = v:Dot(x)
    local wx = w:Dot(x)

    local constraint1 = u:Dot(pos1) >= ux and ux >= u:Dot(pos2)
    local constraint2 = v:Dot(pos1) >= vx and vx >= v:Dot(pos3)
    local constraint3 = w:Dot(pos1) >= wx and wx >= w:Dot(pos4)
    return constraint1 and constraint2 and constraint3
end


return module