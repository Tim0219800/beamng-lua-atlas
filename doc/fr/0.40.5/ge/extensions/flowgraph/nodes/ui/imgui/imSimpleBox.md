# `flowgraph_nodes_ui_imgui_imSimpleBox`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/imgui/imSimpleBox.lua` · VM : Game Engine (GE) · 36 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/imgui/imSimpleBox")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « im Simple Text Box » (catégorie repeat_instant, tag imgui) : fenêtre imgui minimale avec un titre et un texte. Entrées : « title » (défaut 'Some Title'), « text » (défaut 'Some Text').

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` | Zone centrale vide. | 23 |
| `C:work()` | Ouvre une fenêtre imgui, affiche le texte et la ferme. | 27 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/imgui/imSimpleBox.lua`.*
