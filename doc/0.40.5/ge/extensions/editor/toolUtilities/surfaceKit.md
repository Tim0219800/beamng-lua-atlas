# `editor_toolUtilities_surfaceKit`

*Fichier : `lua/ge/extensions/editor/toolUtilities/surfaceKit.lua` · VM : Game Engine (GE) · 140 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_surfaceKit` : `extensions.load("editor_toolUtilities_surfaceKit")`, puis la globale `editor_toolUtilities_surfaceKit`

Kit partagé pour peindre des groundmodels (physique) sur des routes en mesh (mode groundmodel du Hero Road Editor). Le groundmodel est déduit du nom du matériau d'un triangle : les variantes de grip ont le même aspect que la base et ne diffèrent que par groundType. Les variantes sont le matériau de chaussée de la route plus un suffixe (_wet, _snow ou _snowy, _ice) ; Dry est le matériau de base et sert de gomme. Un état n'est peignable que si son matériau existe dans le niveau. La peinture est stockée en tampons monde { x, y, r, m } (m = indice de palette à partir de 1).

## Remarques

- Palette : 1 Dry (ASPHALT1), 2 Wet (ASPHALT_WET), 3 Snow (SNOW), 4 Ice (ICE). Les couleurs ne servent qu'à la surcouche de l'éditeur.
- Dans materialAt, le tampon d'indice le plus haut (peint en dernier) gagne, y compris un tampon Dry de gomme.
- La grille spatiale a une cellule égale au plus grand rayon de pinceau (au moins 0.5) et une recherche en voisinage 3x3.
- materialOf retombe sur le matériau de base si la variante n'existe pas ; sans baseMat, renvoie 'dry' (id de la palette).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_surfaceKit.buildGrid(stamps)` | Construit un hachage spatial uniforme sur les tampons pour que la recherche par quad soit environ O(1). Renvoie nil s'il n'y a rien de peint. | 84 |
| `editor_toolUtilities_surfaceKit.colOf(i)` | Couleur de surcouche { r, g, b } (0-255) ; celle de Dry si l'indice est inconnu. | 41 |
| `editor_toolUtilities_surfaceKit.count()` | Nombre d'entrées de la palette. | 37 |
| `editor_toolUtilities_surfaceKit.get(i)` | Entrée de palette (id, label, groundmodel, col, suffixes). | 38 |
| `editor_toolUtilities_surfaceKit.isAvailable(i, baseMat)` | Vrai si la surface `i` est peignable : Dry toujours, les autres seulement si une variante existe. | 62 |
| `editor_toolUtilities_surfaceKit.isBase(i)` | Vrai si l'indice est celui de la surface de base (Dry) ; nil est traité comme la base. | 39 |
| `editor_toolUtilities_surfaceKit.labelOf(i)` | Libellé de l'entrée, '?' si inconnue. | 40 |
| `editor_toolUtilities_surfaceKit.materialAt(grid, stamps, px, py)` | Indice de palette de la surface peinte au point monde (px, py) : le tampon d'indice le plus élevé couvrant le point gagne. Renvoie l'indice de base si rien ne le couvre. | 101 |
| `editor_toolUtilities_surfaceKit.materialExists(name)` | Vrai si un matériau de ce nom est présent dans le niveau (scenetree.findObject). | 44 |
| `editor_toolUtilities_surfaceKit.materialOf(i, baseMat)` | Matériau réellement appliqué à un quad peint de la surface `i` : la variante si elle existe, sinon la base. | 69 |
| `editor_toolUtilities_surfaceKit.resolveMaterials(baseMat)` | Résout le matériau de chaque surface pour une base donnée, en un passage (appelé une fois par construction de mesh). | 75 |
| `editor_toolUtilities_surfaceKit.variantMaterial(i, baseMat)` | Nom du matériau variante de la surface `i` pour la chaussée `baseMat`, ou nil si aucune variante n'existe (non peignable). Dry renvoie le matériau de base. | 50 |

### Détail des paramètres

#### `editor_toolUtilities_surfaceKit.buildGrid(stamps)`

Construit un hachage spatial uniforme sur les tampons pour que la recherche par quad soit environ O(1). Renvoie nil s'il n'y a rien de peint.

- `stamps` (*table|nil*) : Liste de tampons { x, y, r, m }.
- **renvoie** : table|nil { cell, map } ou nil.

#### `editor_toolUtilities_surfaceKit.colOf(i)`

Couleur de surcouche { r, g, b } (0-255) ; celle de Dry si l'indice est inconnu.

- `i` (*integer*) : Indice.
- **renvoie** : table { r, g, b }.

#### `editor_toolUtilities_surfaceKit.count()`

Nombre d'entrées de la palette.

- **renvoie** : integer 4

#### `editor_toolUtilities_surfaceKit.get(i)`

Entrée de palette (id, label, groundmodel, col, suffixes).

- `i` (*integer*) : Indice à partir de 1.
- **renvoie** : table|nil Entrée.

#### `editor_toolUtilities_surfaceKit.isAvailable(i, baseMat)`

Vrai si la surface `i` est peignable : Dry toujours, les autres seulement si une variante existe.

- `i` (*integer*) : Indice de palette.
- `baseMat` (*string*) : Matériau de base.
- **renvoie** : boolean Disponible.

#### `editor_toolUtilities_surfaceKit.isBase(i)`

Vrai si l'indice est celui de la surface de base (Dry) ; nil est traité comme la base.

- `i` (*integer|nil*) : Indice de palette.
- **renvoie** : boolean Est la base.

#### `editor_toolUtilities_surfaceKit.labelOf(i)`

Libellé de l'entrée, '?' si inconnue.

- `i` (*integer*) : Indice.
- **renvoie** : string Libellé.

#### `editor_toolUtilities_surfaceKit.materialAt(grid, stamps, px, py)`

Indice de palette de la surface peinte au point monde (px, py) : le tampon d'indice le plus élevé couvrant le point gagne. Renvoie l'indice de base si rien ne le couvre.

- `grid` (*table|nil*) : Résultat de buildGrid.
- `stamps` (*table*) : Les mêmes tampons.
- `px` (*number*) : X monde (m).
- `py` (*number*) : Y monde (m).
- **renvoie** : integer Indice de palette.

#### `editor_toolUtilities_surfaceKit.materialExists(name)`

Vrai si un matériau de ce nom est présent dans le niveau (scenetree.findObject).

- `name` (*string|nil*) : Nom du matériau.
- **renvoie** : boolean Existe.

#### `editor_toolUtilities_surfaceKit.materialOf(i, baseMat)`

Matériau réellement appliqué à un quad peint de la surface `i` : la variante si elle existe, sinon la base.

- `i` (*integer*) : Indice.
- `baseMat` (*string*) : Matériau de base.
- **renvoie** : string Nom du matériau.

#### `editor_toolUtilities_surfaceKit.resolveMaterials(baseMat)`

Résout le matériau de chaque surface pour une base donnée, en un passage (appelé une fois par construction de mesh).

- `baseMat` (*string*) : Matériau de base.
- **renvoie** : table<integer, string> Indice de palette -> nom de matériau.

#### `editor_toolUtilities_surfaceKit.variantMaterial(i, baseMat)`

Nom du matériau variante de la surface `i` pour la chaussée `baseMat`, ou nil si aucune variante n'existe (non peignable). Dry renvoie le matériau de base.

- `i` (*integer*) : Indice de palette.
- `baseMat` (*string*) : Matériau de base de la chaussée.
- **renvoie** : string|nil Nom du matériau.

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/surfaceKit.lua`.*
