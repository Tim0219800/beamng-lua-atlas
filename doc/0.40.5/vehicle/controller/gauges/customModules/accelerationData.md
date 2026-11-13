# `controller_gauges_customModules_accelerationData`

*Fichier : `lua/vehicle/controller/gauges/customModules/accelerationData.lua` · VM : Véhicule · 48 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `gauges/customModules/accelerationData` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Module de données pour genericGauges (type "auxiliary") : fournit les accélérations du capteur du véhicule. À référencer dans displayData.customModules avec le nom de module accelerationData.

## Remarques

- Les unités sont celles de sensors.gx/gy/gz (non précisées dans ce fichier).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_gauges_customModules_accelerationData.init(jbeamData)` | Ne fait rien. *(interne)* | 37 |
| `controller_gauges_customModules_accelerationData.reset()` | Réinitialise l'état interne du module. *(interne)* | 34 |
| `controller_gauges_customModules_accelerationData.setupGaugeData(properties)` | Appelé par genericGauges avec les propriétés demandées dans displayData.customModules : acceleration (x, y, z = sensors.gx/gy/gz) et accelerationSmooth (xSmooth, ySmooth, zSmooth = sensors.gx2/gy2/gz2). *(interne)* | 29 |
| `controller_gauges_customModules_accelerationData.updateGFX(dt)` | Ne fait rien (la mise à jour se fait par updateGaugeData). *(interne)* | 13 |
| `controller_gauges_customModules_accelerationData.updateGaugeData(moduleData, dt)` | Appelé par genericGauges avant chaque envoi : remplit moduleData avec les valeurs demandées. *(interne)* | 16 |

### Détail des paramètres

#### `controller_gauges_customModules_accelerationData.init(jbeamData)`

Ne fait rien.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_gauges_customModules_accelerationData.setupGaugeData(properties)`

Appelé par genericGauges avec les propriétés demandées dans displayData.customModules : acceleration (x, y, z = sensors.gx/gy/gz) et accelerationSmooth (xSmooth, ySmooth, zSmooth = sensors.gx2/gy2/gz2).

- `properties` (*table<string, boolean>*) : Ensemble des propriétés demandées (clé = nom, valeur = true).

#### `controller_gauges_customModules_accelerationData.updateGFX(dt)`

Ne fait rien (la mise à jour se fait par updateGaugeData).

- `dt` (*number*) : Pas de temps (s).

#### `controller_gauges_customModules_accelerationData.updateGaugeData(moduleData, dt)`

Appelé par genericGauges avant chaque envoi : remplit moduleData avec les valeurs demandées.

- `moduleData` (*table*) : Table de données du module, envoyée ensuite à la page HTML.
- `dt` (*number*) : Temps écoulé depuis le dernier envoi (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/gauges/customModules/accelerationData.lua`.*
