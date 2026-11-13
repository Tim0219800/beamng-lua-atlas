---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/openDriveImport.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Import OpenDRIVE (.xodr) dans Road Architect. Le fichier XML est analysé (routes : planView avec line/arc/spiral/poly3/paramPoly3, elevationProfile, superelevation, laneOffset, laneSections avec largeurs et hauteurs de voies ; junctions), la ligne de référence est discrétisée en polyligne 3D, puis chaque route OpenDRIVE devient une route Road Architect indépendante. Les jonctions OpenDRIVE sont lues mais non converties. Peut être utilisé sans interface (importFromFile, y compris avec le contenu du fichier fourni par le pont tech/BeamNGpy). Enregistre l'import dans l'historique de l'éditeur (undo/redo).
--- Accès : extension `editor_roadArchitect_openDriveImport` : `extensions.load("editor_roadArchitect_openDriveImport")`, puis la globale `editor_roadArchitect_openDriveImport`
---@class editor_roadArchitect_openDriveImport
editor_roadArchitect_openDriveImport = {}

--- Version interactive : ouvre le sélecteur de fichier de l'éditeur (filtre .xodr) puis appelle importFromFile avec le chemin choisi. Les erreurs sont écrites dans le journal (niveau E) au lieu d'être relancées.
---Source : lua/ge/extensions/editor/roadArchitect/openDriveImport.lua:919
---@param options table|nil Options transmises à importFromFile.
function editor_roadArchitect_openDriveImport.import(options) end

--- Importe un fichier .xodr (ou son contenu fourni en fileContent), crée les routes Road Architect correspondantes, applique placement, décalage vertical, conformation au terrain et terraformage selon options, finalise et enregistre l'action dans l'historique. Lance une erreur si le contenu est illisible.
---Source : lua/ge/extensions/editor/roadArchitect/openDriveImport.lua:652
---@param filePath string Chemin du fichier .xodr (peut être ignoré si fileContent est fourni).
---@param options table|nil Options d'import (placeMode, placeX, placeY, placeZ, offsetToTerrain, verticalOffset, terraform, domainOfInfluence, margin, finalize…).
---@param fileContent string|nil Contenu XML du fichier, déjà lu (par exemple envoyé par BeamNGpy).
---@return table  Résumé { success, importedRoadCount, skippedRoadCount, warningCount, warnings, junctionCount, unsupported, finalized }.
function editor_roadArchitect_openDriveImport.importFromFile(filePath, options, fileContent) end

