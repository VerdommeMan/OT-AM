# What is OT&AM?

OT&AM is a module that handles the interaction between my other modules (OT,AV2,AV7...). The main purpose of OT&AM is that it can track objects and gives you onLeave/onEnter events when that object enters an area. It's similar to [Zone+](https://1foreverhd.github.io/HDAdmin/projects/zoneplus/about/) only this module supports not only the player but any object, further more it has many more features and it scales much better.


## Object Tracker
This class is used for storing objects in an universal way, this way i can use methods to get the same result no matter which object was given

## Area Manager
I have different Area modules, atm i have only two: AV2 and AV7, but in the future i will have many more. AV2 is basically Region3 replacement and AV7 is Rotated Region3 replacement.

OT&AM manages these Areas for you, you dont need any knowledge about them at all. It uses a feature to auto determine which one it should construct.

## What i mean with Object
With object i refer to any instance that can exist in the explorer, e.g., Parts, Meshes, Cameras, Tools, Models, ... But not values like NumberValue, StringValue, etc

## What i mean with Area
Any 3D shape, atm i only support cuboids.