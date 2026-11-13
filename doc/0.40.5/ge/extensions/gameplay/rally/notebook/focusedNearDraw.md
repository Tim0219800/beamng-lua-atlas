# `gameplay_rally_notebook_focusedNearDraw`

*Fichier : `lua/ge/extensions/gameplay/rally/notebook/focusedNearDraw.lua` · VM : Game Engine (GE) · 356 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_notebook_focusedNearDraw` : `extensions.load("gameplay_rally_notebook_focusedNearDraw")`, puis la globale `gameplay_rally_notebook_focusedNearDraw`

Dessin de debug de l'éditeur de notes de rallye (pacenotes) : quand la caméra est proche des notes, ne dessine que la portion de la route (snaproad) et les notes proches du point visé par la caméra. Le point visé (pivot) est la position du snaproad la plus proche du rayon de la caméra. Les prismes de route sont rétrécis progressivement vers la fenêtre minimale (nearbyCount notes de chaque côté) à mesure que la caméra se rapproche. Utilisé par l'outil pacenotes de l'éditeur.

## Exemple

```lua
local ctx = gameplay_rally_notebook_focusedNearDraw.buildContext(path, snaproad, state, 650, 3)
if ctx then gameplay_rally_notebook_focusedNearDraw.draw(ctx, path, snaproad, state, 1, 1.945, false) end
```

## Remarques

- buildContext renvoie nil quand la caméra est à plus de 2/3 de maxDistance des notes (fullDrawDistanceRatio) : l'appelant doit alors dessiner autrement (vue d'ensemble).
- buildContext écrit pacenoteToolsState._pacenoteLabelRaycastCursorPos (position du pivot) et getCameraLookSnaproadLocation met en cache dans pacenoteToolsState._pacenoteLabelRaycastLocationCache (clé : snaproad, position et direction de la caméra).
- Les prismes ont une hauteur de 0.5 m et une largeur par défaut de 1.945 m ; la couleur vient de util/colors (snaproads_clr_recce, snaproads_alpha).
- Les paramètres path, snaproad de draw ne servent que pour la signature : draw utilise context et snaproad pour les prismes, context et pacenoteToolsState pour les notes.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_notebook_focusedNearDraw.buildContext(path, snaproad, pacenoteToolsState, maxDistance, nearbyCount)` | Prépare le contexte de dessin : entrées de notes (distances début/fin le long de la route), pivot, fenêtre [startDistance, endDistance] de la route à dessiner. La fenêtre va de la fenêtre minimale (notes voisines) à toute la route selon la distance de la caméra. | 253 |
| `gameplay_rally_notebook_focusedNearDraw.draw(context, path, snaproad, pacenoteToolsState, globalOpacity, prismWidth, drawOnTop)` | Dessine les prismes de route de la fenêtre du contexte, puis chaque note dont l'étendue recoupe la fenêtre via pacenote:drawDebugPacenoteNoSelection. | 350 |
| `gameplay_rally_notebook_focusedNearDraw.getCameraLookSnaproadLocation(pacenoteToolsState, snaproad, cameraPos, pointDistances)` | Renvoie l'emplacement du snaproad le plus proche du rayon partant de la caméra (position, segment, xnorm, distanceAlongRoute…). Si le snaproad n'expose pas _allPoints, ou si la caméra n'a pas de direction, utilise le point du snaproad le plus proche de la caméra. Le résultat est mis en cache tant que la caméra ne bouge pas. | 104 |

### Détail des paramètres

#### `gameplay_rally_notebook_focusedNearDraw.buildContext(path, snaproad, pacenoteToolsState, maxDistance, nearbyCount)`

Prépare le contexte de dessin : entrées de notes (distances début/fin le long de la route), pivot, fenêtre [startDistance, endDistance] de la route à dessiner. La fenêtre va de la fenêtre minimale (notes voisines) à toute la route selon la distance de la caméra.

- `path` (*table*) : Notebook (path.pacenotes.sorted).
- `snaproad` (*table*) : Snaproad (doit avoir totalRouteLength).
- `pacenoteToolsState` (*table*) : État de l'outil.
- `maxDistance` (*number|nil*) : Distance maximale caméra-notes en mètres (défaut 650).
- `nearbyCount` (*integer|nil*) : Nombre de notes gardées de chaque côté du pivot (défaut 3).
- **renvoie** : table|nil {entries, pivotLoc, pointDistances, startDistance, endDistance, totalLength} ou nil si rien à dessiner.

#### `gameplay_rally_notebook_focusedNearDraw.draw(context, path, snaproad, pacenoteToolsState, globalOpacity, prismWidth, drawOnTop)`

Dessine les prismes de route de la fenêtre du contexte, puis chaque note dont l'étendue recoupe la fenêtre via pacenote:drawDebugPacenoteNoSelection.

- `context` (*table|nil*) : Résultat de buildContext.
- `path` (*table*) : Notebook (non utilisé directement).
- `snaproad` (*table*) : Snaproad.
- `pacenoteToolsState` (*table*) : État de l'outil.
- `globalOpacity` (*number|nil*) : Opacité globale (défaut 1).
- `prismWidth` (*number|nil*) : Largeur des prismes en mètres (défaut 1.945).
- `drawOnTop` (*boolean|nil*) : true pour dessiner par-dessus la géométrie (sans test de profondeur).

#### `gameplay_rally_notebook_focusedNearDraw.getCameraLookSnaproadLocation(pacenoteToolsState, snaproad, cameraPos, pointDistances)`

Renvoie l'emplacement du snaproad le plus proche du rayon partant de la caméra (position, segment, xnorm, distanceAlongRoute…). Si le snaproad n'expose pas _allPoints, ou si la caméra n'a pas de direction, utilise le point du snaproad le plus proche de la caméra. Le résultat est mis en cache tant que la caméra ne bouge pas.

- `pacenoteToolsState` (*table*) : État de l'outil (sert de cache).
- `snaproad` (*table*) : Objet snaproad (closestSnapResult, _allPoints, routeLocationForPoint).
- `cameraPos` (*vec3*) : Position de la caméra.
- `pointDistances` (*table<integer, number>|nil*) : Distances cumulées le long de la route, par index ou id de point.
- **renvoie** : table|nil Emplacement {pos, fromPoint, toPoint, nearestPoint, segmentIndex, xnorm, distanceAlongRoute, distSq, rayPos} ou nil.

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSquarePrism`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/notebook/focusedNearDraw.lua`.*
