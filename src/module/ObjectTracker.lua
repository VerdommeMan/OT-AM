local module = {}

local constructors
constructors = {
    default = function(object, key, size) -- all features supported
        local self = {}
        self.Object = key -- also used as key when key not given
        self.Position = object.CFrame.Position
        self.FrontCenterPosition = object.CFrame.Position + object.CFrame.LookVector * size.Z/2 -- or part.CFrame * CFrame.new(0, 0, part.Size.Z/-2)
        return self
    end,
    defaultWithoutSize = function(object) -- limited features supported
        local self = {}
        self.Object = object -- also used as key when key not given
        self.Position = object.CFrame.Position
        return self
    end,
    defaultOnlyPosition = function(object) -- no features supported
        local self = {}
        self.Object = object -- also used as key when key not given
        self.Position = object.Position
        return self
    end,
    model = function(model) -- all features supported
       return constructors.default(model.PrimaryPart, model, model.PrimaryPart.Size)
    end,
    tool= function(tool) -- all features supported
        return constructors.default(tool.Handle, tool,tool.Handle.Size)
    end
}


local function hasProp(object, prop, proptype)
    local suc, res = pcall(function()
        return typeof(object[prop]) == proptype
    end)
    return suc and res
end

local function hasSize(object)
   return hasProp(object,"Size","Vector3")
end

local function hasCFrame(object)
    return hasProp(object, "CFrame", "CFrame")
end

local function hasPosition(object)
    return hasProp(object, "Position", "Vector3")
end

function module.new(object, Size) -- first param can be anything that has a CFrame property/model/tool, second is optional, if the object doesnt have a size property then you can give it one, its for the frontedge feature
   assert( (object and typeof(object) == "Instance") and not Size or typeof(Size) == "Vector3", "Wrong arguments giving to ObjectTracker Constructor")
   
   if object:IsA("Model") and object.PrimaryPart then -- must have a PP
        return constructors.model(object)
   elseif object:IsA("Tool") and object:FindFirstChild("Handle") then -- must have a Handle
        return constructors.tool(object)
   elseif hasCFrame(object) then -- every other thing that has a CFrame is supported like camera, part, etc
        if hasSize(object) then
            return constructors.default(object, object, object.Size)
        elseif Size then
            return constructors.default(object, object, Size)
        else -- no support for FCP feature
            return constructors.defaultWithoutSize(object)
        end
    elseif hasPosition(object) then -- no support for FCP feature
        return constructors.defaultOnlyPosition(object)
   else
        error("That type of instance is not supported")
   end
    
end

return module