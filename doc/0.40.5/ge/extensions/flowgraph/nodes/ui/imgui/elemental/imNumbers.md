# `flowgraph_nodes_ui_imgui_elemental_imNumbers`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imNumbers.lua` · VM : Game Engine (GE) · 126 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/imgui/elemental/imNumbers")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « im Number » (catégorie repeat_instant, tag imgui) : champ numérique imgui. Mode choisi dans les propriétés : Int, Float, SliderInt, SliderFloat, DragInt, DragFloat. Entrées : « text », « set » (impulsion : réapplique setVal), « setVal » (0), « min » (0), « max » (10), « step » (1), « format » (%0.2f), « power » (1). Sorties : « value » et « changed » (impulsion).

## Remarques

- La valeur est bornée à min/max même en mode Int/Float libre.
- Sans valeur initiale (setVal nil), rien n'est dessiné.

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Efface les sorties et la valeur. | 59 |
| `C:_onDeserialized(nodeData)` | Restaure le mode (défaut 'Int'). | 120 |
| `C:_onSerialize(res)` | Sauvegarde le mode. | 116 |
| `C:drawCustomProperties()` | Combo du mode d'édition. | 45 |
| `C:init()` | Liste des modes et mode = 'Int'. | 33 |
| `C:work()` | Dessine le widget du mode choisi, borne la valeur et écrit value/changed. | 66 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imNumbers.lua`.*
