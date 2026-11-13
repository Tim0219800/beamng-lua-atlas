# `controller_drivingDynamics_actuators_activeDiffLock`

*Fichier : `lua/vehicle/controller/drivingDynamics/actuators/activeDiffLock.lua` · VM : Véhicule · 245 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `drivingDynamics/actuators/activeDiffLock` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Actionneur de la Driving Dynamics Suite : verrouillage actif d'un différentiel d'essieu. À 100 Hz (updateFixedStep) il compare les vitesses des deux sorties corrigées du rayon de braquage (`CMU.vehicleData.turningCircleSpeedRatios`) ; sous accélérateur, un PID règle un coefficient de verrouillage 0..1 qui monte quand l'écart de vitesse dépasse `avDiffThreshold`. Le coefficient est écrit dans `relevantDifferential.activeLockCoef`. Les superviseurs peuvent le borner par `overrideMin`/`overrideMax`. Ordre d'appel : `defaultOrder = 80`.

## Remarques

- Clés jbeam lues par init : `avDiffThreshold` (3 rad/s), `lockingPIDkP` (0.5), `lockingPIDkI` (0.5), `lockingPIDkD` (0), `name`. Lue par initSecondStage : `differentialName`.
- Sans accélérateur (`electrics.values.throttle` <= 0), le verrouillage est 0 et le PID et le lisseur sont remis à zéro.
- Une vitesse de sortie de signe opposé à l'entrée est mise à 0 avant le calcul de l'écart.
- Nécessite `CMU.vehicleData` ; sans CMU enregistré, initSecondStage appelle shutdown.
- `reset` ne remet pas `overrideMin`/`overrideMax` (appeler resetOverride) ni le coefficient interne.
- `shutdown` met isActive/isActing à false et retire updateGFX et updateFixedStep.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_drivingDynamics_actuators_activeDiffLock.getConfig()` | Renvoie une copie des paramètres. | 217 |
| `controller_drivingDynamics_actuators_activeDiffLock.init(jbeamData)` | Lit les paramètres jbeam et crée le PID. *(interne)* | 132 |
| `controller_drivingDynamics_actuators_activeDiffLock.initSecondStage(jbeamData)` | Retrouve le différentiel (`differentialName`) et les roues de chaque sortie ; active le système. *(interne)* | 154 |
| `controller_drivingDynamics_actuators_activeDiffLock.registerCMU(cmu)` | Appelée par le CMU pour donner une référence vers lui. *(interne)* | 192 |
| `controller_drivingDynamics_actuators_activeDiffLock.reset()` | Remet isActing à false. *(interne)* | 128 |
| `controller_drivingDynamics_actuators_activeDiffLock.resetOverride()` | Remet les bornes d'override à 0 et 1. | 46 |
| `controller_drivingDynamics_actuators_activeDiffLock.sendConfigData()` | Envoie les paramètres au CMU dans un paquet de debug config. *(interne)* | 221 |
| `controller_drivingDynamics_actuators_activeDiffLock.setConfig(configTable)` | Remplace toute la table de paramètres. *(interne)* | 213 |
| `controller_drivingDynamics_actuators_activeDiffLock.setDebugMode(debugEnabled)` | Active ou désactive l'envoi de paquets de debug. *(interne)* | 186 |
| `controller_drivingDynamics_actuators_activeDiffLock.setParameters(parameters)` | Modifie à chaud avDiffThreshold, isEnabled et lockingPIDkP/kI/kD (via CMU.applyParameter). | 196 |
| `controller_drivingDynamics_actuators_activeDiffLock.shutdown()` | Arrête l'actionneur. *(interne)* | 121 |
| `controller_drivingDynamics_actuators_activeDiffLock.updateFixedStep(dt)` | Pas fixe (100 Hz) : calcule l'écart de vitesse corrigé, le coefficient de verrouillage (PID lissé, borné par l'override) et l'écrit dans `activeLockCoef` du différentiel. *(interne)* | 51 |
| `controller_drivingDynamics_actuators_activeDiffLock.updateGFX(dt)` | Chaque frame : rien d'utile. Variante debug : envoie les valeurs au CMU. *(interne)* | 93 |

### Détail des paramètres

#### `controller_drivingDynamics_actuators_activeDiffLock.getConfig()`

Renvoie une copie des paramètres.

- **renvoie** : table Copie profonde.

#### `controller_drivingDynamics_actuators_activeDiffLock.init(jbeamData)`

Lit les paramètres jbeam et crée le PID.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_drivingDynamics_actuators_activeDiffLock.initSecondStage(jbeamData)`

Retrouve le différentiel (`differentialName`) et les roues de chaque sortie ; active le système.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_drivingDynamics_actuators_activeDiffLock.registerCMU(cmu)`

Appelée par le CMU pour donner une référence vers lui.

- `cmu` (*table*) : Module CMU.

#### `controller_drivingDynamics_actuators_activeDiffLock.setConfig(configTable)`

Remplace toute la table de paramètres.

- `configTable` (*table*) : Nouveaux paramètres.

#### `controller_drivingDynamics_actuators_activeDiffLock.setDebugMode(debugEnabled)`

Active ou désactive l'envoi de paquets de debug.

- `debugEnabled` (*boolean*) : true pour envoyer.

#### `controller_drivingDynamics_actuators_activeDiffLock.setParameters(parameters)`

Modifie à chaud avDiffThreshold, isEnabled et lockingPIDkP/kI/kD (via CMU.applyParameter).

- `parameters` (*table*) : Table des paramètres à changer.

#### `controller_drivingDynamics_actuators_activeDiffLock.updateFixedStep(dt)`

Pas fixe (100 Hz) : calcule l'écart de vitesse corrigé, le coefficient de verrouillage (PID lissé, borné par l'override) et l'écrit dans `activeLockCoef` du différentiel.

- `dt` (*number*) : Pas en secondes.

#### `controller_drivingDynamics_actuators_activeDiffLock.updateGFX(dt)`

Chaque frame : rien d'utile. Variante debug : envoie les valeurs au CMU.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultOrder` | number | 80. |
| `isActing` | boolean | true si le coefficient de verrouillage est > 0. |
| `isActive` | boolean | true si le différentiel et ses roues ont été trouvés. |
| `overrideMax` | number | Borne haute du verrouillage (1 par défaut). |
| `overrideMin` | number | Borne basse du verrouillage (0 par défaut). |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/drivingDynamics/actuators/activeDiffLock.lua`.*
