# `flowgraph_nodes_util_worldEditorOpen`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/worldEditorOpen.lua` · VM : Game Engine (GE) · 64 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/worldEditorOpen")` (fichier sous extensions/ mais pas une extension classique)

Nœud « World Editor Open » (repeat_instant). Indique si l'éditeur de monde est ouvert (editor.active). Entrée : reset (impulsion). Sorties : open, close (flow), onOpened et onClosed (impulsions cachées), openOrClosed (bool caché).

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Appelle reset. | 29 |
| `C:reset()` | Remet l'état précédent à « none ». | 25 |
| `C:work()` | Écrit open/close/openOrClosed selon editor.active et émet une impulsion onOpened ou onClosed quand l'état change par rapport à la frame précédente. | 33 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/worldEditorOpen.lua`.*
