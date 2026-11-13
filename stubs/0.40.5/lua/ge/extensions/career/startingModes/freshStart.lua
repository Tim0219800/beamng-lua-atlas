---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/startingModes/freshStart.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mode de départ de carrière « freshStart » (tier minor, ordre 200, image start_fresh.jpg) : départ sans tutoriel avec 10 000 d'argent. Table de description chargée par career/career.lua, pas une extension. Le joueur (à pied) est téléporté devant le concessionnaire, face à lui.
--- Accès : extension `career_startingModes_freshStart` : `extensions.load("career_startingModes_freshStart")`, puis la globale `career_startingModes_freshStart`
---@class career_startingModes_freshStart
---@field id string "freshStart".
---@field image string images/career/start_fresh.jpg.
---@field order number 200.
---@field tier string "minor".
career_startingModes_freshStart = {}

--- Initialise l'argent à 10 000 (libellé « Starting Capital »).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/startingModes/freshStart.lua:6
---@param playerAttributes table Module career_modules_playerAttributes.
function career_startingModes_freshStart.initPlayerAttributes(playerAttributes) end

--- Téléporte le joueur en (905.54, -542.39, 164.31) et l'oriente vers le concessionnaire (gameplay_walk.setRot).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/startingModes/freshStart.lua:9
function career_startingModes_freshStart.setupInventory() end

