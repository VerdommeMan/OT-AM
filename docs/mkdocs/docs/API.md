# API

A shorter version can also be found in [docs/short/](https://github.com/VerdommeMan/OT-AM/tree/master/docs/short)

## Methods

### module.addArea({==String==} identifier, {==Variant==} ...) {==:Area==}
The identifier is key used to store said Area, the Area can be retrieved using this key. If identifier already exists it will throw an error. Next you give in the arguments for the constructor of the Area. It uses a feature to auto determine which Area it should use, you can disable this by manually adding a String at the end of the arguments. The String should be the area's name. I.e. `"AreaV2"` or `"AreaV7"`. It returns the created Area.

### module.removeArea({==String==} identifier) {==void==}
Removes the Area associated with said identifier.

### module.getArea({==String==} identifier) {==:Area==}
Returns the Area associated with said identifier.

### module.addTrackedObject({==Instance==} object, {==Variant==} objectKey, {==Vector3==} size) {==void==}
Object can be any instance that you want to track as long as it has a CFrame/Position property or it is a Model/Tool. ObjectKey is the key used to store the TrackedObject, it must be unique or it will throw an error. ObjectKey is also the key that will be returned as parameter in the function connected to onLeave/onEnter events.

ObjectKey and size are optional arguments, if objectKey isn’t given then it will use object as objectKey. If an object doesn’t not contain a Size then you can manually add a size if you want to have support for FCP.

### module.setTrackedObject({==Instance==} object, {==Variant==} objectKey, {==Vector3==} size) {==void==}
Same as `module.addTrackedObject` but this function won’t throw an error if the objectKey isn’t unique. It will just overwrite the previous value.

### module.removeTrackedObject({==Variant==} objectKey) {==void==}
Removes the TrackedObject that is associated with the objectKey.

### module.getAreas({==Variant==} objectKey) {==:Table<Area>==}
Returns a table of areas which the object tied to the key is inside of, in other words onEnter fired but onLeave event didn’t for that object.

### module.setAutoAddCharacter({==Boolean==} bool) {==void==}
This function allows you turn on/off the autoAddCharacter feature. It is on by default.

### module.switchMakeAreasVisible() {==void==}
This is a feature, it is a switch which either makes all the areas visible or makes them all invisible. Call it make them visible and call it again to make them invisible again. It’s meant for debug purposes.

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


## Constructors for Area
The arguments of these is what you need to pass to `module.addArea`.

### Area.new({==CFrame==} cf, {==Vector3==} Size) {==:Area==}
Returns an Area.

### Area.new({==BasePart==} part) {==:Area==}
Calls the other constructor internally, returns an Area.

<script>
document.addEventListener('DOMContentLoaded', init);
function init(){
    document.querySelectorAll("[data-md-component='toc'] li a").forEach( link =>{
        link.innerHTML = link.innerHTML.match(/\s*([^\s\()]+)/)[1]
    });
}
</script>