# `controller_drivingDynamics_supervisors_yawControl`

*Fichier : `lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua` · VM : Véhicule · 230 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `drivingDynamics/supervisors/yawControl` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Superviseur de contrôle de lacet (ESC moderne, type "auxiliary", defaultOrder 60) de l'architecture drivingDynamics. À chaque pas fixe il demande le lacet attendu à la première yawProvider qui répond (ex. STMEstimate), le compare au lacet mesuré (sensorHub.yawAVSmooth), calcule l'écart et les angles de dérive avant/arrière, puis appelle actAsYawControl de chaque composant enregistré (brakeControl, motorTorqueControl, awdControl…). Il pilote le voyant electrics.values.esc/escActive.

## Exemple

```lua
local yc = controller.getControllerSafe('drivingDynamics/supervisors/yawControl')
if yc then yc.setParameters({isEnabled = false}) end
```

## Remarques

- Signature appelée sur chaque composant : actAsYawControl(measuredYaw, expectedYaw, yawDifferenceAdjusted, bodySlipAngleAdjusted, frontSlipAngle, rearSlipAngle, dt) ; doit renvoyer vrai si le composant est intervenu.
- Les fournisseurs de lacet doivent exposer calculateExpectedYaw(speed, dt) (renvoie nil s'ils ne peuvent pas répondre) et setParameters. Le lacet est en rad/s, les angles de dérive en rad, la vitesse en m/s.
- Si le lacet mesuré et le lacet attendu sont de signes opposés (contre-braquage), le lacet attendu est inversé. yawDifferenceRaw = (mesuré - attendu) * signe(mesuré) : positif = survirage, négatif = sous-virage.
- bodySlipAngleAdjusted = angle de dérive de caisse * coefficient de confiance (linearScale 0.5..0.8 de trustWorthiness.bodySlipAngle) * coefficient basse vitesse (s'annule sous 8..10 m/s). Les angles avant/arrière sont calculés seulement si la vitesse utilisée dépasse 1 m/s, sinon 0.
- Le voyant est lissé ; electrics.values.esc reste à 1 fixe si isEnabled est faux. Contrairement à tractionControl, shutdown met aussi updateFixedStep à nil.
- init remplace controlParameters par {isEnabled = true}. Il n'y a aucune clé jbeam lue dans ce fichier (le superviseur n'utilise pas jbeamData).
- Les composants sont triés par componentOrderYawControl (ou order), les fournisseurs par providerOrder (ou order).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_drivingDynamics_supervisors_yawControl.getConfig()` | Renvoie une copie de la configuration. | 201 |
| `controller_drivingDynamics_supervisors_yawControl.init(jbeamData)` | Réinitialise paramètres, fournisseurs et composants et met isActive à true. *(interne)* | 139 |
| `controller_drivingDynamics_supervisors_yawControl.initLastStage(jbeamData)` | Trie fournisseurs et composants selon leur ordre. *(interne)* | 156 |
| `controller_drivingDynamics_supervisors_yawControl.initSecondStage(jbeamData)` | Met electrics.values.hasESC à true et sauvegarde les paramètres initiaux. *(interne)* | 150 |
| `controller_drivingDynamics_supervisors_yawControl.registerCMU(cmu)` | Mémorise la référence au CMU (virtualSensors, vehicleData, sensorHub, sendDebugPacket, applyParameter, warningLightPulse). *(interne)* | 122 |
| `controller_drivingDynamics_supervisors_yawControl.registerComponent(component)` | Ajoute un composant exposant actAsYawControl. *(interne)* | 131 |
| `controller_drivingDynamics_supervisors_yawControl.registerYawProvider(yawProvider)` | Ajoute un fournisseur de lacet attendu. *(interne)* | 126 |
| `controller_drivingDynamics_supervisors_yawControl.reset()` | Ne fait rien. *(interne)* | 136 |
| `controller_drivingDynamics_supervisors_yawControl.sendConfigData()` | Envoie la configuration au CMU (paquet de debug "config"). | 205 |
| `controller_drivingDynamics_supervisors_yawControl.setConfig(configTable)` | Remplace la configuration et propage isEnabled. | 196 |
| `controller_drivingDynamics_supervisors_yawControl.setDebugMode(debugEnabled)` | Active/désactive l'envoi de paquets de debug (écarts de lacet, angles de dérive, vitesse utilisée) au CMU. | 116 |
| `controller_drivingDynamics_supervisors_yawControl.setParameters(parameters)` | Modifie isEnabled via CMU.applyParameter ; propagé aux fournisseurs (clé "isEnabled") et aux composants (clé "yawControl.isEnabled"). | 190 |
| `controller_drivingDynamics_supervisors_yawControl.shutdown()` | Désactive le superviseur (isActive=false, updateGFX, update et updateFixedStep à nil). | 174 |
| `controller_drivingDynamics_supervisors_yawControl.updateFixedStep(dt)` | Pas fixe : calcule lacet attendu, écart, angles de dérive, puis appelle les composants. *(interne)* | 43 |
| `controller_drivingDynamics_supervisors_yawControl.updateGFX(dt)` | Met à jour electrics.values.esc et escActive depuis l'état lissé (remplacé par une version avec paquet de debug si setDebugMode(true)). *(interne)* | 91 |

### Détail des paramètres

#### `controller_drivingDynamics_supervisors_yawControl.getConfig()`

Renvoie une copie de la configuration.

- **renvoie** : table Copie de {isEnabled}.

#### `controller_drivingDynamics_supervisors_yawControl.init(jbeamData)`

Réinitialise paramètres, fournisseurs et composants et met isActive à true.

- `jbeamData` (*table*) : Données jbeam (inutilisées).

#### `controller_drivingDynamics_supervisors_yawControl.initLastStage(jbeamData)`

Trie fournisseurs et composants selon leur ordre.

- `jbeamData` (*table*) : Données jbeam (inutilisées).

#### `controller_drivingDynamics_supervisors_yawControl.initSecondStage(jbeamData)`

Met electrics.values.hasESC à true et sauvegarde les paramètres initiaux.

- `jbeamData` (*table*) : Données jbeam (inutilisées).

#### `controller_drivingDynamics_supervisors_yawControl.registerCMU(cmu)`

Mémorise la référence au CMU (virtualSensors, vehicleData, sensorHub, sendDebugPacket, applyParameter, warningLightPulse).

- `cmu` (*table*) : Contrôleur CMU.

#### `controller_drivingDynamics_supervisors_yawControl.registerComponent(component)`

Ajoute un composant exposant actAsYawControl.

- `component` (*table*) : Composant de contrôle.

#### `controller_drivingDynamics_supervisors_yawControl.registerYawProvider(yawProvider)`

Ajoute un fournisseur de lacet attendu.

- `yawProvider` (*table*) : Fournisseur exposant calculateExpectedYaw.

#### `controller_drivingDynamics_supervisors_yawControl.setConfig(configTable)`

Remplace la configuration et propage isEnabled.

- `configTable` (*table*) : Table {isEnabled}.

#### `controller_drivingDynamics_supervisors_yawControl.setDebugMode(debugEnabled)`

Active/désactive l'envoi de paquets de debug (écarts de lacet, angles de dérive, vitesse utilisée) au CMU.

- `debugEnabled` (*boolean*) : Vrai pour activer.

#### `controller_drivingDynamics_supervisors_yawControl.setParameters(parameters)`

Modifie isEnabled via CMU.applyParameter ; propagé aux fournisseurs (clé "isEnabled") et aux composants (clé "yawControl.isEnabled").

- `parameters` (*table<string, any>*) : Ex. {isEnabled = false}.

#### `controller_drivingDynamics_supervisors_yawControl.updateFixedStep(dt)`

Pas fixe : calcule lacet attendu, écart, angles de dérive, puis appelle les composants.

- `dt` (*number*) : Pas de temps (s).

#### `controller_drivingDynamics_supervisors_yawControl.updateGFX(dt)`

Met à jour electrics.values.esc et escActive depuis l'état lissé (remplacé par une version avec paquet de debug si setDebugMode(true)).

- `dt` (*number*) : Pas de temps graphique (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultOrder` | number | Ordre d'exécution par défaut (60). |
| `isActing` | boolean | Vrai quand le contrôle de lacet intervient de façon soutenue (indicateur lissé >= 1). |
| `isActive` | boolean | Vrai après init, faux après shutdown. |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua`.*
