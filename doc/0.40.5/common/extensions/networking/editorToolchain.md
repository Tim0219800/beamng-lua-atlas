# `networking_editorToolchain`

*File: `lua/common/extensions/networking/editorToolchain.lua` · VM: Common (GE + vehicle) · 214 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `networking_editorToolchain`: `extensions.load("networking_editorToolchain")`, then the global `networking_editorToolchain`

TCP server (port 7000, all interfaces) that lets an external tool (JBeam editor, etc.) talk to the game. Clients send JSON commands (ping, init, getPlayerVehicleInfo, selectNodes, subscribe) and receive responses (pong, siminfo, playerVehicleInfo, data). It can also highlight nodes of the player vehicle in the 3D world and continuously stream node positions and velocity. Not loaded by default (commented-out line extensions.load('networking_editorToolchain')); once loaded, it stays in memory (unload mode 'manual').

## Example

```lua
extensions.load('networking_editorToolchain')
-- the client connects to port 7000 and sends {"cmd":"ping"}
```

## Notes

- Listens on '*' port 7000: reachable from the network as long as the extension is loaded.
- Recognized commands: ping (-> pong), init (-> siminfo: versions, buildtype, game and user paths), getPlayerVehicleInfo (-> playerVehicleInfo or noPlayerVehicle), selectNodes (list of node names to highlight), subscribe. Any other command returns {cmd='error'}.
- Supported subscription types: 'nodePositions' (only with what == '*') and 'velocity'; sent on every onPreRender.
- The highlight draws a red sphere of radius 0.1 m and the node name via debugDrawer.
- A 'disconnect' message removes the client's subscriptions and sets selectedNodes back to nil (clears the highlight for all clients).
- The server is destroyed in onExtensionUnloaded; onInit sets the extension to setExtensionUnloadMode(M, 'manual').

## Functions

| Function | Description | Line |
|---|---|---|
| `networking_editorToolchain.onExtensionLoaded()` | Hook called when the extension is loaded: creates the TCPServer on '*':7000. *(internal)* *(hook)* | 183 |
| `networking_editorToolchain.onExtensionUnloaded()` | Hook called on unload: destroys the server if it exists. *(internal)* *(hook)* | 187 |
| `networking_editorToolchain.onInit()` | Initialization hook: sets the extension's unload mode to 'manual'. *(internal)* *(hook)* | 202 |
| `networking_editorToolchain.onPreRender(dtReal, dtSim, dtRaw)` | Called every frame before rendering: reads and handles received messages, sends the vehicle context back to clients if the player vehicle changed, draws the selected nodes, then sends the subscription data (node positions, velocity). *(internal)* *(hook)* | 126 |
| `networking_editorToolchain.onVehicleSpawned(vehID)` | Hook called when a vehicle spawns: if it is player vehicle 0, flags the vehicle context to be resent to clients. *(internal)* *(hook)* | 194 |
| `networking_editorToolchain.onVehicleSwitched(_, _, player)` | Hook called when the player switches vehicle: if the player is nil or 0, flags the vehicle context to be resent to clients. *(internal)* *(hook)* | 198 |

### Parameter details

#### `networking_editorToolchain.onPreRender(dtReal, dtSim, dtRaw)`

Called every frame before rendering: reads and handles received messages, sends the vehicle context back to clients if the player vehicle changed, draws the selected nodes, then sends the subscription data (node positions, velocity).

- `dtReal` (*number*) : Real delta time (s), unused.
- `dtSim` (*number*) : Simulation delta time (s), unused.
- `dtRaw` (*number*) : Raw delta time (s), unused.

#### `networking_editorToolchain.onVehicleSpawned(vehID)`

Hook called when a vehicle spawns: if it is player vehicle 0, flags the vehicle context to be resent to clients.

- `vehID` (*integer*) : Id of the created vehicle.

#### `networking_editorToolchain.onVehicleSwitched(_, _, player)`

Hook called when the player switches vehicle: if the player is nil or 0, flags the vehicle context to be resent to clients.

- `_` (*any*) : First argument ignored.
- `_` (*any*) : First argument ignored.
- `player` (*integer|nil*) : Index of the player concerned.

## Calls into the engine (C++)

- `FS:` `getGamePath`, `getUserPath`
- `be:` `getPlayerVehicleID`
- `debugDrawer:` `drawSphere`, `drawText`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/extensions/networking/editorToolchain.lua`.*
