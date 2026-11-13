# `ui_apps_minimap_topomap`

*Fichier : `lua/ge/extensions/ui/apps/minimap/topomap.lua` · VM : Game Engine (GE) · 434 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_apps_minimap_topomap` : `extensions.load("ui_apps_minimap_topomap")`, puis la globale `ui_apps_minimap_topomap`

Carte topographique de la minimap. Calcule les bornes du niveau à partir des nœuds du navgraph (`map.getMap()`), échantillonne la hauteur du terrain sur une grille (une mesure tous les 5 m, via `core_terrain.getTerrainHeight`), génère des courbes de niveau par l'algorithme des marching squares, les range dans un arbre spatial (`kdtreebox2d`) et sait les dessiner sur la texture de la minimap. Les données sont vidées au début et à la fin d'une mission.

## Remarques

- BUG : drawContours appelle `ui_apps_sdfTopomap.getContourSegments()` et `getContourQuadtree()` au lieu de `M` ; minimap.lua teste aussi `ui_apps_sdfTopomap`. Aucun fichier de 0.40.5 ne définit cette extension (ancien nom), donc le test `if ui_apps_sdfTopomap and ...` échoue et les courbes de niveau ne sont jamais dessinées par ce chemin.
- Le paramètre `worldToMapXYZ` de drawContours n'est pas utilisé : la fonction récupère la transformation via `ui_apps_minimap_utils.getWorldToMapTransform()`.
- drawContours limite le dessin à 5000 segments par appel et ne considère que les segments dans un rayon de 200 * scale autour de la caméra. Les niveaux vont de 0 à 100 ; les multiples de 10 sont tracés plus épais.
- loadTopoMap enchaîne trois étapes (bornes, scan du terrain, contours) et renvoie false dès qu'une échoue ; elle renvoie true sans rien refaire si la carte est déjà chargée.
- Beaucoup de logs `log("I", ...)` sont émis pendant la génération.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_apps_minimap_topomap.drawContours(td, width, height, scale, camPos, worldToMapXYZ)` | Dessine les courbes de niveau proches de la caméra sur la texture de la minimap, dans la couche BACKGROUND. Gris d'autant plus clair que le niveau est haut. *(interne)* | 385 |
| `ui_apps_minimap_topomap.getContourQuadtree()` | Renvoie l'arbre spatial `kdtreebox2d` indexant les segments de contours, ou nil si non généré. | 415 |
| `ui_apps_minimap_topomap.getContourSegments()` | Renvoie la liste des segments de courbes de niveau. Chaque segment est `{niveau, x1, y1, x2, y2}` (déduit de drawContours). | 414 |
| `ui_apps_minimap_topomap.getHeightmapBounds()` | Renvoie les bornes monde de la heightmap. | 413 |
| `ui_apps_minimap_topomap.getHeightmapData()` | Renvoie la table de la grille de hauteurs (champs `data`, `gridWidth`, `gridHeight` utilisés par le code ; vide avant le chargement). | 412 |
| `ui_apps_minimap_topomap.isLoaded()` | Indique si la carte topographique est chargée. | 411 |
| `ui_apps_minimap_topomap.loadTopoMap()` | Charge la carte topographique : bornes du navgraph, grille de hauteurs du terrain, puis courbes de niveau et arbre spatial. Sans effet (renvoie true) si déjà chargée. | 357 |
| `ui_apps_minimap_topomap.onClientEndMission()` | Hook appelé à la fin d'une mission/niveau. Réinitialise la heightmap, les bornes et les contours et marque la carte comme non chargée. *(interne)* *(hook)* | 418 |
| `ui_apps_minimap_topomap.onClientStartMission()` | Hook appelé au début d'une mission/niveau. Même réinitialisation que onClientEndMission. *(interne)* *(hook)* | 426 |

### Détail des paramètres

#### `ui_apps_minimap_topomap.drawContours(td, width, height, scale, camPos, worldToMapXYZ)`

Dessine les courbes de niveau proches de la caméra sur la texture de la minimap, dans la couche BACKGROUND. Gris d'autant plus clair que le niveau est haut.

- `td` (*table*) : Objet de dessin de texture (TextureDrawPrimitive) de la minimap.
- `width` (*number*) : Largeur de la minimap (inutilisé ici).
- `height` (*number*) : Hauteur de la minimap (inutilisé ici).
- `scale` (*number*) : Échelle de la minimap en px/m ; le rayon de requête vaut 200 * scale.
- `camPos` (*vec3*) : Position de la caméra dans le monde.
- `worldToMapXYZ` (*function*) : Inutilisé (la transformation est relue dans ui_apps_minimap_utils).

#### `ui_apps_minimap_topomap.getContourQuadtree()`

Renvoie l'arbre spatial `kdtreebox2d` indexant les segments de contours, ou nil si non généré.

- **renvoie** : table|nil Arbre spatial des segments.

#### `ui_apps_minimap_topomap.getContourSegments()`

Renvoie la liste des segments de courbes de niveau. Chaque segment est `{niveau, x1, y1, x2, y2}` (déduit de drawContours).

- **renvoie** : table<integer, table> Segments de contours.

#### `ui_apps_minimap_topomap.getHeightmapBounds()`

Renvoie les bornes monde de la heightmap.

- **renvoie** : table `{minX, maxX, minY, maxY}` en mètres (tous à 0 avant le chargement).

#### `ui_apps_minimap_topomap.getHeightmapData()`

Renvoie la table de la grille de hauteurs (champs `data`, `gridWidth`, `gridHeight` utilisés par le code ; vide avant le chargement).

- **renvoie** : table Données de la heightmap.

#### `ui_apps_minimap_topomap.isLoaded()`

Indique si la carte topographique est chargée.

- **renvoie** : boolean true une fois loadTopoMap réussi, remis à false à chaque début/fin de mission.

#### `ui_apps_minimap_topomap.loadTopoMap()`

Charge la carte topographique : bornes du navgraph, grille de hauteurs du terrain, puis courbes de niveau et arbre spatial. Sans effet (renvoie true) si déjà chargée.

- **renvoie** : boolean true si la carte est chargée, false si une étape a échoué.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/apps/minimap/topomap.lua`.*
