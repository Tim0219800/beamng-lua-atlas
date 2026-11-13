# `flowgraph_nodes_ui_tasklistMessage`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/tasklistMessage.lua` · VM : Game Engine (GE) · 45 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/tasklistMessage")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Tasklist Message » (catégorie once_instant, durée) : affiche un objectif de type message dans l'app Goal List (hook 'SetTasklistTask', type 'message'). Entrées : « label », « sub » (sous-texte, caché), « identifier » (flowgraph), « clear » (caché, vrai par défaut), « active » (caché, vrai). Sortie : flow propagé.

## Remarques

- L'app n'accepte pas un libellé qui commence par un chiffre (todo du code).
- Par défaut 'clear' vaut true : l'objectif est effacé sauf si le pin est mis à false.

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Envoie l'objectif à l'UI et propage le flux. | 27 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/tasklistMessage.lua`.*
