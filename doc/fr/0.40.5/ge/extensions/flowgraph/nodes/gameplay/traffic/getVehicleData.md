# `flowgraph_nodes_gameplay_traffic_getVehicleData`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/getVehicleData.lua` · VM : Game Engine (GE) · 38 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/getVehicleData")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Get Traffic Vehicle Data » (repeat_instant). Lit les paramètres d'un véhicule actif dans le trafic (gameplay_traffic.getTrafficData) : role (nom du rôle), state, camVisible, crashDamage, respawnCount.

## Remarques

- Si le véhicule n'est pas dans le trafic, les sorties gardent leurs anciennes valeurs.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Recopie les données du véhicule de trafic vehId sur les sorties. | 27 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/getVehicleData.lua`.*
