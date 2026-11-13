# `flowgraph_nodes_gameplay_crash_removeTrackedVehicleCrash`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/crash/removeTrackedVehicleCrash.lua` · VM : Game Engine (GE) · 23 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/crash/removeTrackedVehicleCrash")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Remove Tracked Vehicle Crash » (catégorie repeat_instant). Retire un véhicule (pin vehId) du suivi des crashs via gameplay_util_crashDetection.removeTrackedVehicleById.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Appelle removeTrackedVehicleById(vehId) à chaque frame. | 18 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/crash/removeTrackedVehicleCrash.lua`.*
