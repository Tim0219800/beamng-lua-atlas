# `editor_toolUtilities_sitePad`

*File: `lua/ge/extensions/editor/toolUtilities/sitePad.lua` · VM: Game Engine (GE) · 258 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_sitePad`: `extensions.load("editor_toolUtilities_sitePad")`, then the global `editor_toolUtilities_sitePad`

A flat terrain platform ("pad") on which a site tool can draw, and the site's own ground carved into it. enter flattens a 300 m square at 50 m altitude (the site's reference level) while remembering the real ground; leave puts it back as it was; carve carves the site's ground plan into it (terrace, ramp, steps, basement) so that it can be seen while drawing; suspend/resume remove it for the duration of a level save. Only one pad at a time (only one tool holds the screen).

## Notes

- PAD_SIZE_M = 300 (square taken flat, cut to a size that nothing the tools draw exceeds), PAD_Z = 50 (reference level; high so that a basement, a sunken courtyard or steps have ground to cut into).
- The pad is a drawing board: it deliberately does NOT call setTerrainDirty, so that opening a tool does not ask for a level save. suspend() must remove it during a save, otherwise a 300 m plateau would be written as real ground.
- The pad is clipped to the terrain block (a site at the edge of the map gets the part of the pad that exists). Without terrain or the editor_terrainEditor extension, enter returns false.
- The terrain grid heights are measured from the base of the block, not from world z (a difference of hundreds of meters): toGridZ converts; cellZ returns heights in grid frame, groundZ in world frame.
- Carve size parameters (identical to those with which the city builder levels a placed site): influence depth 12, margin 3, decay 2, smoothing 6.
- In real mode (real ground), carve also adds the works that locally take precedence (heldFn), so that the cut yields to a road's shoulder as the level's grading will.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_sitePad.carve(features, prio)` | Carves the site's ground plan into the pad, so that a sunken square, a terrace or a staircase are VISIBLE during drawing. features is the same list as the one baked for the placer. The last cut is first undone (a cut blends into the ground around it, and blending into an already lowered ground would nibble the pad each time); without features, that is all the call does. | 150 |
| `editor_toolUtilities_sitePad.cellZ(gx, gy)` | Original height of a cell of the pad's height grid (before placement), in grid units (from the base of the block); nil outside the pad. | 206 |
| `editor_toolUtilities_sitePad.centreFor(ring)` | Where a tool should center its pad according to the bounds of what it already holds (center of the points' bounding box). Without points, the camera's aim (util.lookAtGround), where the tools place a starting shape. | 126 |
| `editor_toolUtilities_sitePad.drop()` | How far the pad's ground is below the reference level; nil without a pad. | 229 |
| `editor_toolUtilities_sitePad.enter(cx, cy, drop, real)` | Flattens the square centered on (cx, cy) while remembering what was there, so that leave puts it back. A pad already in place is first put back (two overlapping pads would lose the real ground). Calls beforeEnterFn first if there was no pad. | 89 |
| `editor_toolUtilities_sitePad.groundZ(x, y)` | The ground at (x, y) as it was before the pad was placed or any cut; nil outside the pad. What a level is measured from: measured on the cut, each cut would shift the level of the next. | 219 |
| `editor_toolUtilities_sitePad.isDown()` | True if a pad is placed. | 203 |
| `editor_toolUtilities_sitePad.leave()` | Puts the ground back as it was. Only the heights: what the tool built on the pad goes away through its own teardown. Everything carved INTO the pad goes with it. | 61 |
| `editor_toolUtilities_sitePad.level()` | The world level (50 m) against which a site placed on the pad is DRAWN. To be used for everything that stands on the drawing board instead of sampling the ground, which is no longer flat once the site has carved its shapes into it. | 239 |
| `editor_toolUtilities_sitePad.redrop(d)` | Recuts the pad at a different lowering, where it stands. Its cut falls with it: it had been carved into the old ground. Returns false without a pad or if the lowering is unchanged. | 232 |
| `editor_toolUtilities_sitePad.resume()` | Puts the pad back in place after suspend, with the same cut size. | 195 |
| `editor_toolUtilities_sitePad.setBeforeEnter(fn)` | Registers who restores the real ground one last time before a pad remembers it: fn() runs on entering an editor (only if there was no pad already). | 215 |
| `editor_toolUtilities_sitePad.setHeld(fn)` | Registers who answers for what takes precedence over a site on real ground: fn(x0, y0, x1, y1) returns those features, each with its band. | 212 |
| `editor_toolUtilities_sitePad.suspend()` | Removes the pad from the ground for the duration of a level save, retaining its position and what was carved into it. A save writes the terrain as it finds it: a drawing board left there would be written as real ground. | 186 |

### Parameter details

#### `editor_toolUtilities_sitePad.carve(features, prio)`

Carves the site's ground plan into the pad, so that a sunken square, a terrace or a staircase are VISIBLE during drawing. features is the same list as the one baked for the placer. The last cut is first undone (a cut blends into the ground around it, and blending into an already lowered ground would nibble the pad each time); without features, that is all the call does.

- `features` (*table|nil*) : List of features { quad } or { rings, z } with mode and band.
- `prio` (*number|nil*) : On real ground, the site's priority band; what takes precedence nearby enters the same pass at its own priority.
- **returns**: boolean false if there is no pad.

#### `editor_toolUtilities_sitePad.cellZ(gx, gy)`

Original height of a cell of the pad's height grid (before placement), in grid units (from the base of the block); nil outside the pad.

- `gx` (*integer*) : Grid column.
- `gy` (*integer*) : Grid row.
- **returns**: number|nil Height in grid frame.

#### `editor_toolUtilities_sitePad.centreFor(ring)`

Where a tool should center its pad according to the bounds of what it already holds (center of the points' bounding box). Without points, the camera's aim (util.lookAtGround), where the tools place a starting shape.

- `ring` (*table|nil*) : List of {x,y} points.
- **returns**: number x of the center.
- **returns**: number y of the center.

#### `editor_toolUtilities_sitePad.drop()`

How far the pad's ground is below the reference level; nil without a pad.

- **returns**: number|nil Lowering in meters.

#### `editor_toolUtilities_sitePad.enter(cx, cy, drop, real)`

Flattens the square centered on (cx, cy) while remembering what was there, so that leave puts it back. A pad already in place is first put back (two overlapping pads would lose the real ground). Calls beforeEnterFn first if there was no pad.

- `cx` (*number*) : x of the center.
- `cy` (*number*) : y of the center.
- `drop` (*number|nil*) : Lowers the ground by this distance BELOW the reference level (a tool whose site has its own ground below, basement or sunken courtyard, can thus see inside). The site stays at level(): the reference level and the carved surface separate.
- `real` (*boolean|nil*) : Leaves the ground as is and only remembers it: a site drawn around its plot is designed on the ground where it will stand. Such a pad has no reference level; level is not for it.
- **returns**: boolean true if the pad is placed.

#### `editor_toolUtilities_sitePad.groundZ(x, y)`

The ground at (x, y) as it was before the pad was placed or any cut; nil outside the pad. What a level is measured from: measured on the cut, each cut would shift the level of the next.

- `x` (*number*) : World x.
- `y` (*number*) : World y.
- **returns**: number|nil World z height.

#### `editor_toolUtilities_sitePad.isDown()`

True if a pad is placed.

- **returns**: boolean true if pad placed.

#### `editor_toolUtilities_sitePad.leave()`

Puts the ground back as it was. Only the heights: what the tool built on the pad goes away through its own teardown. Everything carved INTO the pad goes with it.

- **returns**: boolean false if there was no pad.

#### `editor_toolUtilities_sitePad.level()`

The world level (50 m) against which a site placed on the pad is DRAWN. To be used for everything that stands on the drawing board instead of sampling the ground, which is no longer flat once the site has carved its shapes into it.

- **returns**: number Reference level (PAD_Z = 50).

#### `editor_toolUtilities_sitePad.redrop(d)`

Recuts the pad at a different lowering, where it stands. Its cut falls with it: it had been carved into the old ground. Returns false without a pad or if the lowering is unchanged.

- `d` (*number*) : New lowering in meters.
- **returns**: boolean true if the pad was redone.

#### `editor_toolUtilities_sitePad.resume()`

Puts the pad back in place after suspend, with the same cut size.

- **returns**: boolean true if the pad and its cut are restored.

#### `editor_toolUtilities_sitePad.setBeforeEnter(fn)`

Registers who restores the real ground one last time before a pad remembers it: fn() runs on entering an editor (only if there was no pad already).

- `fn` (*function*) : fn() with no argument.

#### `editor_toolUtilities_sitePad.setHeld(fn)`

Registers who answers for what takes precedence over a site on real ground: fn(x0, y0, x1, y1) returns those features, each with its band.

- `fn` (*function*) : fn(x0, y0, x1, y1) -> list of features.

#### `editor_toolUtilities_sitePad.suspend()`

Removes the pad from the ground for the duration of a level save, retaining its position and what was carved into it. A save writes the terrain as it finds it: a drawing board left there would be written as real ground.

- **returns**: boolean false if there was no pad.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/sitePad.lua`.*
