---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayStatisticModules/watchAirtime.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module de gameplayStatistic qui mesure le temps où le véhicule est entièrement en l'air : vitesse sol > 6 m/s, aucune roue en contact (contactMaterialID1 et 2 = -1) et axe haut du véhicule à moins de 45° de la verticale (z > 0,707). Au retour au sol, si la durée dépasse 0,1 s, ajoute la métrique 'vehicle/airtime.time' (agrégée).
--- Accès : extension `gameplayStatisticModules_watchAirtime` : `extensions.load (VM véhicule)("gameplayStatisticModules_watchAirtime")`, puis la globale `gameplayStatisticModules_watchAirtime`
---@class gameplayStatisticModules_watchAirtime
gameplayStatisticModules_watchAirtime = {}

--- Appelé au chargement : mémorise le nombre de roues ; renvoie false pour se décharger si le véhicule ne convient pas.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayStatisticModules/watchAirtime.lua:39
---@return boolean|nil  false pour demander le déchargement.
function gameplayStatisticModules_watchAirtime.onExtensionLoaded() end

--- Fonction de surveillance exécutée à tour de rôle par gameplayStatistic : met à jour l'état 'en l'air' et envoie la métrique à l'atterrissage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayStatisticModules/watchAirtime.lua:11
function gameplayStatisticModules_watchAirtime.workload() end

