# `gameplay_rally_notebook_pacenoteGenerator`

*File: `lua/ge/extensions/gameplay/rally/notebook/pacenoteGenerator.lua` · VM: Game Engine (GE) · 287 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_notebook_pacenoteGenerator`: `extensions.load("gameplay_rally_notebook_pacenoteGenerator")`, then the global `gameplay_rally_notebook_pacenoteGenerator`

Simple pacenote generator: from a list of driveline points, it detects left/right corners by computing, for each point, the circle through three points (the point and those `lookAheadContext` indices before/after, in 2D). Nearly straight areas are filtered out, then consecutive segments of the same direction are merged. Used by the rally editor's generation tool.

## Example

```lua
local gen = require('gameplay_rally_notebook_pacenoteGenerator')
local res = gen.detectCorners(drivelinePoints, { straightThreshold = 8 })
for _, c in ipairs(res.corners) do print(c.direction, c.angle, c.length) end
```

## Notes

- Direction: " right" or " left" (with a leading space) for a corner, "" for a straight section. Angle in degrees: positive = right, negative = left.
- detectCorners fills in the params table passed as an argument (it is modified in place with the default values).
- The first/last two points receive no direction data; the split into corners stops 3 points before the end of the list.
- If pointList is nil or has fewer than 3 points: 'E' log and result { sections = {}, corners = {} }.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_notebook_pacenoteGenerator.detectCorners(pointList, params)` | Detects corners along a driveline. Returns `sections` (all sections, straights included, for debug drawing) and `corners` (only those with a direction, pacenote candidates). Each section contains pos, posEnd, direction, angle, length and nodes. | 218 |

### Parameter details

#### `gameplay_rally_notebook_pacenoteGenerator.detectCorners(pointList, params)`

Detects corners along a driveline. Returns `sections` (all sections, straights included, for debug drawing) and `corners` (only those with a direction, pacenote candidates). Each section contains pos, posEnd, direction, angle, length and nodes.

- `pointList` (*table*) : List of points: tables with a .pos field, or vec3s directly.
- `params` (*table|nil*) : Override of defaultParams (lookAheadContext, straightThreshold, mergeDistanceThreshold, maxSimplifyIterations).
- **returns**: table { sections = table[], corners = table[] }.

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultParams` | table | Default parameters: lookAheadContext = 7 (number of points before/after for the circle), straightThreshold = 5.0 (angle in degrees below which a section is considered straight), mergeDistanceThreshold = 0.2 (m, distance to the line for merging straight sections), maxSimplifyIterations = 10. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/notebook/pacenoteGenerator.lua`.*
