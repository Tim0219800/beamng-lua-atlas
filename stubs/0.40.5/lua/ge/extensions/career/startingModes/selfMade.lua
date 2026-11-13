---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/startingModes/selfMade.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mode de départ de carrière « selfMade » (tier minor, ordre 300, ignore = true) : 1 000 d'argent et une vieille voiture générée aléatoirement. setupInventory choisit parmi les véhicules éligibles (util_configListGenerator) ceux passant un filtre (années 1990-2005, valeur 1000-50000, types de config Factory ou Service), tire une année, estime par dichotomie (28 itérations) le kilométrage qui amène la valeur ajustée au plus près d'une cible de 4000 à 5000, garde le meilleur candidat, le fait apparaître à (838.51, -522.42, 165.75) avec une peinture aléatoire, l'ajoute à l'inventaire et remplit les réservoirs à 15 %. Table de description chargée par career/career.lua, pas une extension.
--- Accès : extension `career_startingModes_selfMade` : `extensions.load("career_startingModes_selfMade")`, puis la globale `career_startingModes_selfMade`
---@class career_startingModes_selfMade
---@field description string « Start with nothing but a beaten down car, a handful of dollars and a dream. »
---@field high number
---@field id string "selfMade".
---@field ignore boolean true.
---@field image string images/career/start_beater.jpg.
---@field maxYear any
---@field order number 300.
---@field rot any
---@field tier string "minor".
---@field title string "Self-Made".
career_startingModes_selfMade = {}

--- Initialise l'argent à 1 000.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/startingModes/selfMade.lua:9
---@param playerAttributes table Module career_modules_playerAttributes.
function career_startingModes_selfMade.initPlayerAttributes(playerAttributes) end

--- Génère et fait apparaître la voiture de départ (voir description du module) et l'ajoute à l'inventaire avec initPartConditions pour le kilométrage estimé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/startingModes/selfMade.lua:12
---@param inventoryModule table Module career_modules_inventory (utilise addVehicle).
function career_startingModes_selfMade.setupInventory(inventoryModule) end

