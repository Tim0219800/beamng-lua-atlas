---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/psDuplicationChecker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil de debug « Parking Spot Duplication Checker » pour level designers : compare les places de parking (parkingSpots) de deux fichiers .sites.json (par défaut city.sites.json et facilities/delivery/mixed.sites.json de west_coast_usa) et liste celles dont les boîtes orientées (OBB) se recouvrent, en les dessinant en 3D avec leur nom.
--- Accès : extension `career_modules_debug_psDuplicationChecker` : `extensions.load("career_modules_debug_psDuplicationChecker")`, puis la globale `career_modules_debug_psDuplicationChecker`
---@class career_modules_debug_psDuplicationChecker
---@field debugName string 'Parking Spot Duplication Checker'.
---@field debugOrder number Ordre de tri (11).
career_modules_debug_psDuplicationChecker = {}

--- Charge les deux fichiers sites (gameplay_sites_sitesManager.loadSites) et remplit la liste de résultats avec chaque paire de parking spots dont les OBB se chevauchent.
---Source : lua/ge/extensions/career/modules/debug/psDuplicationChecker.lua:24
function career_modules_debug_psDuplicationChecker.compareFiles() end

--- Sous-menu de fonctions de debug ; vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/psDuplicationChecker.lua:15
function career_modules_debug_psDuplicationChecker.drawDebugFunctions() end

--- Dessine la fenêtre 'PS Duplication Checker' : sélecteurs de fichiers A/B, bouton Compare et liste des doublons, dessinés en 3D (orange pour A, bleu pour B) avec leur nom.
---Source : lua/ge/extensions/career/modules/debug/psDuplicationChecker.lua:46
function career_modules_debug_psDuplicationChecker.drawDebugMenu() end

--- Ouvre l'outil : M.onUpdate = drawDebugMenu puis extensions.hookUpdate('onUpdate').
---Source : lua/ge/extensions/career/modules/debug/psDuplicationChecker.lua:81
function career_modules_debug_psDuplicationChecker.show() end

