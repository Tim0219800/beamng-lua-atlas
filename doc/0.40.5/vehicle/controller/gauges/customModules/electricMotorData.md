# `controller_gauges_customModules_electricMotorData`

*Fichier : `lua/vehicle/controller/gauges/customModules/electricMotorData.lua` · VM : Véhicule · 120 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `gauges/customModules/electricMotorData` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Module de données pour genericGauges : calcule la puissance affichée, la puissance et le couple, l'autonomie restante et un graphe de consommation pour les moteurs électriques.

## Remarques

- Les moteurs sont les dispositifs de type "electricMotor" ; les batteries sont leurs stockages d'énergie enregistrés. Autonomie = énergie stockée * 0.0278 / consommation moyenne par 100 km.
- La consommation est lissée et ne change que si le véhicule roule (> 0.5 m/s). updateGaugeData lit electrics.values.wheelspeed sans défaut.
- setupGaugeData ajoute les batteries sans vider la liste précédente (un second appel les duplique).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_gauges_customModules_electricMotorData.init(jbeamData)` | Ne fait rien. *(interne)* | 109 |
| `controller_gauges_customModules_electricMotorData.reset()` | Réinitialise l'état interne du module. *(interne)* | 105 |
| `controller_gauges_customModules_electricMotorData.setupGaugeData(properties)` | Appelé par genericGauges avec les propriétés demandées dans displayData.customModules : powerDisplay (electricPowerDisplay : accélérateur moyen moins régénération), currentPower (currentPower et averagePower en ch, currentTorque en N·m), remainingRange, consumptionGraph (averageConsumption, envoyé toutes les 5 s, sinon nil). *(interne)* | 92 |
| `controller_gauges_customModules_electricMotorData.updateGFX(dt)` | Ne fait rien (la mise à jour se fait par updateGaugeData). *(interne)* | 33 |
| `controller_gauges_customModules_electricMotorData.updateGaugeData(moduleData, dt)` | Appelé par genericGauges avant chaque envoi : remplit moduleData avec les valeurs demandées. *(interne)* | 36 |

### Détail des paramètres

#### `controller_gauges_customModules_electricMotorData.init(jbeamData)`

Ne fait rien.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_gauges_customModules_electricMotorData.setupGaugeData(properties)`

Appelé par genericGauges avec les propriétés demandées dans displayData.customModules : powerDisplay (electricPowerDisplay : accélérateur moyen moins régénération), currentPower (currentPower et averagePower en ch, currentTorque en N·m), remainingRange, consumptionGraph (averageConsumption, envoyé toutes les 5 s, sinon nil).

- `properties` (*table<string, boolean>*) : Ensemble des propriétés demandées (clé = nom, valeur = true).

#### `controller_gauges_customModules_electricMotorData.updateGFX(dt)`

Ne fait rien (la mise à jour se fait par updateGaugeData).

- `dt` (*number*) : Pas de temps (s).

#### `controller_gauges_customModules_electricMotorData.updateGaugeData(moduleData, dt)`

Appelé par genericGauges avant chaque envoi : remplit moduleData avec les valeurs demandées.

- `moduleData` (*table*) : Table de données du module, envoyée ensuite à la page HTML.
- `dt` (*number*) : Temps écoulé depuis le dernier envoi (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/gauges/customModules/electricMotorData.lua`.*
