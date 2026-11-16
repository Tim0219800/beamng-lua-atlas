# `kdtreebox3d`

*Fichier : `lua/common/kdtreebox3d.lua` · VM : Commun (GE + véhicule) · 295 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("kdtreebox3d")`

Arbre k-d pour boîtes 3D (xmin, ymin, zmin, xmax, ymax, zmax), soit 6 dimensions. Permet de retrouver rapidement tous les éléments dont la boîte intersecte une boîte de requête. Même API que kdtreebox2d en 3D : new -> preLoad -> build -> query/queryNotNested ; export/import pour réutiliser un arbre.

## Exemple

```lua
local kdTreeB3d = require('kdtreebox3d')
local kdT = kdTreeB3d.new(itemCount)
kdT:preLoad(id, xmin, ymin, zmin, xmax, ymax, zmax)
kdT:build()
for id in kdT:queryNotNested(xmin, ymin, zmin, xmax, ymax, zmax) do ... end
```

## Remarques

- Chaque élément occupe 7 valeurs dans self.items (xmin, ymin, zmin, xmax, ymax, zmax, id) ; avant build() itemCount compte des valeurs, après build() c'est le nombre d'éléments.
- Mêmes règles que kdtreebox2d : queryNotNested réutilise l'état de l'arbre (pas d'imbrication), query alloue un état par requête (imbrication possible), bornes de requête ramenées à ±1.7e308.
- Contrairement à kdtreebox2d, il n'y a pas de méthode clear() dans cette version.
- Dans le code, l'exemple d'usage en tête de fichier décrit les mêmes appels que la version 2D ; c'est la version à 7 valeurs par élément qui est implémentée.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `kdtreebox3d.new(itemCount)` | Crée un arbre k-d de boîtes 3D vide. | 115 |

### Détail des paramètres

#### `kdtreebox3d.new(itemCount)`

Crée un arbre k-d de boîtes 3D vide.

- `itemCount` (*integer|nil*) : nombre d'éléments prévus (préallocation, facultatif)
- **renvoie** : kdTree arbre vide

## Classe `kdTree`

Objet renvoyé par new().

| Méthode | Description | Ligne |
|---|---|---|
| `kdTree:_build(axis, left, right, treeIdx)` | Interne : construction récursive d'un noeud. | 158 |
| `kdTree:analytics()` | Affiche (print) des statistiques de l'arbre. | 284 |
| `kdTree:build()` | Construit l'arbre (médiane récursive en alternant les axes) à partir des éléments chargés. | 192 |
| `kdTree:export()` | Renvoie les données de l'arbre (références) pour sérialisation/réutilisation. | 130 |
| `kdTree:import(kdTreeData)` | Charge des données produites par export(). | 139 |
| `kdTree:preLoad(id, xmin, ymin, zmin, xmax, ymax, zmax)` | Ajoute un élément (avant build). | 146 |
| `kdTree:query(query_xmin, query_ymin, query_zmin, query_xmax, query_ymax, query_zmax)` | Itérateur sur les ids des éléments dont la boîte intersecte la boîte de requête ; imbrication possible. | 254 |
| `kdTree:queryNotNested(query_xmin, query_ymin, query_zmin, query_xmax, query_ymax, query_zmax)` | Comme query sans allocation ; interdit d'imbriquer. | 268 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/kdtreebox3d.lua`.*
