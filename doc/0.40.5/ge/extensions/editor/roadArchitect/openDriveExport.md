# `editor_roadArchitect_openDriveExport`

*File: `lua/ge/extensions/editor/roadArchitect/openDriveExport.lua` · VM: Game Engine (GE) · 367 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadArchitect_openDriveExport`: `extensions.load("editor_roadArchitect_openDriveExport")`, then the global `editor_roadArchitect_openDriveExport`

Export of the Road Architect network in OpenDRIVE 1.8 format (.xodr). Each road (excluding overlays) is converted to OpenDRIVE geometry: reference line approximated by 2D parametric cubics (paramPoly3, Chordal Catmull-Rom tangents), elevation profile in explicit cubics, lane widths and heights per section. The file is written via the editor file selector (editor_fileDialog.saveFile). If no Road Architect road exists, the export falls back to tech_openDriveExporter to export the road network of the loaded map.

## Example

```lua
editor_roadArchitect_openDriveExport.export()
```

## Notes

- Exported lane types: 'road_lane' -> driving, 'sidewalk' -> walking, any other type (islands, concrete...) -> restricted.
- Roads without nodes are ignored; overlays (isOverlay) are not exported. Each road is written with rule="RHT", junction="-1" and an id equal to its rank - 1.
- Predecessor/successor links (link tag of roads and lanes), objects, signals and surface are not exported: the tags are written empty or as comments (the code contains a TODO for the lane link). The header writes north/south/east/west as 0.0.
- The center mark is always written as a standard broken line, whatever the profile's paint.
- If the file cannot be opened for writing, io.open returns nil and the write fails (no check in the code).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_roadArchitect_openDriveExport.export()` | Exports the current Road Architect network to .xodr. Filters out empty roads, converts non-overlay roads to OpenDRIVE geometry, then opens a save dialog (.xodr extension, overwrite confirmation) and writes the file. With no roads, exports the map's road network instead via tech_openDriveExporter. | 336 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadArchitect/openDriveExport.lua`.*
