# `flowgraph_nodes_gameplay_traffic_trafficParams`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficParams.lua` · VM : Game Engine (GE) · 77 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/trafficParams")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Traffic Parameters » (once_instant). Règle le système de trafic via gameplay_traffic.setTrafficVars : aiMode (traffic, random, flee, chase, follow, stop ; défaut traffic), spawnRate (spawnValue, 0 à 3), directionBias (spawnDirBias, -1 à 1 ; -1 = loin du joueur), risk (baseAggression), poolActiveAmount (activeAmount ; avec data.usePoolInactiveAmount, vaut le nombre de véhicules de trafic moins la valeur), enableRandomEvents. Seuls les pins non nil sont appliqués. Ancien pin poolAmount renommé poolActiveAmount.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Initialise l'état interne du nœud à sa création (appelé par le moteur flowgraph). | 33 |
| `C:postInit()` | Définit les valeurs prédéfinies du pin aiMode. | 38 |
| `C:workOnce()` | Construit la table de variables à partir des pins non nil et appelle gameplay_traffic.setTrafficVars. | 46 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficParams.lua`.*
