# `editor_roadArchitect_openDriveImport`

*File: `lua/ge/extensions/editor/roadArchitect/openDriveImport.lua` · VM: Game Engine (GE) · 937 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadArchitect_openDriveImport`: `extensions.load("editor_roadArchitect_openDriveImport")`, then the global `editor_roadArchitect_openDriveImport`

OpenDRIVE (.xodr) import into Road Architect. The XML file is parsed (roads: planView with line/arc/spiral/poly3/paramPoly3, elevationProfile, superelevation, laneOffset, laneSections with lane widths and heights; junctions), the reference line is discretized into a 3D polyline, then each OpenDRIVE road becomes an independent Road Architect road. OpenDRIVE junctions are read but not converted. Can be used without the UI (importFromFile, including with the file content supplied by the tech/BeamNGpy bridge). Records the import in the editor history (undo/redo).

## Example

```lua
local res = editor_roadArchitect_openDriveImport.importFromFile('/levels/mon_niveau/route.xodr', {placeMode = 2, terraform = true})
print(res.importedRoadCount, res.skippedRoadCount)
```

## Notes

- Recognized options: placeMode (0 = file position, 1 = placeX/placeY, 2 = camera XY, 3 = player vehicle XY), placeX, placeY, placeZ (height of the first node of the first imported road), offsetToTerrain (true: conform to the terrain), verticalOffset (Z offset, ignored if offsetToTerrain), terraform (true: terraformMultiRoads with domainOfInfluence, default 30, and margin, default 1.0), plus the options read by importFile.maybeFinalise.
- Result: table { success, importedRoadCount, skippedRoadCount, warningCount, warnings, junctionCount, unsupported = {junctions}, finalized }. On error during conversion, the roads already created are deleted and the error is rethrown.
- If fileContent is a non-empty string, it is used instead of reading the file (the sandboxed read does not see host paths; the path must otherwise be under the game's or the user's VFS mounts).
- Probable inconsistency: the name and rule attributes of <road> are read with tonumber(), which gives nil for the usual text values (name="Route 1", rule="RHT").
- Roads whose conversion creates nothing are counted in skippedRoadCount. OpenDRIVE junctions produce a warning ('junction record(s) were parsed but not converted').

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_roadArchitect_openDriveImport.import(options)` | Interactive version: opens the editor file selector (.xodr filter) then calls importFromFile with the chosen path. Errors are written to the log (level E) instead of being rethrown. | 919 |
| `editor_roadArchitect_openDriveImport.importFromFile(filePath, options, fileContent)` | Imports a .xodr file (or its content supplied in fileContent), creates the corresponding Road Architect roads, applies placement, vertical offset, terrain conforming and terraforming according to options, finalizes and records the action in the history. Raises an error if the content is unreadable. | 652 |

### Parameter details

#### `editor_roadArchitect_openDriveImport.import(options)`

Interactive version: opens the editor file selector (.xodr filter) then calls importFromFile with the chosen path. Errors are written to the log (level E) instead of being rethrown.

- `options` (*table|nil*) : Options passed to importFromFile.

#### `editor_roadArchitect_openDriveImport.importFromFile(filePath, options, fileContent)`

Imports a .xodr file (or its content supplied in fileContent), creates the corresponding Road Architect roads, applies placement, vertical offset, terrain conforming and terraforming according to options, finalizes and records the action in the history. Raises an error if the content is unreadable.

- `filePath` (*string*) : Path of the .xodr file (may be ignored if fileContent is supplied).
- `options` (*table|nil*) : Import options (placeMode, placeX, placeY, placeZ, offsetToTerrain, verticalOffset, terraform, domainOfInfluence, margin, finalize...).
- `fileContent` (*string|nil*) : XML content of the file, already read (for example sent by BeamNGpy).
- **returns**: table Summary { success, importedRoadCount, skippedRoadCount, warningCount, warnings, junctionCount, unsupported, finalized }.

## Calls into the engine (C++)

- `be:` `getPlayerVehicle`, `reloadCollision`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadArchitect/openDriveImport.lua`.*
