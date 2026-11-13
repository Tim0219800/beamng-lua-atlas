---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/apps/minimap/roads.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Dessine les routes du graphe de navigation (map.getMap()) sur la mini-carte. Au premier appel, il construit un tableau de segments (positions, couleur selon drivability) et un kd-tree 2D (kdtreebox2d) ; aux appels suivants il interroge le kd-tree autour de la caméra et trace les segments visibles avec td:lineRoundEndWithBackground sur les couches ROADS_BG/ROADS_FG. Module utilitaire de la minimap, chargé par require, pas une extension à appeler directement.
--- Accès : extension `ui_apps_minimap_roads` : `extensions.load("ui_apps_minimap_roads")`, puis la globale `ui_apps_minimap_roads`
---@class ui_apps_minimap_roads
ui_apps_minimap_roads = {}

--- Construit le cache des routes au premier appel, puis dessine les routes visibles dans le carré de côté 2*radius centré sur la caméra.
---Source : lua/ge/extensions/ui/apps/minimap/roads.lua:15
---@param p table|nil Profileur optionnel (méthode add).
---@param radius number Demi-côté de la zone interrogée, en mètres monde.
---@param td table Objet de dessin de la minimap (doit fournir lineRoundEndWithBackground).
---@param debugSettings table Réglages de debug ; seul drawGrid est lu.
---@param camPos vec3 Position de la caméra (x, y utilisés).
---@param scale number Échelle de la carte ; la largeur de trait est 2 / scale * dpi.
---@param dpi number|nil Facteur d'échelle d'écran, 1 par défaut.
function ui_apps_minimap_roads.drawRoads(p, radius, td, debugSettings, camPos, scale, dpi) end

--- Vide le cache (kd-tree et indicateur hasRoads) ; il sera reconstruit au prochain drawRoads.
---Source : lua/ge/extensions/ui/apps/minimap/roads.lua:95
function ui_apps_minimap_roads.reset() end

