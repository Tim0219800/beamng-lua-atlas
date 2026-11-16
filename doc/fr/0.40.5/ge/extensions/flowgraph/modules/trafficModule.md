# `flowgraph_modules_trafficModule`

*Fichier : `lua/ge/extensions/flowgraph/modules/trafficModule.lua` · VM : Game Engine (GE) · 73 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/modules/trafficModule")` (fichier sous extensions/ mais pas une extension classique)

Module flowgraph (moduleOrder 0) qui enveloppe gameplay_traffic et gameplay_parking pour les nœuds de trafic. Il retient si le flowgraph a lui-même activé le trafic (trafficActive) ou les voitures garées (parkedCarsActive) afin de ne les désactiver à l'arrêt que si c'est lui qui les a activés, sauf si keepTrafficState est vrai.

## Remarques

- À l'arrêt (sans keepTrafficState), si le trafic était actif, il réinitialise les variables de trafic et de poursuite (setTrafficVars, setPursuitVars) et celles de stationnement, puis désactive trafic et voitures garées.
- keepTrafficState est remis à false à chaque arrêt.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `flowgraph_modules_trafficModule.activateParkedCars(vehList)` | Active les voitures garées (gameplay_parking.processVehicles(vehList)). (assignée dynamiquement) | dyn |
| `flowgraph_modules_trafficModule.activateTraffic(vehList)` | Active le trafic (gameplay_traffic.activate) avec une liste de véhicules. (assignée dynamiquement) | dyn |
| `flowgraph_modules_trafficModule.deactivateParkedCars()` | Désactive les voitures garées (processVehicles sans argument), seulement si activées par le flowgraph. (assignée dynamiquement) | dyn |
| `flowgraph_modules_trafficModule.deactivateTraffic()` | Désactive le trafic (gameplay_traffic.deactivate), seulement s'il a été activé par le flowgraph. (assignée dynamiquement) | dyn |
| `flowgraph_modules_trafficModule.executionStopped()` | Appelé à l'arrêt du projet : remet à zéro les variables de trafic, poursuite et stationnement puis désactive trafic et voitures garées, sauf si keepTrafficState est vrai. (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_trafficModule.init()` | Appelé à la création du module : trafficActive, parkedCarsActive et keepTrafficState valent false. (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_trafficModule.insertTraffic(id)` | Ajoute un véhicule au trafic (gameplay_traffic.insertTraffic) et met à jour l'état. (assignée dynamiquement) | dyn |
| `flowgraph_modules_trafficModule.removeTraffic(id)` | Retire un véhicule du trafic (gameplay_traffic.removeTraffic) et met à jour l'état. (assignée dynamiquement) | dyn |
| `flowgraph_modules_trafficModule.updateParkedCarsState()` | Met à jour parkedCarsActive d'après gameplay_parking.getParkedCarsData(). (assignée dynamiquement) | dyn |
| `flowgraph_modules_trafficModule.updateTrafficState()` | Met à jour trafficActive d'après gameplay_traffic.getTrafficData(). À n'utiliser que si le flowgraph a modifié l'état du trafic. (assignée dynamiquement) | dyn |

### Détail des paramètres

#### `flowgraph_modules_trafficModule.activateParkedCars(vehList)`

Active les voitures garées (gameplay_parking.processVehicles(vehList)). (assignée dynamiquement)

- `vehList` (*integer[]|nil*) : ids des véhicules (déduit du code)

#### `flowgraph_modules_trafficModule.activateTraffic(vehList)`

Active le trafic (gameplay_traffic.activate) avec une liste de véhicules. (assignée dynamiquement)

- `vehList` (*integer[]|nil*) : ids des véhicules (déduit du code)

#### `flowgraph_modules_trafficModule.insertTraffic(id)`

Ajoute un véhicule au trafic (gameplay_traffic.insertTraffic) et met à jour l'état. (assignée dynamiquement)

- `id` (*integer*) : id du véhicule

#### `flowgraph_modules_trafficModule.removeTraffic(id)`

Retire un véhicule du trafic (gameplay_traffic.removeTraffic) et met à jour l'état. (assignée dynamiquement)

- `id` (*integer*) : id du véhicule

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:activateParkedCars(vehList)` |  | 45 |
| `C:activateTraffic(vehList)` |  | 33 |
| `C:deactivateParkedCars()` |  | 50 |
| `C:deactivateTraffic()` |  | 38 |
| `C:executionStopped()` |  | 57 |
| `C:init()` |  | 8 |
| `C:insertTraffic(id)` |  | 23 |
| `C:removeTraffic(id)` |  | 28 |
| `C:updateParkedCarsState()` |  | 19 |
| `C:updateTrafficState()` | trafficActive and parkedCarsActive should only get updated if the flowgraph itself alters the traffic state | 15 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/modules/trafficModule.lua`.*
