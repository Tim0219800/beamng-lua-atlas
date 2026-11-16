# `flowgraph_nodes_gameplay_traffic_parkingParams`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/parkingParams.lua` · VM : Game Engine (GE) · 62 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/parkingParams")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Parking System Parameters » (once_instant). Règle le système de parking (gameplay_parking.setParkingVars) : precision et neatness (bornés 0-1), radiusCoef, respawnProbability (baseProbability), poolActiveAmount (activeAmount ; avec data.usePoolInactiveAmount, vaut le nombre de voitures garées moins la valeur), debugLevel (0 à 3). Seuls les pins non nil sont appliqués.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Initialise l'état interne du nœud à sa création (appelé par le moteur flowgraph). | 25 |
| `C:workOnce()` | Construit la table de variables à partir des pins non nil et l'envoie à gameplay_parking.setParkingVars ; règle gameplay_parking.debugLevel. | 30 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/parkingParams.lua`.*
