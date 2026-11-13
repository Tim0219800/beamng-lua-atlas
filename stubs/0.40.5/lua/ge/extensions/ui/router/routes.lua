---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Registre racine des routes du routeur UI : l'unique point d'entrée explicite pour enregistrer les familles de routes de premier niveau. Chaque entrée `{ include = "nom" }` monte le module de routes/nom.lua (Root + Children). Il n'y a pas de découverte automatique par le système de fichiers : un module n'est enregistré que s'il est listé ici (ou ajouté à l'exécution via routeManager.addVueRoutes / registerModRoutes). Lu par routeManager.
--- Accès : extension `ui_router_routes` : `extensions.load("ui_router_routes")`, puis la globale `ui_router_routes`
---@class ui_router_routes
---@field Children table[] Liste d'entrées `{ include = "module" }` : bigmap, campaign, career, debug, default, firstDrive, freeroamLevels, freeroamWizard, garage, legal, livery, liveries, menu, mission, mods, multiseat, multiplayer, options, pause, radial, scenario, taxi, trackBuilder.
---@field Global table `{ include = "global" }` : module des routes globales plates (play, /mainmenu, etc.).
ui_router_routes = {}

