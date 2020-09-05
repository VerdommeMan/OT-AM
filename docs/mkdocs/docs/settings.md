# Settings

The `Settings` are a Property of the module thus you can access them as `module.Settings`. It returns a Dictionary with the values below.

!!! note "\[READ/WRITE\]"

### Settings.Heartbeat {==:Number==}
It represents the amount times it calls the coreLoop per second, reduce this number to drastically lower the impact it has on performance but it will make the events less responsive has no minimum but max is 60 (you can try setting it higher but it wont make it go faster).

### Settings.FolderName {==:String==}
You can change this if you already have folder in that name which is only theoretically speaking possible.

### Settings.FrontCenterPosition {==:Boolean==}
By changing the bool you can turn on/off this feature.

### Settings.Part {==:Dictionary==}
Contains a Dictionary with as key the Property name and as value the property value, this is used to set the properties of the parts which will represents Area when `module.switchMakeAreasVisible()` is called.

!!! note "\[READ ONLY\]" 
### Settings.TrackedObjects {==:Dictionary ==}
All the added TrackedObjects get stored in that dictionary.
### Settings.AutoAddPlayersCharacter {==:Boolean==}
This bool is internally used to keep record of in which state this feature currently is.

<script>
document.addEventListener('DOMContentLoaded', init);
function init(){
    document.querySelectorAll("[data-md-component='toc'] li a").forEach( link =>{
        link.innerHTML = link.innerHTML.match(/\s*(\S+)/)[1]
    });
}
</script>