# `editor_toolUtilities_meshPart`

*Fichier : `lua/ge/extensions/editor/toolUtilities/meshPart.lua` · VM : Game Engine (GE) · 524 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_meshPart` : `extensions.load("editor_toolUtilities_meshPart")`, puis la globale `editor_toolUtilities_meshPart`

Assemblage générique de « parts » de maillage pour les pièces de kit cuites (bridgeKit, islandKit, etc.). Une part est { verts, normals, uvs, faces } où chaque entrée de faces est { v, n, u } avec des indices en base 0, le format consommé à la fois par ProceduralMesh et par l'export DAE. Toutes les géométries de kit passent par ici pour partager une seule convention de bobinage. Fournit aussi la triangulation par ear clipping, des poteaux chanfreinés et emitObject, qui crée le ProceduralMesh dans la scène.

## Exemple

```lua
local mp = require('editor/toolUtilities/meshPart')
local part = mp.newPart()
mp.face4(part, p1, p2, p3, p4, 0, 0, 1, {0,0}, {1,0}, {1,1}, {0,1}) -- face visible côté +Z
mp.emitObject(folder, 'ma_dalle', {part}, false)
```

## Remarques

- Bobinage : la face avant d'un ProceduralMesh a sa normale géométrique de bobinage orientée À L'OPPOSÉ du côté visible ; la normale d'ombrage stockée pointe vers le côté visible. Les fonctions face* prennent un point de référence (rx, ry, rz) = direction du côté visible et retournent le bobinage si besoin. Ne pas assembler les faces à la main avec la convention inverse (daeExport inverse le bobinage une seule fois).
- Les entrées faces comptent un enregistrement par COIN de triangle (trois par triangle) ; face4 écrit 6 coins, face3 en écrit 3.
- Limite moteur : ProceduralMesh remplit un tampon d'index 16 bits avec un compteur 16 bits ; au-delà de 65535 coins dans un mesh, le compteur déborde et le jeu se fige. emitObject coupe donc à 60000 coins par mesh et renvoie alors un SimGroup de plusieurs meshes.
- Les meshes créés ont canSave = false. Sans collide, collisionType vaut 'None'. Les parts issues d'un pool ne sont pas conservées pour partsOf (elles sont réutilisées).
- UV : listes {u, v} ; les points sont des tables { x, y, z }.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_meshPart.ccwRing(poly)` | Renvoie l'anneau fermé de paires {x, y} bobiné dans le sens anti-horaire (la normale sortante d'une arête a->b est (dy, -dx)). Si l'anneau est déjà anti-horaire, il est renvoyé tel quel ; sinon une copie inversée. | 236 |
| `editor_toolUtilities_meshPart.emitObject(folder, name, parts, collide, decalSurface)` | Construit un ProceduralMesh nommé name à partir de parts, dans folder, en remplaçant tout objet de même nom (qui survit à un rechargement Lua seul). Un nom nil laisse le mesh sans nom. Au-delà de 60000 coins, renvoie à la place un SimGroup de plusieurs meshes sous ce nom. Par défaut sans collision. | 484 |
| `editor_toolUtilities_meshPart.face3(part, p1, p2, p3, rx, ry, rz, u1, u2, u3)` | Émet un triangle p1 -> p2 -> p3 avec le même contrat de bobinage que face4. Pour des capuchons plats (toits, terrasses) où un quad ne convient pas. | 173 |
| `editor_toolUtilities_meshPart.face4(part, p1, p2, p3, p4, rx, ry, rz, u1, u2, u3, u4, snx, sny, snz)` | Émet un quad p1 -> p2 -> p3 -> p4 dans la part, avec la face avant visible du côté du vecteur (rx, ry, rz). La normale d'ombrage est celle de la face (vers le côté visible), sauf si snx/sny/snz est fourni (le bobinage suit toujours la géométrie). | 122 |
| `editor_toolUtilities_meshPart.face4n(part, p1, p2, p3, p4, rx, ry, rz, u1, u2, u3, u4, n1, n2, n3, n4)` | Comme face4 mais avec une normale d'ombrage par coin (n1..n4 = {x, y, z}), pour ombrer en douceur une surface bosselée à partir de normales de sommets précalculées au lieu d'une seule normale de facette. | 148 |
| `editor_toolUtilities_meshPart.faces3(part, x, y, z, u, v, nv, tri, nt, rx, ry, rz)` | Émet des triangles sur des coins partagés, tous à ombrage plat : coin i en (x[i], y[i], z[i]) avec uv (u[i], v[i]), nv coins et nt triangles dont les coins sont tri[3t-2..3t] (indices 1-based). Chaque triangle est bobiné comme face3, mais un coin n'est stocké qu'une fois. | 195 |
| `editor_toolUtilities_meshPart.isDecalSurface(o)` | Indique si un objet est marqué comme surface de décalques. | 459 |
| `editor_toolUtilities_meshPart.markDecalSurface(o)` | Marque un objet comme surface drapée de décalques (tablier, dalle, sol de tunnel, place pavée) en posant decalSurface = '1' (sauvegardé avec l'objet). Les décalques se plaquent sur les formes statiques mais pas sur les items Forest : ces objets restent donc des TSStatic. | 455 |
| `editor_toolUtilities_meshPart.newPart(pool)` | Renvoie une part vide { verts, normals, uvs, faces }. Avec un pool, réutilise la part suivante du pool en vidant ses tables (les entrées internes sont gardées pour éviter des allocations). | 34 |
| `editor_toolUtilities_meshPart.newPool()` | Crée un pool de parts réutilisables, pour des parts émises puis jetées encore et encore. Le moteur copie les données du mesh à la création : une part passée par emitObject n'a plus besoin d'être conservée. | 26 |
| `editor_toolUtilities_meshPart.partsCentre(parts)` | Centre de l'étendue d'une liste de parts. Une forme est écrite autour de ce point et son objet statique y est posé : écrite autour de l'origine du monde, elle perdrait en précision loin sur la carte. Renvoie 0, 0, 0 si la liste est vide. | 356 |
| `editor_toolUtilities_meshPart.partsOf(id)` | Renvoie les parts à partir desquelles un mesh vivant a été construit (par id), pour pouvoir l'exporter ensuite comme forme. Nil pour un mesh issu de parts d'un pool. La table est purgée des meshes disparus tous les 2000 enregistrements. | 449 |
| `editor_toolUtilities_meshPart.partsTris(parts)` | Nombre de triangles d'une liste de parts (entrées de faces divisées par 3), pour rapporter ce qu'une cuisson a réellement écrit. | 348 |
| `editor_toolUtilities_meshPart.poolReset(pool)` | Remet à zéro le compteur du pool : les parts redonnées par newPart(pool) seront de nouveau remplies. | 30 |
| `editor_toolUtilities_meshPart.postPlan(d, cx, cy, cham)` | Plan d'un poteau carré de demi-largeur d centré en (cx, cy), arêtes verticales abattues de cham (anti-horaire). Sous 0.1 mm de chanfrein, c'est le carré simple (4 points) ; sinon un octogone (8 points). | 290 |
| `editor_toolUtilities_meshPart.postStage(part, d, cx, cy, z0, z1, cham, uv)` | Un étage de poteau habillé (dé de pilier, chapeau de poteau) : le plan de postPlan extrudé de z0 à z1, toutes les faces vers l'extérieur et les deux bouts fermés. UV en mètres multipliés par uv (U autour du plan, V en hauteur). | 302 |
| `editor_toolUtilities_meshPart.quad(part, p1, p2, p3, p4, rx, ry, rz, u1, u2, u3, u4)` | Émet un quad qui peut en réalité être un TRIANGLE (un coin confondu avec son voisin à 1e-6 près) : dans ce cas appelle face3 au lieu de gaspiller un triangle d'aire nulle ; sinon appelle face4. | 223 |
| `editor_toolUtilities_meshPart.scaleUVs(parts, s)` | Met à l'échelle sur place les UV d'une liste de parts : permet à un kit de poser ses UV en mètres puis de convertir au tiling du kit au moment de la cuisson. | 329 |
| `editor_toolUtilities_meshPart.tintParts(parts, m, tint)` | Applique une teinte à chaque part de la liste dont le champ material vaut m. Sans tint, ne fait rien. | 338 |
| `editor_toolUtilities_meshPart.triangulate(poly)` | Triangulation par ear clipping d'un anneau anti-horaire. S'arrête sans finir si aucune oreille n'est trouvée (anneau dégénéré ou auto-intersecté). | 253 |

### Détail des paramètres

#### `editor_toolUtilities_meshPart.ccwRing(poly)`

Renvoie l'anneau fermé de paires {x, y} bobiné dans le sens anti-horaire (la normale sortante d'une arête a->b est (dy, -dx)). Si l'anneau est déjà anti-horaire, il est renvoyé tel quel ; sinon une copie inversée.

