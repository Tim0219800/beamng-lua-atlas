---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/apps/minimap/topomap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Carte topographique de la minimap. Calcule les bornes du niveau à partir des nœuds du navgraph (`map.getMap()`), échantillonne la hauteur du terrain sur une grille (une mesure tous les 5 m, via `core_terrain.getTerrainHeight`), génère des courbes de niveau par l'algorithme des marching squares, les range dans un arbre spatial (`kdtreebox2d`) et sait les dessiner sur la texture de la minimap. Les données sont vidées au début et à la fin d'une mission.
--- Accès : extension `ui_apps_minimap_topomap` : `extensions.load("ui_apps_minimap_topomap")`, puis la globale `ui_apps_minimap_topomap`
---@class ui_apps_minimap_topomap
ui_apps_minimap_topomap = {}

--- Dessine les courbes de niveau proches de la caméra sur la texture de la minimap, dans la couche BACKGROUND. Gris d'autant plus clair que le niveau est haut.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/apps/minimap/topomap.lua:385
---@param td table Objet de dessin de texture (TextureDrawPrimitive) de la minimap.
---@param width number Largeur de la minimap (inutilisé ici).
---@param height number Hauteur de la minimap (inutilisé ici).
---@param scale number Échelle de la minimap en px/m ; le rayon de requête vaut 200 * scale.
---@param camPos vec3 Position de la caméra dans le monde.
---@param worldToMapXYZ function Inutilisé (la transformation est relue dans ui_apps_minimap_utils).
function ui_apps_minimap_topomap.drawContours(td, width, height, scale, camPos, worldToMapXYZ) end

--- Renvoie l'arbre spatial `kdtreebox2d` indexant les segments de contours, ou nil si non généré.
---Source : lua/ge/extensions/ui/apps/minimap/topomap.lua:415
---@return table|nil  Arbre spatial des segments.
function ui_apps_minimap_topomap.getContourQuadtree() end

--- Renvoie la liste des segments de courbes de niveau. Chaque segment est `{niveau, x1, y1, x2, y2}` (déduit de drawContours).
---Source : lua/ge/extensions/ui/apps/minimap/topomap.lua:414
---@return table<integer, table>  Segments de contours.
function ui_apps_minimap_topomap.getContourSegments() end

--- Renvoie les bornes monde de la heightmap.
---Source : lua/ge/extensions/ui/apps/minimap/topomap.lua:413
---@return table  `{minX, maxX, minY, maxY}` en mètres (tous à 0 avant le chargement).
function ui_apps_minimap_topomap.getHeightmapBounds() end

--- Renvoie la table de la grille de hauteurs (champs `data`, `gridWidth`, `gridHeight` utilisés par le code ; vide avant le chargement).
---Source : lua/ge/extensions/ui/apps/minimap/topomap.lua:412
---@return table  Données de la heightmap.
function ui_apps_minimap_topomap.getHeightmapData() end

--- Indique si la carte topographique est chargée.
---Source : lua/ge/extensions/ui/apps/minimap/topomap.lua:411
---@return boolean  true une fois loadTopoMap réussi, remis à false à chaque début/fin de mission.
function ui_apps_minimap_topomap.isLoaded() end

--- Charge la carte topographique : bornes du navgraph, grille de hauteurs du terrain, puis courbes de niveau et arbre spatial. Sans effet (renvoie true) si déjà chargée.
---Source : lua/ge/extensions/ui/apps/minimap/topomap.lua:357
---@return boolean  true si la carte est chargée, false si une étape a échoué.
function ui_apps_minimap_topomap.loadTopoMap() end

--- Hook appelé à la fin d'une mission/niveau. Réinitialise la heightmap, les bornes et les contours et marque la carte comme non chargée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/apps/minimap/topomap.lua:418
function ui_apps_minimap_topomap.onClientEndMission() end

--- Hook appelé au début d'une mission/niveau. Même réinitialisation que onClientEndMission.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/apps/minimap/topomap.lua:426
function ui_apps_minimap_topomap.onClientStartMission() end

