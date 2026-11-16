# `flowgraph_nodes_util_onMenu`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/onMenu.lua` · VM : Game Engine (GE) · 68 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/onMenu")` (fichier sous extensions/ mais pas une extension classique)

Nœud « On Menu » (repeat_instant). Détecte l'ouverture d'un menu d'interface (menu Échap), d'après core_input_bindings.getMenuActionMapEnabled() et l'absence de chargement. Entrée : reset (impulsion). Sorties : open, close (flow), onOpened et onClosed (impulsions, cachées), openOrClosed (bool, caché).

## Remarques

- Laisse des print de débogage (« OnMenu Debug ») à chaque changement d'état.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Appelle reset. | 29 |
| `C:reset()` | Remet l'état précédent à « none » : la prochaine frame émettra une impulsion. | 25 |
| `C:work()` | Calcule l'état ouvert/fermé et écrit open, close, openOrClosed ; émet l'impulsion onOpened ou onClosed au changement d'état, puis les remet à false à la frame suivante. | 33 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/onMenu.lua`.*
