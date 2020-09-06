# Code examples

## Basic setup

``` lua
local module = require(game:GetService("ServerStorage"):WaitForChild("OT&AM")) -- require the module

local a1 = module.addArea("SafeZone", workspace:WaitForChild("Zone")) -- add an Area

a1.onEnter:Connect(function(player) -- add listener
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
