# `gameplay_rally_transcripts_vehicleSnapshot`

*File: `lua/ge/extensions/gameplay/rally/transcripts/vehicleSnapshot.lua` · VM: Game Engine (GE) · 50 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/transcripts/vehicleSnapshot")` (file under extensions/ but not a regular extension)

Skeleton class representing a vehicle snapshot (position, orientation, steering, timestamp) attached to a rally transcriptions path. It behaves like an element of `sortedList` (fields id, name, sortOrder). The module returns a constructor: `require(...)(path, name, forceId)`. In this version, most fields stay nil and deserialization is empty.

## Notes

- onSerialize reads self.text, which is never initialized in init: the serialized `text` field will always be nil.
- onDeserialized does nothing (the whole body is commented out): the code appears to be an unfinished copy of transcripts/entry.lua.
- sortOrder is set to 999999.

## Class `C`

Vehicle snapshot. Initialized fields: path, id, name, sortOrder, pos, quat, steering, timestamp, cornerCall (the last five nil).

The module returns a constructor: `local obj = require("gameplay_rally_transcripts_vehicleSnapshot")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:init(path, name, forceId)` | Constructor called by the function returned by the module. Stores the parent path, takes the provided id or a new id via path:getNextUniqueIdentifier(), and names the object `t_<id>` by default. | 7 |
| `C:onDeserialized(data, oldIdMap)` | Restoration from the saved data. Does nothing in this version. | 33 |
| `C:onSerialize()` | Returns a table {oldId, name, text} for saving. | 22 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/transcripts/vehicleSnapshot.lua`.*
