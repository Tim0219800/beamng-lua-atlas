# `libs_binaryheap_binaryheap`

*Fichier : `lua/common/libs/binaryheap/binaryheap.lua` · VM : Commun (GE + véhicule) · 404 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/binaryheap/binaryheap")`

binaryheap : bibliothèque tierce (Lua binary heap, utilisée notamment par copas pour ses minuteries) implémentant un tas binaire (file de priorité). Deux familles : « plain heap » (minHeap/maxHeap, gérés par position, valeurs dans heap.values) et « unique heap » (minUnique/maxUnique, chaque élément a une charge `payload` unique retrouvée en O(1) via heap.reverse). Le module renvoie la table M.

## Exemple

```lua
local bh = require("libs/binaryheap/binaryheap")
local h = bh.minUnique()
h:insert(5, "b")
h:insert(2, "a")
print(h:pop()) --> "a", 2
```

## Remarques

- Dans un unique heap, le payload doit être unique et non nil (insert lève « duplicate payload » sinon) ; update/remove prennent le payload, pas la position.
- pop renvoie d'abord le payload puis la valeur (unique heap) ; sur un plain heap, pop renvoie la valeur.
- La fonction de comparaison par défaut est a < b (min) ou a > b (max).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_binaryheap_binaryheap.binaryHeap(swap, erase, lt)` | Cœur de toutes les files : construit un tas à partir de fonctions de swap, d'effacement et de comparaison. Renvoie une table avec les méthodes bubbleUp(pos) et sinkDown(pos) et les listes values et payloads. | 58 |
| `libs_binaryheap_binaryheap.maxHeap(gt)` | Crée un tas simple dont la plus grande valeur est au sommet. | 227 |
| `libs_binaryheap_binaryheap.maxUnique(gt)` | Crée un tas à payloads uniques, plus grande valeur au sommet. | 396 |
| `libs_binaryheap_binaryheap.minHeap(lt)` | Crée un tas simple dont la plus petite valeur est au sommet. | 217 |
| `libs_binaryheap_binaryheap.minUnique(lt)` | Crée un tas à payloads uniques, plus petite valeur au sommet. | 382 |

### Détail des paramètres

#### `libs_binaryheap_binaryheap.binaryHeap(swap, erase, lt)`

Cœur de toutes les files : construit un tas à partir de fonctions de swap, d'effacement et de comparaison. Renvoie une table avec les méthodes bubbleUp(pos) et sinkDown(pos) et les listes values et payloads.

- `swap` (*function*) : swap(heap, idx1, idx2) échange deux éléments
- `erase` (*function*) : erase(heap, position) suppression brute
- `lt` (*function*) : lt(a, b) vrai quand a doit être au-dessus de b
- **renvoie** : table Tas de base

#### `libs_binaryheap_binaryheap.maxHeap(gt)`

Crée un tas simple dont la plus grande valeur est au sommet.

- `gt` (*function|nil*) : Comparaison « supérieur à » (défaut a > b)
- **renvoie** : table Le tas

#### `libs_binaryheap_binaryheap.maxUnique(gt)`

Crée un tas à payloads uniques, plus grande valeur au sommet.

- `gt` (*function|nil*) : Comparaison (défaut a > b)
- **renvoie** : table Le tas

#### `libs_binaryheap_binaryheap.minHeap(lt)`

Crée un tas simple dont la plus petite valeur est au sommet.

- `lt` (*function|nil*) : Comparaison « inférieur à » (défaut a < b)
- **renvoie** : table Le tas

#### `libs_binaryheap_binaryheap.minUnique(lt)`

Crée un tas à payloads uniques, plus petite valeur au sommet.

- `lt` (*function|nil*) : Comparaison (défaut a < b)
- **renvoie** : table Le tas

## Classe `h`

Méthodes des tas créés par minHeap/maxHeap (par position) et minUnique/maxUnique (par payload). Pour un unique heap, les paramètres désignés payload remplacent les positions.

Objet `h` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `h:insert(value, payload)` | Insère un élément. Sur un unique heap, lève une erreur si le payload existe déjà. | 267 |
| `h:peek()` | Renvoie le sommet sans le retirer. | 307 |
| `h:peekValue()` | Renvoie la valeur du sommet sans le retirer (unique heap). | 321 |
| `h:pop()` | Retire et renvoie le sommet du tas. | 295 |
| `h:remove(payload)` | Retire un élément du tas. | 280 |
| `h:size()` | Nombre d'éléments du tas. | 338 |
| `h:update(payload, newValue)` | Change la valeur d'un élément et le replace dans le tas. | 257 |
| `h:valueByPayload(payload)` | Renvoie la valeur associée à un payload (unique heap). | 330 |

## Classe `heap`

Méthodes de bas niveau du tas de base (déduit du code : swap et erase passés à binaryHeap).

Objet `heap` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `heap:erase(pos)` | Efface brutalement l'élément à la position pos. | 195 |
| `heap:swap(a, b)` | Échange les éléments aux positions a et b. | 191 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/binaryheap/binaryheap.lua`.*
