# `debug_advancedExternalDebug`

*File: `lua/vehicle/extensions/debug/advancedExternalDebug.lua` · VM: Vehicle · 139 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `debug_advancedExternalDebug`: `extensions.load (vehicle VM)("debug_advancedExternalDebug")`, then the global `debug_advancedExternalDebug`

Debug extension that sends JSON packets over UDP to an external tool (AED, 'Advanced External Debug') on 127.0.0.1:43812, at 30 sends per second, with a heartbeat planned at 1 Hz. Vehicle modules drop their packets there via debugPacket; the extension adds to each frame a main packet indicating whether this vehicle is the player's.

## Example

```lua
extensions.debug_advancedExternalDebug.debugPacket({sourceType = 'MY_MODULE', packetType = 'data', value = 42})
```

## Notes

- Each packet receives vehicleID = objectId. Pending packets are sent as a single JSON array every 1/30 s (jsonEncode(debugPackets)), then the list is cleared.
- At load and at onInit: creates a non-blocking UDP socket (if the global `socket` exists), points to 127.0.0.1:43812 (peerIP and peerPort are hardcoded, debugSettings is an empty table) and records a packet {sourceType='AED', packetType='init'}.
- Receiving commands (RequestConfig, EnableDebugMode, SetConfig, SetProperty) is coded but disabled: the call receiveDebugCommands() is commented out in updateGFX. If enabled, it would use `subControllerLookup`, a variable that is not defined anywhere in this file.
- sendDebugHeartbeat (sending the string 'BNGAED') is defined but never called.
- If udpSocket:send fails, the error is printed (print) at each attempt.

## Functions

| Function | Description | Line |
|---|---|---|
| `debug_advancedExternalDebug.debugPacket(packet)` | Adds a packet to the send queue (vehicleID is added automatically). | 19 |
| `debug_advancedExternalDebug.onExtensionLoaded()` | Called when the extension loads: calls onInit. *(internal)* *(hook)* | 127 |
| `debug_advancedExternalDebug.onInit()` | Initialization hook: creates the UDP link and signals a new vehicle to the tool. *(internal)* *(hook)* | 106 |
| `debug_advancedExternalDebug.onReset()` | Reset hook: clears the packet queue. *(internal)* *(hook)* | 102 |
| `debug_advancedExternalDebug.updateGFX(dt)` | Called every frame: adds the main packet then sends the accumulated packets at 30 Hz. *(internal)* | 85 |

### Parameter details

#### `debug_advancedExternalDebug.debugPacket(packet)`

Adds a packet to the send queue (vehicleID is added automatically).

- `packet` (*table*) : JSON-serializable table, preferably with sourceType and packetType.

#### `debug_advancedExternalDebug.updateGFX(dt)`

Called every frame: adds the main packet then sends the accumulated packets at 30 Hz.

- `dt` (*number*) : Time step in seconds.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/debug/advancedExternalDebug.lua`.*
