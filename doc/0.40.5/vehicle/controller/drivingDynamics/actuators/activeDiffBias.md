# `controller_drivingDynamics_actuators_activeDiffBias`

*Fichier : `lua/vehicle/controller/drivingDynamics/actuators/activeDiffBias.lua` · VM : Véhicule · 308 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `drivingDynamics/actuators/activeDiffBias` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Actionneur de la Driving Dynamics Suite : répartition active du couple entre les deux sorties d'un différentiel (torque vectoring). Il compare les vitesses des roues gauche et droite corrigées du rayon de braquage (`CMU.vehicleData.turningCircleSpeedRatios`) et, sous accélérateur, calcule par PID un décalage de répartition (plus un terme dépendant du volant, de la g longitudinale et de l'accélérateur). Le résultat règle `diffTorqueSplitA` et `diffTorqueSplitB` du différentiel autour de 0,5/0,5. Ordre d'appel : `defaultOrder = 80`.

## Remarques

- Clés jbeam lues par init : `avDiffThreshold` (5), `brakingPIDkP` (0), `brakingPIDkI` (0.1), `brakingPIDkD` (0), `maxBiasOffset` (0.2), `name`. Lue par initSecondStage : `differentialName`.
- Le décalage final `biasOffset` est limité par `overrideMin` et `overrideMax` (défaut -1 et 1) puis : split A = 0.5 - biasOffset, split B = 1 - A.
- Les roues de chaque sortie sont obtenues par `powertrain.getChildWheels` ; `wheelSides` indique quelle sortie (-1 ou 1) correspond au côté gauche ou droit, calculé par produit scalaire avec les noeuds de référence du véhicule.
- Nécessite `CMU.vehicleData` et `CMU.sensorHub` ; sans CMU enregistré initSecondStage appelle shutdown.
- setParameters essaie aussi la clé `avThreshold`, qui n'existe pas dans les paramètres de ce système (sans effet, entrée de debug seulement).
- `shutdown` met isActive/isActing à false et retire `updateGFX` et `updateFixedStep`. Il n'y a pas de `update` ni de `updateWheelsIntermediate` : le calcul se fait à 100 Hz dans updateFixedStep.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_drivingDynamics_actuators_activeDiffBias.getConfig()` | Renvoie une copie des paramètres. | 280 |
| `controller_drivingDynamics_actuators_activeDiffBias.init(jbeamData)` | Lit les paramètres jbeam et crée le PID de répartition. *(interne)* | 156 |
| `controller_drivingDynamics_actuators_activeDiffBias.initSecondStage(jbeamData)` | Retrouve le différentiel (`differentialName`), ses roues par sortie et le côté gauche/droit ; active le système. *(interne)* | 180 |
| `controller_drivingDynamics_actuators_activeDiffBias.registerCMU(cmu)` | Appelée par le CMU pour donner une référence vers lui. *(interne)* | 253 |
| `controller_drivingDynamics_actuators_activeDiffBias.reset()` | Remet isActing et les bornes d'override à leur valeur initiale. *(interne)* | 150 |
| `controller_drivingDynamics_actuators_activeDiffBias.resetOverride()` | Remet les bornes d'override à -1 et 1. | 51 |
| `controller_drivingDynamics_actuators_activeDiffBias.sendConfigData()` | Envoie les paramètres au CMU dans un paquet de debug config. *(interne)* | 284 |
| `controller_drivingDynamics_actuators_activeDiffBias.setConfig(configTable)` | Remplace toute la table de paramètres. *(interne)* | 276 |
| `controller_drivingDynamics_actuators_activeDiffBias.setDebugMode(debugEnabled)` | Active ou désactive l'envoi de paquets de debug. *(interne)* | 247 |
| `controller_drivingDynamics_actuators_activeDiffBias.setParameters(parameters)` | Modifie à chaud avDiffThreshold, isEnabled, maxBiasOffset et brakingPIDkP/kI/kD (via CMU.applyParameter). | 257 |
| `controller_drivingDynamics_actuators_activeDiffBias.shutdown()` | Arrête l'actionneur. *(interne)* | 143 |
| `controller_drivingDynamics_actuators_activeDiffBias.updateFixedStep(dt)` | Pas fixe (100 Hz) : calcule les vitesses corrigées, le décalage de répartition (PID + terme de volant) et règle la répartition de couple du différentiel. *(interne)* | 56 |
| `controller_drivingDynamics_actuators_activeDiffBias.updateGFX(dt)` | Chaque frame : rien d'utile (retourne si désactivé). Variante debug : envoie les valeurs au CMU. *(interne)* | 112 |

### Détail des paramètres

#### `controller_drivingDynamics_actuators_activeDiffBias.getConfig()`

Renvoie une copie des paramètres.

- **renvoie** : table Copie profonde.

#### `controller_drivingDynamics_actuators_activeDiffBias.init(jbeamData)`

Lit les paramètres jbeam et crée le PID de répartition.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_drivingDynamics_actuators_activeDiffBias.initSecondStage(jbeamData)`

Retrouve le différentiel (`differentialName`), ses roues par sortie et le côté gauche/droit ; active le système.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_drivingDynamics_actuators_activeDiffBias.registerCMU(cmu)`

Appelée par le CMU pour donner une référence vers lui.

- `cmu` (*table*) : Module CMU.

#### `controller_drivingDynamics_actuators_activeDiffBias.setConfig(configTable)`

Remplace toute la table de paramètres.

- `configTable` (*table*) : Nouveaux paramètres.

#### `controller_drivingDynamics_actuators_activeDiffBias.setDebugMode(debugEnabled)`

Active ou désactive l'envoi de paquets de debug.

- `debugEnabled` (*boolean*) : true pour envoyer.

#### `controller_drivingDynamics_actuators_activeDiffBias.setParameters(parameters)`

Modifie à chaud avDiffThreshold, isEnabled, maxBiasOffset et brakingPIDkP/kI/kD (via CMU.applyParameter).

- `parameters` (*table*) : Table des paramètres à changer.

#### `controller_drivingDynamics_actuators_activeDiffBias.updateFixedStep(dt)`

Pas fixe (100 Hz) : calcule les vitesses corrigées, le décalage de répartition (PID + terme de volant) et règle la répartition de couple du différentiel.

- `dt` (*number*) : Pas en secondes.

#### `controller_drivingDynamics_actuators_activeDiffBias.updateGFX(dt)`

Chaque frame : rien d'utile (retourne si désactivé). Variante debug : envoie les valeurs au CMU.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultOrder` | number | 80. |
| `isActing` | boolean | true si le décalage de répartition est non nul. |
| `isActive` | boolean | true si le différentiel et les roues ont été trouvés. |
| `overrideMax` | number | Borne haute du décalage (1 par défaut). |
| `overrideMin` | number | Borne basse du décalage imposée par un superviseur (-1 par défaut). |
| `type` | string | "auxiliary". |
| `wheelSides` | table<string, integer> | {left = -1\|1, right = -1\|1} : indique quelle sortie du différentiel alimente le côté gauche ou droit (rempli par initSecondStage). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/drivingDynamics/actuators/activeDiffBias.lua`.*
