# `controller_gauges_customModules_tireData`

*Fichier : `lua/vehicle/controller/gauges/customModules/tireData.lua` · VM : Véhicule · 57 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `gauges/customModules/tireData` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Module de données pour genericGauges : fournit pour chaque roue une couleur de température (valeur fixe) et la pression de pneu.

## Remarques

- Les températures sont des couleurs constantes "#ffffff" (aucune vraie température n'est calculée dans ce fichier).
- Pression = max((pression du groupe de pression - pression ambiante) * 0.001, 0) ; 0 si la roue n'a pas de groupe de pression.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_gauges_customModules_tireData.init(jbeamData)` | Ne fait rien. *(interne)* | 46 |
| `controller_gauges_customModules_tireData.reset()` | Réinitialise l'état interne du module. *(interne)* | 43 |
| `controller_gauges_customModules_tireData.setupGaugeData(properties)` | Appelé par genericGauges avec les propriétés demandées dans displayData.customModules : temperatures (table nomRoue -> "#ffffff") et pressures (table nomRoue -> pression). *(interne)* | 38 |
| `controller_gauges_customModules_tireData.updateGFX(dt)` | Ne fait rien (la mise à jour se fait par updateGaugeData). *(interne)* | 15 |
| `controller_gauges_customModules_tireData.updateGaugeData(moduleData, dt)` | Appelé par genericGauges avant chaque envoi : remplit moduleData avec les valeurs demandées. *(interne)* | 18 |

### Détail des paramètres

#### `controller_gauges_customModules_tireData.init(jbeamData)`

Ne fait rien.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_gauges_customModules_tireData.setupGaugeData(properties)`

Appelé par genericGauges avec les propriétés demandées dans displayData.customModules : temperatures (table nomRoue -> "#ffffff") et pressures (table nomRoue -> pression).

- `properties` (*table<string, boolean>*) : Ensemble des propriétés demandées (clé = nom, valeur = true).

#### `controller_gauges_customModules_tireData.updateGFX(dt)`

Ne fait rien (la mise à jour se fait par updateGaugeData).

- `dt` (*number*) : Pas de temps (s).

#### `controller_gauges_customModules_tireData.updateGaugeData(moduleData, dt)`

Appelé par genericGauges avant chaque envoi : remplit moduleData avec les valeurs demandées.

- `moduleData` (*table*) : Table de données du module, envoyée ensuite à la page HTML.
- `dt` (*number*) : Temps écoulé depuis le dernier envoi (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `getEnvPressure`, `getGroupPressure`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/gauges/customModules/tireData.lua`.*
