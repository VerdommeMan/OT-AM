# Code examples

## Basic setup

``` lua
local module = require(game:GetService("ServerStorage"):WaitForChild("OT&AM")) -- require the module

local a1 = module.addArea("SafeZone", workspace:WaitForChild("Zone")) -- add an Area

a1.onEnter:Connect(function(player) -- add listener , it returns the player obj as param since, autoAddCharacter feature sets the player as ObjectKey
    print(player.Name.."  entered!")
end)

a1.onLeave:Connect(function(player) -- add listener
    print(player.Name.."  left!")
end)
```


## Change settings

``` lua
local module = require(game:GetService("ServerStorage"):WaitForChild("OT&AM")) -- require the module

module.Settings.Heartbeat = 10 -- set another heartbeat
module.Settings.FrontCenterPosition = true -- turn on this feature

module.setAutoAddCharacter(false) -- disable autoAddCharacter feature

```

## Adding objects

``` lua
local module = require(game:GetService("ServerStorage"):WaitForChild("OT&AM")) -- require the module

module.addTrackedObject(workspace:WaitForChild("npc")) -- adds the NPC to the TrackedObjects
```

## Get the amount of Objects in an Area

``` lua
local module = require(game:GetService("ServerStorage"):WaitForChild("OT&AM")) -- require the module

local a1 = module.addArea("PlayZone", CFrame.new(3,5,8), Vector3.new(5,5,5)) -- add an Area , using a different constructor, will be AV2 due being axis aligned
a1:getObjects() -- returns empty array or table of tracked objects inside this area

```

## Get the Areas the object is inside of

``` lua
local module = require(game:GetService("ServerStorage"):WaitForChild("OT&AM")) -- require the module

local npc = workspace:WaitForChild("NPC") -- Model

module.addTrackedObject(npc, "Henk") -- this time we give an ObjectKey manually

module.getAreas("Henk") -- so we must use this key to reference this object

```