- `poly` (*number[][]*) : Anneau de points {x, y} (indexés [1] et [2]).
- **renvoie** : number[][] Anneau anti-horaire.

#### `editor_toolUtilities_meshPart.emitObject(folder, name, parts, collide, decalSurface)`

Construit un ProceduralMesh nommé name à partir de parts, dans folder, en remplaçant tout objet de même nom (qui survit à un rechargement Lua seul). Un nom nil laisse le mesh sans nom. Au-delà de 60000 coins, renvoie à la place un SimGroup de plusieurs meshes sous ce nom. Par défaut sans collision.

- `folder` (*userdata*) : SimGroup parent ; nil = renvoie nil.
- `name` (*string|nil*) : Nom d'objet de scène.
- `parts` (*table[]*) : Liste de parts ; vide = nil.
- `collide` (*boolean|nil*) : Cuire une collision (là où le mesh est la seule surface, par exemple une bordure que la voiture doit sentir).
- `decalSurface` (*boolean|nil*) : Marque le mesh comme surface sur laquelle des décalques s'appliquent.
- **renvoie** : userdata|nil ProceduralMesh ou SimGroup créé.

#### `editor_toolUtilities_meshPart.face3(part, p1, p2, p3, rx, ry, rz, u1, u2, u3)`

Émet un triangle p1 -> p2 -> p3 avec le même contrat de bobinage que face4. Pour des capuchons plats (toits, terrasses) où un quad ne convient pas.

