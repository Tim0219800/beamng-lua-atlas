# `controller_drivingDynamics_actuators_electronicDiffLock`

*Fichier : `lua/vehicle/controller/drivingDynamics/actuators/electronicDiffLock.lua` · VM : Véhicule · 269 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `drivingDynamics/actuators/electronicDiffLock` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Actionneur de la Driving Dynamics Suite : différentiel à verrouillage électronique par freinage (EDL, « brake-based » : on freine la roue qui patine pour transférer le couple). À chaque étape physique intermédiaire, il compare les vitesses des deux sorties corrigées du rayon de braquage (`CMU.vehicleData.turningCircleSpeedRatios`) ; si l'écart dépasse `avDiffThreshold` sous accélérateur (> 0.05), un PID calcule un coefficient de freinage appliqué en `desiredBrakingTorque` aux roues du côté le plus rapide. Ordre d'appel : `defaultOrder = 80`.

## Remarques

- Clés jbeam lues par init : `avDiffThreshold` (5 rad/s), `avThreshold` (1 rad/s : somme minimale des vitesses de sortie), `brakingPIDkP` (0), `brakingPIDkI` (0.1), `brakingPIDkD` (0), `name`. Lue par initSecondStage : `differentialName`.
- Le freinage maximal est borné par `overrideMax` (1 par défaut) et par le `brakeTorque` de chaque roue ; une roue `isBroken` n'est pas freinée.
- Particularité : `overrideMin` n'est jamais défini ni utilisé dans ce fichier avant un appel à resetOverride (qui le met à 0) ; seul `overrideMax` borne réellement le freinage.
- Nécessite `CMU.vehicleData` ; sans CMU enregistré initSecondStage appelle shutdown. `shutdown` retire updateGFX et updateWheelsIntermediate (nil).
- `reset` remet `overrideMax` à 1 mais ne touche pas aux lisseurs ni au PID.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_drivingDynamics_actuators_electronicDiffLock.getConfig()` | Renvoie une copie des paramètres. | 241 |
| `controller_drivingDynamics_actuators_electronicDiffLock.init(jbeamData)` | Lit les paramètres jbeam et crée le PID de freinage. *(interne)* | 152 |
| `controller_drivingDynamics_actuators_electronicDiffLock.initSecondStage(jbeamData)` | Retrouve le différentiel (`differentialName`) et les roues de chaque sortie ; active le système. *(interne)* | 175 |
| `controller_drivingDynamics_actuators_electronicDiffLock.registerCMU(cmu)` | Appelée par le CMU pour donner une référence vers lui. *(interne)* | 215 |
| `controller_drivingDynamics_actuators_electronicDiffLock.reset()` | Remet isActing à false et overrideMax à 1. *(interne)* | 147 |
| `controller_drivingDynamics_actuators_electronicDiffLock.resetOverride()` | Remet les bornes d'override : overrideMin = 0, overrideMax = 1. | 48 |
| `controller_drivingDynamics_actuators_electronicDiffLock.sendConfigData()` | Envoie les paramètres au CMU dans un paquet de debug config. *(interne)* | 245 |
| `controller_drivingDynamics_actuators_electronicDiffLock.setConfig(configTable)` | Remplace toute la table de paramètres. *(interne)* | 237 |
| `controller_drivingDynamics_actuators_electronicDiffLock.setDebugMode(debugEnabled)` | Active ou désactive l'envoi de paquets de debug. *(interne)* | 209 |
| `controller_drivingDynamics_actuators_electronicDiffLock.setParameters(parameters)` | Modifie à chaud avDiffThreshold, avThreshold, isEnabled et brakingPIDkP/kI/kD (via CMU.applyParameter). | 219 |
| `controller_drivingDynamics_actuators_electronicDiffLock.shutdown()` | Arrête l'actionneur. *(interne)* | 140 |
| `controller_drivingDynamics_actuators_electronicDiffLock.updateGFX(dt)` | Chaque frame : rien d'utile. Variante debug : envoie les valeurs au CMU. *(interne)* | 110 |
| `controller_drivingDynamics_actuators_electronicDiffLock.updateWheelsIntermediate(dt)` | Étape physique intermédiaire : calcule les vitesses de sortie corrigées, le coefficient de freinage (PID) et ajoute le couple de freinage aux roues du côté qui patine. *(interne)* | 53 |

### Détail des paramètres

#### `controller_drivingDynamics_actuators_electronicDiffLock.getConfig()`

Renvoie une copie des paramètres.

- **renvoie** : table Copie profonde.

#### `controller_drivingDynamics_actuators_electronicDiffLock.init(jbeamData)`

Lit les paramètres jbeam et crée le PID de freinage.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_drivingDynamics_actuators_electronicDiffLock.initSecondStage(jbeamData)`

Retrouve le différentiel (`differentialName`) et les roues de chaque sortie ; active le système.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_drivingDynamics_actuators_electronicDiffLock.registerCMU(cmu)`

Appelée par le CMU pour donner une référence vers lui.

- `cmu` (*table*) : Module CMU.

#### `controller_drivingDynamics_actuators_electronicDiffLock.setConfig(configTable)`

Remplace toute la table de paramètres.

- `configTable` (*table*) : Nouveaux paramètres.

#### `controller_drivingDynamics_actuators_electronicDiffLock.setDebugMode(debugEnabled)`

Active ou désactive l'envoi de paquets de debug.

- `debugEnabled` (*boolean*) : true pour envoyer.

#### `controller_drivingDynamics_actuators_electronicDiffLock.setParameters(parameters)`

Modifie à chaud avDiffThreshold, avThreshold, isEnabled et brakingPIDkP/kI/kD (via CMU.applyParameter).

- `parameters` (*table*) : Table des paramètres à changer.

#### `controller_drivingDynamics_actuators_electronicDiffLock.updateGFX(dt)`

Chaque frame : rien d'utile. Variante debug : envoie les valeurs au CMU.

- `dt` (*number*) : Pas de temps en secondes.

#### `controller_drivingDynamics_actuators_electronicDiffLock.updateWheelsIntermediate(dt)`

Étape physique intermédiaire : calcule les vitesses de sortie corrigées, le coefficient de freinage (PID) et ajoute le couple de freinage aux roues du côté qui patine.

- `dt` (*number*) : Pas en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultOrder` | number | 80. |
| `isActing` | boolean | true si l'écart de vitesse justifie un freinage. |
| `isActive` | boolean | true si le différentiel et ses roues ont été trouvés. |
| `overrideMax` | number | Plafond du coefficient de freinage imposé par un superviseur (1 par défaut). |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/drivingDynamics/actuators/electronicDiffLock.lua`.*
