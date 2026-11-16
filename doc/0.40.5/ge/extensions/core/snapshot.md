# `core_snapshot`

*File: `lua/ge/extensions/core/snapshot.lua` · VM: Game Engine (GE) · 80 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_snapshot`: `extensions.load("core_snapshot")`, then the global `core_snapshot`

Saving and loading of "snapshots" (camera position and rotation) via the BeamNG online service (s2/v4/saveSnapshot and getSnapshot). A snapshot can be loaded from a URL scheme command (loadSnapshot). Emits the hooks onSnapshotCreate and onSnapshotLoad.

## Notes

- BUG: the local function save(data) is a copy of load(data) (it repositions the camera and emits onSnapshotLoad). createSnapshot calls save() with no argument, so data is nil and data.camPos causes an error: snapshot creation is broken.
- createSnapshot ignores its scheme and saveToServer parameters.
- The ignoreStartupCmd field is kept across extension reloads (onSerialize returns true) so as not to replay the startup command.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_snapshot.createSnapshot(scheme, saveToServer)` | Intended to build the snapshot data, emit onSnapshotCreate(data) then send it to the server with core_online.apiCall('s2/v4/saveSnapshot'). Logs the id received or an error. | 27 |
| `core_snapshot.loadSnapshot(snapshotId)` | Downloads the snapshot (s2/v4/getSnapshot) then switches to free camera, places the camera at data.camPos/camRot, emits onSnapshotLoad(data) and calls changeMap() if core_modmanager.isReady(). | 43 |
| `core_snapshot.onDeserialized(d)` | Hook called after reload. Restores ignoreStartupCmd. *(internal)* *(hook)* | 68 |
| `core_snapshot.onSerialize()` | Hook called before a reload of the Lua extensions. Returns {ignoreStartupCmd = true}. *(internal)* *(hook)* | 62 |
| `core_snapshot.onSnapshotSchemeCommand(command, data, isStartingArg)` | Hook called when a URL scheme command arrives. For the "loadSnapshot" command, calls loadSnapshot(data). Ignored if isStartingArg and ignoreStartupCmd. *(internal)* *(hook)* | 54 |

### Parameter details

#### `core_snapshot.createSnapshot(scheme, saveToServer)`

Intended to build the snapshot data, emit onSnapshotCreate(data) then send it to the server with core_online.apiCall('s2/v4/saveSnapshot'). Logs the id received or an error.

- `scheme` (*any*) : Not used.
- `saveToServer` (*any*) : Not used.

#### `core_snapshot.loadSnapshot(snapshotId)`

Downloads the snapshot (s2/v4/getSnapshot) then switches to free camera, places the camera at data.camPos/camRot, emits onSnapshotLoad(data) and calls changeMap() if core_modmanager.isReady().

- `snapshotId` (*string|number*) : Snapshot identifier on the server.

#### `core_snapshot.onDeserialized(d)`

Hook called after reload. Restores ignoreStartupCmd.

- `d` (*table*) : Table returned by onSerialize.

#### `core_snapshot.onSerialize()`

Hook called before a reload of the Lua extensions. Returns {ignoreStartupCmd = true}.

- **returns**: table State to keep.

#### `core_snapshot.onSnapshotSchemeCommand(command, data, isStartingArg)`

Hook called when a URL scheme command arrives. For the "loadSnapshot" command, calls loadSnapshot(data). Ignored if isStartingArg and ignoreStartupCmd.

- `command` (*string*) : Command name.
- `data` (*any*) : Command argument (snapshot id).
- `isStartingArg` (*boolean*) : True if the command comes from the launch arguments.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onSnapshotCreate`
- `onSnapshotLoad`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/snapshot.lua`.*
