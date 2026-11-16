# `controller_drivingDynamics_supervisors_yawProviders_STMEstimate`

*Fichier : `lua/vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.lua` · VM : Véhicule · 131 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `drivingDynamics/supervisors/yawProviders/STMEstimate` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Fournisseur de lacet attendu (type "auxiliary", defaultOrder 80, providerOrder 20) pour le superviseur yawControl. Il estime le taux de lacet que le conducteur demande avec le modèle de bicyclette à rigidité de dérive (angle de roue avant, empattement, vitesse caractéristique), limité par une accélération latérale maximale. S'enregistre via yawControl.registerYawProvider ; si yawControl est absent, il se désactive.

## Remarques

- Clé jbeam : maxLateralAcceleration (défaut 12 m/s²).
- Formule : min( |angleRoueAvant| / empattement * v / (1 + v² / vc²), maxLateralAcceleration / v ) avec v = vitesse virtuelle si virtualSpeed est entièrement fiable (>= 1) sinon vitesse de roue. Le résultat est toujours positif (le signe est géré par yawControl).
- Incohérence : yawControl appelle yawProvider.calculateExpectedYaw(speed, dt), mais la fonction est déclarée calculateExpectedYaw(dt) : le paramètre dt reçoit en fait la vitesse. Sans conséquence car il n'est pas utilisé.
- Paramètres modifiables : isEnabled, maxLateralAcceleration. isEnabled n'est pas consulté dans calculateExpectedYaw (le fournisseur répond toujours).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.calculateExpectedYaw(dt)` | Renvoie le taux de lacet attendu (rad/s, positif) d'après l'angle de roue avant et la vitesse ; appelé par yawControl à chaque pas fixe. *(interne)* | 25 |
| `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.getConfig()` | Renvoie une copie de la configuration. | 103 |
| `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.init(jbeamData)` | Passe isActive à true. *(interne)* | 66 |
| `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.initLastStage(jbeamData)` | Ne fait rien. *(interne)* | 85 |
| `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.initSecondStage(jbeamData)` | S'enregistre auprès de yawControl et lit maxLateralAcceleration. *(interne)* | 70 |
| `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.registerCMU(cmu)` | Mémorise la référence au CMU. *(interne)* | 59 |
| `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.reset()` | Ne fait rien. *(interne)* | 63 |
| `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.sendConfigData()` | Envoie la configuration au CMU. | 107 |
| `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.setConfig(configTable)` | Remplace la configuration. | 99 |
| `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.setDebugMode(debugEnabled)` | Active/désactive les paquets de debug. | 53 |
| `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.setParameters(parameters)` | Applique isEnabled et maxLateralAcceleration. | 94 |
| `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.shutdown()` | Désactive le fournisseur. | 88 |
| `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.updateGFX(dt)` | Vide (version debug : envoie isEnabled). *(interne)* | 42 |

### Détail des paramètres

#### `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.calculateExpectedYaw(dt)`

Renvoie le taux de lacet attendu (rad/s, positif) d'après l'angle de roue avant et la vitesse ; appelé par yawControl à chaque pas fixe.

- `dt` (*number*) : Déclaré dt mais reçoit la vitesse (voir notes) ; non utilisé.
- **renvoie** : number Lacet attendu en rad/s.

#### `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.getConfig()`

Renvoie une copie de la configuration.

- **renvoie** : table Copie.

#### `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.init(jbeamData)`

Passe isActive à true.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.initLastStage(jbeamData)`

Ne fait rien.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.initSecondStage(jbeamData)`

S'enregistre auprès de yawControl et lit maxLateralAcceleration.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.registerCMU(cmu)`

Mémorise la référence au CMU.

- `cmu` (*table*) : Contrôleur CMU.

#### `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.setConfig(configTable)`

Remplace la configuration.

- `configTable` (*table*) : Table {isEnabled, maxLateralAcceleration}.

#### `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.setDebugMode(debugEnabled)`

Active/désactive les paquets de debug.

- `debugEnabled` (*boolean*) : Vrai pour activer.

#### `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.setParameters(parameters)`

Applique isEnabled et maxLateralAcceleration.

- `parameters` (*table<string, any>*) : Paramètres à appliquer.

#### `controller_drivingDynamics_supervisors_yawProviders_STMEstimate.updateGFX(dt)`

Vide (version debug : envoie isEnabled).

- `dt` (*number*) : Pas de temps graphique (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultOrder` | number | Ordre d'exécution par défaut (80). |
| `isActive` | boolean | Vrai après init, faux si yawControl est absent. |
| `providerOrder` | number | Priorité parmi les fournisseurs de lacet (20). |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.lua`.*
