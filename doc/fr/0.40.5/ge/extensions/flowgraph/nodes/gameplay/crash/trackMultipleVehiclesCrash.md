# `flowgraph_nodes_gameplay_crash_trackMultipleVehiclesCrash`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/crash/trackMultipleVehiclesCrash.lua` · VM : Game Engine (GE) · 26 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/crash/trackMultipleVehiclesCrash")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Track Multiple Vehicles Crash » (catégorie repeat_instant). Ajoute plusieurs véhicules (pin vehIds, table d'ids) au suivi des crashs de gameplay_util_crashDetection.

## Remarques

- Plante si vehIds est nil (ipairs sur nil).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Appelle addTrackedVehicleById pour chaque id de vehIds. | 19 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/crash/trackMultipleVehiclesCrash.lua`.*
