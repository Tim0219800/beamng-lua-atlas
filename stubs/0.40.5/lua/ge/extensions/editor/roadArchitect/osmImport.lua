---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/osmImport.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petit module d'alias de Road Architect : il charge editor/roadArchitect/networkImport et réexporte sa fonction importOsmFromFile sous le nom importFromFile. Il sert de point d'entrée pour importer un fichier OpenStreetMap (.osm) dans l'éditeur Road Architect.
--- Accès : extension `editor_roadArchitect_osmImport` : `extensions.load("editor_roadArchitect_osmImport")`, puis la globale `editor_roadArchitect_osmImport`
---@class editor_roadArchitect_osmImport
---@field importFromFile function Alias de networkImport.importOsmFromFile(filePath, options) : importe un fichier .osm et renvoie un résumé { success, importedRoadCount, skippedRoadCount, warnings, … }.
editor_roadArchitect_osmImport = {}

