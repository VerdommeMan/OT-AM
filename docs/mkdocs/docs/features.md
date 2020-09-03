# Features

##  autoAddCharacter:
   
This feature is by default on, it has different behavior depending on which Lua environment the module is required from. On the server it auto adds all the player characters to the tracked objects. On the client it only adds the character of the localplayer. It returns the Player in the onEnter/onLeave events as argument. You can turn this feature on/off with `module.setAutoAddCharacter(Boolean bool)`

##    frontCenterPosition:
FCP is a feature which allows you to track the front center of an object instead of tracking the center of an object. So that it feels like the event calls faster because as soon as the front enters the area it fires now instead of as soon as the center enters the area. You can turn this feature on/off by manually setting it in Settings.

##   switchMakeAreasVisible:
This feature makes areas visible so that you can visually see them for debugging purposes, you can turn this feature on by calling 
`#!lua module.switchMakeAreasVisible()`. The visualation is customizable. 

##   autoDetermineWhichArea:
By default when you add the Area constructor arguments, this feature calculates (based on the args) which Area to construct 
so it will use AV2 on Areas which are axis aligned and AV7 on those who arent. You can still manually specify which Area you want (see module.addArea)