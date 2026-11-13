---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/simpleTripApp.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Alimente l'appli UI « trip » : cumule distance et temps de simulation, estime la consommation de carburant et l'autonomie, et envoie le résultat à l'UI environ chaque seconde réelle via guihooks.trigger('tripData', data). Lit electrics.values.fuelVolume, wheelspeed et airspeed.
--- Accès : extension `simpleTripApp` : `extensions.load (VM véhicule)("simpleTripApp")`, puis la globale `simpleTripApp`
---@class simpleTripApp
simpleTripApp = {}

--- Hook de chargement : renvoie false (déchargement) si le véhicule n'a ni roue ni dispositif powertrain, sinon appelle reset().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/simpleTripApp.lua:66
---@return boolean|nil  false pour demander le déchargement, nil sinon.
function simpleTripApp.onExtensionLoaded() end

--- Hook appelé par main.lua quand les joueurs assis changent ; décharge l'extension (extensions.unload) s'il n'y a plus de joueur ou si le véhicule est inadapté.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/simpleTripApp.lua:73
---@param anyPlayerSeated boolean true si au moins un joueur est assis dans ce véhicule.
function simpleTripApp.onPlayersChanged(anyPlayerSeated) end

--- Remet à zéro distance, temps, timer d'envoi (1 s), carburant précédent et carburant de départ. Appelé au chargement ; utilisable pour redémarrer un trajet.
---Source : lua/vehicle/extensions/simpleTripApp.lua:14
function simpleTripApp.reset() end

--- Appelé à chaque frame graphique via extensions.hook('updateGFX'). Intègre distance et temps, puis toutes les ~1 s réelle calcule les statistiques et appelle guihooks.trigger('tripData', data).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/simpleTripApp.lua:22
---@param dtSim number Pas de temps de simulation en secondes.
function simpleTripApp.updateGFX(dtSim) end

