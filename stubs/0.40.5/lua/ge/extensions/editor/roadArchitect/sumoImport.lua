---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/sumoImport.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small routing module for the SUMO import (.nod.xml / .edg.xml files) into Road Architect. It contains no logic: it re-exports the networkImport.importSumoFromFile function under two names. The Road Network Import/Exporter window calls it via require('editor/roadArchitect/sumoImport').importFromFile(filePath, options).
--- Access: extension `editor_roadArchitect_sumoImport`: `extensions.load("editor_roadArchitect_sumoImport")`, then the global `editor_roadArchitect_sumoImport`
---@class editor_roadArchitect_sumoImport
---@field importFromFile function Alias of networkImport.importSumoFromFile: imports a SUMO network from a file (actual signature in editor/roadArchitect/networkImport; roadNetworkExporter calls it with (filePath, options)).
---@field importFromPrefix function Identical alias of importFromFile.
editor_roadArchitect_sumoImport = {}

