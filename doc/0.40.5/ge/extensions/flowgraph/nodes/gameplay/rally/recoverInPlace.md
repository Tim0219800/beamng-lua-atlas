# `flowgraph_nodes_gameplay_rally_recoverInPlace`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverInPlace.lua` · VM : Game Engine (GE) · 132 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/recoverInPlace")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Mode Recover In Place » (catégorie repeat_p_duration, tags rally, recover, teleport). Récupère le véhicule sur place, sans pacenotes, historique de route ni driveline : mémorise position et orientation actuelles, téléporte avec spawn.safeTeleport (avec réparation/reset si le réglage de recovery l'indique), restaure le carburant via un instantané (fuelUtils), puis lance les hooks onVehicleTeleportedToLastRoad(vehId) et onRallyRouteRecoveryComplete({vehId, repairVehicle, inPlace = true}). Entrée : vehId (sinon véhicule joueur 0), flow.

## Remarques

- La réparation vient de gameplay_rallyLoop manager:getRecoveryRepairVehicle(), sinon gameplay_rally.getRecoveryRepairVehicle(), sinon du réglage rallyRepairVehicleOnRecovery, sinon true.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Appelle onNodeReset. | 43 |
| `C:_executionStopped()` | Appelle onNodeReset. | 47 |
| `C:init()` | Appelle onNodeReset. | 39 |
| `C:onNodeReset()` | Efface la recovery en attente et l'instantané de carburant. | 51 |
| `C:runRecovery()` | Exécute la recovery en attente : téléporte le véhicule, réapplique le carburant, émet les hooks. | 56 |
| `C:startRecovery()` | Prépare la recovery (position/rotation actuelles, choix de réparation) ; demande d'abord l'instantané de carburant si réparation, puis lance runRecovery. | 85 |
| `C:work()` | Si flow est actif, appelle startRecovery. | 125 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRallyRouteRecoveryComplete` — écouté par 1 module(s)
- `onVehicleTeleportedToLastRoad`

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverInPlace.lua`.*
