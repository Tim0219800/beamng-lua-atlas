# `flowgraph_nodes_gameplay_dragRace_generateDragOpponents`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua` · VM : Game Engine (GE) · 226 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents")` (fichier sous extensions/ mais pas une extension classique)

**Dépendances (chargées avant) :** `gameplay_drag_dragBridge`

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` |  | 214 |
| `C:createVehicleEntry(config)` | Create a vehicle entry from a config | 69 |
| `C:drawCustomProperties()` |  | 31 |
| `C:drawMiddle(builder, style)` |  | 36 |
| `C:filterValidVehicleConfigs()` | Filter vehicle configs to only include valid cars/trucks | 50 |
| `C:generateBracketRaceOpponents(vehConfigs, count)` | Generate opponents for bracket race mode | 138 |
| `C:generateSimilarOpponents(vehConfigs, dial, count, currentVeh)` | Generate opponents with similar dial times | 157 |
| `C:getPlayerDial(currentVeh)` | Get player dial time from various sources | 113 |
| `C:getPlayerVehicleAsFallback(count)` | Generate opponents using player vehicle with different colors | 85 |
| `C:init()` |  | 26 |
| `C:selectVehicle()` |  | 189 |
| `C:workOnce()` |  | 219 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua`.*
