---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/osmImport.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small Road Architect alias module: it loads editor/roadArchitect/networkImport and re-exports its importOsmFromFile function under the name importFromFile. It serves as the entry point to import an OpenStreetMap (.osm) file into the Road Architect editor.
--- Access: extension `editor_roadArchitect_osmImport`: `extensions.load("editor_roadArchitect_osmImport")`, then the global `editor_roadArchitect_osmImport`
---@class editor_roadArchitect_osmImport
---@field importFromFile function Alias of networkImport.importOsmFromFile(filePath, options): imports an .osm file and returns a summary { success, importedRoadCount, skippedRoadCount, warnings, ... }.
editor_roadArchitect_osmImport = {}

