---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/mpDragHandlers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Network message dispatch table of the multiplayer drag mode. The MP gamemode (multiplayer/gamemodes/drag) calls handle(msgName, ...) on every session message received; depending on the name, the module updates the race state in gameplay_drag_core (setRaceState, clearRaceState, setDragRaceData) and emits extensions.hook hooks (onDragRaceStarted, onDragRaceTimerUpdated, onDragRaceTreeLights...). Some messages are only handled by the session host (finishTime, timerUpdateRequest, treeLightUpdate, stateRequest), the others by all clients.
--- Access: extension `gameplay_drag_mpDragHandlers`: `extensions.load("gameplay_drag_mpDragHandlers")`, then the global `gameplay_drag_mpDragHandlers`
---@class gameplay_drag_mpDragHandlers
gameplay_drag_mpDragHandlers = {}

--- Entry point: looks up the handler for the message msgName and calls it with (state, bridge, client, senderId, recpIds, data). Unknown messages are ignored without error.
---Source: lua/ge/extensions/gameplay/drag/mpDragHandlers.lua:408
---@param msgName string Message name (e.g. 'dragRaceStarted', 'dragRaceTimerUpdate').
---@param state table MP gamemode state (dragRaces, localClientActiveRace).
---@param bridge table MP gamemode interface (session, network, race state).
---@param client table|nil Sending client (id field).
---@param senderId any Not used.
---@param recpIds any Not used.
---@param data table Message payload (type, raceId, lane, lightState, timerName, timerValue...).
---@param packetClock number|nil Not used.
---@param recvClock number|nil Not used.
---@param msgNumber integer|nil Not used.
function gameplay_drag_mpDragHandlers.handle(msgName, state, bridge, client, senderId, recpIds, data, packetClock, recvClock, msgNumber) end

