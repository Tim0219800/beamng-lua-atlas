# `flowgraph_nodes_ui_tasklistClear`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/tasklistClear.lua` · VM : Game Engine (GE) · 24 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/tasklistClear")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Clear Goals » (catégorie once_instant, auteur BeamNG) : efface tous les objectifs de la liste de tâches (hook 'ClearTasklist'). Aucun pin.

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | guihooks.trigger('ClearTasklist'). | 19 |

**Évènements UI (guihooks.trigger) :** `ClearTasklist`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/tasklistClear.lua`.*
