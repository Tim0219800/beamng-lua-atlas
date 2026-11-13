---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/statisticModules/watchJturn.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module de statistiques qui détecte les « J-turns » (demi-tour en marche arrière puis marche avant) du véhicule joueur et incrémente la métrique « vehicle/jturn » via gameplay_statistic.metricAdd. Il est appelé par gameplay_statistic avec la fonction workload à chaque tour de surveillance.
--- Accès : extension `gameplay_statisticModules_watchJturn` : `extensions.load("gameplay_statisticModules_watchJturn")`, puis la globale `gameplay_statisticModules_watchJturn`
---@class gameplay_statisticModules_watchJturn
gameplay_statisticModules_watchJturn = {}

--- Hook appelé au chargement de l'extension ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statisticModules/watchJturn.lua:91
function gameplay_statisticModules_watchJturn.onExtensionLoaded() end

--- Hook appelé quand un véhicule est réinitialisé : annule la détection s'il s'agit du véhicule suivi.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statisticModules/watchJturn.lua:87
---@param vid integer Identifiant du véhicule.
function gameplay_statisticModules_watchJturn.onVehicleResetted(vid) end

--- Hook appelé au changement de véhicule contrôlé : annule la détection.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statisticModules/watchJturn.lua:94
---@param oldid integer Ancien véhicule.
---@param newid integer Nouveau véhicule.
---@param player integer Indice du joueur.
function gameplay_statisticModules_watchJturn.onVehicleSwitched(oldid, newid, player) end

--- Analyse un véhicule à chaque appel (vitesse, direction) et compte un J-turn quand la séquence recul puis marche avant est détectée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/statisticModules/watchJturn.lua:29
---@param v userdata Objet véhicule.
---@param vid integer Identifiant du véhicule ; un changement de véhicule annule la détection.
---@param dtSim number Temps simulé écoulé en secondes.
function gameplay_statisticModules_watchJturn.workload(v, vid, dtSim) end

