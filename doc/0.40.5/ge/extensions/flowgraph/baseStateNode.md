# `flowgraph_baseStateNode`

*Fichier : `lua/ge/extensions/flowgraph/baseStateNode.lua` · VM : Game Engine (GE) · 96 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `flowgraph_baseStateNode` : `extensions.load("flowgraph_baseStateNode")`, puis la globale `flowgraph_baseStateNode`

Classe de base des nœuds d'un graphe d'états (state graph) du flowgraph. Elle étend flowgraph/basenode en ajoutant huit pins de type « transition » aux bords du nœud (entrées et sorties N, E, S, W) et leur dessin dans l'éditeur. Un moddeur ne l'appelle pas directement : elle sert aux nœuds d'état.

## Remarques

- Les pins créés se nomment tInN/tInE/tInS/tInW et tOutN/tOutE/tOutS/tOutW, de type 'transition'.
- Les pins d'entrée sont dessinés avec une flèche (PinArrowSize/Width = 20) et un LinkStrength de 0 ; les pins de sortie n'ont pas de flèche.
- M.createBase copie les méthodes de C directement dans l'objet (o[k] = v) : C:init remplace donc l'init de basenode. L'init de basenode est bien appelé d'abord par basenode.createBase, mais C:init(mgr) est ensuite appelé avec les mêmes arguments et utilise self.graph, déjà défini.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `flowgraph_baseStateNode.createBase(...)` | Crée un nœud basenode, y copie les méthodes de la classe d'états (init, customDrawEnd, drawTransitionPin) puis appelle init(...). *(interne)* | 67 |
| `flowgraph_baseStateNode.use(mgr, graph, forceId, derivedClass)` | Crée un nœud d'état, applique derivedClass par-dessus, puis exécute _preInit, init (si redéfini) et _postInit comme basenode.use. *(interne)* | 80 |

### Détail des paramètres

#### `flowgraph_baseStateNode.createBase(...)`

Crée un nœud basenode, y copie les méthodes de la classe d'états (init, customDrawEnd, drawTransitionPin) puis appelle init(...).

- `...` (*any*) : arguments de basenode.createBase : mgr, graph, forceId
- **renvoie** : table nœud d'état

#### `flowgraph_baseStateNode.use(mgr, graph, forceId, derivedClass)`

Crée un nœud d'état, applique derivedClass par-dessus, puis exécute _preInit, init (si redéfini) et _postInit comme basenode.use.

- `mgr` (*table*) : manager flowgraph
- `graph` (*table*) : graphe qui contient le nœud
- `forceId` (*integer|nil*) : identifiant imposé, sinon le manager en attribue un
- `derivedClass` (*table*) : méthodes/champs du type de nœud concret
- **renvoie** : table nœud initialisé

## Classe `C`

Méthodes ajoutées aux nœuds d'état.

| Méthode | Description | Ligne |
|---|---|---|
| `C:customDrawEnd(builder)` | Appelé par le builder à la fin du dessin du nœud (builder:End). Dessine les 8 pins de transition le long des bords du rectangle du nœud (entrées sur les côtés antihoraires, sorties côtés horaires). | 35 |
| `C:drawTransitionPin(pin, kind, pos, size)` | Dessine un pin de transition rectangulaire à la position donnée avec ui_flowgraph_editor (BeginPin, PinRect, PinPivotRect, EndPin) et mémorise pin.imPos. | 10 |
| `C:init(mgr)` | Crée les 8 pins de transition (4 entrées, 4 sorties : N, E, S, W) via flowgraph/pin et les range dans self.transitionPins._in et ._out. | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/baseStateNode.lua`.*
