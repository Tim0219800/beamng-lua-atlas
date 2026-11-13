# `flowgraph_nodes_ui_imgui_elemental_imColor`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imColor.lua` · VM : Game Engine (GE) · 37 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/imgui/elemental/imColor")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « im Color » (catégorie repeat_instant, tag imgui) : sélecteur de couleur imgui (ColorEdit4 sans entrées numériques, avec barre alpha). Entrées : « text », « colorIn » (couleur initiale, caché ; blanc par défaut). Sortie « colorOut » ({r,g,b,a}).

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Initialise la couleur depuis colorIn. | 23 |
| `C:work()` | Dessine le sélecteur et écrit colorOut. | 31 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imColor.lua`.*
