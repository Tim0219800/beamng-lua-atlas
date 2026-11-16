# `flowgraph_nodes_input_getActionControl`

*Fichier : `lua/ge/extensions/flowgraph/nodes/input/getActionControl.lua` · VM : Game Engine (GE) · 26 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/input/getActionControl")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Get Action Control » (repeat_instant). Donne le contrôle (touche/bouton) associé à une action d'entrée via core_input_bindings.getControlForAction(actionName). Sortie : controlName.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:work(args)` | Écrit sur controlName le contrôle lié à actionName. | 21 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/input/getActionControl.lua`.*
