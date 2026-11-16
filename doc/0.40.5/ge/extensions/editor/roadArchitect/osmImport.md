# `editor_roadArchitect_osmImport`

*File: `lua/ge/extensions/editor/roadArchitect/osmImport.lua` · VM: Game Engine (GE) · 12 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadArchitect_osmImport`: `extensions.load("editor_roadArchitect_osmImport")`, then the global `editor_roadArchitect_osmImport`

Small Road Architect alias module: it loads editor/roadArchitect/networkImport and re-exports its importOsmFromFile function under the name importFromFile. It serves as the entry point to import an OpenStreetMap (.osm) file into the Road Architect editor.

## Example

```lua
editor_roadArchitect_osmImport.importFromFile('C:/data/ville.osm', {placeMode = 3})
```

## Fields

| Field | Type | Description |
|---|---|---|
| `importFromFile` | function | Alias of networkImport.importOsmFromFile(filePath, options): imports an .osm file and returns a summary { success, importedRoadCount, skippedRoadCount, warnings, ... }. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadArchitect/osmImport.lua`.*
