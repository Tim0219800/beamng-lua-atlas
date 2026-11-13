# `flowgraph_nodes_gameplay_traffic_drivingStats`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/drivingStats.lua` · VM : Game Engine (GE) · 74 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/drivingStats")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Traffic Driving Stats » (once_p_duration). Suit la route et le comportement de conduite d'un véhicule (vehId, sinon véhicule joueur) avec gameplay/traffic/roadTracking. Sorties : n1/n2 (nœuds de la route), roadOffset, roadXnorm/roadYnorm, speedRatio (vitesse / limite), collisions, faultOverSpeed/WrongWay/Reckless (0 à 1) et timers associés.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Réinitialise le nœud (appelle onNodeReset). | 40 |
| `C:init()` | Réinitialise le nœud (appelle onNodeReset). | 36 |
| `C:onNodeReset()` | Oublie le véhicule et le suivi en cours. | 44 |
| `C:work()` | Crée ou met à jour l'objet roadTracking pour le véhicule (onUpdate avec dtSim) et recopie ses valeurs sur les sorties. | 49 |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/drivingStats.lua`.*
