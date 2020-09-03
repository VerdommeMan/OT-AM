# Settings

##  [READ/WRITE]

```lua
    Settings.Heartbeat :Number
        > it represents the amount times it calls the coreLoop per second, reduce this number to drastically lower the impact it has on performance but it will make the events less responsive
        > has no minimum but max is 60 (you can try setting it higher but it wont make it go faster)
    Settings.FolderName :String
        > you can change this if you already have folder in that name which is only statistically speaking possible
    Settings.FrontCenterPosition :Boolean
        > by changing the bool you can turn on/off this feature
    Settings.Part :Dictionary
        > contains a Dictionary with as key the Property name and as value the property value, this is used to set the properties of the parts which will represents Area when switchMakeAreasVisible() is called 
 ```
 ##   [READ ONLY]
 ### Settings.TrackedObjects :Dictionary
         in this dictionary are all the trackedObjects stored
### Settings.AutoAddPlayersCharacter :Boolean
        >this bool is internally used to keep record of in which state this feature is