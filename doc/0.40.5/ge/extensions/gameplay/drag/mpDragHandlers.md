# `gameplay_drag_mpDragHandlers`

*File: `lua/ge/extensions/gameplay/drag/mpDragHandlers.lua` · VM: Game Engine (GE) · 416 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_drag_mpDragHandlers`: `extensions.load("gameplay_drag_mpDragHandlers")`, then the global `gameplay_drag_mpDragHandlers`

Network message dispatch table of the multiplayer drag mode. The MP gamemode (multiplayer/gamemodes/drag) calls handle(msgName, ...) on every session message received; depending on the name, the module updates the race state in gameplay_drag_core (setRaceState, clearRaceState, setDragRaceData) and emits extensions.hook hooks (onDragRaceStarted, onDragRaceTimerUpdated, onDragRaceTreeLights...). Some messages are only handled by the session host (finishTime, timerUpdateRequest, treeLightUpdate, stateRequest), the others by all clients.

## Notes

- Handled messages: dragSessionStarted, dragRaceStarted, dragRaceCountdownStart, dragRaceStart, dragRacePlayerJoined, dragRaceTreeLights, dragRaceWinningLights, dragRaceTreeLightUpdate (host), dragRaceFinishTime (host), dragRaceTimerUpdate, dragRaceTimerUpdateRequest (host), dragRaceFinishTimeBroadcast, dragRaceReset, dragRaceCancelled, dragRaceRulesUpdate, dragRaceStateRequest (host).
- A client's finish time is converted to the host's clock via multiplayer_synclib.mapOtherClock; if the sync is not calibrated or the extension is absent, the raw time is used (warning in the log). Elapsed time = finish (host clock) - syncRaceStart.
- The bridge parameter is the gamemode interface (isSessionHost, getRaceState, getTimerRecipientMPClientIds, sendToMPClientIds, getLocalMPPlayerId...); state contains dragRaces and localClientActiveRace.
- dragRaceRulesUpdate saves the rules locally via multiplayer.gamemodes.drag.util.presetManager (pcall) and updates dragType, treeType and importantTimerId of dragData.
- The parameters senderId, recpIds, packetClock, recvClock, msgNumber of handle are not used.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_drag_mpDragHandlers.handle(msgName, state, bridge, client, senderId, recpIds, data, packetClock, recvClock, msgNumber)` | Entry point: looks up the handler for the message msgName and calls it with (state, bridge, client, senderId, recpIds, data). Unknown messages are ignored without error. | 408 |

### Parameter details

#### `gameplay_drag_mpDragHandlers.handle(msgName, state, bridge, client, senderId, recpIds, data, packetClock, recvClock, msgNumber)`

Entry point: looks up the handler for the message msgName and calls it with (state, bridge, client, senderId, recpIds, data). Unknown messages are ignored without error.

- `msgName` (*string*) : Message name (e.g. 'dragRaceStarted', 'dragRaceTimerUpdate').
- `state` (*table*) : MP gamemode state (dragRaces, localClientActiveRace).
- `bridge` (*table*) : MP gamemode interface (session, network, race state).
- `client` (*table|nil*) : Sending client (id field).
- `senderId` (*any*) : Not used.
- `recpIds` (*any*) : Not used.
- `data` (*table*) : Message payload (type, raceId, lane, lightState, timerName, timerValue...).
- `packetClock` (*number|nil*) : Not used.
- `recvClock` (*number|nil*) : Not used.
- `msgNumber` (*integer|nil*) : Not used.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onDragRaceCancelled` — listened to by 1 module(s)
- `onDragRaceCountdownStart` — listened to by 1 module(s)
- `onDragRaceFinishTimesUpdated`
- `onDragRaceListChanged` — listened to by 2 module(s)
- `onDragRacePlayersUpdated` — listened to by 1 module(s)
- `onDragRaceReset` — listened to by 1 module(s)
- `onDragRaceStart` — listened to by 1 module(s)
- `onDragRaceStarted` — listened to by 2 module(s)
- `onDragRaceStateChanged` — listened to by 1 module(s)
- `onDragRaceTimerUpdated` — listened to by 2 module(s)
- `onDragRaceTimerValuesUpdated`
- `onDragRaceTreeLights` — listened to by 1 module(s)
- `onDragRaceWinningLights` — listened to by 1 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drag/mpDragHandlers.lua`.*
