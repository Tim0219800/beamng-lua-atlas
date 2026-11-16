# `flowgraph_nodes_gameplay_traffic_setVehicleData`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/setVehicleData.lua` · VM : Game Engine (GE) · 61 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/setVehicleData")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Set Traffic Vehicle Data » (once_instant). Règle un véhicule actif du trafic : role (veh:setRole), enableActions (inverse de role.lockAction), enableRespawn, enableTracking, enablePoolCycle (enableAutoPooling), changePaint (useRandomPaint). Seuls les pins non nil sont appliqués.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Initialise l'état interne du nœud à sa création (appelé par le moteur flowgraph). | 26 |
| `C:workOnce()` | Applique les pins non nil au véhicule de trafic vehId (s'il existe). | 30 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/setVehicleData.lua`.*
