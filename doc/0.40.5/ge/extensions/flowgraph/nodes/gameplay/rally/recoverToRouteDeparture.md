# `flowgraph_nodes_gameplay_rally_recoverToRouteDeparture`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverToRouteDeparture.lua` · VM : Game Engine (GE) · 143 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/recoverToRouteDeparture")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Mode Recover To Route Departure » (catégorie repeat_p_duration, tags rally, recover, teleport). Replace le véhicule au dernier point de recovery de sortie de route suivi, via gameplay_rally.getRallyManager():recoverVehicleToRouteDeparture(veh, {repairVehicle, backoffDistance}). Entrées : flow, vehId (sinon véhicule joueur 0) et backoffDistance (distance en amont du point suivi, le long du driveline statique). Si la réparation est active, un instantané de carburant est pris avant et réappliqué après.

## Remarques

- Erreur loggée si le rally manager est introuvable ; avertissement avec la raison si recoverVehicleToRouteDeparture échoue.
- Contrairement à recoverInPlace, ce nœud n'émet pas lui-même les hooks de fin de recovery.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Appelle onNodeReset. | 44 |
| `C:_executionStopped()` | Appelle onNodeReset. | 48 |
| `C:init()` | Appelle onNodeReset. | 40 |
| `C:onNodeReset()` | Efface la recovery en attente et l'instantané de carburant. | 52 |
| `C:runRecovery()` | Appelle rm:recoverVehicleToRouteDeparture puis réapplique le carburant si réparé. | 57 |
| `C:startRecovery()` | Prépare la recovery en attente (véhicule, réparation, backoffDistance) et la lance, après l'instantané de carburant si nécessaire. | 91 |
| `C:work()` | Si flow est actif, appelle startRecovery. | 136 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverToRouteDeparture.lua`.*
