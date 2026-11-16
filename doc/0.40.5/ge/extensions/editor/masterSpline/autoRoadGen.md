# `editor_masterSpline_autoRoadGen`

*File: `lua/ge/extensions/editor/masterSpline/autoRoadGen.lua` · VM: Game Engine (GE) · 394 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_masterSpline_autoRoadGen`: `extensions.load("editor_masterSpline_autoRoadGen")`, then the global `editor_masterSpline_autoRoadGen`

Automatic road generation of the Master Spline tool: between each pair of consecutive nodes, a grid pathfinding (8 directions, minheap priority queue) takes into account the terrain, the maximum slope, the minimum radius and the slope avoidance of the road preset. The path is simplified (RDP), widened in tight turns, adjusted in Z, interpolated (Catmull-Rom) then shown as a preview before being converted to a spline.

## Example

```lua
local gen = extensions.editor_masterSpline_autoRoadGen
gen.generateAutoPreview(spline, autoParams, presetParams)
-- every frame: gen.handlePreview(spline)
if gen.isPreview() then gen.createAutoRoad(spline, 0.5, 0.6) end
```

## Notes

- The module keeps a single global preview (pathNodes/pathWidths); it is shared, not tied to a specific spline.
- Parameters read: autoParams.baseWidth, slopeAvoidance, widthBlend; presetParams.maxSlope, minRadius, maxWidthGradient.
- Constants: RDP tolerance 9.0 then 2.5 after interpolation, 10 Z relaxation iterations, start offset of 10 m at each intermediate waypoint, maximum widening +80% at maximum curvature.
- createAutoRoad replaces the spline's nodes, widths and nmls (normals (0,0,1)) and clears the preview; auto-banking is only enabled if bankingStrength > 0.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_masterSpline_autoRoadGen.clearPreview()` | Clears the current preview (nodes and widths). | 67 |
| `editor_masterSpline_autoRoadGen.createAutoRoad(spline, bankingStrength, autoBankFalloff)` | Converts the preview into spline geometry (nodes, widths, nmls), marks it isDirty, enables auto-banking if bankingStrength > 0, then clears the preview. If the preview has fewer than 2 nodes, it is cleared without creating anything. | 346 |
| `editor_masterSpline_autoRoadGen.generateAutoPreview(spline, autoParams, presetParams)` | Generates the preview of an automatic road passing through the spline's nodes (at least 2, otherwise returns without doing anything). Each segment is computed separately, the duplicates at the junctions are removed, then the path is simplified, widened in hairpins, set to the allowed slope and as close to the terrain as possible, interpolated and re-simplified. | 290 |
| `editor_masterSpline_autoRoadGen.handlePreview(spline)` | Draws the preview ribbon (rSpline.renderPreviewRibbon). Call once per frame; does nothing if the spline is nil or the preview is empty. | 375 |
| `editor_masterSpline_autoRoadGen.isPreview()` | Indicates whether a road preview exists (at least one path node). | 64 |

### Parameter details

#### `editor_masterSpline_autoRoadGen.createAutoRoad(spline, bankingStrength, autoBankFalloff)`

Converts the preview into spline geometry (nodes, widths, nmls), marks it isDirty, enables auto-banking if bankingStrength > 0, then clears the preview. If the preview has fewer than 2 nodes, it is cleared without creating anything.

- `spline` (*table*) : Spline to fill.
- `bankingStrength` (*number*) : Auto-banking strength; 0 or less disables banking.
- `autoBankFalloff` (*number*) : Auto-banking falloff (copied into spline.autoBankFalloff).

#### `editor_masterSpline_autoRoadGen.generateAutoPreview(spline, autoParams, presetParams)`

Generates the preview of an automatic road passing through the spline's nodes (at least 2, otherwise returns without doing anything). Each segment is computed separately, the duplicates at the junctions are removed, then the path is simplified, widened in hairpins, set to the allowed slope and as close to the terrain as possible, interpolated and re-simplified.

- `spline` (*table*) : Master Spline whose nodes are used as waypoints.
- `autoParams` (*table*) : Tool parameters (baseWidth, slopeAvoidance, widthBlend).
- `presetParams` (*table*) : Road preset constraints (maxSlope, minRadius, maxWidthGradient).

#### `editor_masterSpline_autoRoadGen.handlePreview(spline)`

Draws the preview ribbon (rSpline.renderPreviewRibbon). Call once per frame; does nothing if the spline is nil or the preview is empty.

- `spline` (*table|nil*) : Current spline.

#### `editor_masterSpline_autoRoadGen.isPreview()`

Indicates whether a road preview exists (at least one path node).

- **returns**: boolean true if a preview exists.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/masterSpline/autoRoadGen.lua`.*
