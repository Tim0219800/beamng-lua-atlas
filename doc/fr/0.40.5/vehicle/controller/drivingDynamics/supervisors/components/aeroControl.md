# `controller_drivingDynamics_supervisors_components_aeroControl`

*Fichier : `lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua` · VM : Véhicule · 167 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `drivingDynamics/supervisors/components/aeroControl` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Composant de contrôle de lacet (type "auxiliary", defaultOrder 70) pour l'aérodynamique active. Il s'enregistre auprès du superviseur yawControl (ordre 30) ; quand le véhicule survire (angle de dérive de caisse de signe opposé au lacet et supérieur à un seuil), il écrit electrics.values.yawControlRequestReduceOversteer (1 ou 0) que les éléments aéro (ailerons, volets) du véhicule peuvent lire pour réduire le survirage. Ne sert pas à l'antipatinage ni à l'ABS.

## Remarques

- Clé jbeam : slipAngleThreshold (défaut 0.2 rad) = seuil de dérive de caisse au-delà duquel l'aéro est demandée.
- Paramètres modifiables (setParameters) : yawControl, yawControl.isEnabled, yawControl.slipAngleThreshold.
- L'indicateur electrics.values.yawControlRequestReduceOversteer est lissé (temporalSmoothing 1 / 1000, montée lente de 1 s, retombée quasi immédiate) puis ramené à son signe (0 ou 1) : il reste à 1 pendant la montée du lisseur même après la fin de la demande.
- actAsTractionControl est remplacée par nop à initSecondStage ; actAsABSControl est nop. componentOrderTractionControl et componentOrderABSControl valent 1000 (inutilisés).
- Le composant ne s'enregistre auprès de yawControl que si ce superviseur existe (CMU.getSupervisor("yawControl")).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_drivingDynamics_supervisors_components_aeroControl.actAsTractionControl(wheelGroup, dt)` | Appelé par tractionControl ; ne fait rien (renvoie false, remplacée par nop à l'init). *(interne)* | 34 |
| `controller_drivingDynamics_supervisors_components_aeroControl.actAsYawControl(measuredYaw, expectedYaw, yawDifference, bodySlipAngle, frontSlipAngle, rearSlipAngle, dt)` | Appelé par yawControl à chaque pas fixe : détecte le survirage via l'angle de dérive de caisse et met à jour electrics.values.yawControlRequestReduceOversteer. *(interne)* | 41 |
| `controller_drivingDynamics_supervisors_components_aeroControl.getConfig()` | Renvoie une copie de la configuration. | 137 |
| `controller_drivingDynamics_supervisors_components_aeroControl.init(jbeamData)` | Remet à false les indicateurs d'action. *(interne)* | 90 |
| `controller_drivingDynamics_supervisors_components_aeroControl.initLastStage(jbeamData)` | Ne fait rien. *(interne)* | 112 |
| `controller_drivingDynamics_supervisors_components_aeroControl.initSecondStage(jbeamData)` | S'enregistre auprès de yawControl, lit slipAngleThreshold et passe isActive à true. *(interne)* | 96 |
| `controller_drivingDynamics_supervisors_components_aeroControl.registerCMU(cmu)` | Mémorise la référence au CMU. *(interne)* | 76 |
| `controller_drivingDynamics_supervisors_components_aeroControl.reset()` | Remet à zéro les indicateurs et le lisseur. *(interne)* | 83 |
| `controller_drivingDynamics_supervisors_components_aeroControl.sendConfigData()` | Envoie la configuration au CMU (paquet de debug). | 141 |
| `controller_drivingDynamics_supervisors_components_aeroControl.setConfig(configTable)` | Remplace la configuration complète. | 132 |
| `controller_drivingDynamics_supervisors_components_aeroControl.setDebugMode(debugEnabled)` | Active/désactive les paquets de debug. | 70 |
| `controller_drivingDynamics_supervisors_components_aeroControl.setParameters(parameters)` | Applique des paramètres (voir notes) via CMU.applyParameter. | 124 |
| `controller_drivingDynamics_supervisors_components_aeroControl.shutdown()` | Désactive le composant. | 115 |
| `controller_drivingDynamics_supervisors_components_aeroControl.updateGFX(dt)` | Vide (version debug : envoie un paquet d'état au CMU). *(interne)* | 57 |

### Détail des paramètres

#### `controller_drivingDynamics_supervisors_components_aeroControl.actAsTractionControl(wheelGroup, dt)`

Appelé par tractionControl ; ne fait rien (renvoie false, remplacée par nop à l'init).

- `wheelGroup` (*table*) : Groupe de roues.
- `dt` (*number*) : Pas de temps (s).
- **renvoie** : boolean false.

#### `controller_drivingDynamics_supervisors_components_aeroControl.actAsYawControl(measuredYaw, expectedYaw, yawDifference, bodySlipAngle, frontSlipAngle, rearSlipAngle, dt)`

Appelé par yawControl à chaque pas fixe : détecte le survirage via l'angle de dérive de caisse et met à jour electrics.values.yawControlRequestReduceOversteer.

- `measuredYaw` (*number*) : Lacet mesuré (rad/s).
- `expectedYaw` (*number*) : Lacet attendu (rad/s), non utilisé.
- `yawDifference` (*number*) : Écart de lacet, non utilisé.
- `bodySlipAngle` (*number*) : Angle de dérive de caisse ajusté (rad).
- `frontSlipAngle` (*number*) : Angle de dérive avant (rad), non utilisé.
- `rearSlipAngle` (*number*) : Angle de dérive arrière (rad), non utilisé.
- `dt` (*number*) : Pas de temps (s).
- **renvoie** : boolean Vrai si la réduction de survirage est demandée.

#### `controller_drivingDynamics_supervisors_components_aeroControl.getConfig()`

Renvoie une copie de la configuration.

- **renvoie** : table Copie de la configuration.

#### `controller_drivingDynamics_supervisors_components_aeroControl.init(jbeamData)`

Remet à false les indicateurs d'action.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_drivingDynamics_supervisors_components_aeroControl.initLastStage(jbeamData)`

Ne fait rien.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_drivingDynamics_supervisors_components_aeroControl.initSecondStage(jbeamData)`

S'enregistre auprès de yawControl, lit slipAngleThreshold et passe isActive à true.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_drivingDynamics_supervisors_components_aeroControl.registerCMU(cmu)`

Mémorise la référence au CMU.

- `cmu` (*table*) : Contrôleur CMU.

#### `controller_drivingDynamics_supervisors_components_aeroControl.setConfig(configTable)`

Remplace la configuration complète.

- `configTable` (*table*) : Table {yawControl = {isEnabled, slipAngleThreshold}}.

#### `controller_drivingDynamics_supervisors_components_aeroControl.setDebugMode(debugEnabled)`

Active/désactive les paquets de debug.

- `debugEnabled` (*boolean*) : Vrai pour activer.

#### `controller_drivingDynamics_supervisors_components_aeroControl.setParameters(parameters)`

Applique des paramètres (voir notes) via CMU.applyParameter.

- `parameters` (*table<string, any>*) : Ex. {["yawControl.slipAngleThreshold"] = 0.3}.

#### `controller_drivingDynamics_supervisors_components_aeroControl.updateGFX(dt)`

Vide (version debug : envoie un paquet d'état au CMU).

- `dt` (*number*) : Pas de temps graphique (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `actAsABSControl` | function | nop. |
| `componentOrderABSControl` | number | 1000 : jamais utilisé comme ABS. |
| `componentOrderTractionControl` | number | 1000 : jamais utilisé comme antipatinage. |
| `componentOrderYawControl` | number | 30 : ordre d'appel par yawControl. |
| `defaultOrder` | number | Ordre d'exécution par défaut (70). |
| `isActingAsABS` | boolean | Toujours false. |
| `isActingAsTC` | boolean | Toujours false. |
| `isActingAsYC` | boolean | Vrai quand la réduction de survirage est demandée. |
| `isActive` | boolean | Vrai après initSecondStage. |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/drivingDynamics/supervisors/components/aeroControl.lua`.*
