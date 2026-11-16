# `editor_toolUtilities_skeleton`

*File: `lua/ge/extensions/editor/toolUtilities/skeleton.lua` · VM: Game Engine (GE) · 718 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_skeleton`: `extensions.load("editor_toolUtilities_skeleton")`, then the global `editor_toolUtilities_skeleton`

Suite of utilities to skeletonize and vectorize binary masks. The main function getPathsFromPng converts a PNG into a mask, skeletonizes it (Guo-Hall algorithm), detects endpoints and junctions, extracts the paths, estimates widths, then simplifies by RDP (tolerance 6.0). Used by spline tools to turn an image of roads into polylines.

## Example

```lua
local sk = extensions.editor_toolUtilities_skeleton
local paths = sk.getPathsFromPng('/levels/x/roads.png')
for _, p in ipairs(paths or {}) do print(#p.points, #p.widths) end
```

## Notes

- The default bitmap -> mask conversion threshold is 0.5; the RDP uses a tolerance of 6.0 (constants at the top of the file).
- Pipeline of getPathsFromPng: vertical flip of the bitmap, mask dilation (radius 3), skeletonization, paths of fewer than 20 points discarded, nearby fragments (40) joined, widths estimated on the undilated mask, then tapering, smoothing and width cap at the ends (15.0).
- The points are vec3 in mask pixel coordinates (2D, inferred from the code).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_skeleton.estimateWidths(paths, mask)` | Estimates the width along each path from the mask derived from the original PNG (uses local tangents). | 451 |
| `editor_toolUtilities_skeleton.extractPaths(mask)` | Extracts all paths from an already skeletonized mask. | 331 |
| `editor_toolUtilities_skeleton.getPathsFromPng(filepath)` | Converts a PNG into a skeletonized mask and vectorizes it into polylines. Returns nil (with a logged error) if the file fails to load or the conversion fails. | 652 |
| `editor_toolUtilities_skeleton.skeletonise(mask)` | Skeletonizes a mask with the Guo-Hall algorithm, alternating two passes until stable. The mask is modified in place then returned. | 155 |

### Parameter details

#### `editor_toolUtilities_skeleton.estimateWidths(paths, mask)`

Estimates the width along each path from the mask derived from the original PNG (uses local tangents).

- `paths` (*table*) : Extracted paths.
- `mask` (*table*) : Original mask, not skeletonized.
- **returns**: table Widths, one list per path (inferred from code).

#### `editor_toolUtilities_skeleton.extractPaths(mask)`

Extracts all paths from an already skeletonized mask.

- `mask` (*table*) : Skeletonized mask.
- **returns**: table List of paths (inferred from the code).

#### `editor_toolUtilities_skeleton.getPathsFromPng(filepath)`

Converts a PNG into a skeletonized mask and vectorizes it into polylines. Returns nil (with a logged error) if the file fails to load or the conversion fails.

- `filepath` (*string*) : Path of a PNG in a supported format.
- **returns**: table<integer, {points: vec3[], widths: number[]}>|nil One element per path: points (2D as vec3) and matching widths.

#### `editor_toolUtilities_skeleton.skeletonise(mask)`

Skeletonizes a mask with the Guo-Hall algorithm, alternating two passes until stable. The mask is modified in place then returned.

- `mask` (*table*) : 2D mask (rows of 0 or 1).
- **returns**: table The same mask, skeletonized.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/skeleton.lua`.*
