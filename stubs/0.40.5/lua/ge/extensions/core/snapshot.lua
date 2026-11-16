---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/snapshot.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Saving and loading of "snapshots" (camera position and rotation) via the BeamNG online service (s2/v4/saveSnapshot and getSnapshot). A snapshot can be loaded from a URL scheme command (loadSnapshot). Emits the hooks onSnapshotCreate and onSnapshotLoad.
--- Access: extension `core_snapshot`: `extensions.load("core_snapshot")`, then the global `core_snapshot`
---@class core_snapshot
core_snapshot = {}

--- Intended to build the snapshot data, emit onSnapshotCreate(data) then send it to the server with core_online.apiCall('s2/v4/saveSnapshot'). Logs the id received or an error.
---Source: lua/ge/extensions/core/snapshot.lua:27
---@param scheme any Not used.
---@param saveToServer any Not used.
function core_snapshot.createSnapshot(scheme, saveToServer) end

--- Downloads the snapshot (s2/v4/getSnapshot) then switches to free camera, places the camera at data.camPos/camRot, emits onSnapshotLoad(data) and calls changeMap() if core_modmanager.isReady().
---Source: lua/ge/extensions/core/snapshot.lua:43
---@param snapshotId string|number Snapshot identifier on the server.
function core_snapshot.loadSnapshot(snapshotId) end

--- Hook called after reload. Restores ignoreStartupCmd.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/snapshot.lua:68
---@param d table Table returned by onSerialize.
function core_snapshot.onDeserialized(d) end

--- Hook called before a reload of the Lua extensions. Returns {ignoreStartupCmd = true}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/snapshot.lua:62
---@return table  State to keep.
function core_snapshot.onSerialize() end

--- Hook called when a URL scheme command arrives. For the "loadSnapshot" command, calls loadSnapshot(data). Ignored if isStartingArg and ignoreStartupCmd.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/snapshot.lua:54
---@param command string Command name.
---@param data any Command argument (snapshot id).
---@param isStartingArg boolean True if the command comes from the launch arguments.
function core_snapshot.onSnapshotSchemeCommand(command, data, isStartingArg) end

