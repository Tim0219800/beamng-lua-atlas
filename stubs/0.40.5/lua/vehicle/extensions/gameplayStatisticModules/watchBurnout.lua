---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayStatisticModules/watchBurnout.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module de gameplayStatistic qui détecte les burnouts : une roue motrice intacte patine (vitesse de roue > 2 et > 1,5 x vitesse sol, glissement pondéré par la charge > 4) tout en touchant le sol. À la fin, si la durée dépasse 0,1 s, ajoute la métrique 'vehicle/burnout.time' (agrégée).
--- Accès : extension `gameplayStatisticModules_watchBurnout` : `extensions.load (VM véhicule)("gameplayStatisticModules_watchBurnout")`, puis la globale `gameplayStatisticModules_watchBurnout`
---@class gameplayStatisticModules_watchBurnout
gameplayStatisticModules_watchBurnout = {}

--- Appelé au chargement : liste les roues motrices ; renvoie false pour se décharger si le véhicule ne convient pas.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayStatisticModules/watchBurnout.lua:42
---@return boolean|nil  false pour demander le déchargement.
function gameplayStatisticModules_watchBurnout.onExtensionLoaded() end

--- Fonction de surveillance exécutée à tour de rôle par gameplayStatistic : détecte début/fin de burnout et envoie la métrique.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayStatisticModules/watchBurnout.lua:15
function gameplayStatisticModules_watchBurnout.workload() end

