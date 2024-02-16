# brPlayer

## Key Features
- Play audio on a single client
- Play audio on all clients
- Play audio in range of given coordinates

## How to use
You can freely put .ogg files inside the folder `\html\sounds\`, remember to restart the script or you won't be able to use the audios

 - To play audio on a single client
	 - `TriggerClientEvent("brPlayer:playOnOne", fileName, volume)`
- To play audio on all clients
	- `TriggerServerEvent("brPlayer:playOnAll", fileName, volume)`
- To play audio in range
	- `TriggerServerEvent("brPlayer:playOnRange", fileName, volume, coordinates, range)`

**fileName** (string) = name of the file
**volume** (num) = 0.1 to 1.0
**coordinates** (vector3) = output of `GetEntityCoords` or similar
**range** (num) = max distance in meters

# Credits
"[plunkettscott](https://github.com/plunkettscott)" who made the [original script](https://github.com/plunkettscott/interact-sound)

"[R4ndomThunder](https://github.com/R4ndomThunder)" because i'm a bad programmer and he helps me a lot

# License
MIT

***
