# `gameplay_rally_recceSettings`

*File: `lua/ge/extensions/gameplay/rally/recceSettings.lua` · VM: Game Engine (GE) · 145 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/recceSettings")` (file under extensions/ but not a regular extension)

Persistent preferences of the rally recce, saved in rallySettingsRoot/recce.json: last mission id and last load state per level, and the name of the corner call style. Also loads the corner angles file to offer the available styles. The module returns a constructor.

## Example

```lua
local RecceSettings = require('/lua/ge/extensions/gameplay/rally/recceSettings')
local s = RecceSettings()
s:load()
s:setLastMissionId('west_coast_usa', 'rally/stage1')
```

## Notes

- setLastMissionId, setLastLoadState and setCornerCallStyleName save the file immediately.
- Potential bug: cornerCallStyleNames and getCornerCallStyle index self.corner_angles_data.pacenoteStyles without checking that corner_angles_data is non-nil (error if loadCornerAngles failed or if load was not called).
- The default values are shared by reference (default_settings.last_mission_ids): _reset reuses the same tables, so a modification before a reload can pollute the defaults.

## Class `C`

Settings object returned by the constructor.

The module returns a constructor: `local obj = require("gameplay_rally_recceSettings")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:_reset()` | Resets last_mission_ids, last_load_states and corner_call_style_name to the default values. | 23 |
| `C:cornerCallStyleNames()` | List of the available corner call style names. | 90 |
| `C:defaultCornerCallStyleName()` | Name of the first style in the corner angles' pacenoteStyles, or the default value (nil) if there is no data. | 79 |
| `C:getCornerCallStyle()` | Returns the style table matching the current name in pacenoteStyles. | 128 |
| `C:getCornerCallStyleName()` | Name of the current corner call style. | 125 |
| `C:getLastLoadState(level)` | Last load state for a level. | 117 |
| `C:getLastMissionId(level)` | Last mission id for a level. | 109 |
| `C:init()` | Sets the file path (recce.json) and resets to the default values. | 17 |
| `C:load()` | Resets, loads the corner angles then reads recce.json and deserializes it. | 38 |
| `C:loadCornerAngles()` | Loads the corner angle data via rallyUtil.loadCornerAnglesFile; corner_angles_data stays nil on failure. | 29 |
| `C:onDeserialized(data)` | Applies the data read from the file; missing fields take their default value (style: first available style). | 98 |
| `C:onSerialize()` | Returns the table to save (last_mission_ids, last_load_states, corner_call_style_name). | 69 |
| `C:save()` | Writes the serialized settings to recce.json (jsonWriteFile, pretty format). | 64 |
| `C:setCornerCallStyleName(style_name)` | Sets the corner call style and saves. | 121 |
| `C:setLastLoadState(level, state)` | Stores the last load state for a level and saves. | 113 |
| `C:setLastMissionId(level, id)` | Stores the last mission id for a level and saves. | 105 |

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/recceSettings.lua`.*
