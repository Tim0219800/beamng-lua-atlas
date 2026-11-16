# `controller_drivingDynamics_actuators_activeCenterDiffLock`

*Fichier : `lua/vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.lua` · VM : Véhicule · 260 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `drivingDynamics/actuators/activeCenterDiffLock` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Actionneur de la Driving Dynamics Suite : verrouillage actif du différentiel central (embrayage à commande électronique). À chaque étape physique intermédiaire, il lit les vitesses de sortie du différentiel central, mesure l'écart de vitesse entre essieux et règle, par un PID, un coefficient de verrouillage 0..1 écrit dans `relevantDiff.activeLockCoef`. Le verrouillage est coupé au freinage, sans accélérateur ou au frein de stationnement, figé pendant un changement de rapport, et peut avoir un minimum. Les superviseurs du CMU peuvent le limiter avec `overrideMin`/`overrideMax`. Ordre d'appel : `defaultOrder = 80`.

## Remarques

- Clés jbeam lues par init : `avDiffThreshold` (4 rad/s), `avThreshold` (1 rad/s : vitesse moyenne minimale), `minimumLock` (0), `clutchPIDkP` (0.15), `clutchPIDkI` (0.001), `clutchPIDkD` (0), `applyMinimumLockOnlyWithThrottle` (true), `name` (utilisé pour la source de debug). Lue par initSecondStage : `centerDiffName` (nom du différentiel central dans le powertrain).
- Le coefficient final = clamp(lockCoef, overrideMin, overrideMax) ; le commentaire du code précise que selon la disposition du groupe motopropulseur c'est le min ou le max de l'override qui est utilisé.
- Sans CMU enregistré (registerCMU non appelé), initSecondStage appelle shutdown ; si le différentiel est introuvable, l'actionneur reste inactif (isActive = false).
- Le test `isESCActive` est une constante false dans le code (jamais activé). `electrics.values.brake`, `parkingbrake`, `throttle` sont lus sans valeur par défaut.
- Les paquets de debug portent le type "electronicCenterDiffLock" (ancien nom du système) ; `configPacket.sourceName` n'est pas défini.
- `shutdown` met `isActive` et `isActing` à false et retire `updateGFX` et `updateWheelsIntermediate` (nil).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_drivingDynamics_actuators_activeCenterDiffLock.getConfig()` | Renvoie une copie des paramètres. | 232 |
| `controller_drivingDynamics_actuators_activeCenterDiffLock.init(jbeamData)` | Lit les paramètres jbeam et crée le PID de verrouillage. *(interne)* | 147 |
| `controller_drivingDynamics_actuators_activeCenterDiffLock.initSecondStage(jbeamData)` | Retrouve le différentiel central (`centerDiffName`) et active le système ; l'arrête si le CMU est absent. *(interne)* | 176 |
| `controller_drivingDynamics_actuators_activeCenterDiffLock.registerCMU(cmu)` | Appelée par le CMU pour donner une référence vers lui. *(interne)* | 206 |
| `controller_drivingDynamics_actuators_activeCenterDiffLock.reset()` | Remet les états, vitesses lissées, override et `activeLockCoef` à zéro. *(interne)* | 132 |
| `controller_drivingDynamics_actuators_activeCenterDiffLock.resetOverride()` | Remet les bornes d'override à 0 et 1. | 43 |
| `controller_drivingDynamics_actuators_activeCenterDiffLock.sendConfigData()` | Envoie les paramètres au CMU dans un paquet de debug de type config. *(interne)* | 236 |
| `controller_drivingDynamics_actuators_activeCenterDiffLock.setConfig(configTable)` | Remplace toute la table de paramètres (utilisé par l'outil de debug). *(interne)* | 228 |
| `controller_drivingDynamics_actuators_activeCenterDiffLock.setDebugMode(debugEnabled)` | Active ou désactive l'envoi de paquets de debug à chaque frame. *(interne)* | 200 |
| `controller_drivingDynamics_actuators_activeCenterDiffLock.setParameters(parameters)` | Modifie à chaud les paramètres (avDiffThreshold, avThreshold, minimumLock, isEnabled, clutchPIDkP/kI/kD) via CMU.applyParameter ; la valeur "default" restaure l'initial. | 210 |
| `controller_drivingDynamics_actuators_activeCenterDiffLock.shutdown()` | Arrête l'actionneur (appelée par le CMU en cas de système incomplet). *(interne)* | 125 |
| `controller_drivingDynamics_actuators_activeCenterDiffLock.updateGFX(dt)` | Chaque frame : ne fait rien d'utile (retourne si désactivé). Variante debug : envoie les valeurs au CMU. *(interne)* | 98 |
| `controller_drivingDynamics_actuators_activeCenterDiffLock.updateWheelsIntermediate(dt)` | Étape physique intermédiaire : calcule le coefficient de verrouillage (PID sur l'écart de vitesse entre sorties, conditions de frein, accélérateur, rapport et frein de stationnement), applique l'override et l'écrit dans `activeLockCoef` du différentiel. *(interne)* | 48 |

### Détail des paramètres

#### `controller_drivingDynamics_actuators_activeCenterDiffLock.getConfig()`

Renvoie une copie des paramètres.

- **renvoie** : table Copie profonde des paramètres.

#### `controller_drivingDynamics_actuators_activeCenterDiffLock.init(jbeamData)`

Lit les paramètres jbeam et crée le PID de verrouillage.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_drivingDynamics_actuators_activeCenterDiffLock.initSecondStage(jbeamData)`

