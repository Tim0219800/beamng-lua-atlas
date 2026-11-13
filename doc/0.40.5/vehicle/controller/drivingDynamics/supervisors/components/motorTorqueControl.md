# `controller_drivingDynamics_supervisors_components_motorTorqueControl`

*Fichier : `lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua` · VM : Véhicule · 379 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `drivingDynamics/supervisors/components/motorTorqueControl` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Composant du système drivingDynamics qui réduit le couple moteur via device.throttleFactor, pour l'antipatinage (ordre 40) et le contrôle de lacet (ordre 40). Pour chaque moteur concerné, le facteur final est min(facteur antipatinage, facteur lacet), recalculé à chaque pas fixe. L'antipatinage utilise un PID sur le glissement maximal du groupe de roues du moteur ; le lacet utilise trois PID (écart de lacet, dérive de caisse, dérive avant). N'est pas utilisable pour l'ABS.

## Remarques

- Clés jbeam : useForTractionControl, useForYawControl (vrai par défaut) ; tractionControl.wheelGroupSettings (table d'en-tête : motorName, kP, kI, kD (0), integralInCoef (20), integralOutCoef (2), slipThreshold (0.2), minimumThrottleLimit (0)) ; yawControl.PIDSettings (table d'en-tête : type yawAV | slipAngle | frontAxleSlipAngle, kP, kI, kD, integralInCoef, integralOutCoef ; défaut yawAV {2,0.5,0,100,10} et slipAngle {2,1,0,10,1}), yawControl.yawAVThreshold (0.4), yawControl.slipAngleThreshold (0.1), yawControl.frontAxleSlipAngleThreshold (0.1), yawControl.minimumThrottleLimit (0), yawControlledMotors (liste de noms de moteurs).
- Les rôles ne sont actifs que si le superviseur correspondant existe ET si la table jbeam correspondante (tractionControl / yawControl) est présente.
- Le facteur d'antipatinage est lissé (temporalSmoothing 5/5) et borné par minimumThrottleLimit ; le facteur de lacet est borné par yawControl.minimumThrottleLimit. M.isActingAsTC / isActingAsYC sont vrais quand le facteur est < 1.
- setParameters traite : tractionControl.isEnabled, tractionControl.wheelGroupSettings.<moteur>.(kP|kI|kD|integralInCoef|integralOutCoef|slipThreshold|minimumThrottleLimit), yawControl.isEnabled, yawControl.yawAvThreshold, yawControl.slipAngleThreshold. Les PID de lacet ne sont pas reconfigurés par setParameters/applyControlParameters (seul l'antipatinage l'est) ; yawControl.frontAxleSlipAngleThreshold n'est pas modifiable.
- Incohérence : si le rôle yawControl est actif mais pas tractionControl (ou inversement), controlParameters.yawControl/tractionControl peut être nil, et actAsTractionControl/actAsYawControl lisent controlParameters.<rôle>.isEnabled sans garde ; ces fonctions ne sont toutefois appelées que si le composant s'est enregistré pour ce rôle.
- Le throttleFactor du moteur peut être aussi modifié par d'autres contrôleurs (esc.lua passe par electrics, pas par ce champ) ; ici il est écrasé à chaque pas.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_drivingDynamics_supervisors_components_motorTorqueControl.actAsTractionControl(wheelGroup, dt)` | Appelé par tractionControl : calcule le facteur de couple du moteur d'un groupe de roues d'après le glissement maximal du groupe. *(interne)* | 54 |
| `controller_drivingDynamics_supervisors_components_motorTorqueControl.actAsYawControl(measuredYaw, expectedYaw, yawDifference, bodySlipAngle, frontSlipAngle, rearSlipAngle, dt)` | Appelé par yawControl : calcule un facteur de couple commun à tous les moteurs contrôlés d'après l'écart de lacet, l'angle de dérive de caisse (survirage seulement) et la dérive avant. *(interne)* | 80 |
| `controller_drivingDynamics_supervisors_components_motorTorqueControl.getConfig()` | Renvoie une copie de la configuration. | 348 |
| `controller_drivingDynamics_supervisors_components_motorTorqueControl.init(jbeamData)` | Passe isActive à true et remet à false les indicateurs. *(interne)* | 173 |
| `controller_drivingDynamics_supervisors_components_motorTorqueControl.initLastStage(jbeamData)` | Ne fait rien. *(interne)* | 308 |
| `controller_drivingDynamics_supervisors_components_motorTorqueControl.initSecondStage(jbeamData)` | Lit la configuration, crée les PID, liste les moteurs contrôlés et s'enregistre auprès des superviseurs. *(interne)* | 190 |
| `controller_drivingDynamics_supervisors_components_motorTorqueControl.registerCMU(cmu)` | Mémorise la référence au CMU. *(interne)* | 147 |
| `controller_drivingDynamics_supervisors_components_motorTorqueControl.reset()` | Remet à zéro les indicateurs et les PID. *(interne)* | 151 |
| `controller_drivingDynamics_supervisors_components_motorTorqueControl.sendConfigData()` | Envoie la configuration au CMU. | 352 |
| `controller_drivingDynamics_supervisors_components_motorTorqueControl.setConfig(configTable)` | Remplace la configuration complète. | 343 |
| `controller_drivingDynamics_supervisors_components_motorTorqueControl.setDebugMode(debugEnabled)` | Active/désactive les paquets de debug. | 141 |
| `controller_drivingDynamics_supervisors_components_motorTorqueControl.setParameters(parameters)` | Applique des paramètres (voir notes) puis reconfigure les PID d'antipatinage. | 320 |
| `controller_drivingDynamics_supervisors_components_motorTorqueControl.shutdown()` | Désactive le composant. | 311 |
| `controller_drivingDynamics_supervisors_components_motorTorqueControl.updateFixedStep(dt)` | Applique à chaque moteur contrôlé throttleFactor = min(facteur TC, facteur YC). *(interne)* | 41 |
| `controller_drivingDynamics_supervisors_components_motorTorqueControl.updateGFX(dt)` | Vide (version debug : envoie un paquet détaillé). *(interne)* | 104 |

