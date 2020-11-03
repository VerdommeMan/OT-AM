# How does OT&AM work?

Region3 works by looping over the parts inside of it and checking if a part belongs to a player.

Zone+ works by raycasting from the player that is inside an Region3.

OT&AM works by tracking the position of a giving instance. It uses PiP (Point in Polygon) to detect if an object is inside an Area. Basically, every Heartbeat (the one u set in settings) it loops over each area and checks if an object is inside of an Area using PiP. Based on that it generates the events.

The main advantage of this over the others is that it is much efficient, Areas can be as big you want them to be and have as many parts as you want them to have. It won’t have an effect on the performance. While it would drastically reduce the performance of the Region3 method and thus Zone+.


