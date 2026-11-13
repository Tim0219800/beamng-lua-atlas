# `editor_toolUtilities_gridCap`

*Fichier : `lua/ge/extensions/editor/toolUtilities/gridCap.lua` · VM : Game Engine (GE) · 356 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_gridCap` : `extensions.load("editor_toolUtilities_gridCap")`, puis la globale `editor_toolUtilities_gridCap`

Construit un « chapeau » (capot) de triangles sur un contour qui doit suivre un champ de hauteur : une grille carrée alignée sur le fil (grain) du contour, découpée à ce contour. Chaque cellule entièrement dans le contour donne deux triangles aux hauteurs du champ ; seules les cellules traversées par le contour sont découpées (polyBool), ce qui évite les triangles très longs ou en éclat. Un passage de Delaunay améliore ensuite le maillage.

## Remarques

- build renvoie toujours la même table 'mesh' réutilisée : { x, y, z (positions), tri (indices 1-based, 3 par triangle), nv, nt }. Elle n'est valable que jusqu'au prochain build : copier si besoin.
- Les points sont soudés au dixième de millimètre (WELD = 1e4) ; les cellules découpées avec trous sont mises en cache (20000 par génération, deux générations conservées).
- Un point d'un anneau dont les noeuds portent une hauteur (p.z) garde la droite entre eux ; un anneau sans hauteur prend celle du champ.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_gridCap.build(rings, cf, zAt, cell)` | Construit le chapeau sur les anneaux donnés (le contour extérieur, puis ses trous ; ouverts ou fermés) en coordonnées monde. Travaille dans le repère du grain où les cellules sont carrées. Renvoie nil si aucun triangle n'est produit. | 206 |
| `editor_toolUtilities_gridCap.reaching(outer, rings, cf, cell)` | Filtre les anneaux qui peuvent toucher une cellule de la grille sur laquelle le chapeau du contour 'outer' est posé (boîte dans le repère du grain, arrondie à la grille, plus un petit jeu). Les autres ne changent rien au résultat. | 330 |

### Détail des paramètres

#### `editor_toolUtilities_gridCap.build(rings, cf, zAt, cell)`

Construit le chapeau sur les anneaux donnés (le contour extérieur, puis ses trous ; ouverts ou fermés) en coordonnées monde. Travaille dans le repère du grain où les cellules sont carrées. Renvoie nil si aucun triangle n'est produit.

- `rings` (*table[]*) : Anneaux de points {x, y, z?} : le contour puis les trous.
- `cf` (*table*) : Le grain : ax, ay (le long), inX, inY (en travers).
- `zAt` (*function*) : Champ de hauteur zAt(x, y) -> z, en monde.
- `cell` (*number*) : Pas de la grille (m).
- **renvoie** : table|nil Le maillage plat { x, y, z, tri, nv, nt } ou nil.

#### `editor_toolUtilities_gridCap.reaching(outer, rings, cf, cell)`

Filtre les anneaux qui peuvent toucher une cellule de la grille sur laquelle le chapeau du contour 'outer' est posé (boîte dans le repère du grain, arrondie à la grille, plus un petit jeu). Les autres ne changent rien au résultat.

- `outer` (*table*) : Contour extérieur.
- `rings` (*table[]*) : Anneaux candidats.
- `cf` (*table*) : Le grain (ax, ay, inX, inY).
- `cell` (*number*) : Pas de la grille (m).
- **renvoie** : table[] Sous-liste des anneaux atteignables.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/gridCap.lua`.*
