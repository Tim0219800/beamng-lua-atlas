# `gameplay_rally_notebook_waypointTypes`

*File: `lua/ge/extensions/gameplay/rally/notebook/waypointTypes.lua` · VM: Game Engine (GE) · 25 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_notebook_waypointTypes`: `extensions.load("gameplay_rally_notebook_waypointTypes")`, then the global `gameplay_rally_notebook_waypointTypes`

Constants for the waypoint types of a rally pacenote: corner start ("cornerStart") and corner end ("cornerEnd"). Also provides a function that abbreviates these types to "Cs" / "Ce" for display in the editor.

## Example

```lua
local wpt = require('gameplay_rally_notebook_waypointTypes')
print(wpt.shortenWaypointType(wpt.wpTypeCornerStart)) -- "Cs"
```

## Notes

- shortenWaypointType returns nil for any type other than cornerStart/cornerEnd.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_notebook_waypointTypes.shortenWaypointType(wpType)` | Returns the abbreviation of a waypoint type: "Cs" for cornerStart, "Ce" for cornerEnd, nil otherwise. | 15 |

### Parameter details

#### `gameplay_rally_notebook_waypointTypes.shortenWaypointType(wpType)`

Returns the abbreviation of a waypoint type: "Cs" for cornerStart, "Ce" for cornerEnd, nil otherwise.

- `wpType` (*string*) : Waypoint type (wpTypeCornerStart or wpTypeCornerEnd).
- **returns**: string|nil Abbreviation, or nil if the type is unknown.

## Fields

| Field | Type | Description |
|---|---|---|
| `wpTypeCornerEnd` | string | Value "cornerEnd": corner end waypoint. |
| `wpTypeCornerStart` | string | Value "cornerStart": corner start waypoint. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/notebook/waypointTypes.lua`.*
