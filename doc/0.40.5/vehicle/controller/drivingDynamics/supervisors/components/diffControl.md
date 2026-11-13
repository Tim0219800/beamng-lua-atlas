# `controller_drivingDynamics_supervisors_components_diffControl`

*Fichier : `lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua` · VM : Véhicule · 301 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `drivingDynamics/supervisors/components/diffControl` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Composant de contrôle de lacet agissant sur les différentiels avant/arrière à pilotage électronique (type "auxiliary", defaultOrder 70). Il s'enregistre auprès de tractionControl (ordre 20, sans action) et de yawControl (ordre 10). Quand le véhicule survire sous accélération, il règle overrideMin/overrideMax des contrôleurs de différentiel (activeDiffLock ou electronicDiffLock) pour verrouiller ou ouvrir le différentiel selon l'angle de dérive de caisse.

## Remarques

- Clés jbeam : frontDiffName (défaut "lockFront") et rearDiffName (défaut "lockRear") = noms de contrôleurs de différentiel ; seuils d'angle de dérive (rad) openFrontDiffOversteerThresholdMin/Max (0/0), openRearDiffOversteerThresholdMin/Max (0/0.1), lockableFrontDiffOversteerThresholdMin/Max (0/0.2), lockableRearDiffOversteerThresholdMin/Max (0/0.2).
- Le type de contrôleur de différentiel (champ typeName) détermine la méthode : "drivingDynamics/actuators/activeDiffLock" (différentiel verrouillable) ou "drivingDynamics/actuators/electronicDiffLock" (différentiel ouvert). Autre type = nop. Si aucun des deux différentiels n'existe, le composant se neutralise (actAs... = nop).
- actAsYawControl renvoie toujours false pour ne pas déclencher le voyant ESC ; l'état réel est dans isActingAsYC. Il ne réagit que si electrics.values.throttle > 0.
- Les fonctions internes yawControlBiasFrontDiff/yawControlBiasRearDiff sont définies mais jamais utilisées.
- Le différentiel avant ouvert est sans effet (override max fixé à 1, « TODO » dans le code).
- Les paramètres tractionControl.isEnabled sont déclarés dans controlParameters mais setParameters ne les traite pas (seule la branche yawControl est appliquée).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_drivingDynamics_supervisors_components_diffControl.actAsTractionControl(wheelGroup, dt)` | Appelé par tractionControl ; ne fait rien et renvoie false. *(interne)* | 52 |
| `controller_drivingDynamics_supervisors_components_diffControl.actAsYawControl(measuredYaw, expectedYaw, yawDifference, bodySlipAngle, frontSlipAngle, rearSlipAngle, dt)` | Appelé par yawControl : remet à zéro les overrides puis, en cas de survirage sous accélération, applique les méthodes de contrôle avant/arrière. *(interne)* | 126 |
| `controller_drivingDynamics_supervisors_components_diffControl.getConfig()` | Renvoie une copie de la configuration. | 271 |
| `controller_drivingDynamics_supervisors_components_diffControl.init(jbeamData)` | Remet à false les indicateurs. *(interne)* | 178 |
| `controller_drivingDynamics_supervisors_components_diffControl.initLastStage(jbeamData)` | Ne fait rien. *(interne)* | 235 |
| `controller_drivingDynamics_supervisors_components_diffControl.initSecondStage(jbeamData)` | Cherche les contrôleurs de différentiel, s'enregistre auprès des superviseurs et lit les seuils. *(interne)* | 184 |
| `controller_drivingDynamics_supervisors_components_diffControl.registerCMU(cmu)` | Mémorise la référence au CMU. *(interne)* | 165 |
| `controller_drivingDynamics_supervisors_components_diffControl.reset()` | Remet à false les indicateurs. *(interne)* | 172 |
| `controller_drivingDynamics_supervisors_components_diffControl.sendConfigData()` | Envoie la configuration au CMU (paquet de debug). | 275 |
| `controller_drivingDynamics_supervisors_components_diffControl.setConfig(configTable)` | Remplace la configuration complète. | 266 |
| `controller_drivingDynamics_supervisors_components_diffControl.setDebugMode(debugEnabled)` | Active/désactive les paquets de debug. | 159 |
| `controller_drivingDynamics_supervisors_components_diffControl.setParameters(parameters)` | Applique les paramètres yawControl.* (isEnabled et les huit seuils) via CMU.applyParameter. | 247 |
| `controller_drivingDynamics_supervisors_components_diffControl.shutdown()` | Désactive le composant. | 238 |
| `controller_drivingDynamics_supervisors_components_diffControl.updateGFX(dt)` | Vide (version debug : envoie un paquet d'état). *(interne)* | 147 |

### Détail des paramètres

#### `controller_drivingDynamics_supervisors_components_diffControl.actAsTractionControl(wheelGroup, dt)`

Appelé par tractionControl ; ne fait rien et renvoie false.

- `wheelGroup` (*table*) : Groupe de roues.
- `dt` (*number*) : Pas de temps (s).
- **renvoie** : boolean false.

#### `controller_drivingDynamics_supervisors_components_diffControl.actAsYawControl(measuredYaw, expectedYaw, yawDifference, bodySlipAngle, frontSlipAngle, rearSlipAngle, dt)`

Appelé par yawControl : remet à zéro les overrides puis, en cas de survirage sous accélération, applique les méthodes de contrôle avant/arrière.

- `measuredYaw` (*number*) : Lacet mesuré (rad/s).
- `expectedYaw` (*number*) : Lacet attendu.
- `yawDifference` (*number*) : Écart de lacet.
- `bodySlipAngle` (*number*) : Angle de dérive de caisse ajusté (rad).
- `frontSlipAngle` (*number*) : Non utilisé.
- `rearSlipAngle` (*number*) : Non utilisé.
- `dt` (*number*) : Pas de temps (s).
- **renvoie** : boolean Toujours false (voir notes).

#### `controller_drivingDynamics_supervisors_components_diffControl.getConfig()`

Renvoie une copie de la configuration.

- **renvoie** : table Copie de la configuration.

#### `controller_drivingDynamics_supervisors_components_diffControl.init(jbeamData)`

Remet à false les indicateurs.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_drivingDynamics_supervisors_components_diffControl.initLastStage(jbeamData)`

