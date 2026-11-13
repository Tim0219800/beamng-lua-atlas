---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/notebook/focusedNearDraw.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Dessin de debug de l'éditeur de notes de rallye (pacenotes) : quand la caméra est proche des notes, ne dessine que la portion de la route (snaproad) et les notes proches du point visé par la caméra. Le point visé (pivot) est la position du snaproad la plus proche du rayon de la caméra. Les prismes de route sont rétrécis progressivement vers la fenêtre minimale (nearbyCount notes de chaque côté) à mesure que la caméra se rapproche. Utilisé par l'outil pacenotes de l'éditeur.
--- Accès : extension `gameplay_rally_notebook_focusedNearDraw` : `extensions.load("gameplay_rally_notebook_focusedNearDraw")`, puis la globale `gameplay_rally_notebook_focusedNearDraw`
---@class gameplay_rally_notebook_focusedNearDraw
gameplay_rally_notebook_focusedNearDraw = {}

--- Prépare le contexte de dessin : entrées de notes (distances début/fin le long de la route), pivot, fenêtre [startDistance, endDistance] de la route à dessiner. La fenêtre va de la fenêtre minimale (notes voisines) à toute la route selon la distance de la caméra.
---Source : lua/ge/extensions/gameplay/rally/notebook/focusedNearDraw.lua:253
---@param path table Notebook (path.pacenotes.sorted).
---@param snaproad table Snaproad (doit avoir totalRouteLength).
---@param pacenoteToolsState table État de l'outil.
---@param maxDistance number|nil Distance maximale caméra-notes en mètres (défaut 650).
---@param nearbyCount integer|nil Nombre de notes gardées de chaque côté du pivot (défaut 3).
---@return table|nil  {entries, pivotLoc, pointDistances, startDistance, endDistance, totalLength} ou nil si rien à dessiner.
function gameplay_rally_notebook_focusedNearDraw.buildContext(path, snaproad, pacenoteToolsState, maxDistance, nearbyCount) end

--- Dessine les prismes de route de la fenêtre du contexte, puis chaque note dont l'étendue recoupe la fenêtre via pacenote:drawDebugPacenoteNoSelection.
---Source : lua/ge/extensions/gameplay/rally/notebook/focusedNearDraw.lua:350
---@param context table|nil Résultat de buildContext.
---@param path table Notebook (non utilisé directement).
---@param snaproad table Snaproad.
---@param pacenoteToolsState table État de l'outil.
---@param globalOpacity number|nil Opacité globale (défaut 1).
---@param prismWidth number|nil Largeur des prismes en mètres (défaut 1.945).
---@param drawOnTop boolean|nil true pour dessiner par-dessus la géométrie (sans test de profondeur).
function gameplay_rally_notebook_focusedNearDraw.draw(context, path, snaproad, pacenoteToolsState, globalOpacity, prismWidth, drawOnTop) end

--- Renvoie l'emplacement du snaproad le plus proche du rayon partant de la caméra (position, segment, xnorm, distanceAlongRoute…). Si le snaproad n'expose pas _allPoints, ou si la caméra n'a pas de direction, utilise le point du snaproad le plus proche de la caméra. Le résultat est mis en cache tant que la caméra ne bouge pas.
---Source : lua/ge/extensions/gameplay/rally/notebook/focusedNearDraw.lua:104
---@param pacenoteToolsState table État de l'outil (sert de cache).
---@param snaproad table Objet snaproad (closestSnapResult, _allPoints, routeLocationForPoint).
---@param cameraPos vec3 Position de la caméra.
---@param pointDistances table<integer, number>|nil Distances cumulées le long de la route, par index ou id de point.
---@return table|nil  Emplacement {pos, fromPoint, toPoint, nearestPoint, segmentIndex, xnorm, distanceAlongRoute, distSq, rayPos} ou nil.
function gameplay_rally_notebook_focusedNearDraw.getCameraLookSnaproadLocation(pacenoteToolsState, snaproad, cameraPos, pointDistances) end

