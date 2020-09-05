# API

A shorter version can also be found in [docs/short/](https://github.com/VerdommeMan/OT-AM/tree/master/docs/short)

## Methods

### module.addArea({==String==} indentifier, ...) {==:Area==}
The indentifier is key used to store said Area, the Area can be retrieved using this key. If indentifier already exists it will throw an error. Next you give in the arguments for the constructor of the Area (#TODO: constructors ).It uses a feature to auto determine which Area it should use, you can disable this by manually adding a bool at the end of arguments. True is AreaV2 and false is AreaV7. It returns the created Area.

### module.removeArea({==String==} indentifier) {==void==}
Removes the Area associated with said indentifier.

### module.getArea({==String==} indentifier) {==:Area==}
Returns the Area associated with said indentifier.

### module.addTrackedObject({==Instance==} object, {==String==} objectkey, {==Vector3==} size) {==void==}
Object can be any instance that you want to track as long as it has a CFrame/Position property or it is a Model/Tool. Objectkey is they key used to store the TrackedObject, it must be unique or it will throw an error. Objectkey is also the key that will be returned as parameter in the function connected to onLeave/onEnter events.
Objectkey and size are optional arguments, if objectkey isnt given then it will use object as objectkey. (#TODO: Size)

### module.setTrackedObject({==Instance==} object, {==String==} objectkey, {==Vector3==} size) {==void==}
Same as `module.addTrackedObject` but this function wont throw an error if the objectkey isnt unique. It will just overwrite the previous value.

### module.removeTrackedObject({==String==} objectkey) {==void==}
Removes the TrackedObject that is associated with the objectkey.

### module.getAreas({==String==} objectkey) {==:Table<Area>==}
Returns a table of areas which the object tied to the key is inside of, in other words onEnter fired but onLeave event didnt for that object.

### module.setAutoAddCharacter({==Boolean==} bool) {==void==}
This function allows you turn on/off the autoAddCharacter feature. It is on by default.

### module.switchMakeAreasVisible() {==void==}
This is a feature, it is a switch which either makes all the areas visible or makes them all invisible. Call it make them visible and call it again to make them invisible again.

### Area:getObjects() {==:Table<Objects>==}
Returns a table of objects which are in that Area.


## Properties 

!!! note "\[READ ONLY\]"

### module.Settings {==:Dictionary==}
This property is a dictionary which contains all the [settings](settings.md).

### Area.enter {==:BindableEvent==}
Holds a reference to the BindableEvent used for onEnter.

### Area.leave {==:BindableEvent==}
Holds a reference to the BindableEvent used for onLeave.

### Area.onEnter {==:BindableEvent.Event==}
Holds a reference to .Event of the `Area.enter` BindableEvent. When you connect a function to this, it will return the key of the TrackedObject that entered this Area as parameter to said function.

### Area.onLeave {==:BindableEvent.Event==}
Holds a reference to .Event of the `Area.leave` BindableEvent. When you connect a function to this, it will return the key of the TrackedObject that left this Area as parameter to said function.

### Area.TrackedObjectKeys {==:Dictionary==}
Holds all the Tracked Objects its keys which are in that Area.
 
<script>
document.addEventListener('DOMContentLoaded', init);
function init(){
    document.querySelectorAll("[data-md-component='toc'] li a").forEach( link =>{
        link.innerHTML = link.innerHTML.match(/\s*([^\s\()]+)/)[1]
    });
}
</script>