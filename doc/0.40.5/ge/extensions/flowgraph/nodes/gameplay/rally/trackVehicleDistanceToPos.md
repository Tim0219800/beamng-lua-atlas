# `flowgraph_nodes_gameplay_rally_trackVehicleDistanceToPos`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/trackVehicleDistanceToPos.lua` · VM : Game Engine (GE) · 115 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/trackVehicleDistanceToPos")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Track Vehicle Distance to Position » (catégorie repeat, icône straighten, tag rally). Mesure la distance entre le centre avant d'un véhicule (RallyUtil.getVehFrontCenter) et une position cible, et la diffuse à l'UI via extensions.hook('onRallyDataUpdated', {activeState = vehicleProximity, vehicleProximity = {isNear = false, distance, isStopped = false, isFrozen = false, timer = 0, duration = 0}}). Entrées : flow, vehId (sinon véhicule joueur 0), pos (vec3 ou table). Sortie : flow (recopie).

## Remarques

- La position cible est mise en cache à la première lecture et ne change plus jusqu'au redémarrage du graphe.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Oublie la position cible mémorisée. | 29 |
| `C:getDistanceSquared()` | Calcule le carré de la distance entre le centre avant du véhicule et la position cible. | 74 |
| `C:init(mgr, ...)` | Initialise targetPos à nil. | 25 |
| `C:updateVehicleData2()` | Met à jour (variables locales du module) position avant, rotation et vitesse du véhicule suivi à partir de map.objects. | 55 |
| `C:work(args)` | Chaque frame : met à jour les données du véhicule, diffuse la distance à l'UI et recopie le flux. | 89 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRallyDataUpdated` — écouté par 2 module(s)

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/trackVehicleDistanceToPos.lua`.*
