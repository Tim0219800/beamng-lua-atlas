# `flowgraph_nodes_ui_imgui_elemental_imEnd`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imEnd.lua` · VM : Game Engine (GE) · 24 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/imgui/elemental/imEnd")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « im End » (catégorie repeat_instant, tag imgui) : termine la fenêtre imgui ouverte par « im Begin » (im.End). Aucun pin.

## Remarques

- Un im End sans im Begin correspondant provoque une erreur imgui.

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Appelle im.End(). | 19 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imEnd.lua`.*
