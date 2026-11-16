# `controller_drivingDynamics_actuators_electronicSplitShaftLock`

*Fichier : `lua/vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.lua` · VM : Véhicule · 257 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `drivingDynamics/actuators/electronicSplitShaftLock` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Actionneur de la Driving Dynamics Suite : verrouillage électronique d'un arbre de répartition (split shaft, embrayage de transfert type Haldex). À chaque étape physique intermédiaire, il compare la vitesse d'entrée à celle de la sortie secondaire (`secondaryOutputAVName`) ; un PID règle le rapport d'embrayage `clutchRatio` (0..1) de l'arbre pour réduire l'écart. Le verrouillage est coupé au freinage ou sans accélérateur (sauf freinage du pied gauche), figé pendant un changement de rapport, avec un minimum possible, et nul au frein de stationnement. Ordre d'appel : `defaultOrder = 80`.

## Remarques

- Clés jbeam lues par init : `avDiffThreshold` (4 rad/s), `avThreshold` (1 rad/s), `minimumLock` (0), `clutchPIDkP` (0.1), `clutchPIDkI` (1), `clutchPIDkD` (0), `applyMinimumLockOnlyWithThrottle` (true), `name`. Lue par initSecondStage : `splitShaftName`.
- Seuils internes : frein considéré actif au-dessus de 0.1 ; accélérateur considéré relâché à 0 ou moins.
- Le rapport final est clamp(clutchRatio, overrideMin, overrideMax) ; le commentaire du code précise que selon la disposition du groupe motopropulseur c'est le min ou le max de l'override qui compte.
- Sans CMU enregistré, initSecondStage appelle shutdown ; si l'arbre est introuvable le système reste inactif. `electrics.values.brake`, `throttle`, `parkingbrake` sont lus sans valeur par défaut.
- `shutdown` retire updateGFX et updateWheelsIntermediate (nil).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_drivingDynamics_actuators_electronicSplitShaftLock.getConfig()` | Renvoie une copie des paramètres. | 229 |
| `controller_drivingDynamics_actuators_electronicSplitShaftLock.init(jbeamData)` | Lit les paramètres jbeam et crée le PID d'embrayage. *(interne)* | 146 |
| `controller_drivingDynamics_actuators_electronicSplitShaftLock.initSecondStage(jbeamData)` | Retrouve l'arbre de répartition (`splitShaftName`) et active le système. *(interne)* | 175 |
| `controller_drivingDynamics_actuators_electronicSplitShaftLock.registerCMU(cmu)` | Appelée par le CMU pour donner une référence vers lui. *(interne)* | 203 |
| `controller_drivingDynamics_actuators_electronicSplitShaftLock.reset()` | Remet isActing et les bornes d'override à leur valeur initiale. *(interne)* | 140 |
| `controller_drivingDynamics_actuators_electronicSplitShaftLock.resetOverride()` | Remet les bornes d'override à 0 et 1. | 46 |
| `controller_drivingDynamics_actuators_electronicSplitShaftLock.sendConfigData()` | Envoie les paramètres au CMU dans un paquet de debug config. *(interne)* | 233 |
| `controller_drivingDynamics_actuators_electronicSplitShaftLock.setConfig(configTable)` | Remplace toute la table de paramètres. *(interne)* | 225 |
| `controller_drivingDynamics_actuators_electronicSplitShaftLock.setDebugMode(debugEnabled)` | Active ou désactive l'envoi de paquets de debug. *(interne)* | 197 |
| `controller_drivingDynamics_actuators_electronicSplitShaftLock.setParameters(parameters)` | Modifie à chaud avDiffThreshold, avThreshold, minimumLock, isEnabled et clutchPIDkP/kI/kD (via CMU.applyParameter). | 207 |
| `controller_drivingDynamics_actuators_electronicSplitShaftLock.shutdown()` | Arrête l'actionneur. *(interne)* | 133 |
| `controller_drivingDynamics_actuators_electronicSplitShaftLock.updateGFX(dt)` | Chaque frame : rien d'utile. Variante debug : envoie les valeurs au CMU. *(interne)* | 106 |
| `controller_drivingDynamics_actuators_electronicSplitShaftLock.updateWheelsIntermediate(dt)` | Étape physique intermédiaire : calcule le rapport d'embrayage (PID, conditions de conduite, override) et l'écrit dans `clutchRatio` de l'arbre de répartition. *(interne)* | 51 |

### Détail des paramètres

#### `controller_drivingDynamics_actuators_electronicSplitShaftLock.getConfig()`

Renvoie une copie des paramètres.

- **renvoie** : table Copie profonde.

#### `controller_drivingDynamics_actuators_electronicSplitShaftLock.init(jbeamData)`

Lit les paramètres jbeam et crée le PID d'embrayage.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_drivingDynamics_actuators_electronicSplitShaftLock.initSecondStage(jbeamData)`

Retrouve l'arbre de répartition (`splitShaftName`) et active le système.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_drivingDynamics_actuators_electronicSplitShaftLock.registerCMU(cmu)`

Appelée par le CMU pour donner une référence vers lui.

- `cmu` (*table*) : Module CMU.

#### `controller_drivingDynamics_actuators_electronicSplitShaftLock.setConfig(configTable)`

Remplace toute la table de paramètres.

- `configTable` (*table*) : Nouveaux paramètres.

#### `controller_drivingDynamics_actuators_electronicSplitShaftLock.setDebugMode(debugEnabled)`

Active ou désactive l'envoi de paquets de debug.

- `debugEnabled` (*boolean*) : true pour envoyer.

#### `controller_drivingDynamics_actuators_electronicSplitShaftLock.setParameters(parameters)`

Modifie à chaud avDiffThreshold, avThreshold, minimumLock, isEnabled et clutchPIDkP/kI/kD (via CMU.applyParameter).

- `parameters` (*table*) : Table des paramètres à changer.

#### `controller_drivingDynamics_actuators_electronicSplitShaftLock.updateGFX(dt)`

Chaque frame : rien d'utile. Variante debug : envoie les valeurs au CMU.

- `dt` (*number*) : Pas de temps en secondes.

#### `controller_drivingDynamics_actuators_electronicSplitShaftLock.updateWheelsIntermediate(dt)`

Étape physique intermédiaire : calcule le rapport d'embrayage (PID, conditions de conduite, override) et l'écrit dans `clutchRatio` de l'arbre de répartition.

- `dt` (*number*) : Pas en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultOrder` | number | 80. |
| `isActing` | boolean | true si le rapport d'embrayage dépasse 0.01. |
| `isActive` | boolean | true si l'arbre de répartition a été trouvé. |
| `overrideMax` | number | Borne haute du rapport d'embrayage (1 par défaut). |
| `overrideMin` | number | Borne basse du rapport d'embrayage (0 par défaut). |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.lua`.*
