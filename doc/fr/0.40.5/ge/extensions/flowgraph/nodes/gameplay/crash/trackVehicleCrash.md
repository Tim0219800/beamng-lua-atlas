# `flowgraph_nodes_gameplay_crash_trackVehicleCrash`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/crash/trackVehicleCrash.lua` · VM : Game Engine (GE) · 24 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/crash/trackVehicleCrash")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Track Vehicle Crash » (catégorie repeat_instant). Ajoute un véhicule (pin vehId) au suivi des crashs via gameplay_util_crashDetection.addTrackedVehicleById.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Appelle addTrackedVehicleById(vehId) à chaque frame. | 19 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/crash/trackVehicleCrash.lua`.*
