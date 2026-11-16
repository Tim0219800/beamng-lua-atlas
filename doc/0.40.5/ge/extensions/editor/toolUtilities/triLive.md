# `editor_toolUtilities_triLive`

*File: `lua/ge/extensions/editor/toolUtilities/triLive.lua` · VM: Game Engine (GE) · 271 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_triLive`: `extensions.load("editor_toolUtilities_triLive")`, then the global `editor_toolUtilities_triLive`

Counter of the triangles actually drawn by a "kit" (instanced pieces), as seen from the camera: each instance is counted at the LOD it really draws, minus those off screen. Used by the statsFooter footer. Keeps a single answer at a time (the editor has only one edit mode). The measured LOD scales, which are costly, are shared and cached on disk in /temp/massingEditor/shapeLods.json (with the shape file's modification date).

## Example

```lua
local tl = require('editor/toolUtilities/triLive')
tl.note(instances)     -- on every rebuild
tl.scanStep()          -- every frame
tl.update(instances)
local tris, dist, live, placed, toScan = tl.get()
```

## Notes

- Each instance must have shape (shape path), px, py, pz.
- Update limited to 4 Hz, and 10000 instances processed per frame so as not to freeze the editor on a large city.
- The computation assumes an engine constant ENGINE_SCALE = 4.48 measured at 1920x1009 and 65 degrees, with the real FOV and window size. Visibility is tested by a cone around the screen diagonal.
- A shape that cannot be measured is counted as drawing nothing for the session, with a logged warning, and retried at the next reload.
- A shape whose file has been rewritten since the measurement is measured again.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_triLive.get()` | Last result: instanced triangles drawn, distance to the instances' centroid (m), instances drawn, instances placed, shapes left to scan. | 254 |
| `editor_toolUtilities_triLive.note(instances)` | Queues the shapes of `instances` never measured (or whose file has changed). Cheap enough to be called on every rebuild. | 130 |
| `editor_toolUtilities_triLive.rescan()` | Clears the measurement cache, the scales, the queue and the failures: "retry everything". The cache will be rewritten. | 258 |
| `editor_toolUtilities_triLive.scanStep()` | Measures ONE shape per call (LOD scale), called from the editor frame so that the cold scan shows up as progress rather than a freeze. Saves the cache when the queue is empty. | 148 |
| `editor_toolUtilities_triLive.update(instances)` | Computes the total of instanced triangles on screen and the camera - instance centroid distance. Rate-limited and split into slices of 10000 instances per frame. | 197 |

### Parameter details

#### `editor_toolUtilities_triLive.get()`

Last result: instanced triangles drawn, distance to the instances' centroid (m), instances drawn, instances placed, shapes left to scan.

- **returns**: number Triangles drawn.
- **returns**: number Distance to the centroid (m).
- **returns**: integer Instances drawn.
- **returns**: integer Instances placed.
- **returns**: integer Shapes still to scan.

#### `editor_toolUtilities_triLive.note(instances)`

Queues the shapes of `instances` never measured (or whose file has changed). Cheap enough to be called on every rebuild.

- `instances` (*table*) : List of entries with a shape field.

#### `editor_toolUtilities_triLive.scanStep()`

Measures ONE shape per call (LOD scale), called from the editor frame so that the cold scan shows up as progress rather than a freeze. Saves the cache when the queue is empty.

- **returns**: boolean True if a shape was processed.

#### `editor_toolUtilities_triLive.update(instances)`

Computes the total of instanced triangles on screen and the camera - instance centroid distance. Rate-limited and split into slices of 10000 instances per frame.

- `instances` (*table*) : List of entries { shape, px, py, pz }.

## Calls into the engine (C++)

- `FS:` `stat`
- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/triLive.lua`.*
