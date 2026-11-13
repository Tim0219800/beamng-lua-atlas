---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/statisticModules/watchRollover.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module de statistiques qui détecte les tonneaux (véhicule retourné sur le toit puis remis sur ses roues) et incrémente la métrique « vehicle/rollover » via gameplay_statistic.metricAdd. Il est appelé par gameplay_statistic avec la fonction workload.
--- Accès : extension `gameplay_statisticModules_watchRollover` : `extensions.load("gameplay_statisticModules_watchRollover")`, puis la globale `gameplay_statisticModules_watchRollover`
---@class gameplay_statisticModules_watchRollover
gameplay_statisticModules_watchRollover = {}

--- Hook appelé au chargement de l'extension ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statisticModules/watchRollover.lua:66
function gameplay_statisticModules_watchRollover.onExtensionLoaded() end

--- Hook appelé quand un véhicule est réinitialisé : annule la détection s'il s'agit du véhicule suivi.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statisticModules/watchRollover.lua:62
---@param vid integer Identifiant du véhicule.
function gameplay_statisticModules_watchRollover.onVehicleResetted(vid) end

--- Hook appelé au changement de véhicule contrôlé : annule la détection.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statisticModules/watchRollover.lua:69
---@param oldid integer Ancien véhicule.
---@param newid integer Nouveau véhicule.
---@param player integer Indice du joueur.
function gameplay_statisticModules_watchRollover.onVehicleSwitched(oldid, newid, player) end

--- Analyse un véhicule à chaque appel (axes haut/avant, vitesse) et compte un tonneau quand la séquence toit puis roues est détectée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statisticModules/watchRollover.lua:28
---@param v userdata Objet véhicule.
---@param vid integer Identifiant du véhicule ; un changement annule la détection.
---@param dtSim number Temps simulé écoulé en secondes.
function gameplay_statisticModules_watchRollover.workload(v, vid, dtSim) end

