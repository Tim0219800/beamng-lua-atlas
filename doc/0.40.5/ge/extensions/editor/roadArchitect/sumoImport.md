# `editor_roadArchitect_sumoImport`

*File: `lua/ge/extensions/editor/roadArchitect/sumoImport.lua` · VM: Game Engine (GE) · 12 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadArchitect_sumoImport`: `extensions.load("editor_roadArchitect_sumoImport")`, then the global `editor_roadArchitect_sumoImport`

Small routing module for the SUMO import (.nod.xml / .edg.xml files) into Road Architect. It contains no logic: it re-exports the networkImport.importSumoFromFile function under two names. The Road Network Import/Exporter window calls it via require('editor/roadArchitect/sumoImport').importFromFile(filePath, options).

## Notes

- importFromFile and importFromPrefix point to the same function (networkImport.importSumoFromFile); importFromPrefix therefore has no behavior of its own.
- The module is loaded with require() by roadNetworkExporter, not as an extension.

## Fields

| Field | Type | Description |
|---|---|---|
| `importFromFile` | function | Alias of networkImport.importSumoFromFile: imports a SUMO network from a file (actual signature in editor/roadArchitect/networkImport; roadNetworkExporter calls it with (filePath, options)). |
| `importFromPrefix` | function | Identical alias of importFromFile. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadArchitect/sumoImport.lua`.*
