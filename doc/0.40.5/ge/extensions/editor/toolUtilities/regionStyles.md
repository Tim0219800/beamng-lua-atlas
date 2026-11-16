# `editor_toolUtilities_regionStyles`

*File: `lua/ge/extensions/editor/toolUtilities/regionStyles.lua` · VM: Game Engine (GE) · 33 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_regionStyles`: `extensions.load("editor_toolUtilities_regionStyles")`, then the global `editor_toolUtilities_regionStyles`

Road marking paint style for a region. For now only one region is defined: USA (right-hand traffic). Provides the materials and widths of center, lane, edge, stop and give-way lines, as well as of the hatched separation zone.

## Notes

- The give-way line (shark teeth) does not exist as a DecalRoad material: it is a solid white bar.
- getRegion ignores any argument and always returns the USA table.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_regionStyles.getRegion()` | Returns the marking style table of the current region (always USA): centerLineMaterial, centerLineWidthM, centerLineTexLen, laneLineMaterial, edgeLineMaterial, leftEdgeLineMaterial, stopLineMaterial, giveWayMaterial, stopLineWidthM, giveWayWidthM, goreSepMaterial, goreSepTexLen. | 25 |

### Parameter details

#### `editor_toolUtilities_regionStyles.getRegion()`

Returns the marking style table of the current region (always USA): centerLineMaterial, centerLineWidthM, centerLineTexLen, laneLineMaterial, edgeLineMaterial, leftEdgeLineMaterial, stopLineMaterial, giveWayMaterial, stopLineWidthM, giveWayWidthM, goreSepMaterial, goreSepTexLen.

- **returns**: table Style table (materials as strings, widths and texture lengths in meters).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/regionStyles.lua`.*
