# `controller_gauges_customModules_environmentData`

*Fichier : `lua/vehicle/controller/gauges/customModules/environmentData.lua` · VM : Véhicule · 35 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `gauges/customModules/environmentData` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Module de données pour genericGauges : fournit la température extérieure et l'heure système.

## Remarques

- temperatureEnv en °C (obj:getEnvTemperature() - 273.15) ; time = chaîne "HH:MM" de l'heure locale réelle de l'ordinateur (os.date), pas l'heure du jeu.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_gauges_customModules_environmentData.init(jbeamData)` | Ne fait rien. *(interne)* | 24 |
| `controller_gauges_customModules_environmentData.reset()` | Réinitialise l'état interne du module. *(interne)* | 21 |
| `controller_gauges_customModules_environmentData.setupGaugeData(properties)` | Appelé par genericGauges avec les propriétés demandées dans displayData.customModules : aucune propriété n'est lue ; produit toujours temperatureEnv et time. *(interne)* | 18 |
| `controller_gauges_customModules_environmentData.updateGFX(dt)` | Ne fait rien (la mise à jour se fait par updateGaugeData). *(interne)* | 10 |
| `controller_gauges_customModules_environmentData.updateGaugeData(moduleData, dt)` | Appelé par genericGauges avant chaque envoi : remplit moduleData avec les valeurs demandées. *(interne)* | 13 |

### Détail des paramètres

#### `controller_gauges_customModules_environmentData.init(jbeamData)`

Ne fait rien.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_gauges_customModules_environmentData.setupGaugeData(properties)`

Appelé par genericGauges avec les propriétés demandées dans displayData.customModules : aucune propriété n'est lue ; produit toujours temperatureEnv et time.

- `properties` (*table<string, boolean>*) : Ensemble des propriétés demandées (clé = nom, valeur = true).

#### `controller_gauges_customModules_environmentData.updateGFX(dt)`

Ne fait rien (la mise à jour se fait par updateGaugeData).

- `dt` (*number*) : Pas de temps (s).

#### `controller_gauges_customModules_environmentData.updateGaugeData(moduleData, dt)`

Appelé par genericGauges avant chaque envoi : remplit moduleData avec les valeurs demandées.

- `moduleData` (*table*) : Table de données du module, envoyée ensuite à la page HTML.
- `dt` (*number*) : Temps écoulé depuis le dernier envoi (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `getEnvTemperature`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/gauges/customModules/environmentData.lua`.*
