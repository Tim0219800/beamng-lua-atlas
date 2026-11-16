# `ui_multiseat_assignmentCache`

*File: `lua/ge/extensions/ui/multiseat/assignmentCache.lua` · VM: Game Engine (GE) · 23 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_multiseat_assignmentCache`: `extensions.load("ui_multiseat_assignmentCache")`, then the global `ui_multiseat_assignmentCache`

In-memory cache of multi-seat (multiseat) assignments. It keeps a deep copy of the value passed to set and returns a copy to get, logging the reason for each access. Its unload mode is "manual", so the cache survives the automatic unloading of extensions.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_multiseat_assignmentCache.get(reason)` | Returns a deep copy of the stored assignments and logs the reason. | 16 |
| `ui_multiseat_assignmentCache.onInit()` | Extension initialization hook; sets the unload mode to "manual" via setExtensionUnloadMode and logs. *(internal)* *(hook)* | 6 |
| `ui_multiseat_assignmentCache.set(value, reason)` | Replaces the stored assignments with a deep copy of value and logs the reason. | 11 |

### Parameter details

#### `ui_multiseat_assignmentCache.get(reason)`

Returns a deep copy of the stored assignments and logs the reason.

- `reason` (*string|nil*) : Reason, used only for the log.
- **returns**: any Copy of the assignments, nil if nothing was set.

#### `ui_multiseat_assignmentCache.set(value, reason)`

Replaces the stored assignments with a deep copy of value and logs the reason.

- `value` (*any*) : Assignments to store (copied with deepcopy).
- `reason` (*string|nil*) : Reason, used only for the log.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/multiseat/assignmentCache.lua`.*
