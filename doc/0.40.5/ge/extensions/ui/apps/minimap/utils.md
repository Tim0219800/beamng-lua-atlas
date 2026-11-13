# `ui_apps_minimap_utils`

*Fichier : `lua/ge/extensions/ui/apps/minimap/utils.lua` · VM : Game Engine (GE) · 391 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_apps_minimap_utils` : `extensions.load("ui_apps_minimap_utils")`, puis la globale `ui_apps_minimap_utils`

Utilitaires partagés de la mini-carte : conversion coordonnées monde / carte (transformation affine recalculée à chaque setMinimapState), recadrage dans les limites de la carte (cercle ou carré), dessin de formes simples (cercle, ligne, pointeur de bord, grille de 50 m) et palettes de couleurs (Default, Monochrome, Green, Blue, Orange, Grayscale). Le module minimap appelle setMinimapState à chaque frame ; les autres modules (roads, route, vehicles) s'en servent pour dessiner. Un moddeur qui ajoute un marqueur sur la minimap utilise surtout simpleCircleWithEdgePointer et worldToMapXY.

## Exemple

```lua
ui_apps_minimap_utils.simpleCircleWithEdgePointer(vec3(100, 200, 0), ui_apps_minimap_utils.colors.orange, nil, 8)
```

## Remarques

- Aucune fonction de dessin ne marche avant le premier setMinimapState (td, width, height… sont nil).
- La matrice monde vers carte : x_carte = x*XX + y*XYCoef + XOffset ; y_carte = x*YX + y*YY + YOffset ; l'axe Y de la carte est inversé.
- Bug : M.centerPointer est exporté mais la variable locale centerPointer n'existe pas ; le champ vaut nil.
- La fonction locale worldToMapXYInverse (monde depuis carte) est définie mais jamais exportée ; mapToWorld, elle, utilise centerX/centerY et la rotation inverse.
- drawEdgePointer ignore son paramètre strikeClr : le contour est toujours blanc et la bordure clrNavBg (blanc). setClampToBounds ne s'en sert pas non plus : son paramètre maxDistance est inutilisé.
- Les couleurs sont des objets color(r,g,b,a) avec composantes de 0 à 255.
- Le jeu de couleurs utilisé est toujours l'indice 1 (Default) : defaultStyleRoadColorSet est une constante locale, non modifiable depuis l'extérieur.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_apps_minimap_utils.clampToMinimapBounds(pos, buffer)` | Recadre pos (modifié sur place) dans le rectangle de la carte élargi de buffer. | 152 |
| `ui_apps_minimap_utils.drawEdgePointer(pos, fill, strikeClr, radius, maxDistance)` | Dessine un pointeur sur le bord de la carte pour une position monde hors de la carte (couche ROUTE_POINTER). Ne dessine rien et renvoie false si la position est à l'intérieur. | 213 |
| `ui_apps_minimap_utils.drawGrid()` | Dessine une grille de fond avec un trait tous les 50 m monde, sur la couche BG_GRID, autour de la caméra. | 251 |
| `ui_apps_minimap_utils.getCurrentStyleColors()` | Renvoie le jeu de couleurs actif (l'indice par défaut). | 385 |
| `ui_apps_minimap_utils.getDefaultStyleColorSet()` | Renvoie l'indice du jeu de couleurs par défaut (toujours 1). | 380 |
| `ui_apps_minimap_utils.getStyleColorSet()` | Renvoie la liste des jeux de couleurs (Default, Monochrome, Green, Blue, Orange, Grayscale) avec color, colorLow, colorLowest, clrFocus, clrFocusMuted, gridWhite, navFg, navBg, grayMuted. | 375 |
| `ui_apps_minimap_utils.getWorldToMapTransform()` | Renvoie les six coefficients de la transformation affine monde vers carte, à passer aux fonctions de dessin transformé du td. | 108 |
| `ui_apps_minimap_utils.isInsideMinimapBounds(pos, buffer)` | Teste si un point carte est dans le rectangle de la carte, éventuellement réduit d'une marge. | 144 |
| `ui_apps_minimap_utils.mapToWorld(p)` | Convertit un point de la carte (pixels) en point monde (z = 0 avant ajout de la position caméra). | 135 |
| `ui_apps_minimap_utils.setClampToBounds(pos, inset, maxDistance)` | Ramène pos (modifié sur place) sur le bord de la carte (cercle de rayon width/2 - inset en mode circle, rectangle sinon) en conservant la direction depuis le centre. | 159 |
| `ui_apps_minimap_utils.setMinimapState(w, h, cx, cy, cp, cr, cri, s, si, textureDraw, ox, oy, minimapMode, dpi)` | Reçoit de la minimap principale la taille, le centre, la caméra, l'échelle, l'objet de dessin, le décalage, le mode (circle par défaut ou carré) et le dpi, puis recalcule les coefficients de transformation monde vers carte. *(interne)* | 37 |
| `ui_apps_minimap_utils.simpleCircle(pos, fill, strikeClr, radius)` | Dessine un marqueur circulaire à une position monde, sur la couche GAMEPLAY_MARKERS (orange et contour blanc par défaut). | 203 |
| `ui_apps_minimap_utils.simpleCircleWithEdgePointer(pos, fill, strikeClr, radius)` | Dessine un pointeur de bord si la position est hors carte, sinon un cercle simple à cette position. | 217 |
| `ui_apps_minimap_utils.simpleLine(pos1, pos2, fill, strikeClr)` | Dessine un segment à extrémités rondes entre deux positions monde, sur la couche GAMEPLAY_MARKERS. | 207 |
| `ui_apps_minimap_utils.simpleLineWithEdgePointer(pos1, pos2, fill, strikeClr)` | Utilise le milieu du segment : pointeur de bord s'il est hors carte, sinon ligne simple. | 224 |
| `ui_apps_minimap_utils.worldLineToMapXY(x1, y1, x2, y2)` | Convertit les deux extrémités d'un segment monde en coordonnées carte. | 101 |
| `ui_apps_minimap_utils.worldToMap(p)` | Convertit un point monde en point carte (version allouante, recalculée avec soustraction, division par l'échelle et rotation). Préférer worldToMapXY pour les boucles. | 73 |
| `ui_apps_minimap_utils.worldToMapXY(x, y)` | Convertit des coordonnées monde (x, y) en coordonnées carte. | 96 |
| `ui_apps_minimap_utils.worldToMapXYZ(target, source)` | Convertit source (x, y monde) en coordonnées carte et les écrit dans target (z = 0), sans allocation. | 87 |

### Détail des paramètres

#### `ui_apps_minimap_utils.clampToMinimapBounds(pos, buffer)`

Recadre pos (modifié sur place) dans le rectangle de la carte élargi de buffer.

- `pos` (*vec3*) : Point carte, modifié.
- `buffer` (*number|nil*) : Marge en pixels (0 par défaut).

#### `ui_apps_minimap_utils.drawEdgePointer(pos, fill, strikeClr, radius, maxDistance)`

Dessine un pointeur sur le bord de la carte pour une position monde hors de la carte (couche ROUTE_POINTER). Ne dessine rien et renvoie false si la position est à l'intérieur.

- `pos` (*vec3*) : Position monde visée.
- `fill` (*color|nil*) : Couleur de remplissage.
- `strikeClr` (*color|nil*) : Ignoré (contour toujours blanc).
- `radius` (*number|nil*) : Rayon en pixels (6 par défaut).
- `maxDistance` (*number|nil*) : Distance max pour afficher le pointeur (illimitée par défaut).
- **renvoie** : boolean true si un pointeur a été dessiné.

#### `ui_apps_minimap_utils.getCurrentStyleColors()`

Renvoie le jeu de couleurs actif (l'indice par défaut).

- **renvoie** : table Jeu de couleurs courant.

#### `ui_apps_minimap_utils.getDefaultStyleColorSet()`

Renvoie l'indice du jeu de couleurs par défaut (toujours 1).

- **renvoie** : integer Indice.

#### `ui_apps_minimap_utils.getStyleColorSet()`

Renvoie la liste des jeux de couleurs (Default, Monochrome, Green, Blue, Orange, Grayscale) avec color, colorLow, colorLowest, clrFocus, clrFocusMuted, gridWhite, navFg, navBg, grayMuted.

- **renvoie** : table<integer, table> Tableau de jeux de couleurs.

#### `ui_apps_minimap_utils.getWorldToMapTransform()`

Renvoie les six coefficients de la transformation affine monde vers carte, à passer aux fonctions de dessin transformé du td.

- **renvoie** : number XX.
- **renvoie** : number XYCoef.
- **renvoie** : number YX.
- **renvoie** : number YY.
- **renvoie** : number XOffset.
- **renvoie** : number YOffset.

#### `ui_apps_minimap_utils.isInsideMinimapBounds(pos, buffer)`

Teste si un point carte est dans le rectangle de la carte, éventuellement réduit d'une marge.

- `pos` (*vec3*) : Point carte.
- `buffer` (*number|nil*) : Marge intérieure en pixels (0 par défaut).
- **renvoie** : boolean true si strictement à l'intérieur.

#### `ui_apps_minimap_utils.mapToWorld(p)`

Convertit un point de la carte (pixels) en point monde (z = 0 avant ajout de la position caméra).

- `p` (*vec3*) : Point carte.
- **renvoie** : vec3 Point monde.

#### `ui_apps_minimap_utils.setClampToBounds(pos, inset, maxDistance)`

Ramène pos (modifié sur place) sur le bord de la carte (cercle de rayon width/2 - inset en mode circle, rectangle sinon) en conservant la direction depuis le centre.

- `pos` (*vec3*) : Point carte, modifié.
- `inset` (*number|nil*) : Retrait depuis le bord en pixels (0 par défaut).
- `maxDistance` (*number|nil*) : Non utilisé.
- **renvoie** : vec3 pos.
- **renvoie** : boolean true si le point a été ramené sur le bord.

#### `ui_apps_minimap_utils.setMinimapState(w, h, cx, cy, cp, cr, cri, s, si, textureDraw, ox, oy, minimapMode, dpi)`

Reçoit de la minimap principale la taille, le centre, la caméra, l'échelle, l'objet de dessin, le décalage, le mode (circle par défaut ou carré) et le dpi, puis recalcule les coefficients de transformation monde vers carte.

- `w` (*number*) : Largeur de la carte en pixels.
- `h` (*number*) : Hauteur de la carte en pixels.
- `cx` (*number*) : Centre X de la carte.
- `cy` (*number*) : Centre Y de la carte.
- `cp` (*vec3*) : Position de la caméra (monde).
- `cr` (*quat*) : Rotation de la caméra.
- `cri` (*quat*) : Rotation inverse de la caméra.
- `s` (*number*) : Échelle : mètres par pixel.
- `si` (*number*) : Inverse de l'échelle.
- `textureDraw` (*table*) : Objet de dessin (circleMarker, edgePointer, line, lineRoundEndTransformed…).
- `ox` (*number|nil*) : Décalage horizontal de la carte (0 par défaut).
- `oy` (*number|nil*) : Décalage vertical de la carte (0 par défaut).
- `minimapMode` (*string|nil*) : 'circle' (défaut) ou autre pour une carte carrée/rectangulaire.
- `dpi` (*number|nil*) : Facteur dpi (1 par défaut).

#### `ui_apps_minimap_utils.simpleCircle(pos, fill, strikeClr, radius)`

Dessine un marqueur circulaire à une position monde, sur la couche GAMEPLAY_MARKERS (orange et contour blanc par défaut).

- `pos` (*vec3*) : Position monde.
- `fill` (*color|nil*) : Couleur de remplissage.
- `strikeClr` (*color|nil*) : Couleur du contour.
- `radius` (*number|nil*) : Rayon en pixels (6 par défaut).

#### `ui_apps_minimap_utils.simpleCircleWithEdgePointer(pos, fill, strikeClr, radius)`

Dessine un pointeur de bord si la position est hors carte, sinon un cercle simple à cette position.

- `pos` (*vec3*) : Position monde.
- `fill` (*color|nil*) : Remplissage.
- `strikeClr` (*color|nil*) : Contour.
- `radius` (*number|nil*) : Rayon (6 par défaut).

#### `ui_apps_minimap_utils.simpleLine(pos1, pos2, fill, strikeClr)`

Dessine un segment à extrémités rondes entre deux positions monde, sur la couche GAMEPLAY_MARKERS.

- `pos1` (*vec3*) : Départ monde.
- `pos2` (*vec3*) : Arrivée monde.
- `fill` (*color|nil*) : Couleur de remplissage.
- `strikeClr` (*color|nil*) : Couleur du contour.

#### `ui_apps_minimap_utils.simpleLineWithEdgePointer(pos1, pos2, fill, strikeClr)`

Utilise le milieu du segment : pointeur de bord s'il est hors carte, sinon ligne simple.

- `pos1` (*vec3*) : Départ monde.
- `pos2` (*vec3*) : Arrivée monde.
- `fill` (*color|nil*) : Remplissage.
- `strikeClr` (*color|nil*) : Contour.

#### `ui_apps_minimap_utils.worldLineToMapXY(x1, y1, x2, y2)`

Convertit les deux extrémités d'un segment monde en coordonnées carte.

- `x1` (*number*) : X monde de A.
- `y1` (*number*) : Y monde de A.
- `x2` (*number*) : X monde de B.
- `y2` (*number*) : Y monde de B.
- **renvoie** : number X carte de A.
- **renvoie** : number Y carte de A.
- **renvoie** : number X carte de B.
- **renvoie** : number Y carte de B.

#### `ui_apps_minimap_utils.worldToMap(p)`

Convertit un point monde en point carte (version allouante, recalculée avec soustraction, division par l'échelle et rotation). Préférer worldToMapXY pour les boucles.

- `p` (*vec3*) : Point monde.
- **renvoie** : vec3 Point carte (z = 0).

#### `ui_apps_minimap_utils.worldToMapXY(x, y)`

Convertit des coordonnées monde (x, y) en coordonnées carte.

- `x` (*number*) : X monde.
- `y` (*number*) : Y monde.
- **renvoie** : number X carte.
- **renvoie** : number Y carte.

#### `ui_apps_minimap_utils.worldToMapXYZ(target, source)`

Convertit source (x, y monde) en coordonnées carte et les écrit dans target (z = 0), sans allocation.

- `target` (*vec3*) : Vecteur de sortie (peut être le même que source).
- `source` (*vec3*) : Point monde.

## Champs

| Champ | Type | Description |
|---|---|---|
| `centerPointer` | nil | Exporté à partir d'une variable locale qui n'existe pas : vaut toujours nil. ⚠ référence `centerPointer` non définie dans le fichier (vaut probablement nil) |
| `colors` | table<string, color> | Couleurs exposées : orange, orangeMuted, grayMuted, roadBgTransparentBlack, navBgBlack, gridWhite, navBgWhite, navFgBlue. |
| `dpi` | number | Facteur d'échelle d'écran de la minimap, mis à jour par setMinimapState (1 au départ). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/apps/minimap/utils.lua`.*
