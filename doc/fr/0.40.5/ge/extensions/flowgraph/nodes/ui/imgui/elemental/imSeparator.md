# `flowgraph_nodes_ui_imgui_elemental_imSeparator`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imSeparator.lua` · VM : Game Engine (GE) · 44 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/imgui/elemental/imSeparator")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « im Separator » (catégorie repeat_instant, tag imgui) : séparateur horizontal dans une fenêtre imgui, avec espace au-dessus et au-dessous réglables (data.aboveSpacing et data.belowSpacing, 5 px par défaut). Aucun pin.

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Vide effectif (aucune sortie). | 27 |
| `C:init()` | Espacements à 5. | 19 |
| `C:postInit()` | Vide. | 23 |
| `C:work()` | Dessine espace, séparateur, espace. | 33 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imSeparator.lua`.*
