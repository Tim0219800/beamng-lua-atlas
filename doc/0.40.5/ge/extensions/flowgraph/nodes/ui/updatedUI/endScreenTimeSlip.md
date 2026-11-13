# `flowgraph_nodes_ui_updatedUI_endScreenTimeSlip`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenTimeSlip.lua` · VM : Game Engine (GE) · 48 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/updatedUI/endScreenTimeSlip")` (fichier sous extensions/ mais pas une extension classique)

Nœud « EndScreen Drag Time Slip » (repeat_instant, couleur ui). Affiche dans l'écran de fin le ticket de chronométrage (time slip) d'une course de dragster. Entrée flow, sortie flow (chainFlow).

## Remarques

- Le log d'avertissement utilise la variable logTag qui n'est pas définie dans ce fichier (valeur nil).

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Prépare le panneau {type='dragTimeSlip', header='Timeslip', pages={timeslip=true}}. | 21 |
| `C:work()` | Récupère gameplay_drag_dragBridge.createTimeslipData() et l'ajoute au panneau via modules.ui:addUIElement ; sans données, ajoute le panneau vide et logue un avertissement. | 32 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenTimeSlip.lua`.*
