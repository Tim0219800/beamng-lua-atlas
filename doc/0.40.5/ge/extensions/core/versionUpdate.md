# `core_versionUpdate`

*File: `lua/ge/extensions/core/versionUpdate.lua` · VM: Game Engine (GE) · 55 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_versionUpdate`: `extensions.load("core_versionUpdate")`, then the global `core_versionUpdate`

Detects at startup whether the game was just updated to a new major version (comparison of the first two numbers of beamng_version with the lastVersion setting). In that case it runs FS:folderCleanup to back up the user folders of the old version, then stores the current version in the settings. A modder rarely uses it; updatedFromVersion() indicates which version we come from.

## Example

```lua
local previous = core_versionUpdate.updatedFromVersion()
if previous then log('I', 'mod', 'updated from ' .. previous) end
```

## Notes

- New installation (no lastVersion and onlineFeatures == 'ask') or same major version: no backup, unless the folderCleanupRequested setting is true, in which case FS:folderCleanup("") is executed.
- If lastVersion is absent but it is not a new installation, the value "0.0.0.0.unknown_before_0.38" is used.
- M.updateBackupPath (path returned by FS:folderCleanup) is defined but absent from the list of exported fields; it only exists during a major update.
- onUpdate waits for 2 calls (workaround for a settings system bug), then removes itself (M.onUpdate = nil), reruns extensions.hookUpdate('onUpdate') to rebuild the hook list, writes lastVersion and clears folderCleanupRequested.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_versionUpdate.onExtensionLoaded()` | Hook called on load: compares the current version and the last stored version, optionally runs the folder backup/cleanup and stores lastVersion. *(internal)* *(hook)* | 12 |
| `core_versionUpdate.onUpdate()` | Hook called every frame, but only until the 2nd time: stores the current version in the settings then removes itself. *(internal)* *(hook)* | 41 |
| `core_versionUpdate.updatedFromVersion()` | Returns the version we just migrated from. | 51 |

### Parameter details

#### `core_versionUpdate.updatedFromVersion()`

Returns the version we just migrated from.

- **returns**: string|nil Old version, nil if there was no major update at this launch.

## Fields

| Field | Type | Description |
|---|---|---|
| `lastVersion` | string|nil | Previous game version if a major update was detected at this launch, otherwise nil. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onUpdate` — listened to by 186 module(s)

## Calls into the engine (C++)

- `FS:` `folderCleanup`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/versionUpdate.lua`.*