- `part` (*table*) : Part cible.
- `p1` (*table*) : Point.
- `p2` (*table*) : Point.
- `p3` (*table*) : Point.
- `rx` (*number*) : Côté visible x.
- `ry` (*number*) : Côté visible y.
- `rz` (*number*) : Côté visible z.
- `u1` (*number[]*) : UV coin 1.
- `u2` (*number[]*) : UV coin 2.
- `u3` (*number[]*) : UV coin 3.

#### `editor_toolUtilities_meshPart.face4(part, p1, p2, p3, p4, rx, ry, rz, u1, u2, u3, u4, snx, sny, snz)`

Émet un quad p1 -> p2 -> p3 -> p4 dans la part, avec la face avant visible du côté du vecteur (rx, ry, rz). La normale d'ombrage est celle de la face (vers le côté visible), sauf si snx/sny/snz est fourni (le bobinage suit toujours la géométrie).

- `part` (*table*) : Part cible.
- `p1` (*table*) : Point {x, y, z}.
- `p2` (*table*) : Point {x, y, z}.
- `p3` (*table*) : Point {x, y, z}.
- `p4` (*table*) : Point {x, y, z}.
- `rx` (*number*) : Côté visible, composante x.
- `ry` (*number*) : Côté visible, composante y.
- `rz` (*number*) : Côté visible, composante z.
- `u1` (*number[]*) : UV {u, v} du coin 1.
- `u2` (*number[]*) : UV du coin 2.
- `u3` (*number[]*) : UV du coin 3.
- `u4` (*number[]*) : UV du coin 4.
- `snx` (*number|nil*) : Normale d'ombrage imposée, x.
- `sny` (*number|nil*) : Normale d'ombrage imposée, y.
- `snz` (*number|nil*) : Normale d'ombrage imposée, z.

#### `editor_toolUtilities_meshPart.face4n(part, p1, p2, p3, p4, rx, ry, rz, u1, u2, u3, u4, n1, n2, n3, n4)`

