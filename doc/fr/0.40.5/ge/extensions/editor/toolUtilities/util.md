# `editor_toolUtilities_util`

*Fichier : `lua/ge/extensions/editor/toolUtilities/util.lua` · VM : Game Engine (GE) · 840 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_util` : `extensions.load("editor_toolUtilities_util")`, puis la globale `editor_toolUtilities_util`

Boîte à outils commune aux outils de splines et de « sites » de l'éditeur : souris et raycasts (position sur la carte, sur le terrain, sur un plan), conversions et couleurs, nettoyage de niveau, noms uniques, annulation (commitStep), noms de matériaux de terrain, calculs sur polylignes et splines (longueur, largeur, espacement, inversion, cadrage caméra), construction de rubans (mesh, GLTF), sources de splines pour le terraformage, bitmaps (retournement, export PNG de debug) et sous-onglets ImGui. Constantes par défaut : largeur min et max 10 m, tolérance de largeur fixe 0.01, distance max du rayon caméra 5000 m.

## Exemple

```lua
local util = require('editor/toolUtilities/util')
local p = util.mouseOnTerrainPos()
local len = util.getPolyLength(points)
```

## Remarques

- Unités : msToKph et msToMph prennent des m/s ; les distances sont en mètres.
- flipBitmapY est décrit « en place » dans le code mais renvoie un NOUVEAU GBitmap (format GFXFormatR16) sans modifier l'original.
- generateUniqueName exige prefixIn (il est concaténé sans test) : un appel sans second argument lève une erreur.
- buildRibbonGLTF convertit les coordonnées BeamNG (x, y, z) en GLTF (x, z, -y) et emballe positions en float et indices en uint16, donc limité à 65536 sommets.
- Dans les structures de ruban, un 'source' est une liste de { pos, width, binormal } ; width est la largeur totale, la demi-largeur est utilisée de part et d'autre du binormal.
- La grille d'empreinte des sites (footSnap) a un pas de 1 m, alignée sur le monde.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_util.beginSubTab(label, flags)` | Ouvre un sous-onglet ImGui (BeginTabItem) dont le corps est un enfant, pour que la rangée d'onglets reste en place. Renvoie false si l'onglet n'est pas ouvert. | 768 |
| `editor_toolUtilities_util.buildRibbonGLTF(points, widths, binormals)` | Convertit une polyligne de ruban en JSON GLTF avec tampon binaire intégré (positions float, indices uint16), coordonnées converties (x, z, -y). | 493 |
| `editor_toolUtilities_util.buildRibbonMeshFromPolyline(points, widths, binormals)` | Convertit une polyligne de ruban en maillage de triangles : deux sommets par point (gauche et droite, à demi-largeur le long du binormal), deux triangles par segment. | 451 |
| `editor_toolUtilities_util.calculateAverageSpacingXY(positions, minSpacing)` | Estime l'espacement moyen en XY entre nœuds en simulant une interpolation Catmull-Rom centripète (10 échantillons par segment), sans compter l'emprise des meshes. | 326 |
| `editor_toolUtilities_util.clearLevelContent()` | Ramène un niveau au terrain nu pour construire une scène de zéro. Supprime tous les objets des classes DecalRoad, TSStatic, MeshRoad, ProceduralMesh, PointLight et SpotLight, ainsi que toutes les INSTANCES de forêt ; les datablocks ForestItemData restent (la plantation retrouve ses espèces par nom). Marque editor.forestDirty. | 119 |
| `editor_toolUtilities_util.commitStep(label, data, undoFn, redoFn)` | Enregistre un pas d'annulation comme transaction à part entière. Un commitAction seul copie en profondeur le pas du dessus de la pile et le nouveau pour chercher un doublon, ce qui est prohibitif pour un pas de terraformage de millions de hauteurs ; une transaction est enregistrée sans cette vérification. | 235 |
| `editor_toolUtilities_util.computeIdToIdxMap(splines, map)` | Remplit `map` (vidée d'abord) avec spline.id -> indice dans la liste. | 205 |
| `editor_toolUtilities_util.deepEqual(a, b)` | Égalité profonde de deux valeurs. Teste le type avant == car comparer un vec3 à autre chose lève une erreur. | 212 |
| `editor_toolUtilities_util.doesPathContainNode(path, nodeKey)` | Cherche une clé de nœud dans un chemin. | 358 |
| `editor_toolUtilities_util.endSubTab()` | Ferme le sous-onglet (EndChild puis EndTabItem). Pas de garde : EndChild doit être appelé même si l'enfant est rogné. | 775 |
| `editor_toolUtilities_util.fastArrayCopy(arr)` | Copie rapide d'un tableau simple (copie superficielle). | 94 |
| `editor_toolUtilities_util.filterClosePointsXY(points, minDist)` | Retire les points consécutifs plus proches que minDist dans le plan XY (garde le premier). | 301 |
| `editor_toolUtilities_util.findMaterialIdx(candidates)` | Indice de la première couche de terrain qui porte l'un des noms candidats, sans tenir compte de la casse. | 253 |
| `editor_toolUtilities_util.flipBitmapY(bmpIn)` | Retourne verticalement un bitmap : crée un nouveau GBitmap GFXFormatR16 dont chaque texel copie la valeur de la ligne symétrique. | 650 |
| `editor_toolUtilities_util.flipSplineDirection(spline)` | Inverse le sens d'une spline (nodes, widths, nmls) et la marque isDirty. | 368 |
| `editor_toolUtilities_util.footSnap()` | Spécification de la grille de calage des empreintes de sites : { ox = 0, oy = 0, step = 1 }, alignée sur le monde et partagée par les trois outils de site. | 431 |
| `editor_toolUtilities_util.footSnapped(x, y)` | Ramène un x, y monde à cette grille (pas de 1 m). Pour les points qu'un outil pose lui-même : une forme de départ hors grille devient de travers dès qu'un coin est glissé dessus. | 435 |
| `editor_toolUtilities_util.generateUniqueName(baseName, prefixIn)` | Génère un nom qui n'entre pas en conflit avec l'arbre de scène : teste « prefix - nom », puis « prefix - nom - 1 », « - 2 », etc. Renvoie la partie nom sans préfixe. | 191 |
| `editor_toolUtilities_util.getAllSources(splines)` | Sources de toutes les splines activées (isEnabled), une liste par spline. | 610 |
| `editor_toolUtilities_util.getBlueToRedColour(value, minValue, maxValue)` | Couleur interpolée du bleu (minValue) au rouge (maxValue), valeur bornée. | 164 |
| `editor_toolUtilities_util.getHueBasedColour255(t)` | Couleur de teinte pour t borné entre 0 et 1 : de 240 degrés (bleu) à 0 (rouge), saturation et valeur à 1. | 188 |
| `editor_toolUtilities_util.getMaterialNames()` | Noms des couches de matériau du terrain (indice à partir de 0 -> nom), même source que roadNetwork. 'Material i' si un nom manque. | 243 |
| `editor_toolUtilities_util.getMeshBox(meshPath)` | Boîte englobante d'une forme TSStatic : crée un TSStatic temporaire ('temp_getMeshBox'), lit sa boîte d'objet, le supprime. | 145 |
| `editor_toolUtilities_util.getMinMaxWidth(spline)` | Largeurs minimale et maximale d'une spline (spline.widths) ; 10 et 10 s'il n'y en a pas. | 277 |
| `editor_toolUtilities_util.getPolyLength(pts)` | Longueur d'une polyligne (somme des distances 3D). | 268 |
| `editor_toolUtilities_util.getSourcesSingle(spline)` | Sources d'une spline pour le terraformage : une seule liste de { pos, width, binormal } sur divPoints, avec spline.terraWidth si défini à la place de divWidths. | 596 |
| `editor_toolUtilities_util.goToSpline(points)` | Passe en caméra libre et place la caméra au-dessus de la spline, regard vers le bas, d'après splineFocus. | 408 |
| `editor_toolUtilities_util.hsvToRgb(h, s, v)` | Convertit HSV en RGB, tout dans [0,1] (h est un tour entier = 1). | 630 |
| `editor_toolUtilities_util.hsvToRgb255(h, s, v)` | Convertit HSV en RGB sur 0-255 (h en degrés 0-360, s et v en 0-1). | 170 |
| `editor_toolUtilities_util.isMouseHoveringOverTerrain()` | Vrai si la souris est sur le viewport (ni sur un élément ou une fenêtre ImGui, ni sur le gizmo d'axes). | 41 |
| `editor_toolUtilities_util.isWidthFixed(nodes)` | Vrai si la largeur des nœuds est fixe (écart inférieur à 0.01). | 291 |
| `editor_toolUtilities_util.lookAtGround()` | Le sol sous le milieu de l'écran, en x, y (raycast depuis la caméra). Sert à poser un nouvel objet devant l'utilisateur. Renvoie 0, 0 si le regard est dans le ciel ou hors de la carte. | 418 |
| `editor_toolUtilities_util.mouseOnMapPos()` | Position carte sur laquelle pointe la souris (castRayStatic, portée 5000 m). Sans impact, renvoie la dernière position valide, ou à défaut le point du rayon à la portée maximale. | 46 |
| `editor_toolUtilities_util.mouseOnPlaneZ(planeZ)` | Point où le rayon de la souris coupe le plan horizontal z = planeZ. | 61 |
| `editor_toolUtilities_util.mouseOnTerrainPos(seedZ)` | Le SOL sous la souris, posé sur la grille de hauteur du terrain plutôt que sur une géométrie statique qui se trouverait sur le rayon. Itère 4 fois en recoupant avec la hauteur du terrain. | 71 |
| `editor_toolUtilities_util.msToKph(ms)` | Convertit des m/s en km/h (x 3.6). | 105 |
| `editor_toolUtilities_util.msToMph(ms)` | Convertit des m/s en mph (x 2.236936). | 103 |
| `editor_toolUtilities_util.splineFocus(points)` | Calcule un cadrage vu de dessus pour une spline : milieu de la boîte 2D et altitude telle que tout tient dans le champ (distance / tan(fov/2) + zMax + 5). | 381 |
| `editor_toolUtilities_util.starterRing(w, d, zAt)` | Un rectangle posé sur le sol sous le milieu de l'écran, orienté anti-horaire, coins sur la grille d'empreinte. | 440 |
| `editor_toolUtilities_util.sumOverNonArrayTable(t)` | Somme de toutes les valeurs d'une table non tableau. | 108 |
| `editor_toolUtilities_util.unchangedIds(a, b)` | Ids dont les copies dans deux instantanés des mêmes éléments sont identiques : ce qu'un pas d'annulation intermédiaire n'a pas touché. | 222 |
| `editor_toolUtilities_util.vertRaycast(pos, rayRaise, postFloat)` | Raycast vertical vers le bas qui modifie le Z du point sur place : monte de rayRaise, tire vers le bas, puis redescend sur la surface + postFloat pour ne pas s'enfoncer. | 85 |
| `editor_toolUtilities_util.writeMaskToPng(mask, path)` | Utilitaire de debug : écrit un masque binaire (lignes de 0 ou 1) en PNG 16 bits (blanc si 1). | 665 |
| `editor_toolUtilities_util.writePathsToPng(paths, width, height, path)` | Écrit des chemins vectorisés en PNG 16 bits à niveaux de gris, avec une intensité distincte par chemin. | 689 |
| `editor_toolUtilities_util.writeWidthsToPng(paths, widths, width, height, outPath)` | Écrit les chemins en traits épais continus : un disque plein à chaque point, de rayon max(1, floor(largeur/2)), en blanc sur fond noir. | 724 |

### Détail des paramètres

#### `editor_toolUtilities_util.beginSubTab(label, flags)`

Ouvre un sous-onglet ImGui (BeginTabItem) dont le corps est un enfant, pour que la rangée d'onglets reste en place. Renvoie false si l'onglet n'est pas ouvert.

- `label` (*string*) : Titre.
- `flags` (*integer|nil*) : Drapeaux TabItemFlags.
- **renvoie** : boolean Onglet ouvert.

#### `editor_toolUtilities_util.buildRibbonGLTF(points, widths, binormals)`

Convertit une polyligne de ruban en JSON GLTF avec tampon binaire intégré (positions float, indices uint16), coordonnées converties (x, z, -y).

- `points` (*vec3[]*) : Points.
- `widths` (*number[]*) : Largeurs.
- `binormals` (*vec3[]*) : Binormaux.
- **renvoie** : table Table GLTF.

#### `editor_toolUtilities_util.buildRibbonMeshFromPolyline(points, widths, binormals)`

Convertit une polyligne de ruban en maillage de triangles : deux sommets par point (gauche et droite, à demi-largeur le long du binormal), deux triangles par segment.

- `points` (*vec3[]*) : Points de la ligne centrale.
- `widths` (*number[]*) : Largeur totale à chaque point.
- `binormals` (*vec3[]*) : Binormal à chaque point.
- **renvoie** : table { vertices = vec3[], indices = integer[] } (indices à partir de 1).

#### `editor_toolUtilities_util.calculateAverageSpacingXY(positions, minSpacing)`

Estime l'espacement moyen en XY entre nœuds en simulant une interpolation Catmull-Rom centripète (10 échantillons par segment), sans compter l'emprise des meshes.

- `positions` (*vec3[]*) : Positions des nœuds.
- `minSpacing` (*number|nil*) : Plancher de l'espacement ; sert aussi de valeur de repli (1.0 par défaut) s'il y a moins de 2 nœuds.
- **renvoie** : number Espacement moyen (m).

#### `editor_toolUtilities_util.clearLevelContent()`

Ramène un niveau au terrain nu pour construire une scène de zéro. Supprime tous les objets des classes DecalRoad, TSStatic, MeshRoad, ProceduralMesh, PointLight et SpotLight, ainsi que toutes les INSTANCES de forêt ; les datablocks ForestItemData restent (la plantation retrouve ses espèces par nom). Marque editor.forestDirty.

- **renvoie** : integer Nombre d'objets de scène supprimés (hors éléments de forêt).

#### `editor_toolUtilities_util.commitStep(label, data, undoFn, redoFn)`

Enregistre un pas d'annulation comme transaction à part entière. Un commitAction seul copie en profondeur le pas du dessus de la pile et le nouveau pour chercher un doublon, ce qui est prohibitif pour un pas de terraformage de millions de hauteurs ; une transaction est enregistrée sans cette vérification.

- `label` (*string*) : Libellé.
- `data` (*any*) : Données du pas.
- `undoFn` (*function*) : Callback d'annulation.
- `redoFn` (*function*) : Callback de rétablissement.

#### `editor_toolUtilities_util.computeIdToIdxMap(splines, map)`

Remplit `map` (vidée d'abord) avec spline.id -> indice dans la liste.

- `splines` (*table*) : Liste de splines.
- `map` (*table*) : Table de sortie.

#### `editor_toolUtilities_util.deepEqual(a, b)`

Égalité profonde de deux valeurs. Teste le type avant == car comparer un vec3 à autre chose lève une erreur.

- `a` (*any*) : Valeur.
- `b` (*any*) : Valeur.
- **renvoie** : boolean Égales.

#### `editor_toolUtilities_util.doesPathContainNode(path, nodeKey)`

Cherche une clé de nœud dans un chemin.

- `path` (*table*) : Liste de clés.
- `nodeKey` (*any*) : Clé cherchée.
- **renvoie** : boolean Trouvée.
- **renvoie** : integer|nil Indice ou nil.

#### `editor_toolUtilities_util.fastArrayCopy(arr)`

Copie rapide d'un tableau simple (copie superficielle).

- `arr` (*table*) : Tableau source.
- **renvoie** : table Nouvelle copie.

#### `editor_toolUtilities_util.filterClosePointsXY(points, minDist)`

Retire les points consécutifs plus proches que minDist dans le plan XY (garde le premier).

- `points` (*vec3[]*) : Points.
- `minDist` (*number*) : Distance minimale (m).
- **renvoie** : table Nouvelle liste (la même table si moins de 2 points).

#### `editor_toolUtilities_util.findMaterialIdx(candidates)`

Indice de la première couche de terrain qui porte l'un des noms candidats, sans tenir compte de la casse.

- `candidates` (*string[]*) : Noms candidats, par ordre de priorité.
- **renvoie** : integer|nil Indice (à partir de 0) ou nil.

#### `editor_toolUtilities_util.flipBitmapY(bmpIn)`

Retourne verticalement un bitmap : crée un nouveau GBitmap GFXFormatR16 dont chaque texel copie la valeur de la ligne symétrique.

- `bmpIn` (*GBitmap*) : Bitmap source (non modifié).
- **renvoie** : GBitmap Nouveau bitmap retourné.

#### `editor_toolUtilities_util.flipSplineDirection(spline)`

Inverse le sens d'une spline (nodes, widths, nmls) et la marque isDirty.

- `spline` (*table*) : Spline modifiée en place.

#### `editor_toolUtilities_util.footSnap()`

Spécification de la grille de calage des empreintes de sites : { ox = 0, oy = 0, step = 1 }, alignée sur le monde et partagée par les trois outils de site.

- **renvoie** : table { ox, oy, step }.

#### `editor_toolUtilities_util.footSnapped(x, y)`

Ramène un x, y monde à cette grille (pas de 1 m). Pour les points qu'un outil pose lui-même : une forme de départ hors grille devient de travers dès qu'un coin est glissé dessus.

- `x` (*number*) : X monde.
- `y` (*number*) : Y monde.
- **renvoie** : number X calé.
- **renvoie** : number Y calé.

#### `editor_toolUtilities_util.generateUniqueName(baseName, prefixIn)`

Génère un nom qui n'entre pas en conflit avec l'arbre de scène : teste « prefix - nom », puis « prefix - nom - 1 », « - 2 », etc. Renvoie la partie nom sans préfixe.

- `baseName` (*string*) : Nom de base.
- `prefixIn` (*string*) : Préfixe (obligatoire).
- **renvoie** : string Nom unique, sans le préfixe.

#### `editor_toolUtilities_util.getAllSources(splines)`

Sources de toutes les splines activées (isEnabled), une liste par spline.

- `splines` (*table*) : Liste de splines.
- **renvoie** : table Liste de listes de { pos, width, binormal }.

#### `editor_toolUtilities_util.getBlueToRedColour(value, minValue, maxValue)`

Couleur interpolée du bleu (minValue) au rouge (maxValue), valeur bornée.

- `value` (*number*) : Valeur.
- `minValue` (*number*) : Valeur pour le bleu.
- `maxValue` (*number*) : Valeur pour le rouge.
- **renvoie** : ColorI color(r, 0, b, 255).

#### `editor_toolUtilities_util.getHueBasedColour255(t)`

Couleur de teinte pour t borné entre 0 et 1 : de 240 degrés (bleu) à 0 (rouge), saturation et valeur à 1.

- `t` (*number*) : Valeur 0..1.
- **renvoie** : integer R (0-255).
- **renvoie** : integer G (0-255).
- **renvoie** : integer B (0-255).

#### `editor_toolUtilities_util.getMaterialNames()`

Noms des couches de matériau du terrain (indice à partir de 0 -> nom), même source que roadNetwork. 'Material i' si un nom manque.

- **renvoie** : table<integer, string> Table vide si pas de terrain.

#### `editor_toolUtilities_util.getMeshBox(meshPath)`

Boîte englobante d'une forme TSStatic : crée un TSStatic temporaire ('temp_getMeshBox'), lit sa boîte d'objet, le supprime.

- `meshPath` (*string*) : Chemin de la forme (shapeName).
- **renvoie** : table { minExtents, maxExtents, center, extents } (vec3).

#### `editor_toolUtilities_util.getMinMaxWidth(spline)`

Largeurs minimale et maximale d'une spline (spline.widths) ; 10 et 10 s'il n'y en a pas.

- `spline` (*table*) : Spline avec widths.
- **renvoie** : number Minimum.
- **renvoie** : number Maximum.

#### `editor_toolUtilities_util.getPolyLength(pts)`

Longueur d'une polyligne (somme des distances 3D).

- `pts` (*vec3[]*) : Points.
- **renvoie** : number Longueur en mètres.

#### `editor_toolUtilities_util.getSourcesSingle(spline)`

Sources d'une spline pour le terraformage : une seule liste de { pos, width, binormal } sur divPoints, avec spline.terraWidth si défini à la place de divWidths.

- `spline` (*table*) : Spline (divPoints, divWidths, binormals, terraWidth).
- **renvoie** : table { sData }.

#### `editor_toolUtilities_util.goToSpline(points)`

Passe en caméra libre et place la caméra au-dessus de la spline, regard vers le bas, d'après splineFocus.

- `points` (*vec3[]*) : Points de la spline.

#### `editor_toolUtilities_util.hsvToRgb(h, s, v)`

Convertit HSV en RGB, tout dans [0,1] (h est un tour entier = 1).

- `h` (*number*) : Teinte 0-1.
- `s` (*number*) : Saturation 0-1.
- `v` (*number*) : Valeur 0-1.
- **renvoie** : number R.
- **renvoie** : number G.
- **renvoie** : number B.

#### `editor_toolUtilities_util.hsvToRgb255(h, s, v)`

Convertit HSV en RGB sur 0-255 (h en degrés 0-360, s et v en 0-1).

- `h` (*number*) : Teinte en degrés.
- `s` (*number*) : Saturation 0-1.
- `v` (*number*) : Valeur 0-1.
- **renvoie** : integer R.
- **renvoie** : integer G.
- **renvoie** : integer B.

#### `editor_toolUtilities_util.isMouseHoveringOverTerrain()`

Vrai si la souris est sur le viewport (ni sur un élément ou une fenêtre ImGui, ni sur le gizmo d'axes).

- **renvoie** : boolean La souris pointe le monde.

#### `editor_toolUtilities_util.isWidthFixed(nodes)`

Vrai si la largeur des nœuds est fixe (écart inférieur à 0.01).

- `nodes` (*table*) : Nœuds avec .width.
- **renvoie** : boolean Largeur fixe.
- **renvoie** : number Largeur minimale.

#### `editor_toolUtilities_util.lookAtGround()`

Le sol sous le milieu de l'écran, en x, y (raycast depuis la caméra). Sert à poser un nouvel objet devant l'utilisateur. Renvoie 0, 0 si le regard est dans le ciel ou hors de la carte.

- **renvoie** : number X.
- **renvoie** : number Y.

#### `editor_toolUtilities_util.mouseOnMapPos()`

Position carte sur laquelle pointe la souris (castRayStatic, portée 5000 m). Sans impact, renvoie la dernière position valide, ou à défaut le point du rayon à la portée maximale.

- **renvoie** : vec3 Position monde.

#### `editor_toolUtilities_util.mouseOnPlaneZ(planeZ)`

Point où le rayon de la souris coupe le plan horizontal z = planeZ.

- `planeZ` (*number*) : Altitude du plan.
- **renvoie** : vec3|nil Point d'intersection ; nil si le rayon est presque horizontal ou si le plan est derrière la caméra.

#### `editor_toolUtilities_util.mouseOnTerrainPos(seedZ)`

Le SOL sous la souris, posé sur la grille de hauteur du terrain plutôt que sur une géométrie statique qui se trouverait sur le rayon. Itère 4 fois en recoupant avec la hauteur du terrain.

- `seedZ` (*number|nil*) : Altitude de départ du plan (0 par défaut).
- **renvoie** : vec3|nil Point sur le terrain.

#### `editor_toolUtilities_util.msToKph(ms)`

Convertit des m/s en km/h (x 3.6).

- `ms` (*number*) : Vitesse en m/s.
- **renvoie** : number Vitesse en km/h.

#### `editor_toolUtilities_util.msToMph(ms)`

Convertit des m/s en mph (x 2.236936).

- `ms` (*number*) : Vitesse en m/s.
- **renvoie** : number Vitesse en mph.

#### `editor_toolUtilities_util.splineFocus(points)`

Calcule un cadrage vu de dessus pour une spline : milieu de la boîte 2D et altitude telle que tout tient dans le champ (distance / tan(fov/2) + zMax + 5).

- `points` (*vec3[]*) : Points de la spline.
- **renvoie** : number|nil X du milieu, nil si la spline est trop petite (moins de 0.1 m).
- **renvoie** : number Y du milieu.
- **renvoie** : number Altitude de la caméra.

#### `editor_toolUtilities_util.starterRing(w, d, zAt)`

Un rectangle posé sur le sol sous le milieu de l'écran, orienté anti-horaire, coins sur la grille d'empreinte.

- `w` (*number*) : Largeur (m).
- `d` (*number*) : Profondeur (m).
- `zAt` (*function|nil*) : zAt(x, y) donne l'altitude de chaque coin (0 par défaut).
- **renvoie** : vec3[] 4 coins.

#### `editor_toolUtilities_util.sumOverNonArrayTable(t)`

Somme de toutes les valeurs d'une table non tableau.

- `t` (*table<any, number>*) : Table clé -> nombre.
- **renvoie** : number Somme.

#### `editor_toolUtilities_util.unchangedIds(a, b)`

Ids dont les copies dans deux instantanés des mêmes éléments sont identiques : ce qu'un pas d'annulation intermédiaire n'a pas touché.

- `a` (*table*) : Instantané A (éléments avec .id).
- `b` (*table*) : Instantané B.
- **renvoie** : table<any, boolean> Ensemble id -> true.

#### `editor_toolUtilities_util.vertRaycast(pos, rayRaise, postFloat)`

Raycast vertical vers le bas qui modifie le Z du point sur place : monte de rayRaise, tire vers le bas, puis redescend sur la surface + postFloat pour ne pas s'enfoncer.

- `pos` (*vec3*) : Point modifié en place.
- `rayRaise` (*number|nil*) : Montée avant le tir (10 par défaut).
- `postFloat` (*number|nil*) : Petite hauteur ajoutée après (0.05 par défaut).

#### `editor_toolUtilities_util.writeMaskToPng(mask, path)`

Utilitaire de debug : écrit un masque binaire (lignes de 0 ou 1) en PNG 16 bits (blanc si 1).

- `mask` (*table*) : Masque 2D.
- `path` (*string*) : Fichier de sortie.

#### `editor_toolUtilities_util.writePathsToPng(paths, width, height, path)`

Écrit des chemins vectorisés en PNG 16 bits à niveaux de gris, avec une intensité distincte par chemin.

- `paths` (*table*) : Chemins.
- `width` (*integer*) : Largeur de l'image.
- `height` (*integer*) : Hauteur de l'image.
- `path` (*string*) : Fichier de sortie.

#### `editor_toolUtilities_util.writeWidthsToPng(paths, widths, width, height, outPath)`

Écrit les chemins en traits épais continus : un disque plein à chaque point, de rayon max(1, floor(largeur/2)), en blanc sur fond noir.

- `paths` (*table*) : Chemins.
- `widths` (*table*) : Largeurs par chemin.
- `width` (*integer*) : Largeur de l'image.
- `height` (*integer*) : Hauteur de l'image.
- `outPath` (*string*) : Fichier de sortie.

## Appels vers le moteur (C++)

- `obj:` `delete`, `getObjBox`, `registerObject`, `setField`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/util.lua`.*
