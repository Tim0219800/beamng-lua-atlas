# `flowgraph_nodes_ui_imgui_imVehicleSelect`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/imgui/imVehicleSelect.lua` · VM : Game Engine (GE) · 97 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/imgui/imVehicleSelect")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « im Vehicle Selector » (catégorie once_instant, tags imgui/vehicle/config) : fenêtre imgui de choix de véhicule basée sur editor/util/vehicleSelectUtil. Sorties : « selected » (flux après le bouton Select), « model », « config », « configPath » et, cachées, « paintName1/2/3 ». Options dans data : enableConfigs (vrai), enablePaints (faux), enableCustomConfig (faux).

## Remarques

- La fenêtre fait 480 x 300 px.
- Le flux « selected » n'est remis à false qu'au reset du nœud.

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Crée l'utilitaire de sélection avec les options data. | 33 |
| `C:displayWindow()` | Dessine la fenêtre « Vehicle Select » (widget, boutons Select et Reset) et met à jour les sorties. | 48 |
| `C:drawMiddle(builder, style)` | Zone centrale vide. | 44 |
| `C:init()` | Options data par défaut. | 27 |
| `C:onNodeReset()` | Ferme la fenêtre et remet selected à false. | 79 |
| `C:work()` | Affiche la fenêtre si ouverte. | 90 |
| `C:workOnce()` | Ouvre la fenêtre. | 85 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/imgui/imVehicleSelect.lua`.*