Comme face4 mais avec une normale d'ombrage par coin (n1..n4 = {x, y, z}), pour ombrer en douceur une surface bosselée à partir de normales de sommets précalculées au lieu d'une seule normale de facette.

- `part` (*table*) : Part cible.
- `p1` (*table*) : Point.
- `p2` (*table*) : Point.
- `p3` (*table*) : Point.
- `p4` (*table*) : Point.
- `rx` (*number*) : Côté visible x.
- `ry` (*number*) : Côté visible y.
- `rz` (*number*) : Côté visible z.
- `u1` (*number[]*) : UV coin 1.
- `u2` (*number[]*) : UV coin 2.
- `u3` (*number[]*) : UV coin 3.
- `u4` (*number[]*) : UV coin 4.
- `n1` (*table*) : Normale coin 1 {x, y, z}, vers le côté visible.
- `n2` (*table*) : Normale coin 2.
- `n3` (*table*) : Normale coin 3.
- `n4` (*table*) : Normale coin 4.

#### `editor_toolUtilities_meshPart.faces3(part, x, y, z, u, v, nv, tri, nt, rx, ry, rz)`

Émet des triangles sur des coins partagés, tous à ombrage plat : coin i en (x[i], y[i], z[i]) avec uv (u[i], v[i]), nv coins et nt triangles dont les coins sont tri[3t-2..3t] (indices 1-based). Chaque triangle est bobiné comme face3, mais un coin n'est stocké qu'une fois.

- `part` (*table*) : Part cible.
- `x` (*number[]*) : X des coins.
- `y` (*number[]*) : Y des coins.
- `z` (*number[]*) : Z des coins.
- `u` (*number[]*) : U des coins.
- `v` (*number[]*) : V des coins.
- `nv` (*integer*) : Nombre de coins.
- `tri` (*integer[]*) : Indices des triangles, 3 par triangle, base 1.
- `nt` (*integer*) : Nombre de triangles.
- `rx` (*number*) : Côté visible x.
- `ry` (*number*) : Côté visible y.
- `rz` (*number*) : Côté visible z.

#### `editor_toolUtilities_meshPart.isDecalSurface(o)`

Indique si un objet est marqué comme surface de décalques.

- `o` (*userdata*) : Objet de scène.
- **renvoie** : boolean true si decalSurface vaut '1'.

#### `editor_toolUtilities_meshPart.markDecalSurface(o)`

