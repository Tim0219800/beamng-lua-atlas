# `flowgraph_nodes_ui_imgui_elemental_imCheckbox`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imCheckbox.lua` · VM : Game Engine (GE) · 69 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/imgui/elemental/imCheckbox")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « im Checkbox » (catégorie repeat_instant, tag imgui) : case à cocher imgui. Entrées : « text », « enabled » (vrai), impulsions « setOn » / « setOff ». Sorties : « on », « off », « checked » (bool), « changed » (impulsion). L'état de départ vient de data.startState (false).

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Applique startState et remet les sorties à jour. | 32 |
| `C:init()` | data.startState = false. | 28 |
| `C:work()` | Applique setOn/setOff, dessine la case (désactivée si enabled est faux) et met à jour on/off/checked/changed. | 41 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imCheckbox.lua`.*
