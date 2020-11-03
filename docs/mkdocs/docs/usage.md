# Usage

After acquiring the module ([see README](https://github.com/VerdommeMan/OT-AM))

You can do this any way you want. But this is how I would do it:

## SERVER ONLY
Module in ServerStorage and require from scripts in ServerScriptService.

## CLIENT ONLY
Module in ReplicatedStorage and require from Localscript in playerscripts

## CLIENT & SERVER
Module in ReplicatedStorage and require from playerscripts and ServerScriptService.

## How to setup Areas

The easiest way would be inserting a part and moving/resizing it over the area you want to track, and then reference this in the `module.addArea` function or get the CFrame and Size of said area and give that as argument then you don’t have to waste memory on loading that part (you don’t have to have a physical part in the workspace).