Marque un objet comme surface drapée de décalques (tablier, dalle, sol de tunnel, place pavée) en posant decalSurface = '1' (sauvegardé avec l'objet). Les décalques se plaquent sur les formes statiques mais pas sur les items Forest : ces objets restent donc des TSStatic.

- `o` (*userdata*) : Objet de scène.

#### `editor_toolUtilities_meshPart.newPart(pool)`

Renvoie une part vide { verts, normals, uvs, faces }. Avec un pool, réutilise la part suivante du pool en vidant ses tables (les entrées internes sont gardées pour éviter des allocations).

- `pool` (*table|nil*) : Pool optionnel.
- **renvoie** : table Part.

#### `editor_toolUtilities_meshPart.newPool()`

Crée un pool de parts réutilisables, pour des parts émises puis jetées encore et encore. Le moteur copie les données du mesh à la création : une part passée par emitObject n'a plus besoin d'être conservée.

- **renvoie** : table Pool { n = 0 }.

#### `editor_toolUtilities_meshPart.partsCentre(parts)`

Centre de l'étendue d'une liste de parts. Une forme est écrite autour de ce point et son objet statique y est posé : écrite autour de l'origine du monde, elle perdrait en précision loin sur la carte. Renvoie 0, 0, 0 si la liste est vide.

- `parts` (*table[]|nil*) : Liste de parts.
- **renvoie** : number x du centre.
- **renvoie** : number y du centre.
- **renvoie** : number z du centre.

#### `editor_toolUtilities_meshPart.partsOf(id)`

Renvoie les parts à partir desquelles un mesh vivant a été construit (par id), pour pouvoir l'exporter ensuite comme forme. Nil pour un mesh issu de parts d'un pool. La table est purgée des meshes disparus tous les 2000 enregistrements.

- `id` (*integer*) : Id de l'objet mesh.
- **renvoie** : table[]|nil Liste de parts.

#### `editor_toolUtilities_meshPart.partsTris(parts)`

Nombre de triangles d'une liste de parts (entrées de faces divisées par 3), pour rapporter ce qu'une cuisson a réellement écrit.

- `parts` (*table[]|nil*) : Liste de parts.
- **renvoie** : integer Nombre de triangles.

#### `editor_toolUtilities_meshPart.poolReset(pool)`

Remet à zéro le compteur du pool : les parts redonnées par newPart(pool) seront de nouveau remplies.

- `pool` (*table*) : Pool de newPool.

#### `editor_toolUtilities_meshPart.postPlan(d, cx, cy, cham)`

Plan d'un poteau carré de demi-largeur d centré en (cx, cy), arêtes verticales abattues de cham (anti-horaire). Sous 0.1 mm de chanfrein, c'est le carré simple (4 points) ; sinon un octogone (8 points).

- `d` (*number*) : Demi-largeur (m).
- `cx` (*number*) : Centre x.
- `cy` (*number*) : Centre y.
- `cham` (*number*) : Chanfrein (m).
- **renvoie** : number[][] Anneau de points {x, y}.

#### `editor_toolUtilities_meshPart.postStage(part, d, cx, cy, z0, z1, cham, uv)`

Un étage de poteau habillé (dé de pilier, chapeau de poteau) : le plan de postPlan extrudé de z0 à z1, toutes les faces vers l'extérieur et les deux bouts fermés. UV en mètres multipliés par uv (U autour du plan, V en hauteur).

- `part` (*table*) : Part cible.
- `d` (*number*) : Demi-largeur (m).
- `cx` (*number*) : Centre x.
- `cy` (*number*) : Centre y.
- `z0` (*number*) : Cote basse.
- `z1` (*number*) : Cote haute.
- `cham` (*number|nil*) : Chanfrein (défaut 0).
- `uv` (*number|nil*) : Facteur d'échelle UV (défaut 1).

#### `editor_toolUtilities_meshPart.quad(part, p1, p2, p3, p4, rx, ry, rz, u1, u2, u3, u4)`

Émet un quad qui peut en réalité être un TRIANGLE (un coin confondu avec son voisin à 1e-6 près) : dans ce cas appelle face3 au lieu de gaspiller un triangle d'aire nulle ; sinon appelle face4.

- `part` (*table*) : Part cible.
- `p1` (*table*) : Point.
- `p2` (*table*) : Point.
- `p3` (*table*) : Point.
- `p4` (*table*) : Point.
- `rx` (*number*) : Côté visible x.
- `ry` (*number*) : Côté visible y.
- `rz` (*number*) : Côté visible z.
- `u1` (*number[]*) : UV coin 1.
- `u2` (*number[]*) : UV coin 2.
- `u3` (*number[]*) : UV coin 3.
- `u4` (*number[]*) : UV coin 4.

#### `editor_toolUtilities_meshPart.scaleUVs(parts, s)`

Met à l'échelle sur place les UV d'une liste de parts : permet à un kit de poser ses UV en mètres puis de convertir au tiling du kit au moment de la cuisson.

- `parts` (*table[]*) : Liste de parts.
- `s` (*number*) : Facteur.
- **renvoie** : table[] La même liste parts.

#### `editor_toolUtilities_meshPart.tintParts(parts, m, tint)`

Applique une teinte à chaque part de la liste dont le champ material vaut m. Sans tint, ne fait rien.

- `parts` (*table[]*) : Liste de parts.
- `m` (*string*) : Nom du matériau.
- `tint` (*any|nil*) : Teinte à affecter à part.tint.
- **renvoie** : table[] La liste parts.

#### `editor_toolUtilities_meshPart.triangulate(poly)`

Triangulation par ear clipping d'un anneau anti-horaire. S'arrête sans finir si aucune oreille n'est trouvée (anneau dégénéré ou auto-intersecté).

- `poly` (*number[][]*) : Anneau anti-horaire de points {x, y}.
- **renvoie** : integer[][] Triplets d'indices {i0, i1, i2} dans poly.

## Appels vers le moteur (C++)

- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/meshPart.lua`.*
