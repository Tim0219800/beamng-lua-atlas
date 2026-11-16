# `gameplay_rally_startClocks_rallyStartTree`

*File: `lua/ge/extensions/gameplay/rally/startClocks/rallyStartTree.lua` · VM: Game Engine (GE) · 203 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_startClocks_rallyStartTree`: `extensions.load("gameplay_rally_startClocks_rallyStartTree")`, then the global `gameplay_rally_startClocks_rallyStartTree`

LED display of BeamNG's start clock panel ("rally start tree"). It finds in the scene the TSStatics using the s_rally_start_tree.dae shape, then draws into two textures (color and opacity, 900x540) an LED grid: traffic lights (R/A/G), a 6-digit clock in green, a stage label in amber and a countdown in red. Also helps choose the display's orientation toward a target point. Simple module (table C), without a constructor.

## Notes

- The textures are declared in C.textures (tags @rallyStartClockDisplay and @rallyStartClockOpacity); draw must receive a table with the matching color and opacity fields.
- Available digits: 0 to 9, S and dash; a character without a pattern is ignored.
- Unlit LEDs are drawn in black (showInactiveLeds = true).

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_startClocks_rallyStartTree.draw(textures, display)` | Draws the display's full state into the textures: lights, clock, stage label and countdown ("-N", "M:SS" or one or two digits format). | 130 |
| `gameplay_rally_startClocks_rallyStartTree.findClocks()` | Walks through the scene's TSStatics and returns those whose shapeName is the start tree's shape. | 66 |
| `gameplay_rally_startClocks_rallyStartTree.getView(clock, startLine, targetPos)` | Computes an aiming vector for a clock's display: combines the tangent and the normal of the clock's surface, oriented in the direction of the road and inward, depending on whether the clock is to the right or to the left of the start line. | 178 |

### Parameter details

#### `gameplay_rally_startClocks_rallyStartTree.draw(textures, display)`

Draws the display's full state into the textures: lights, clock, stage label and countdown ("-N", "M:SS" or one or two digits format).

- `textures` (*table*) : {color, opacity}: target texture objects
- `display` (*table*) : {clock=string "HH:MM:SS" style, label=string, countdown=string, semaphore="R"|"A"|"G"}

#### `gameplay_rally_startClocks_rallyStartTree.findClocks()`

Walks through the scene's TSStatics and returns those whose shapeName is the start tree's shape.

- **returns**: table[] List of {anchor, shapeName (display shape), transform, scale}

#### `gameplay_rally_startClocks_rallyStartTree.getView(clock, startLine, targetPos)`

Computes an aiming vector for a clock's display: combines the tangent and the normal of the clock's surface, oriented in the direction of the road and inward, depending on whether the clock is to the right or to the left of the start line.

- `clock` (*table*) : Element returned by findClocks (uses clock.anchor)
- `startLine` (*table*) : {pos, rot} of the start line; rot required
- `targetPos` (*vec3*) : Target position (side where the clock is relative to the road)
- **returns**: vec3|nil Composed direction; nil if the rotation is absent or degenerate

## Fields

| Field | Type | Description |
|---|---|---|
| `textures` | table | Definition of the two dynamic textures: color (transparent clearColor) and opacity (black clearColor), each with tag, width and height. |

## Calls into the engine (C++)

- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/startClocks/rallyStartTree.lua`.*
