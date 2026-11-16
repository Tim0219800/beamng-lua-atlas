---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/networkImport.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Shared OpenStreetMap (.osm) and SUMO (.nod.xml/.edg.xml) import into Road Architect. Each OSM way or SUMO edge becomes an independent Road Architect road (two-lane 'driving' import profile, width inferred from the tags or the number of lanes). Ends that share the same source node are snapped to a common position, but no real Road Architect junction is created. The module is the implementation behind osmImport.lua (importFromFile) and can be called without the UI (headless). The import is recorded in the editor history (undo/redo).
--- Access: extension `editor_roadArchitect_networkImport`: `extensions.load("editor_roadArchitect_networkImport")`, then the global `editor_roadArchitect_networkImport`
---@class editor_roadArchitect_networkImport
editor_roadArchitect_networkImport = {}

--- Reads an OpenStreetMap file, converts the road ways into Road Architect roads, applies the requested placement/height, snaps the shared ends, optionally terraforms, then finalizes and records the action in the history. Raises an error if the file is unreadable or contains no usable node.
---Source: lua/ge/extensions/editor/roadArchitect/networkImport.lua:342
---@param filePath string Path of the .osm file.
---@param options table|nil Import options (placeMode, placeX, placeY, placeZ, offsetToTerrain, verticalOffset, terraform, domainOfInfluence, margin, finalize...).
---@return table  Summary { success, importedRoadCount, skippedRoadCount, warningCount, warnings, junctionCount, unsupported, finalized }.
function editor_roadArchitect_networkImport.importOsmFromFile(filePath, options) end

--- Reads the SUMO .nod.xml and .edg.xml files sharing the prefix of filePath and creates one Road Architect road per edge (deduplicating reverse directions). Same options and same result as importOsmFromFile. Raises an error if either file is unreadable.
---Source: lua/ge/extensions/editor/roadArchitect/networkImport.lua:535
---@param filePath string Path of the SUMO file (.nod.xml, .edg.xml, .xml or prefix without extension).
---@param options table|nil Same options as importOsmFromFile.
---@return table  Summary { success, importedRoadCount, skippedRoadCount, warningCount, warnings, junctionCount, unsupported, finalized }.
function editor_roadArchitect_networkImport.importSumoFromFile(filePath, options) end