### Détail des paramètres

#### `controller_drivingDynamics_supervisors_components_motorTorqueControl.actAsTractionControl(wheelGroup, dt)`

Appelé par tractionControl : calcule le facteur de couple du moteur d'un groupe de roues d'après le glissement maximal du groupe.

- `wheelGroup` (*table*) : Groupe de roues {motor, maxSlip…}.
- `dt` (*number*) : Pas de temps (s).
- **renvoie** : boolean Vrai si le couple est réduit.

#### `controller_drivingDynamics_supervisors_components_motorTorqueControl.actAsYawControl(measuredYaw, expectedYaw, yawDifference, bodySlipAngle, frontSlipAngle, rearSlipAngle, dt)`

Appelé par yawControl : calcule un facteur de couple commun à tous les moteurs contrôlés d'après l'écart de lacet, l'angle de dérive de caisse (survirage seulement) et la dérive avant.

- `measuredYaw` (*number*) : Lacet mesuré (rad/s).
- `expectedYaw` (*number*) : Non utilisé.
- `yawDifference` (*number*) : Écart de lacet.
- `bodySlipAngle` (*number*) : Angle de dérive de caisse ajusté (rad).
- `frontSlipAngle` (*number*) : Angle de dérive avant (rad).
- `rearSlipAngle` (*number*) : Non utilisé.
- `dt` (*number*) : Pas de temps (s).
- **renvoie** : boolean Vrai si le couple est réduit.

#### `controller_drivingDynamics_supervisors_components_motorTorqueControl.getConfig()`

Renvoie une copie de la configuration.

- **renvoie** : table Copie de la configuration.

#### `controller_drivingDynamics_supervisors_components_motorTorqueControl.init(jbeamData)`

Passe isActive à true et remet à false les indicateurs.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_drivingDynamics_supervisors_components_motorTorqueControl.initLastStage(jbeamData)`

Ne fait rien.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_drivingDynamics_supervisors_components_motorTorqueControl.initSecondStage(jbeamData)`

Lit la configuration, crée les PID, liste les moteurs contrôlés et s'enregistre auprès des superviseurs.

- `jbeamData` (*table*) : Données jbeam (voir notes).

#### `controller_drivingDynamics_supervisors_components_motorTorqueControl.registerCMU(cmu)`

Mémorise la référence au CMU.

- `cmu` (*table*) : Contrôleur CMU.

#### `controller_drivingDynamics_supervisors_components_motorTorqueControl.setConfig(configTable)`

Remplace la configuration complète.

- `configTable` (*table*) : Table {tractionControl, yawControl}.

#### `controller_drivingDynamics_supervisors_components_motorTorqueControl.setDebugMode(debugEnabled)`

Active/désactive les paquets de debug.

- `debugEnabled` (*boolean*) : Vrai pour activer.

#### `controller_drivingDynamics_supervisors_components_motorTorqueControl.setParameters(parameters)`

Applique des paramètres (voir notes) puis reconfigure les PID d'antipatinage.

- `parameters` (*table<string, any>*) : Paramètres à appliquer.

#### `controller_drivingDynamics_supervisors_components_motorTorqueControl.updateFixedStep(dt)`

Applique à chaque moteur contrôlé throttleFactor = min(facteur TC, facteur YC).

- `dt` (*number*) : Pas de temps (s).

#### `controller_drivingDynamics_supervisors_components_motorTorqueControl.updateGFX(dt)`

Vide (version debug : envoie un paquet détaillé).

- `dt` (*number*) : Pas de temps graphique (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `actAsABSControl` | function | nop. |
| `componentOrderABSControl` | number | 1000 : inutilisé. |
| `componentOrderTractionControl` | number | 40. |
| `componentOrderYawControl` | number | 40. |
| `defaultOrder` | number | Ordre d'exécution par défaut (70). |
| `isActingAsABS` | boolean | Toujours false. |
| `isActingAsTC` | boolean | Vrai quand le couple est réduit pour l'antipatinage. |
| `isActingAsYC` | boolean | Vrai quand le couple est réduit par le contrôle de lacet. |
| `isActive` | boolean | Vrai après init. |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/drivingDynamics/supervisors/components/motorTorqueControl.lua`.*
