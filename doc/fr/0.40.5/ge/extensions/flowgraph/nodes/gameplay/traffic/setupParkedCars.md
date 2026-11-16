# `flowgraph_nodes_gameplay_traffic_setupParkedCars`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/setupParkedCars.lua` · VM : Game Engine (GE) · 43 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/setupParkedCars")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Setup Parking System » (once_instant). Active le système de placement sur places de parking : gameplay_parking.setState(true), option sitesData via setSites, puis traffic:activateParkedCars(vehicleIds). Au reset : deactivateParkedCars et setSites() sans argument.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appelle onNodeReset(). | 26 |
| `C:init()` | Appelle onNodeReset(). | 22 |
| `C:onNodeReset()` | Désactive les voitures garées et réinitialise les sites du système de parking. | 30 |
| `C:workOnce()` | Active le parking, applique les sites si fournis et active les voitures garées pour la liste d'ids. | 35 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/setupParkedCars.lua`.*
