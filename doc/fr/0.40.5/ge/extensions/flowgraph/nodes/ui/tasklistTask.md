# `flowgraph_nodes_ui_tasklistTask`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/tasklistTask.lua` · VM : Game Engine (GE) · 49 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/tasklistTask")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Tasklist Task » (catégorie once_instant, durée) : affiche une tâche dans l'app Tasklist (hook 'SetTasklistTask', type 'goal'). Entrées : « label », « sub », « identifier », « done », « fail », « clear » (vrai par défaut), « active », « attention » (clignote). Sortie : flow propagé.

## Remarques

- L'app n'accepte pas un libellé qui commence par un chiffre (todo du code).
- Par défaut 'clear' vaut true.

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Envoie la tâche à l'UI et propage le flux. | 30 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/tasklistTask.lua`.*
