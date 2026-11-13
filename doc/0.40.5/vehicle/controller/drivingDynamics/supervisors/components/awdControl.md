# `controller_drivingDynamics_supervisors_components_awdControl`

*Fichier : `lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua` · VM : Véhicule · 206 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `drivingDynamics/supervisors/components/awdControl` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Composant de contrôle de lacet pour les transmissions intégrales à verrouillage électronique (type "auxiliary", defaultOrder 70). Il s'enregistre auprès de tractionControl (ordre 10, mais n'y fait rien) et de yawControl (ordre 20). Sous accélération, s'il détecte du survirage via l'angle de dérive de caisse, il règle overrideMin/overrideMax de l'actionneur de verrouillage (par défaut "electronicSplitShaftLock") pour répartir le couple entre essieux avant/arrière selon le mode (rearMain, frontMain, centerDiff).

## Remarques

- Clés jbeam : awdActuatorName (défaut "electronicSplitShaftLock", nom d'un actionneur CMU), controlMode ("rearMain" par défaut, "frontMain" ou "centerDiff" ; centerDiff réutilise rearMain), slipAngleThreshold (défaut 0.2 rad).
- Si l'actionneur est introuvable, actAsTractionControl et actAsYawControl sont remplacées par nop et le composant ne s'enregistre nulle part.
- actAsYawControl renvoie toujours false volontairement, pour ne pas faire s'allumer le voyant ESC (trop intrusif pour le contrôle AWD) ; l'état réel est dans isActingAsYC.
- Mode rearMain : overrideMin monte de 0 à 1 quand l'angle de dérive corrigé passe de 0 à slipAngleThreshold ; mode frontMain : overrideMax descend de 1 à 0. La détection du sous-virage n'est pas implémentée (commentaire « todo » dans le code).
- Paramètres modifiables via setParameters : tractionControl, tractionControl.isEnabled, yawControl, yawControl.isEnabled, yawControl.slipAngleThreshold, controlMode.
- Le contrôle n'agit que si electrics.values.throttle > 0.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_drivingDynamics_supervisors_components_awdControl.actAsTractionControl(wheelGroup, dt)` | Appelé par tractionControl ; ne fait rien et renvoie false. *(interne)* | 35 |
| `controller_drivingDynamics_supervisors_components_awdControl.actAsYawControl(measuredYaw, expectedYaw, yawDifference, bodySlipAngle, frontSlipAngle, rearSlipAngle, dt)` | Appelé par yawControl : réinitialise puis calcule les bornes overrideMin/overrideMax de l'actionneur de verrouillage à partir de l'angle de dérive de caisse (survirage sous accélération seulement). *(interne)* | 54 |
| `controller_drivingDynamics_supervisors_components_awdControl.getConfig()` | Renvoie une copie de la configuration. | 176 |
| `controller_drivingDynamics_supervisors_components_awdControl.init(jbeamData)` | Remet à false les indicateurs. *(interne)* | 114 |
| `controller_drivingDynamics_supervisors_components_awdControl.initLastStage(jbeamData)` | Ne fait rien. *(interne)* | 147 |
| `controller_drivingDynamics_supervisors_components_awdControl.initSecondStage(jbeamData)` | Cherche l'actionneur AWD, s'enregistre auprès des superviseurs et lit controlMode et slipAngleThreshold. *(interne)* | 120 |
| `controller_drivingDynamics_supervisors_components_awdControl.registerCMU(cmu)` | Mémorise la référence au CMU. *(interne)* | 94 |
| `controller_drivingDynamics_supervisors_components_awdControl.reset()` | Remet à false les indicateurs. *(interne)* | 108 |
| `controller_drivingDynamics_supervisors_components_awdControl.sendConfigData()` | Envoie la configuration au CMU (paquet de debug). | 180 |
| `controller_drivingDynamics_supervisors_components_awdControl.setConfig(configTable)` | Remplace la configuration complète. | 171 |
| `controller_drivingDynamics_supervisors_components_awdControl.setDebugMode(debugEnabled)` | Active/désactive les paquets de debug. | 88 |
| `controller_drivingDynamics_supervisors_components_awdControl.setParameters(parameters)` | Applique des paramètres (voir notes) et recalcule la méthode de contrôle selon controlMode. | 159 |
| `controller_drivingDynamics_supervisors_components_awdControl.shutdown()` | Désactive le composant. | 150 |
| `controller_drivingDynamics_supervisors_components_awdControl.updateGFX(dt)` | Vide (version debug : envoie un paquet d'état). *(interne)* | 75 |

### Détail des paramètres

#### `controller_drivingDynamics_supervisors_components_awdControl.actAsTractionControl(wheelGroup, dt)`

Appelé par tractionControl ; ne fait rien et renvoie false.

- `wheelGroup` (*table*) : Groupe de roues.
- `dt` (*number*) : Pas de temps (s).
- **renvoie** : boolean false.

#### `controller_drivingDynamics_supervisors_components_awdControl.actAsYawControl(measuredYaw, expectedYaw, yawDifference, bodySlipAngle, frontSlipAngle, rearSlipAngle, dt)`

Appelé par yawControl : réinitialise puis calcule les bornes overrideMin/overrideMax de l'actionneur de verrouillage à partir de l'angle de dérive de caisse (survirage sous accélération seulement).

- `measuredYaw` (*number*) : Lacet mesuré (rad/s).
- `expectedYaw` (*number*) : Lacet attendu, non utilisé.
- `yawDifference` (*number*) : Écart de lacet, non utilisé.
- `bodySlipAngle` (*number*) : Angle de dérive de caisse ajusté (rad).
- `frontSlipAngle` (*number*) : Non utilisé.
- `rearSlipAngle` (*number*) : Non utilisé.
- `dt` (*number*) : Pas de temps (s).
- **renvoie** : boolean Toujours false (voir notes).

#### `controller_drivingDynamics_supervisors_components_awdControl.getConfig()`

Renvoie une copie de la configuration.

- **renvoie** : table Copie de la configuration.

#### `controller_drivingDynamics_supervisors_components_awdControl.init(jbeamData)`

Remet à false les indicateurs.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_drivingDynamics_supervisors_components_awdControl.initLastStage(jbeamData)`

Ne fait rien.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_drivingDynamics_supervisors_components_awdControl.initSecondStage(jbeamData)`

Cherche l'actionneur AWD, s'enregistre auprès des superviseurs et lit controlMode et slipAngleThreshold.

- `jbeamData` (*table*) : Données jbeam (voir notes).

#### `controller_drivingDynamics_supervisors_components_awdControl.registerCMU(cmu)`

Mémorise la référence au CMU.

- `cmu` (*table*) : Contrôleur CMU.

#### `controller_drivingDynamics_supervisors_components_awdControl.setConfig(configTable)`

Remplace la configuration complète.

- `configTable` (*table*) : Table {tractionControl, yawControl, controlMode}.

#### `controller_drivingDynamics_supervisors_components_awdControl.setDebugMode(debugEnabled)`

Active/désactive les paquets de debug.

- `debugEnabled` (*boolean*) : Vrai pour activer.

#### `controller_drivingDynamics_supervisors_components_awdControl.setParameters(parameters)`

Applique des paramètres (voir notes) et recalcule la méthode de contrôle selon controlMode.

- `parameters` (*table<string, any>*) : Paramètres à appliquer.

#### `controller_drivingDynamics_supervisors_components_awdControl.updateGFX(dt)`

Vide (version debug : envoie un paquet d'état).

- `dt` (*number*) : Pas de temps graphique (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `actAsABSControl` | function | nop. |
| `componentOrderABSControl` | number | 1000 : inutilisé. |
| `componentOrderTractionControl` | number | 10. |
| `componentOrderYawControl` | number | 20. |
| `defaultOrder` | number | Ordre d'exécution par défaut (70). |
| `isActingAsABS` | boolean | Toujours false. |
| `isActingAsTC` | boolean | Toujours false. |
| `isActingAsYC` | boolean | Vrai quand un override de verrouillage est appliqué. |
| `isActive` | boolean | Vrai après initSecondStage. |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/drivingDynamics/supervisors/components/awdControl.lua`.*
