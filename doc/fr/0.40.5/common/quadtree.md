# `quadtree`

*Fichier : `lua/common/quadtree.lua` · VM : Commun (GE + véhicule) · 392 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("quadtree")`

Quadtree 2D pour boîtes (insertion, suppression, requête, compression). Contrairement aux arbres k-d, on peut insérer et retirer des éléments après la construction, et une requête en cours n'est pas perturbée par une suppression. Chaque élément est (id, xmin, ymin, xmax, ymax). Flux : newQuadtree -> preLoad (pour dimensionner le canevas) -> build(maxDepth) -> [compress] -> insert/remove/query.

## Exemple

```lua
local tree = require('quadtree')
local q = tree.newQuadtree()
for _, it in ipairs(items) do q:preLoad(it.id, it.xmin, it.ymin, it.xmax, it.ymax) end
q:build(10) -- profondeur max facultative (10 par défaut)
q:insert(id, xmin, ymin, xmax, ymax)
q:remove(id, centerX, centerY)
for id in q:queryNotNested(xmin, ymin, xmax, ymax) do ... end
```

## Remarques

- Le canevas (boîte de la racine) est calculé par preLoad comme l'union des boîtes préchargées et ne change plus après build ; des éléments hors canevas peuvent être insérés/retirés/interrogés (ils restent dans les noeuds proches de la racine).
- Structure : self.tree[i] est la table des éléments du noeud i (5 valeurs par élément : id, xmin, ymin, xmax, ymax — le commentaire de tête mentionne un autre ordre xmin/xmax) avec itemCount ; self.children[i] est l'indice du premier de 4 enfants.
- remove(itm_id, itm_x, itm_y) a besoin du CENTRE de l'élément pour le retrouver (descente dans l'arbre selon ce point) ; la suppression remplace la table du noeud (supporte les requêtes actives). Un élément qui dépasse les bords d'un quadrant reste dans le noeud parent : la suppression teste d'abord le noeud courant avant de descendre.
- queryNotNested réutilise l'état de l'arbre (pas d'imbrication) ; query alloue un état par requête et supporte l'imbrication. Les deux renvoient les ids des éléments dont la boîte intersecte la boîte de requête.
- build(maxDepth) insère les éléments préchargés puis libère la liste préchargée (itm_preld = nil) : on ne peut plus appeler preLoad après build (utiliser insert).
- compress() recopie les tables de noeuds pour réduire la mémoire ; des insertions ultérieures peuvent être plus lentes (note du code).
- Les champs M.pointBBox et M.lineBBox sont des références aux fonctions globales pointBB2d et lineBB2d de mathlib (l'extraction automatique les marque inconnus).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `quadtree.newQuadtree(numOfItems)` | Crée un quadtree vide. Profondeur max par défaut 10 (la racine est la profondeur 1). | 81 |

### Détail des paramètres

#### `quadtree.newQuadtree(numOfItems)`

Crée un quadtree vide. Profondeur max par défaut 10 (la racine est la profondeur 1).

- `numOfItems` (*integer|nil*) : nombre d'éléments prévus pour préallouer (facultatif)
- **renvoie** : quadTree quadtree vide

## Champs

| Champ | Type | Description |
|---|---|---|
| `lineBBox` | function | Alias de lineBB2d (mathlib) : boîte englobante d'un segment élargi d'un rayon. |
| `pointBBox` | function | Alias de pointBB2d (mathlib) : boîte englobante d'un point élargi d'un rayon. |

## Classe `quadTree`

Objet renvoyé par newQuadtree().

| Méthode | Description | Ligne |
|---|---|---|
| `quadTree:analytics()` | Affiche (print) la profondeur, le nombre de noeuds et d'éléments occupés. | 361 |
| `quadTree:build(maxDepth)` | Insère tous les éléments préchargés dans l'arbre. maxDepth (défaut 10) borne la profondeur. | 244 |
| `quadTree:compress()` | Réduit la mémoire en recopiant les tables de noeuds à la taille exacte. Optionnel après build. | 347 |
| `quadTree:export()` | Renvoie les données de l'arbre {tree, children, nodeCount, maxDepth, xmin, xmax, ymin, ymax} (références). | 101 |
| `quadTree:import(quadTreeData)` | Charge des données produites par export() (et abandonne la liste préchargée). | 114 |
| `quadTree:insert(itm_id, itm_xmin, itm_ymin, itm_xmax, itm_ymax)` | Insère un élément (après build ou en cours d'utilisation) dans le noeud le plus profond qui le contient entièrement. | 144 |
| `quadTree:preLoad(itm_id, itm_xmin, itm_ymin, itm_xmax, itm_ymax)` | Mémorise un élément et agrandit le canevas de l'arbre ; à utiliser avant build(). | 124 |
| `quadTree:query(query_xmin, query_ymin, query_xmax, query_ymax)` | Itérateur sur les ids des éléments intersectant la boîte de requête ; supporte les requêtes imbriquées et les suppressions pendant l'itération. | 310 |
| `quadTree:queryNotNested(query_xmin, query_ymin, query_xmax, query_ymax)` | Comme query sans allocation ; ne pas imbriquer. | 329 |
| `quadTree:remove(itm_id, itm_x, itm_y)` | Retire l'élément d'identifiant itm_id en le cherchant le long du chemin menant à son centre (itm_x, itm_y). Sans effet s'il n'est pas trouvé. | 194 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/quadtree.lua`.*
