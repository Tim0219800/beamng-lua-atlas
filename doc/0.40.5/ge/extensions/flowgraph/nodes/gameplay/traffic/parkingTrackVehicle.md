# `flowgraph_nodes_gameplay_traffic_parkingTrackVehicle`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/parkingTrackVehicle.lua` · VM : Game Engine (GE) · 81 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/parkingTrackVehicle")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Track Vehicle Parking » (catégorie par défaut). Active le suivi de stationnement d'un véhicule (gameplay_parking.enableTracking) et sort enter/exit (impulsions), inside/outside, spotExists et spot (place cible, parkingSpotData). Entrée reset : désactive le suivi et remet l'état à zéro.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appelle reset(). | 34 |
| `C:init()` | Appelle reset(). | 30 |
| `C:reset()` | Désactive le suivi du véhicule et remet les sorties inside/outside/spotExists à false. | 38 |
| `C:work()` | Active le suivi si besoin, lit getTrackingData()[vehId] et détecte les passages garé / non garé. | 49 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/parkingTrackVehicle.lua`.*
