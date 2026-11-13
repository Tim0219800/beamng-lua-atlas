---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/apps/minimap/route.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Dessine sur la mini-carte l'itinéraire de navigation (core_groundMarkers.routePlanner.path) et le pointeur de destination. L'itinéraire est un trait bleu sur contour blanc qui devient plus clair près de la position courante (mélange sur 75 m). Les autres extensions peuvent remplacer l'itinéraire via le hook onMinimapRouteOverride. Module utilitaire de la minimap, chargé par require.
--- Accès : extension `ui_apps_minimap_route` : `extensions.load("ui_apps_minimap_route")`, puis la globale `ui_apps_minimap_route`
---@class ui_apps_minimap_route
ui_apps_minimap_route = {}

--- Dessine l'itinéraire : les routes de remplacement si une extension en fournit via onMinimapRouteOverride, sinon le chemin du routePlanner.
---Source : lua/ge/extensions/ui/apps/minimap/route.lua:67
---@param td table Objet de dessin de la minimap (lineRoundEndWithBackground).
---@param dpi number|nil Facteur d'échelle d'écran, 1 par défaut.
---@param camPos vec3|nil Position de la caméra pour le culling.
---@param cullRadius number|nil Demi-côté du carré de culling, en mètres ; sans lui, aucun culling.
function ui_apps_minimap_route.drawNavigationRoute(td, dpi, camPos, cullRadius) end

--- Dessine un pointeur circulaire sur le dernier point de l'itinéraire (la destination) via ui_apps_minimap_utils.simpleCircleWithEdgePointer ; ne fait rien s'il n'y a pas de route.
---Source : lua/ge/extensions/ui/apps/minimap/route.lua:83
---@param td table Objet de dessin (non utilisé directement).
function ui_apps_minimap_route.drawRoutePointer(td) end

