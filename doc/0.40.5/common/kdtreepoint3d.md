# `kdtreepoint3d`

*Fichier : `lua/common/kdtreepoint3d.lua` · VM : Commun (GE + véhicule) · 319 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("kdtreepoint3d")`

Arbre k-d pour points 3D. Offre deux types de requêtes : les points dans une boîte (query / queryNotNested, itérateurs) et le point le plus proche d'un point donné (findNearest). Typique pour retrouver le noeud de route ou l'objet le plus proche d'une position. Flux : new -> preLoad -> build -> requêtes.

## Exemple

```lua
local kdTreeP3d = require('kdtreepoint3d')
local kdT = kdTreeP3d.new(itemCount)
for id, p in pairs(points) do kdT:preLoad(id, p.x, p.y, p.z) end
kdT:build()
local nearestId, dist = kdT:findNearest(x, y, z)
for id in kdT:queryNotNested(xmin, ymin, zmin, xmax, ymax, zmax) do ... end
```

## Remarques

- Chaque point occupe 4 valeurs dans self.items (x, y, z, id) ; avant build() itemCount compte des valeurs, après build() c'est le nombre de points.
- Le commentaire d'usage écrit `kdT:preload` mais la méthode réelle est preLoad (L majuscule).
- findNearest renvoie l'id et la DISTANCE (racine carrée, pas le carré). Il utilise self.qPoint et self.stack : pas réentrant, et il ne marche pas avant build. Il utilise la globale square (mathlib).
- queryNotNested n'est pas imbricable (état réutilisé) ; query l'est. Bornes de requête clampées à ±1.7e308.
- Pas de méthode clear() dans cette version (contrairement à kdtreebox2d).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `kdtreepoint3d.new(itemCount)` | Crée un arbre k-d de points 3D vide. | 105 |

### Détail des paramètres

#### `kdtreepoint3d.new(itemCount)`

Crée un arbre k-d de points 3D vide.

- `itemCount` (*integer|nil*) : nombre de points prévus (préallocation, facultatif)
- **renvoie** : kdTree arbre vide

## Classe `kdTree`

Objet renvoyé par new().

| Méthode | Description | Ligne |
|---|---|---|
| `kdTree:_build(axis, left, right, treeIdx)` | Interne : construction récursive d'un noeud. | 143 |
| `kdTree:analytics()` | Affiche (print) des statistiques de l'arbre. | 309 |
| `kdTree:build()` | Construit l'arbre à partir des points chargés. | 175 |
| `kdTree:export()` | Renvoie les données de l'arbre (références) pour réutilisation. | 121 |
| `kdTree:findNearest(x, y, z)` | Trouve le point le plus proche de (x, y, z) et renvoie son id et la distance euclidienne. | 262 |
| `kdTree:import(kdTreeData)` | Charge des données produites par export(). | 130 |
| `kdTree:preLoad(id, x, y, z)` | Ajoute un point (avant build). | 137 |
| `kdTree:query(query_xmin, query_ymin, query_zmin, query_xmax, query_ymax, query_zmax)` | Itérateur sur les ids des points situés dans la boîte de requête ; imbrication possible. | 233 |
| `kdTree:queryNotNested(query_xmin, query_ymin, query_zmin, query_xmax, query_ymax, query_zmax)` | Comme query sans allocation ; ne pas imbriquer. | 247 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/kdtreepoint3d.lua`.*
