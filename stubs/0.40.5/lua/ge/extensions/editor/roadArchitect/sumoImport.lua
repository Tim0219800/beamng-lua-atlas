---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/sumoImport.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petit module d'aiguillage pour l'import SUMO (fichiers .nod.xml / .edg.xml) dans le Road Architect. Il ne contient pas de logique : il réexporte la fonction networkImport.importSumoFromFile sous deux noms. La fenêtre Road Network Import/Exporter l'appelle via require('editor/roadArchitect/sumoImport').importFromFile(filePath, options).
--- Accès : extension `editor_roadArchitect_sumoImport` : `extensions.load("editor_roadArchitect_sumoImport")`, puis la globale `editor_roadArchitect_sumoImport`
---@class editor_roadArchitect_sumoImport
---@field importFromFile function Alias de networkImport.importSumoFromFile : importe un réseau SUMO depuis un fichier (signature réelle dans editor/roadArchitect/networkImport ; roadNetworkExporter l'appelle avec (filePath, options)).
---@field importFromPrefix function Alias identique de importFromFile.
editor_roadArchitect_sumoImport = {}

