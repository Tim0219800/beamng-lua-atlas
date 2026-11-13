# `flowgraph_nodes_ui_vehicleSelector`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua` · VM : Game Engine (GE) · 307 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/vehicleSelector")` (fichier sous extensions/ mais pas une extension classique)

**Dépendances (chargées avant) :** `core_input_bindings`

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` |  | 129 |
| `C:_executionStopped()` |  | 140 |
| `C:abandonFromUi()` |  | 257 |
| `C:buildScreen()` |  | 185 |
| `C:closeDialogue()` |  | 163 |
| `C:getDefaultVehicle()` |  | 177 |
| `C:getSavedVehData()` | The last selection is stored on the flowgraph manager so it is shared across every<br> Vehicle Selector node in the project and survives restarts (used when saveSelection is on). | 119 |
| `C:getSelectedVehicleDisplayData()` |  | 172 |
| `C:init()` |  | 109 |
| `C:onClientEndMission()` |  | 149 |
| `C:requestChangeOpponent()` |  | 234 |
| `C:reset()` |  | 153 |
| `C:setSavedVehData(vehData)` |  | 123 |
| `C:startFromUi()` |  | 252 |
| `C:work()` |  | 262 |

**Charge les extensions :** `ui_vehicleSelector_general`, `ui_vehicleSelector_vehicleSpecifications`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua`.*
