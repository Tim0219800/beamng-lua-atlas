# `editor_roadNetworkExporter`

*File: `lua/ge/extensions/editor/roadNetworkExporter.lua` · VM: Game Engine (GE) · 311 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadNetworkExporter`: `extensions.load("editor_roadNetworkExporter")`, then the global `editor_roadNetworkExporter`

"Road Network Import/Exporter" editor window (Window > Tech menu), visible only with a tech license (ResearchVerifier.isTechLicenseVerified()). It allows importing and exporting the Road Architect road network in OpenDRIVE (.xodr), OpenStreetMap (.osm) and SUMO (.nod.xml / .edg.xml) formats, with import options (placement, vertical offset, terraforming, domain of influence and margin) taken from Road Architect.

## Notes

- Without a tech license, onEditorInitialized creates neither a window nor a menu entry and the other hooks return immediately.
- The import goes through require() of the editor/roadArchitect/openDriveImport, osmImport and sumoImport modules (importFromFile(path, options)) inside a pcall; any error is displayed in the window.
- The import options sent are: placeMode (0 = as in the file, 1 = custom X/Y, 2 = camera XY), placeX, placeY, offsetToTerrain, verticalOffset, terraform, domainOfInfluence (default 30), margin (default 1.0).
- The export may temporarily pause the game during processing (warning displayed in the window).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_roadNetworkExporter.onEditorActivated()` | Hook called when the editor is activated. Stores the current TerrainBlock (extensions.editor_terrainEditor.getTerrainBlock()). No effect without a tech license. *(internal)* *(hook)* | 43 |
| `editor_roadNetworkExporter.onEditorGui()` | Hook called every editor UI frame. Draws the window: import options, Import/Export table for OpenDRIVE, OpenStreetMap and SUMO, then the import result (imported/skipped roads, warnings). *(internal)* *(hook)* | 241 |
| `editor_roadNetworkExporter.onEditorInitialized()` | Editor hook, called on initialization. Checks the tech license and, if valid, registers the window (600x600) and the "Road Network Import/Exporter" menu entry in the Tech group. *(internal)* *(hook)* | 36 |

## Calls into the engine (C++)

- `FS:` `virtual2Native`
- `ResearchVerifier.` `isTechLicenseVerified`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadNetworkExporter.lua`.*
