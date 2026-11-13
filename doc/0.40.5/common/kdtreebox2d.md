# `kdtreebox2d`

*Fichier : `lua/common/kdtreebox2d.lua` · VM : Commun (GE + véhicule) · 286 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("kdtreebox2d")`

Arbre k-d pour boîtes 2D (xmin, ymin, xmax, ymax), donc 4 dimensions, permettant de retrouver rapidement tous les éléments dont la boîte intersecte une zone de requête. Typiquement utilisé pour des segments de route, des zones ou des obstacles. Flux : new -> preLoad (pour chaque élément) -> build -> query / queryNotNested. Les requêtes sont des itérateurs Lua utilisables dans une boucle for.

## Exemple

```lua
local kdTreeB2d = require('kdtreebox2d')
local kdT = kdTreeB2d.new(itemCount) -- itemCount facultatif (préallocation)
for _, it in ipairs(items) do kdT:preLoad(it.id, it.xmin, it.ymin, it.xmax, it.ymax) end
kdT:build()
for id in kdT:queryNotNested(xmin, ymin, xmax, ymax) do ... end   -- requêtes non imbriquées
for id1 in kdT:query(xmin, ymin, xmax, ymax) do                    -- requêtes imbriquées (crée du garbage)
  for id2 in kdT:query(...) do ... end
end
```

## Remarques

- Les éléments sont stockés à plat dans self.items par groupes de 5 valeurs (xmin, ymin, xmax, ymax, id). Avant build(), self.itemCount compte des valeurs (x5) ; après build() il est divisé par 5 et devient le nombre d'éléments.
- Les itérateurs renvoient l'identifiant (id) de chaque élément dont la boîte intersecte la boîte de requête (inclusif). Les bornes de requête sont ramenées à ±1.7e308 pour accepter des infinis.
- queryNotNested réutilise l'état interne de l'arbre : on ne peut pas imbriquer une autre requête (ni queryNotNested ni query sur le même arbre pendant l'itération avec queryNotNested). query alloue un nouvel état par appel et supporte l'imbrication.
- build() doit être appelé une seule fois après tous les preLoad (il modifie itemCount). Appeler query avant build() échoue (tree == nil).
- clear() ne fait rien tant que l'arbre n'a pas été construit (self.tree == nil). Après clear on peut réutiliser l'objet (preLoad puis build).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `kdtreebox2d.new(itemCount)` | Crée un arbre k-d de boîtes 2D vide. | 106 |

### Détail des paramètres

#### `kdtreebox2d.new(itemCount)`

Crée un arbre k-d de boîtes 2D vide.

- `itemCount` (*integer|nil*) : nombre d'éléments prévus, pour préallouer (facultatif)
- **renvoie** : kdTree arbre vide

## Classe `kdTree`

Objet renvoyé par new(). Champs : tree, items, itemCount, nonLeafLimIdx et états de requête internes.

| Méthode | Description | Ligne |
|---|---|---|
| `kdTree:_build(axis, left, right, treeIdx)` | Interne : construction récursive d'un noeud ; renvoie la boîte englobante du sous-arbre. | 160 |
| `kdTree:analytics()` | Affiche (print) des statistiques de l'arbre : profondeur, nombre de noeuds, de feuilles, d'éléments. | 275 |
| `kdTree:build()` | Construit l'arbre à partir des éléments chargés (sélection de médiane récursive en alternant les 4 axes). | 187 |
| `kdTree:clear()` | Vide un arbre existant pour le réutiliser (utile pour des arbres mis à jour souvent). Sans effet avant build. | 122 |
| `kdTree:export()` | Renvoie une table {tree, nonLeafLimIdx, items, itemCount} (références, pas de copie) pour la sérialiser ou la réutiliser. | 138 |
| `kdTree:import(kdTreeData)` | Remplace le contenu par des données produites par export(). | 147 |
| `kdTree:preLoad(id, xmin, ymin, xmax, ymax)` | Ajoute un élément (avant build). | 154 |
| `kdTree:query(query_xmin, query_ymin, query_xmax, query_ymax)` | Itérateur (à utiliser dans for) sur les ids des éléments intersectant la boîte donnée ; supporte les requêtes imbriquées. | 247 |
| `kdTree:queryNotNested(query_xmin, query_ymin, query_xmax, query_ymax)` | Comme query mais sans allocation (réutilise l'état de l'arbre) : ne pas imbriquer. | 261 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/kdtreebox2d.lua`.*
