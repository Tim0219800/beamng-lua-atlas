# `flowgraph_nodes_gameplay_traffic_pursuitInformation`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitInformation.lua` · VM : Game Engine (GE) · 89 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/pursuitInformation")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Pursuit Information » (repeat_instant). Donne l'état de la poursuite policière d'un véhicule (vehId, sinon joueur) via gameplay_police.getPursuitData : active, arrest/evade (impulsions), mode (0 off, 1-3 poursuite, -1 arrêté), score, sightValue, arrestValue, evadeValue, timeElapsed, roadblocks, collisions, policeWrecks, offenses, uniqueOffenses, offensesList.

## Remarques

- Les valeurs sont gardées une frame de plus après un arrest/evade (flags) avant d'être rafraîchies.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appelle reset(). | 40 |
| `C:init()` | Appelle reset(). | 36 |
| `C:onPursuitAction(id, action, data)` | Hook appelé par le système de police ; mémorise 'arrest' ou 'evade' si id correspond au véhicule suivi. | 79 |
| `C:reset()` | Remet à zéro le véhicule, les sorties flow et les flags. | 44 |
| `C:work()` | Lit les données de poursuite et met à jour les sorties ; émet arrest/evade une frame. | 53 |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitInformation.lua`.*
