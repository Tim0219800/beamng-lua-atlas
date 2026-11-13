---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/startingModes/apmOnboarding.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mode de départ de carrière « apmOnboarding » (tier major, ordre 100, image start_apm.jpg) : c'est le départ avec tutoriel. Ce fichier ne retourne pas un module d'extension mais une simple table de description, chargée par career/career.lua depuis le dossier startingModes. Il démarre l'argent à 0 et prépare les véhicules du tutoriel avec gameplay_tutorial_setup.setupVehicles().
--- Accès : extension `career_startingModes_apmOnboarding` : `extensions.load("career_startingModes_apmOnboarding")`, puis la globale `career_startingModes_apmOnboarding`
---@class career_startingModes_apmOnboarding
---@field id string "apmOnboarding".
---@field image string images/career/start_apm.jpg.
---@field order number 100 (ordre d'affichage).
---@field tier string "major".
career_startingModes_apmOnboarding = {}

--- Initialise les attributs du joueur : argent = 0 (libellé « Starting Capital »).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/startingModes/apmOnboarding.lua:6
---@param playerAttributes table Module career_modules_playerAttributes (utilise setAttributes).
function career_startingModes_apmOnboarding.initPlayerAttributes(playerAttributes) end

--- Prépare les véhicules du tutoriel (gameplay_tutorial_setup.setupVehicles).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/startingModes/apmOnboarding.lua:9
function career_startingModes_apmOnboarding.setupInventory() end

