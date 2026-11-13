# `editor_roadArchitect_utilities`

*Fichier : `lua/ge/extensions/editor/roadArchitect/utilities.lua` · VM : Game Engine (GE) · 635 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_utilities` : `extensions.load("editor_roadArchitect_utilities")`, puis la globale `editor_roadArchitect_utilities`

Boîte à outils du Road Architect : dessin de sphères/lignes de debug, détection de la souris sur le terrain ou sur un nœud, calculs de boîtes englobantes de routes, manipulation de chemins de fichiers, et nombreuses fonctions de géométrie 2D/3D (intersections, projections, cercle par 3 points, angles, rotations, slerp). Un moddeur peut réutiliser les fonctions géométriques pures ; les fonctions de dessin ou de souris supposent l'éditeur actif.

## Exemple

```lua
local util = extensions.editor_roadArchitect_utilities
local p = util.intersection2Lines(vec3(0,0,0), vec3(10,0,0), vec3(5,-5,0), vec3(5,5,0))  -- vec3(5,0,0)
local a = util.angleBetweenVecs2D(vec3(1,0,0), vec3(0,1,0))  -- pi/2
```

## Remarques

- Les fonctions 2D ignorent la coordonnée z. Les angles sont en radians.
- Fonctions qui MODIFIENT leurs arguments : getRotationBetweenVecs normalise v1 et v2 en place ; rotateVecByQuaternion normalise q en place.
- circle2DFrom3Points ne renvoie que le centre (vec3 sans rayon) ; renvoie nil, nil si les points sont alignés.
- getFilenameFromPath ne sépare que sur '/', alors que removeFileNameFromPath accepte '/' et '\' et conserve le séparateur final.
- slerp : l'angle est multiplié par t puis utilisé dans sin((1-t)*theta) : ce n'est pas la formule slerp standard, résultat à vérifier avant usage précis (déduit du code).
- Les fonctions de dessin utilisent dbgDraw et la distance à la caméra : la taille des sphères est proportionnelle à sqrt(distance).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect_utilities.angleBetweenVecs(a, b)` | Petit angle entre deux vecteurs de longueur quelconque, en radians. | 494 |
| `editor_roadArchitect_utilities.angleBetweenVecs2D(a, b)` | Comme angleBetweenVecs après projection des vecteurs dans le plan XY. | 497 |
| `editor_roadArchitect_utilities.circle2DFrom3Points(p1, p2, p3)` | Ajuste un cercle 2D passant par trois points ; renvoie son centre. | 459 |
| `editor_roadArchitect_utilities.clockwiseAngleBetweenVecs2D(v1, v2)` | Angle 2D entre deux vecteurs dans le sens indiqué par le signe du produit vectoriel : renvoie l'angle si cross < 0, sinon 2*pi - angle. | 500 |
| `editor_roadArchitect_utilities.computeAABB2DAllRoads(roads)` | Boîte englobante 2D de tous les nœuds de toutes les routes. | 101 |
| `editor_roadArchitect_utilities.computeAABB2DGroup(group, roads, map)` | Boîte englobante 2D des seuls nœuds listés dans le groupe. Si group est nil, utilise tous les nœuds de toutes les routes. | 117 |
| `editor_roadArchitect_utilities.computeDivIndicesFromNode(nIdx, road)` | Trouve l'indice du point de division du renderData qui correspond à un nœud (comparaison 2D avec une tolérance). Renvoie 1 par défaut. | 287 |
| `editor_roadArchitect_utilities.computeRoadLength(rD)` | Calcule la longueur cumulée depuis le début de la route pour chaque point de division du renderData (en suivant la ligne centrale). | 232 |
| `editor_roadArchitect_utilities.distance2D(x1, y1, x2, y2)` | Distance 2D entre deux points donnés par composantes. | 158 |
| `editor_roadArchitect_utilities.drawAutoJctMarkup(pos, rName, rLie)` | Affiche à une position deux textes de debug : le nom de la route et sa position dans la jonction automatique. | 57 |
| `editor_roadArchitect_utilities.drawGroupSphere(pos)` | Comme drawSphere, avec la couleur des sphères de groupe. | 47 |
| `editor_roadArchitect_utilities.drawHighlightSphereRad(pos, rad)` | Sphère de surbrillance de rayon donné. | 51 |
| `editor_roadArchitect_utilities.drawPurpleLine(p1, p2)` | Trace une ligne violette de debug (épaisseur 5) entre deux points. | 54 |
| `editor_roadArchitect_utilities.drawSphere(pos)` | Dessine une sphère de debug dont le rayon croît avec sqrt(distance caméra) pour garder une taille apparente à peu près constante. | 46 |
| `editor_roadArchitect_utilities.drawSphereHighlight(pos)` | Sphère de surbrillance (couleur de highlight). | 48 |
| `editor_roadArchitect_utilities.drawSphereHighlightPurple(pos)` | Sphère de surbrillance violette. | 50 |
| `editor_roadArchitect_utilities.drawSphereHighlightRed(pos)` | Sphère de surbrillance rouge. | 49 |
| `editor_roadArchitect_utilities.findBounds(pEval, lengths)` | Trouve les deux indices de points de division qui encadrent une longueur donnée le long de la route. Hors plage, renvoie les deux premiers ou les deux derniers indices. | 271 |
| `editor_roadArchitect_utilities.getFilenameFromPath(path)` | Extrait le nom de fichier (avec extension) après le dernier '/'. | 217 |
| `editor_roadArchitect_utilities.getHalfWidthAtNode(r)` | Demi-largeur de la route au premier point du renderData (suppose une largeur constante). | 260 |
| `editor_roadArchitect_utilities.getRotationBetweenVecs(v1, v2)` | Quaternion qui fait tourner v1 vers v2 (v1 et v2 sont normalisés en place). Cas particuliers : vecteurs quasi identiques -> identité ; opposés -> rotation de pi autour d'un axe orthogonal. | 522 |
| `editor_roadArchitect_utilities.intersection2LineSegs(p1, p2, q1, q2)` | Intersection (2D) de deux segments [p1,p2] et [q1,q2]. Renvoie nil s'ils ne se coupent pas. | 382 |
| `editor_roadArchitect_utilities.intersection2Lines(p1, p2, p3, p4)` | Intersection (2D) des droites infinies (p1,p2) et (p3,p4). Renvoie nil si elles sont parallèles. | 343 |
| `editor_roadArchitect_utilities.intersectionLineSegmentCircle(x1, y1, x2, y2, cx, cy, r)` | Points d'intersection d'un segment 2D avec un cercle. | 394 |
| `editor_roadArchitect_utilities.isInBox(p, box)` | Vrai si le point est dans la boîte 2D {xMin, xMax, yMin, yMax} (bornes incluses). | 553 |
| `editor_roadArchitect_utilities.isInTunnel(idx, tunnels, extraS, extraE)` | Indique si un indice de point de division est à l'intérieur d'un tunnel (entre t.s + extraS et t.e - extraE - 1). | 309 |
| `editor_roadArchitect_utilities.isMouseCloseToNode(roads, selectedRoadIdx, selectedNodeIdx)` | Cherche les nœuds d'autres routes proches (distance 2D) du nœud sélectionné, pour l'accrochage/jonction. Les extrémités (premier/dernier nœud) et les nœuds intermédiaires sont renvoyés dans des listes séparées. Ignore les nœuds verrouillés et les routes non visibles. | 162 |
| `editor_roadArchitect_utilities.isMouseHoveringOverTerrain()` | Vrai si la souris n'est sur aucun élément ImGui, aucune fenêtre ni le gizmo d'axes (donc sur la vue 3D). | 63 |
| `editor_roadArchitect_utilities.isMouseOverNode(roads)` | Cherche si la souris survole un nœud de route (routes dont les sphères de nœuds et la visibilité sont actives, hors nœuds verrouillés). Renvoie nil, nil, nil si la souris n'est pas sur la scène ou sur aucun nœud. | 74 |
| `editor_roadArchitect_utilities.isOverTerrain(p)` | Vrai si le point est directement au-dessus du terrain (et non d'un pont) : compare la hauteur du terrain à celle d'un rayon lancé vers le bas depuis 4.5 m au-dessus (tolérance 0.25 m). | 559 |
| `editor_roadArchitect_utilities.isPointOnLeftSideOfLine(p, p1, p2)` | Vrai si le point est à gauche de la droite orientée p1 -> p2 (2D). | 550 |
| `editor_roadArchitect_utilities.mouseOnMapPos()` | Position monde pointée par la souris : lancer de rayon statique depuis la caméra, portée 1000 m. | 66 |
| `editor_roadArchitect_utilities.polyLerp(pos, nml, lens, q)` | Interpole linéairement dans une polyligne (positions et normales) à la longueur q. Renvoie nil, nil si q est hors de la plage de longueurs. | 320 |
| `editor_roadArchitect_utilities.projectPointToLine(p, a, b)` | Projette un point sur la droite (a,b) en 2D ; le z du point est conservé. | 432 |
| `editor_roadArchitect_utilities.randomInRange(a, b)` | Entier aléatoire dans [a, b] (bornes incluses ; a et b sont échangés si a > b). | 567 |
| `editor_roadArchitect_utilities.removeExtension(filename)` | Retire l'extension (point inclus) d'un nom de fichier ; le renvoie tel quel s'il n'en a pas. | 220 |
| `editor_roadArchitect_utilities.removeFileNameFromPath(path)` | Renvoie le dossier d'un chemin (séparateur final inclus), ou '' s'il n'y a pas de séparateur. | 223 |
| `editor_roadArchitect_utilities.rotateVecAroundAxis(v, k, theta)` | Tourne v autour de l'axe unitaire k d'un angle theta (formule de Rodrigues). | 516 |
| `editor_roadArchitect_utilities.rotateVecByQuaternion(v, q)` | Tourne un vecteur par un quaternion (q est normalisé en place). | 544 |
| `editor_roadArchitect_utilities.round2(num)` | Arrondit à deux décimales. | 149 |
| `editor_roadArchitect_utilities.slerp(v1, v2, t)` | Interpolation sphérique entre deux vecteurs unitaires (voir notes sur la formule). | 475 |
| `editor_roadArchitect_utilities.sqDist2D(a, b)` | Distance 2D au carré entre deux points (z ignoré). | 152 |
| `editor_roadArchitect_utilities.tryAddGroupIdxToRoad(r, placedGroupIdx)` | Ajoute un indice de groupe placé à r.groupIdx s'il n'y est pas déjà. | 134 |

### Détail des paramètres

#### `editor_roadArchitect_utilities.angleBetweenVecs(a, b)`

Petit angle entre deux vecteurs de longueur quelconque, en radians.

- `a` (*vec3*) : Vecteur A.
- `b` (*vec3*) : Vecteur B.
- **renvoie** : number Angle dans [0, pi].

#### `editor_roadArchitect_utilities.angleBetweenVecs2D(a, b)`

Comme angleBetweenVecs après projection des vecteurs dans le plan XY.

- `a` (*vec3*) : Vecteur A.
- `b` (*vec3*) : Vecteur B.
- **renvoie** : number Angle en radians.

#### `editor_roadArchitect_utilities.circle2DFrom3Points(p1, p2, p3)`

Ajuste un cercle 2D passant par trois points ; renvoie son centre.

- `p1` (*vec3*) : Point 1.
- `p2` (*vec3*) : Point 2.
- `p3` (*vec3*) : Point 3.
- **renvoie** : vec3|nil Centre du cercle, ou nil (avec un second nil) si les points sont quasi alignés.

#### `editor_roadArchitect_utilities.clockwiseAngleBetweenVecs2D(v1, v2)`

Angle 2D entre deux vecteurs dans le sens indiqué par le signe du produit vectoriel : renvoie l'angle si cross < 0, sinon 2*pi - angle.

- `v1` (*vec3*) : Premier vecteur.
- `v2` (*vec3*) : Second vecteur.
- **renvoie** : number Angle dans [0, 2*pi].

#### `editor_roadArchitect_utilities.computeAABB2DAllRoads(roads)`

Boîte englobante 2D de tous les nœuds de toutes les routes.

- `roads` (*table*) : Liste des routes.
- **renvoie** : table {xMin, xMax, yMin, yMax}.

#### `editor_roadArchitect_utilities.computeAABB2DGroup(group, roads, map)`

Boîte englobante 2D des seuls nœuds listés dans le groupe. Si group est nil, utilise tous les nœuds de toutes les routes.

- `group` (*table|nil*) : Groupe avec list = {{r = nom, n = indice de nœud}}.
- `roads` (*table*) : Liste des routes.
- `map` (*table<string, integer>*) : Table nom -> indice de route.
- **renvoie** : table {xMin, xMax, yMin, yMax}.

#### `editor_roadArchitect_utilities.computeDivIndicesFromNode(nIdx, road)`

Trouve l'indice du point de division du renderData qui correspond à un nœud (comparaison 2D avec une tolérance). Renvoie 1 par défaut.

- `nIdx` (*integer*) : Indice du nœud.
- `road` (*table*) : Route.
- **renvoie** : integer Indice de division.

#### `editor_roadArchitect_utilities.computeRoadLength(rD)`

Calcule la longueur cumulée depuis le début de la route pour chaque point de division du renderData (en suivant la ligne centrale).

- `rD` (*table*) : renderData de la route.
- **renvoie** : number[] Longueurs cumulées en mètres (lengths[1] = 0).

#### `editor_roadArchitect_utilities.distance2D(x1, y1, x2, y2)`

Distance 2D entre deux points donnés par composantes.

- `x1` (*number*) : x du point 1.
- `y1` (*number*) : y du point 1.
- `x2` (*number*) : x du point 2.
- `y2` (*number*) : y du point 2.
- **renvoie** : number Distance.

#### `editor_roadArchitect_utilities.drawAutoJctMarkup(pos, rName, rLie)`

Affiche à une position deux textes de debug : le nom de la route et sa position dans la jonction automatique.

- `pos` (*vec3*) : Position du texte.
- `rName` (*string*) : Nom de route.
- `rLie` (*string*) : Texte de position (lie).

#### `editor_roadArchitect_utilities.drawGroupSphere(pos)`

Comme drawSphere, avec la couleur des sphères de groupe.

- `pos` (*vec3*) : Centre.

#### `editor_roadArchitect_utilities.drawHighlightSphereRad(pos, rad)`

Sphère de surbrillance de rayon donné.

- `pos` (*vec3*) : Centre.
- `rad` (*number*) : Rayon en mètres.

#### `editor_roadArchitect_utilities.drawPurpleLine(p1, p2)`

Trace une ligne violette de debug (épaisseur 5) entre deux points.

- `p1` (*vec3*) : Début.
- `p2` (*vec3*) : Fin.

#### `editor_roadArchitect_utilities.drawSphere(pos)`

Dessine une sphère de debug dont le rayon croît avec sqrt(distance caméra) pour garder une taille apparente à peu près constante.

- `pos` (*vec3*) : Centre.

#### `editor_roadArchitect_utilities.drawSphereHighlight(pos)`

Sphère de surbrillance (couleur de highlight).

- `pos` (*vec3*) : Centre.

#### `editor_roadArchitect_utilities.drawSphereHighlightPurple(pos)`

Sphère de surbrillance violette.

- `pos` (*vec3*) : Centre.

#### `editor_roadArchitect_utilities.drawSphereHighlightRed(pos)`

Sphère de surbrillance rouge.

- `pos` (*vec3*) : Centre.

#### `editor_roadArchitect_utilities.findBounds(pEval, lengths)`

Trouve les deux indices de points de division qui encadrent une longueur donnée le long de la route. Hors plage, renvoie les deux premiers ou les deux derniers indices.

- `pEval` (*number*) : Longueur à localiser.
- `lengths` (*number[]*) : Longueurs cumulées (computeRoadLength).
- **renvoie** : integer Indice inférieur.
- **renvoie** : integer Indice supérieur.

#### `editor_roadArchitect_utilities.getFilenameFromPath(path)`

Extrait le nom de fichier (avec extension) après le dernier '/'.

- `path` (*string*) : Chemin.
- **renvoie** : string|nil Nom de fichier.

#### `editor_roadArchitect_utilities.getHalfWidthAtNode(r)`

Demi-largeur de la route au premier point du renderData (suppose une largeur constante).

- `r` (*table*) : Route (avec renderData).
- **renvoie** : number Demi-largeur en mètres.

#### `editor_roadArchitect_utilities.getRotationBetweenVecs(v1, v2)`

Quaternion qui fait tourner v1 vers v2 (v1 et v2 sont normalisés en place). Cas particuliers : vecteurs quasi identiques -> identité ; opposés -> rotation de pi autour d'un axe orthogonal.

- `v1` (*vec3*) : Vecteur de départ (modifié).
- `v2` (*vec3*) : Vecteur d'arrivée (modifié).
- **renvoie** : quat Rotation.

#### `editor_roadArchitect_utilities.intersection2LineSegs(p1, p2, q1, q2)`

Intersection (2D) de deux segments [p1,p2] et [q1,q2]. Renvoie nil s'ils ne se coupent pas.

- `p1` (*vec3*) : Début segment 1.
- `p2` (*vec3*) : Fin segment 1.
- `q1` (*vec3*) : Début segment 2.
- `q2` (*vec3*) : Fin segment 2.
- **renvoie** : vec3|nil Point d'intersection (z = 0). Cas colinéaires : division par zéro possible (déduit du code).

#### `editor_roadArchitect_utilities.intersection2Lines(p1, p2, p3, p4)`

Intersection (2D) des droites infinies (p1,p2) et (p3,p4). Renvoie nil si elles sont parallèles.

- `p1` (*vec3*) : Point de la droite 1.
- `p2` (*vec3*) : Second point de la droite 1.
- `p3` (*vec3*) : Point de la droite 2.
- `p4` (*vec3*) : Second point de la droite 2.
- **renvoie** : vec3|nil Point d'intersection (z = 0).

#### `editor_roadArchitect_utilities.intersectionLineSegmentCircle(x1, y1, x2, y2, cx, cy, r)`

Points d'intersection d'un segment 2D avec un cercle.

- `x1` (*number*) : x début.
- `y1` (*number*) : y début.
- `x2` (*number*) : x fin.
- `y2` (*number*) : y fin.
- `cx` (*number*) : x du centre.
- `cy` (*number*) : y du centre.
- `r` (*number*) : Rayon.
- **renvoie** : table<integer, {[1]: number, [2]: number}>|nil Liste de points {x, y} situés sur le segment, ou nil s'il n'y en a pas.

#### `editor_roadArchitect_utilities.isInBox(p, box)`

Vrai si le point est dans la boîte 2D {xMin, xMax, yMin, yMax} (bornes incluses).

- `p` (*vec3*) : Point.
- `box` (*table*) : Boîte.
- **renvoie** : boolean true si dedans.

#### `editor_roadArchitect_utilities.isInTunnel(idx, tunnels, extraS, extraE)`

Indique si un indice de point de division est à l'intérieur d'un tunnel (entre t.s + extraS et t.e - extraE - 1).

- `idx` (*integer*) : Indice de point de division.
- `tunnels` (*table*) : Liste de tunnels {s, e}.
- `extraS` (*integer*) : Marge au début.
- `extraE` (*integer*) : Marge à la fin.
- **renvoie** : boolean true si dans un tunnel.

#### `editor_roadArchitect_utilities.isMouseCloseToNode(roads, selectedRoadIdx, selectedNodeIdx)`

Cherche les nœuds d'autres routes proches (distance 2D) du nœud sélectionné, pour l'accrochage/jonction. Les extrémités (premier/dernier nœud) et les nœuds intermédiaires sont renvoyés dans des listes séparées. Ignore les nœuds verrouillés et les routes non visibles.

- `roads` (*table*) : Liste des routes.
- `selectedRoadIdx` (*integer*) : Route à exclure.
- `selectedNodeIdx` (*integer*) : Nœud de référence.
- **renvoie** : boolean true si au moins un nœud proche existe.
- **renvoie** : integer[] Indices de route des extrémités proches.
- **renvoie** : integer[] Indices de nœud correspondants.
- **renvoie** : integer[] Indices de route des nœuds intermédiaires proches.
- **renvoie** : integer[] Indices de nœud correspondants.

#### `editor_roadArchitect_utilities.isMouseHoveringOverTerrain()`

Vrai si la souris n'est sur aucun élément ImGui, aucune fenêtre ni le gizmo d'axes (donc sur la vue 3D).

- **renvoie** : boolean true si la souris est sur la scène.

#### `editor_roadArchitect_utilities.isMouseOverNode(roads)`

Cherche si la souris survole un nœud de route (routes dont les sphères de nœuds et la visibilité sont actives, hors nœuds verrouillés). Renvoie nil, nil, nil si la souris n'est pas sur la scène ou sur aucun nœud.

- `roads` (*table*) : Liste des routes.
- **renvoie** : boolean|nil true si un nœud est survolé.
- **renvoie** : integer|nil Indice de route.
- **renvoie** : integer|nil Indice de nœud.

#### `editor_roadArchitect_utilities.isOverTerrain(p)`

Vrai si le point est directement au-dessus du terrain (et non d'un pont) : compare la hauteur du terrain à celle d'un rayon lancé vers le bas depuis 4.5 m au-dessus (tolérance 0.25 m).

- `p` (*vec3*) : Point.
- **renvoie** : boolean true si sur le terrain.

#### `editor_roadArchitect_utilities.isPointOnLeftSideOfLine(p, p1, p2)`

Vrai si le point est à gauche de la droite orientée p1 -> p2 (2D).

- `p` (*vec3*) : Point testé.
- `p1` (*vec3*) : Début de la droite.
- `p2` (*vec3*) : Fin de la droite.
- **renvoie** : boolean true si à gauche.

#### `editor_roadArchitect_utilities.mouseOnMapPos()`

Position monde pointée par la souris : lancer de rayon statique depuis la caméra, portée 1000 m.

- **renvoie** : vec3 Point touché.

#### `editor_roadArchitect_utilities.polyLerp(pos, nml, lens, q)`

Interpole linéairement dans une polyligne (positions et normales) à la longueur q. Renvoie nil, nil si q est hors de la plage de longueurs.

- `pos` (*vec3[]*) : Points de la polyligne.
- `nml` (*vec3[]*) : Normales aux points.
- `lens` (*number[]*) : Longueurs cumulées.
- `q` (*number*) : Longueur d'évaluation.
- **renvoie** : vec3|nil Position interpolée.
- **renvoie** : vec3|nil Normale interpolée et normalisée.

#### `editor_roadArchitect_utilities.projectPointToLine(p, a, b)`

Projette un point sur la droite (a,b) en 2D ; le z du point est conservé.

- `p` (*vec3*) : Point.
- `a` (*vec3*) : Point de la droite.
- `b` (*vec3*) : Second point de la droite.
- **renvoie** : vec3 Point projeté.

#### `editor_roadArchitect_utilities.randomInRange(a, b)`

Entier aléatoire dans [a, b] (bornes incluses ; a et b sont échangés si a > b).

- `a` (*integer*) : Borne.
- `b` (*integer*) : Borne.
- **renvoie** : integer Tirage.

#### `editor_roadArchitect_utilities.removeExtension(filename)`

Retire l'extension (point inclus) d'un nom de fichier ; le renvoie tel quel s'il n'en a pas.

- `filename` (*string*) : Nom de fichier.
- **renvoie** : string Nom sans extension.

#### `editor_roadArchitect_utilities.removeFileNameFromPath(path)`

Renvoie le dossier d'un chemin (séparateur final inclus), ou '' s'il n'y a pas de séparateur.

- `path` (*string*) : Chemin.
- **renvoie** : string Chemin du dossier.

#### `editor_roadArchitect_utilities.rotateVecAroundAxis(v, k, theta)`

Tourne v autour de l'axe unitaire k d'un angle theta (formule de Rodrigues).

- `v` (*vec3*) : Vecteur.
- `k` (*vec3*) : Axe unitaire.
- `theta` (*number*) : Angle en radians.
- **renvoie** : vec3 Vecteur tourné.

#### `editor_roadArchitect_utilities.rotateVecByQuaternion(v, q)`

Tourne un vecteur par un quaternion (q est normalisé en place).

- `v` (*vec3*) : Vecteur.
- `q` (*quat*) : Quaternion (modifié).
- **renvoie** : vec3 Vecteur tourné.

#### `editor_roadArchitect_utilities.round2(num)`

Arrondit à deux décimales.

- `num` (*number*) : Valeur.
- **renvoie** : number Valeur arrondie.

#### `editor_roadArchitect_utilities.slerp(v1, v2, t)`

Interpolation sphérique entre deux vecteurs unitaires (voir notes sur la formule).

- `v1` (*vec3*) : Vecteur de départ (unitaire).
- `v2` (*vec3*) : Vecteur d'arrivée (unitaire).
- `t` (*number*) : Paramètre dans [0, 1].
- **renvoie** : vec3 Vecteur interpolé.

#### `editor_roadArchitect_utilities.sqDist2D(a, b)`

Distance 2D au carré entre deux points (z ignoré).

- `a` (*vec3*) : Point A.
- `b` (*vec3*) : Point B.
- **renvoie** : number Distance au carré.

#### `editor_roadArchitect_utilities.tryAddGroupIdxToRoad(r, placedGroupIdx)`

Ajoute un indice de groupe placé à r.groupIdx s'il n'y est pas déjà.

- `r` (*table*) : Route.
- `placedGroupIdx` (*integer*) : Indice de groupe.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/utilities.lua`.*
