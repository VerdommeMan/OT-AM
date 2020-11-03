# What is OT&AM?

OT&AM is a module that handles the interaction between my other modules (OT,AV2,AV7...). The main purpose of OT&AM is that it can track objects and gives you onLeave/onEnter events when that object interacts with an area. It's similar to [Zone+](https://1foreverhd.github.io/HDAdmin/projects/zoneplus/about/) only this module supports not only the player but any object, furthermore it has many more features and it scales much better.


## Object Tracker (OT)
This class is used for storing objects (Instances) in an universal way, this way i can use methods to get the same result no matter which object was given to it.

## Area Manager (AM)
I have different Area modules, atm I have only two: AreaV2 (AV2) and AreaV7 (AV7), but in the future it will have more. AV2 is basically Region3 replacement and AV7 is Rotated Region3 replacement. Their main purpose is for calculating PiP (Point in Polygon) which is basically calculating if a vector is inside an Area.

OT&AM manages these Areas for you, you don’t need to have any knowledge about them at all. It uses a feature to auto determine which one it should construct.

## What I mean by Object
With object I refer to any instance that can exist in the explorer, e.g., Parts, Meshes, Cameras, Tools, Models, ... But not values like NumberValue, StringValue, etc. Any instance that has a CFrame/Position or is Model/Tool is supported. Note: the tool must have a Handle and Model must have a PrimaryPart set.

## What I mean by Area
Any part of the [PartType block](https://developer.roblox.com/en-us/api-reference/enum/PartType). The other PartTypes are planned to be supported.
