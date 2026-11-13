---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/apps/minimap/layers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Constantes numériques des couches de dessin de la mini-carte. Les couches sont rendues de la plus basse (0) à la plus haute : fond, grille, routes, itinéraire, marqueurs de gameplay, véhicules, masque rond/carré, boussole, pointeurs, debug. Ce n'est pas une extension chargeable : les modules de la minimap le lisent par require("ui/apps/minimap/layers").
--- Accès : extension `ui_apps_minimap_layers` : `extensions.load("ui_apps_minimap_layers")`, puis la globale `ui_apps_minimap_layers`
---@class ui_apps_minimap_layers
---@field BACKGROUND integer 0 : fond (tout en bas).
---@field BG_GRID integer 10 : grille de fond.
---@field COMPASS integer 120 : boussole.
---@field DEBUG integer 150 : couche de debug (tout en haut).
---@field GAMEPLAY_MARKERS integer 60 : marqueurs de gameplay.
---@field GAMEPLAY_POINTER integer 140 : pointeur de gameplay.
---@field ROADS_BG integer 20 : contour des routes.
---@field ROADS_FG integer 30 : trait des routes.
---@field ROUND_OR_SQUARE_MASK integer 110 : masque d'occlusion (cadre rond ou carré).
---@field ROUTE_BG integer 40 : contour de l'itinéraire.
---@field ROUTE_FG integer 50 : trait de l'itinéraire.
---@field ROUTE_POINTER integer 130 : pointeur vers la destination.
---@field VEHICLES_OTHER integer 70 : autres véhicules.
---@field VEHICLES_POLICE integer 80 : véhicules de police.
---@field VEHICLES_USABLE integer 90 : véhicules utilisables.
---@field VEHICLE_PLAYER integer 100 : véhicule du joueur.
ui_apps_minimap_layers = {}

