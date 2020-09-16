# Notes

## Object which has client networkownership

If you are tracking an object on the server (using OT&AM serversided) where the client has networkownership over. E.g. the character of player, you will notice a slight latency on the events. The latency is the time it took from that client to replicate to the server (aka ping). If you do not want this, I suggest you track that object on the client instead (use OT&AM clientsided).


