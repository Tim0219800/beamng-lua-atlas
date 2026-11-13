---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/networkImport.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Import partagé OpenStreetMap (.osm) et SUMO (.nod.xml/.edg.xml) vers Road Architect. Chaque way OSM ou arête SUMO devient une route Road Architect indépendante (profil d'import à deux voies 'driving', largeur déduite des tags ou du nombre de voies). Les extrémités qui partagent un même nœud source sont recalées sur une position commune, mais aucune vraie jonction Road Architect n'est créée. Le module sert d'implémentation à osmImport.lua (importFromFile) et peut être appelé sans interface (headless). L'import est enregistré dans l'historique de l'éditeur (undo/redo).
--- Accès : extension `editor_roadArchitect_networkImport` : `extensions.load("editor_roadArchitect_networkImport")`, puis la globale `editor_roadArchitect_networkImport`
---@class editor_roadArchitect_networkImport
editor_roadArchitect_networkImport = {}

--- Lit un fichier OpenStreetMap, convertit les ways routières en routes Road Architect, applique le placement/hauteur demandés, recale les extrémités partagées, éventuellement terraforme, puis finalise et enregistre l'action dans l'historique. Lance une erreur si le fichier est illisible ou ne contient aucun nœud utilisable.
---Source : lua/ge/extensions/editor/roadArchitect/networkImport.lua:342
---@param filePath string Chemin du fichier .osm.
---@param options table|nil Options d'import (placeMode, placeX, placeY, placeZ, offsetToTerrain, verticalOffset, terraform, domainOfInfluence, margin, finalize…).
---@return table  Résumé { success, importedRoadCount, skippedRoadCount, warningCount, warnings, junctionCount, unsupported, finalized }.
function editor_roadArchitect_networkImport.importOsmFromFile(filePath, options) end

--- Lit les fichiers SUMO .nod.xml et .edg.xml partageant le préfixe de filePath et crée une route Road Architect par arête (en dédoublonnant les sens inverses). Mêmes options et même résultat que importOsmFromFile. Lance une erreur si l'un des deux fichiers est illisible.
---Source : lua/ge/extensions/editor/roadArchitect/networkImport.lua:535
---@param filePath string Chemin du fichier SUMO (.nod.xml, .edg.xml, .xml ou préfixe sans extension).
---@param options table|nil Mêmes options que importOsmFromFile.
---@return table  Résumé { success, importedRoadCount, skippedRoadCount, warningCount, warnings, junctionCount, unsupported, finalized }.
function editor_roadArchitect_networkImport.importSumoFromFile(filePath, options) end

