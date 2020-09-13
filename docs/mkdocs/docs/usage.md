# Usage

After aquiring the module ([see README](https://github.com/VerdommeMan/OT-AM))

You can do this anyway you want. But this is how i would do it:

## SERVER ONLY
Module in SS and require from scripts in SSS

## CLIENT ONLY
Module in RS and require from LS in playerscripts

## CLIENT & SERVER
Module in RS and require from playerscripts and SSS

## How to setup Areas

The easiest way would be inserting a part and moving/resizing it over the area you want to track, and then reference this in the `module.addArea` function or get the CFrame and Size of said area and give that as argument then you dont have to waste memory on loading that part.

