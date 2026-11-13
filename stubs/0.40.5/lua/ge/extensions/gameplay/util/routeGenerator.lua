---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/util/routeGenerator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Génère procéduralement un parcours de course sur le graphe routier de la carte (map.getMap().nodes). Une marche aléatoire guidée (angle préféré selon la fluidité demandée, évitement des demi-tours et des culs-de-sac, ratios cible trail/dirt/tarmac selon la praticabilité) produit un chemin, qui est lissé, ré-échantillonné tous les 8 m, puis réduit à des checkpoints par Douglas-Peucker, décalés avant les virages serrés et validés par A* pour que le marqueur au sol suive bien la route générée. Un moddeur l'appelle avec une position de départ et une distance cible.
--- Accès : extension `gameplay_util_routeGenerator` : `extensions.load("gameplay_util_routeGenerator")`, puis la globale `gameplay_util_routeGenerator`
---@class gameplay_util_routeGenerator
---@field defaultMinDrivability number 0,35. Le routage du marqueur au sol doit utiliser la même valeur, sinon la phase 3 valide un itinéraire que le joueur n'aura jamais.
---@field drivabilityPenalty number 10. Pénalité de praticabilité à utiliser avec le routage de marqueur au sol.
---@field maxCheckpointRadius number 13 (m). Rayon maximal d'un checkpoint généré.
gameplay_util_routeGenerator = {}

--- Génère un parcours de la longueur demandée à partir d'une position, avec checkpoints, rayons et normales.
---Source : lua/ge/extensions/gameplay/util/routeGenerator.lua:608
---@param startPos vec3 Position de départ.
---@param targetDistanceMeters number Longueur visée du parcours (m).
---@param startDir vec3|nil Direction de départ, pour choisir le sens de la route ; sinon le nœud connecté le plus proche.
---@param minDrivability number|nil Praticabilité minimale des liens (0,35 par défaut).
---@param routeSmoothness integer|nil 1 à 3 (2 par défaut) ; plus c'est haut, plus le tracé est droit.
---@param lookAheadDistance number|nil Distance d'anticipation en m (300 par défaut).
---@param job table|nil Job du jobsystem pour yield entre les phases.
---@param seed integer|nil Graine aléatoire (os.time() par défaut).
---@param targetRatios table<string, number>|nil Proportions visées {trail, dirt, tarmac}.
---@param bandBoundaries number[]|nil Deux seuils de drivability séparant trail/dirt/tarmac.
---@param checkpointDistance number|nil Distance cible entre checkpoints en m (130 par défaut).
---@return vec3[]|nil  Positions du chemin parcouru (grossier), nil en cas d'échec.
---@return vec3[]  Positions des checkpoints.
---@return number[]  Rayons des checkpoints (m).
---@return vec3[]  Normales (direction de passage, horizontale) des checkpoints.
---@return number  Distance totale parcourue (m).
function gameplay_util_routeGenerator.generateRaceRoute(startPos, targetDistanceMeters, startDir, minDrivability, routeSmoothness, lookAheadDistance, job, seed, targetRatios, bandBoundaries, checkpointDistance) end

--- Choisit une position aléatoire : un nœud routier au hasard, sinon un point au hasard dans la boîte du terrain, sinon l'origine.
---Source : lua/ge/extensions/gameplay/util/routeGenerator.lua:813
---@return vec3  Position choisie.
function gameplay_util_routeGenerator.pickRandomRoadPoint() end

