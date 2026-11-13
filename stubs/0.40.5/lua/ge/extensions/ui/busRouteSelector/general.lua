---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/busRouteSelector/general.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Backend du sélecteur en grille de l'assistant Vue « BusRoute ». Décrit via un descripteur les niveaux ayant des lignes de bus (scenario_scenariosLoader.getLevels('bus')) et, par niveau, la liste de ses lignes, puis délègue à ui/oneshotRaceSelector/core.createBackend(descriptor). Toutes les fonctions publiques du backend généré sont copiées dans M.
--- Accès : extension `ui_busRouteSelector_general` : `extensions.load("ui_busRouteSelector_general")`, puis la globale `ui_busRouteSelector_general`
---@class ui_busRouteSelector_general
---@field dependencies string[] {"scenario_scenariosLoader"} : extension chargée avant celle-ci.
ui_busRouteSelector_general = {}

