---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/startingModes/sandbox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mode de départ de carrière « sandbox » (tier minor, ordre 400) : 50 millions d'argent, « tout débloqué » d'après sa description. Table de description chargée par career/career.lua, pas une extension. Le champ ignore = true indique que ce mode est ignoré (non proposé) dans cette version.
--- Accès : extension `career_startingModes_sandbox` : `extensions.load("career_startingModes_sandbox")`, puis la globale `career_startingModes_sandbox`
---@class career_startingModes_sandbox
---@field description string « Start with 50 million bucks and everthing unlocked. » (faute d'orthographe dans le code).
---@field id string "sandbox".
---@field ignore boolean true.
---@field image string images/career/start_sandbox.jpg.
---@field order number 400.
---@field tier string "minor".
---@field title string "Sandbox".
career_startingModes_sandbox = {}

--- Initialise l'argent à 50 000 000.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/startingModes/sandbox.lua:9
---@param playerAttributes table Module career_modules_playerAttributes.
function career_startingModes_sandbox.initPlayerAttributes(playerAttributes) end

--- Téléporte le joueur en (-808.56, 898.56, 75.51) et règle son orientation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/startingModes/sandbox.lua:12
function career_startingModes_sandbox.setupInventory() end