Retrouve le différentiel central (`centerDiffName`) et active le système ; l'arrête si le CMU est absent.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_drivingDynamics_actuators_activeCenterDiffLock.registerCMU(cmu)`

Appelée par le CMU pour donner une référence vers lui.

- `cmu` (*table*) : Module CMU.

#### `controller_drivingDynamics_actuators_activeCenterDiffLock.setConfig(configTable)`

Remplace toute la table de paramètres (utilisé par l'outil de debug).

- `configTable` (*table*) : Nouveaux paramètres.

#### `controller_drivingDynamics_actuators_activeCenterDiffLock.setDebugMode(debugEnabled)`

Active ou désactive l'envoi de paquets de debug à chaque frame.

- `debugEnabled` (*boolean*) : true pour envoyer.

#### `controller_drivingDynamics_actuators_activeCenterDiffLock.setParameters(parameters)`

Modifie à chaud les paramètres (avDiffThreshold, avThreshold, minimumLock, isEnabled, clutchPIDkP/kI/kD) via CMU.applyParameter ; la valeur "default" restaure l'initial.

- `parameters` (*table*) : Table des paramètres à changer.

#### `controller_drivingDynamics_actuators_activeCenterDiffLock.updateGFX(dt)`

Chaque frame : ne fait rien d'utile (retourne si désactivé). Variante debug : envoie les valeurs au CMU.

- `dt` (*number*) : Pas de temps en secondes.

#### `controller_drivingDynamics_actuators_activeCenterDiffLock.updateWheelsIntermediate(dt)`

Étape physique intermédiaire : calcule le coefficient de verrouillage (PID sur l'écart de vitesse entre sorties, conditions de frein, accélérateur, rapport et frein de stationnement), applique l'override et l'écrit dans `activeLockCoef` du différentiel.

- `dt` (*number*) : Pas en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultOrder` | number | 80. |
| `isActing` | boolean | true si le coefficient de verrouillage dépasse 0.01. |
| `isActive` | boolean | true si le système a trouvé son différentiel et son CMU. |
| `overrideMax` | number | Borne haute imposée par un superviseur (1 par défaut). |
| `overrideMin` | number | Borne basse imposée par un superviseur (0 par défaut). |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.lua`.*