Ne fait rien.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_drivingDynamics_supervisors_components_diffControl.initSecondStage(jbeamData)`

Cherche les contrôleurs de différentiel, s'enregistre auprès des superviseurs et lit les seuils.

- `jbeamData` (*table*) : Données jbeam (voir notes).

#### `controller_drivingDynamics_supervisors_components_diffControl.registerCMU(cmu)`

Mémorise la référence au CMU.

- `cmu` (*table*) : Contrôleur CMU.

#### `controller_drivingDynamics_supervisors_components_diffControl.setConfig(configTable)`

Remplace la configuration complète.

- `configTable` (*table*) : Table {tractionControl, yawControl}.

#### `controller_drivingDynamics_supervisors_components_diffControl.setDebugMode(debugEnabled)`

Active/désactive les paquets de debug.

- `debugEnabled` (*boolean*) : Vrai pour activer.

#### `controller_drivingDynamics_supervisors_components_diffControl.setParameters(parameters)`

Applique les paramètres yawControl.* (isEnabled et les huit seuils) via CMU.applyParameter.

- `parameters` (*table<string, any>*) : Paramètres à appliquer.

#### `controller_drivingDynamics_supervisors_components_diffControl.updateGFX(dt)`

Vide (version debug : envoie un paquet d'état).

- `dt` (*number*) : Pas de temps graphique (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `actAsABSControl` | function | nop. |
| `componentOrderABSControl` | number | 1000 : inutilisé. |
| `componentOrderTractionControl` | number | 20. |
| `componentOrderYawControl` | number | 10. |
| `defaultOrder` | number | Ordre d'exécution par défaut (70). |
| `isActingAsABS` | boolean | Toujours false. |
| `isActingAsTC` | boolean | Toujours false. |
| `isActingAsYC` | boolean | Vrai quand un différentiel est actuellement forcé. |
| `isActive` | boolean | Vrai après initSecondStage. |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/drivingDynamics/supervisors/components/diffControl.lua`.*
