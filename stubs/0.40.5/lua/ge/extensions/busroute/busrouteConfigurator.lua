---@meta
-- tim19Atlas stub generated from lua/ge/extensions/busroute/busrouteConfigurator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Backend de l'étape « aperçu / options » de l'assistant Vue des lignes de bus. Il décrit le mode « busRoute » (descripteur) et le passe à oneshotRaceCore.createConfigurator, dont le résultat est le module exporté. Ici le choix « du milieu » est un fichier de scénario complet (scenario_scenariosLoader.getLevels("bus")) ; le choix de véhicule est limité aux bus de transport en commun (vehicleRestrictionMode = "busRoute"). Les réglages sont : strictStop (arrêt strict, vrai par défaut) et traffic (circulation, faux par défaut). Rien n'est sauvegardé (en mémoire seulement).
--- Accès : extension `busroute_busrouteConfigurator` : `extensions.load("busroute_busrouteConfigurator")`, puis la globale `busroute_busrouteConfigurator`
---@class busroute_busrouteConfigurator
---@field dependencies table<integer, string> Extensions chargées avant : scenario_scenariosLoader, core_highscores, ui_vehicleSelector_general, ui_busRouteSelector_general.
busroute_busrouteConfigurator = {}

