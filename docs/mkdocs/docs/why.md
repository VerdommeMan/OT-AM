# Why should you use OT&AM?

|                  OT&AM                  |              Zone+              |     (Rotated) Region3    |
|:---------------------------------------:|:-------------------------------:|:------------------------:|
|                                         |               PROS              |                          |
|             Tracks anything             |          Complex shapes         |                          |
|        Events (onLeave & onEnter)       |    Events (onLeave & onEnter)   |                          |
|              Easy to setup              |         Easy to setup**         |                          |
|       Areas unlimited size & parts      |                                 |                          |
| Features (FCP, AreasVisibleSwitch, ...) |                                 |                          |
|                Efficient*               |                                 |                          |
|                                         |               CONS              |                          |
|          Limited shapes of Area         |       Tracks only players       |         No events        |
|                                         |     Areas limited size/parts    |   Lots of code to setup  |
|                                         | Uses Region3 internally         | Areas limited size/parts |

\*[see benchmarks](benchmarks.md)

\*\*Client and server have different methods (client & Server: seperate API), while OT&AM doesn't