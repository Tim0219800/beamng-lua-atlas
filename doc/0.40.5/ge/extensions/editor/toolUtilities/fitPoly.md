# `editor_toolUtilities_fitPoly`

*File: `lua/ge/extensions/editor/toolUtilities/fitPoly.lua` · VM: Game Engine (GE) · 155 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_fitPoly`: `extensions.load("editor_toolUtilities_fitPoly")`, then the global `editor_toolUtilities_fitPoly`

Utility that orders an unordered set of objects into a polyline. For each possible starting point, it builds a greedy path (nearest point, bonus if the direction continues), then keeps the path with the best score (direction smoothing, short length). Useful for editor tools that receive selected objects without order.

## Example

```lua
local fitPoly = require('editor/toolUtilities/fitPoly')
local ordered = fitPoly.fitPoly(components) -- components[i].obj:getPosition()
```

## Notes

- Maximum distance between two neighboring points: 50 m (constant maxDist); beyond that, the points are not chained and the remaining points are appended at the end of the path in their original order.
- Complexity roughly O(n^3) (each start, each step goes through all the points): intended for small sets.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_fitPoly.fitPoly(components)` | Reorders the components to form the best polyline. Each component must have an obj field with getPosition(). Returns components as is if there are fewer than two. | 118 |

### Parameter details

#### `editor_toolUtilities_fitPoly.fitPoly(components)`

Reorders the components to form the best polyline. Each component must have an obj field with getPosition(). Returns components as is if there are fewer than two.

- `components` (*table[]*) : List of tables { obj = object with getPosition() }.
- **returns**: table[] New list of the same components, in polyline order.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/fitPoly.lua`.*
