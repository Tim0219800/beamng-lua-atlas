# `util_trackBuilder_markers`

*Fichier : `lua/ge/extensions/util/trackBuilder/markers.lua` · VM : Game Engine (GE) · 1026 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_trackBuilder_markers` : `extensions.load("util_trackBuilder_markers")`, puis la globale `util_trackBuilder_markers`

Gère les marqueurs d'édition du Track Builder (inclinaison, hauteur, largeur, checkpoint, murs gauche et droit, plafond) et l'interpolation des valeurs qu'ils portent le long de la piste. Les marqueurs sont des objets TSStatic créés et déplacés dans la scène (canSave = false). Chaque type de marqueur déclare dans une table interne 'types' son mode d'interpolation ('points', 'segments', 'both' ou 'single'), sa fonction d'interpolation de champ et sa fonction de placement des marqueurs. Le module calcule aussi les caps de début et fin entre segments voisins.

## Remarques

- Les fonctions d'interpolation (step, linear, pow2, pow3, pow4, smoothSlope, smootherSlope) prennent t dans [0, 1] et renvoient deux valeurs : la valeur interpolée et sa dérivée. smoothSlope et smootherSlope ont une dérivée horizontale aux deux extrémités. Les noms d'interpolation stockés dans les marqueurs (b.interpolation) sont les noms de ces fonctions de M.
- Les valeurs de marqueurs sont écrites dans les points du segment (point.bank, point.width, point.height…) et dans segment.markerInfo ; segment.refreshMesh est mis à true quand le mesh doit être régénéré.
- Seuls les types listés dans names (bank, height, width, checkpoint, leftWall, rightWall, ceilingMesh) ont une liste de marqueurs ; les noms centerMesh, leftMesh et rightMesh sont commentés dans names, donc hideMarkers/clearMarkers/unloadAll ne les gèrent pas (hideMarkers('centerMesh') provoquerait une erreur sur une table nil).
- Bug : dans linear/pow2/pow3/pow4, la dérivée renvoyée pour t >= 1 est t, 2t, 3t, 4t au lieu de la dérivée en 1 (1, 2, 3, 4 pour t=1) ; la valeur est correcte seulement si t vaut exactement 1.
- Bug : dans compareSimpleCaps et compareWallCeilingCaps, les branches 'noPoints' testent second.startCap / first.endCap (champs du segment) au lieu de meshInfo[nameOfField].startCap / endCap.
- Bug : dans interpolateOverSegments, la condition 'i ~= track' compare un nombre à une table (toujours vraie).
- Un marqueur de largeur est composé de deux objets TSStatic (nom 'widthMarker<n>' et 'widthMarker<n>b').

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_trackBuilder_markers.addMarkerChange(name, index)` | Note que le segment d'indice index a un marqueur modifié pour le champ name ; interpolate ne recalcule alors que les zones concernées. | 999 |
| `util_trackBuilder_markers.caps(segments, closed)` | Calcule les caps de début et de fin entre segments consécutifs pour centerMesh, leftMesh, rightMesh (si les valeurs diffèrent), et pour leftWall, rightWall, ceilingMesh (si l'état actif diffère). Le segment 1 est ignoré ; si closed est vrai, le dernier segment est comparé au deuxième. | 921 |
| `util_trackBuilder_markers.clearMarkers(name)` | Supprime de la scène les marqueurs du type donné. | 990 |
| `util_trackBuilder_markers.hideMarkers(name)` | Cache les marqueurs du type donné en mettant leur échelle à 0. | 982 |
| `util_trackBuilder_markers.interpolate(nameOfField, track)` | Interpole le champ nameOfField sur toute la piste selon le mode du type ('points', 'segments', 'both' ou 'single'), puis vide la liste des changements de ce champ. | 820 |
| `util_trackBuilder_markers.interpolateField(name, t, a, b, point, length)` | Délègue à la fonction d'interpolation propre au type (par exemple interpolateBank, interpolateWidth) pour écrire la valeur interpolée dans point. | 972 |
| `util_trackBuilder_markers.interpolateOverPoints(nameOfField, track)` | Interpole entre deux valeurs successives de marqueurs sur les points des segments concernés (seulement s'ils sont dans markerChanges ou frais), selon la longueur parcourue. | 721 |
| `util_trackBuilder_markers.interpolateOverSegments(nameOfField, track)` | Applique la valeur de marqueur précédente à chaque segment (mode 'segments'), à partir du premier segment qui porte le champ. | 781 |
| `util_trackBuilder_markers.interpolatePointsOfSegment(segment, startValue, endValue, startLength, endLength, nameOfField)` | Interpole entre startValue et endValue sur les points d'un segment (fraction t = (p.length - startLength)/(endLength - startLength)) et sur son markerInfo ; sans points, ne calcule que markerInfo. Met refreshMesh à true. | 931 |
| `util_trackBuilder_markers.interpolateSingle(nameOfField, track)` | Pour les types 'single' (checkpoint), appelle la fonction de segment seulement pour les indices enregistrés par addMarkerChange. | 808 |
| `util_trackBuilder_markers.linear(t)` | Interpolation linéaire : valeur t, dérivée 1 (0 hors de [0, 1] à gauche, 1 à droite). | 439 |
| `util_trackBuilder_markers.pow2(t)` | Interpolation en t². | 449 |
| `util_trackBuilder_markers.pow3(t)` | Interpolation en t³. | 459 |
| `util_trackBuilder_markers.pow4(t)` | Interpolation en t⁴. | 469 |
| `util_trackBuilder_markers.smoothSlope(t)` | Interpolation lissée (3t²-2t³) : va de 0 à 1 avec une pente horizontale en 0 et en 1. | 480 |
| `util_trackBuilder_markers.smootherSlope(t)` | Interpolation encore plus lisse (polynôme de Perlin 6t⁵-15t⁴+10t³), pente et courbure nulles aux extrémités. | 491 |
| `util_trackBuilder_markers.step(t)` | Interpolation en escalier : renvoie toujours 0 et 0 (la valeur de départ est conservée). | 435 |
| `util_trackBuilder_markers.transformMarkers(name, allNodes)` | Crée, supprime et repositionne les objets marqueurs du type donné pour les nœuds de la piste ; sans effet si le type n'a pas de fonction transformMarkers. | 976 |
| `util_trackBuilder_markers.unloadAll()` | Oublie toutes les listes de marqueurs (remises à {}) sans supprimer les objets de la scène ; à utiliser après un nettoyage de scène. | 1007 |

### Détail des paramètres

#### `util_trackBuilder_markers.addMarkerChange(name, index)`

Note que le segment d'indice index a un marqueur modifié pour le champ name ; interpolate ne recalcule alors que les zones concernées.

- `name` (*string*) : Type de marqueur.
- `index` (*integer*) : Indice du segment dans la piste.

#### `util_trackBuilder_markers.caps(segments, closed)`

Calcule les caps de début et de fin entre segments consécutifs pour centerMesh, leftMesh, rightMesh (si les valeurs diffèrent), et pour leftWall, rightWall, ceilingMesh (si l'état actif diffère). Le segment 1 est ignoré ; si closed est vrai, le dernier segment est comparé au deuxième.

- `segments` (*table[]*) : Segments de la piste.
- `closed` (*boolean|nil*) : Piste en boucle fermée.

#### `util_trackBuilder_markers.clearMarkers(name)`

Supprime de la scène les marqueurs du type donné.

- `name` (*string*) : Type de marqueur présent dans names.

#### `util_trackBuilder_markers.hideMarkers(name)`

Cache les marqueurs du type donné en mettant leur échelle à 0.

- `name` (*string*) : Type de marqueur présent dans names.

#### `util_trackBuilder_markers.interpolate(nameOfField, track)`

Interpole le champ nameOfField sur toute la piste selon le mode du type ('points', 'segments', 'both' ou 'single'), puis vide la liste des changements de ce champ.

- `nameOfField` (*string*) : Type de marqueur (bank, height, width, leftWall…).
- `track` (*table[]*) : Liste ordonnée des segments.

#### `util_trackBuilder_markers.interpolateField(name, t, a, b, point, length)`

Délègue à la fonction d'interpolation propre au type (par exemple interpolateBank, interpolateWidth) pour écrire la valeur interpolée dans point.

- `name` (*string*) : Type de marqueur.
- `t` (*number*) : Fraction dans [0, 1].
- `a` (*table*) : Valeur de départ.
- `b` (*table*) : Valeur d'arrivée.
- `point` (*table*) : Point ou markerInfo à écrire.
- `length` (*number*) : Longueur de l'intervalle.

#### `util_trackBuilder_markers.interpolateOverPoints(nameOfField, track)`

Interpole entre deux valeurs successives de marqueurs sur les points des segments concernés (seulement s'ils sont dans markerChanges ou frais), selon la longueur parcourue.

- `nameOfField` (*string*) : Type de marqueur.
- `track` (*table[]*) : Segments de la piste.

#### `util_trackBuilder_markers.interpolateOverSegments(nameOfField, track)`

Applique la valeur de marqueur précédente à chaque segment (mode 'segments'), à partir du premier segment qui porte le champ.

- `nameOfField` (*string*) : Type de marqueur.
- `track` (*table[]*) : Segments de la piste.

#### `util_trackBuilder_markers.interpolatePointsOfSegment(segment, startValue, endValue, startLength, endLength, nameOfField)`

Interpole entre startValue et endValue sur les points d'un segment (fraction t = (p.length - startLength)/(endLength - startLength)) et sur son markerInfo ; sans points, ne calcule que markerInfo. Met refreshMesh à true.

- `segment` (*table*) : Segment à mettre à jour.
- `startValue` (*table*) : Valeur de départ (avec .value, .interpolation…).
- `endValue` (*table|nil*) : Valeur d'arrivée ; nil pour garder startValue.
- `startLength` (*number*) : Longueur cumulée au départ.
- `endLength` (*number|nil*) : Longueur cumulée à l'arrivée.
- `nameOfField` (*string*) : Type de marqueur.

#### `util_trackBuilder_markers.interpolateSingle(nameOfField, track)`

Pour les types 'single' (checkpoint), appelle la fonction de segment seulement pour les indices enregistrés par addMarkerChange.

- `nameOfField` (*string*) : Type de marqueur.
- `track` (*table[]*) : Segments de la piste.

#### `util_trackBuilder_markers.linear(t)`

Interpolation linéaire : valeur t, dérivée 1 (0 hors de [0, 1] à gauche, 1 à droite).

- `t` (*number*) : Position.
- **renvoie** : number Valeur.
- **renvoie** : number Dérivée.

#### `util_trackBuilder_markers.pow2(t)`

Interpolation en t².

- `t` (*number*) : Position.
- **renvoie** : number Valeur.
- **renvoie** : number Dérivée.

#### `util_trackBuilder_markers.pow3(t)`

Interpolation en t³.

- `t` (*number*) : Position.
- **renvoie** : number Valeur.
- **renvoie** : number Dérivée.

#### `util_trackBuilder_markers.pow4(t)`

Interpolation en t⁴.

- `t` (*number*) : Position.
- **renvoie** : number Valeur.
- **renvoie** : number Dérivée.

#### `util_trackBuilder_markers.smoothSlope(t)`

Interpolation lissée (3t²-2t³) : va de 0 à 1 avec une pente horizontale en 0 et en 1.

- `t` (*number*) : Position.
- **renvoie** : number Valeur.
- **renvoie** : number Dérivée.

#### `util_trackBuilder_markers.smootherSlope(t)`

Interpolation encore plus lisse (polynôme de Perlin 6t⁵-15t⁴+10t³), pente et courbure nulles aux extrémités.

- `t` (*number*) : Position.
- **renvoie** : number Valeur.
- **renvoie** : number Dérivée.

#### `util_trackBuilder_markers.step(t)`

Interpolation en escalier : renvoie toujours 0 et 0 (la valeur de départ est conservée).

- `t` (*number*) : Position dans [0, 1].
- **renvoie** : number Valeur.
- **renvoie** : number Dérivée.

#### `util_trackBuilder_markers.transformMarkers(name, allNodes)`

Crée, supprime et repositionne les objets marqueurs du type donné pour les nœuds de la piste ; sans effet si le type n'a pas de fonction transformMarkers.

- `name` (*string*) : Type de marqueur.
- `allNodes` (*table[]*) : Tous les nœuds/segments de la piste.

## Champs

| Champ | Type | Description |
|---|---|---|
| `names` | string[] | Liste des types de marqueurs gérés : bank, height, width, checkpoint, leftWall, rightWall, ceilingMesh. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/trackBuilder/markers.lua`.*
