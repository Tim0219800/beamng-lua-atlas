# `controller_drivingDynamics_supervisors_tractionControl`

*Fichier : `lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua` · VM : Véhicule · 264 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `drivingDynamics/supervisors/tractionControl` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Superviseur d'antipatinage (TCS) de la nouvelle architecture drivingDynamics (type "auxiliary", defaultOrder 65). Il ne calcule rien lui-même : à chaque pas fixe, pour chaque groupe de roues (un groupe par moteur listé dans tractionControlledMotors) il demande le glissement à la première slipProvider qui réussit, puis appelle actAsTractionControl de chaque composant enregistré (motorTorqueControl, brakeControl, diffControl, etc.). Il pilote aussi le voyant electrics.values.tcs/tcsActive. Les fournisseurs et composants s'enregistrent eux-mêmes via registerSlipProvider/registerComponent ; le CMU (drivingDynamics) appelle registerCMU.

## Exemple

```lua
-- jbeam (clé lues par le contrôleur) :
-- { "tractionControlledMotors": ["mainEngine"], "velocityOffsetThreshold": 10 }
local tc = controller.getControllerSafe('drivingDynamics/supervisors/tractionControl')
if tc then tc.setParameters({isEnabled = false}) end
```

## Remarques

- Clés jbeam : tractionControlledMotors (liste de noms de dispositifs de powertrain ; toutes leurs roues enfants forment un groupe), velocityOffsetThreshold (défaut 10, en m/s : sous cette vitesse absolue, un décalage de vitesse est ajouté pour éviter de diviser par ~0 dans le calcul du glissement).
- steeringCoef passé aux fournisseurs de glissement = linearScale(|steeringInput|, 0.3, 0.5, 1, 0.5) : réduit la sensibilité quand on braque fort.
- Le voyant est lissé (temporalSmoothing 10/5) : tcsActive n'est vrai que lorsque le lissage atteint 1 ; electrics.values.tcs vaut floor(lissé)*CMU.warningLightPulse (clignotement) et reste à 1 fixe si isEnabled est faux.
- Les composants sont triés par componentOrderTractionControl (ou order), les fournisseurs par providerOrder (ou order), en ordre croissant, dans initLastStage.
- setConfig remplace la table controlParameters sans recréer initialControlParameters ; getConfig renvoie une copie profonde.
- Nécessite que registerCMU ait été appelé avant updateGFX/updateFixedStep (CMU nil sinon).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_drivingDynamics_supervisors_tractionControl.getConfig()` | Renvoie une copie de la configuration courante. | 235 |
| `controller_drivingDynamics_supervisors_tractionControl.init(jbeamData)` | Vide les listes de fournisseurs et composants, lit velocityOffsetThreshold et passe isActive à true. *(interne)* | 137 |
| `controller_drivingDynamics_supervisors_tractionControl.initLastStage(jbeamData)` | Trie fournisseurs de glissement et composants selon leur ordre. *(interne)* | 190 |
| `controller_drivingDynamics_supervisors_tractionControl.initSecondStage(jbeamData)` | Construit les groupes de roues à partir de tractionControlledMotors (powertrain.getDevice / getChildWheels), initialise lissage et glissement par roue, met electrics.values.hasTCS à true et sauvegarde les paramètres initiaux. *(interne)* | 148 |
| `controller_drivingDynamics_supervisors_tractionControl.registerCMU(cmu)` | Mémorise la référence au CMU (accès à virtualSensors, sensorHub, applyParameter, sendDebugPacket). *(interne)* | 112 |
| `controller_drivingDynamics_supervisors_tractionControl.registerComponent(component)` | Ajoute un composant qui doit exposer actAsTractionControl(wheelGroup, dt) et setParameters. *(interne)* | 116 |
| `controller_drivingDynamics_supervisors_tractionControl.registerSlipProvider(slipProvider)` | Ajoute un fournisseur qui doit exposer calculateSlipTractionControl(wheelGroup, steeringCoef, velocityOffset, dt) renvoyant vrai si le glissement a été calculé, et setParameters. *(interne)* | 121 |
| `controller_drivingDynamics_supervisors_tractionControl.reset()` | Remet à zéro le glissement (slip, lastSlip, slipRange) et les lisseurs de toutes les roues. *(interne)* | 126 |
| `controller_drivingDynamics_supervisors_tractionControl.sendConfigData()` | Envoie la configuration au CMU sous forme de paquet de debug (packetType "config"). | 239 |
| `controller_drivingDynamics_supervisors_tractionControl.setConfig(configTable)` | Remplace toute la configuration (controlParameters) et propage isEnabled. | 230 |
| `controller_drivingDynamics_supervisors_tractionControl.setDebugMode(debugEnabled)` | Active/désactive l'envoi de paquets de debug (vitesse de roue, glissement, slipRange) au CMU. | 106 |
| `controller_drivingDynamics_supervisors_tractionControl.setParameters(parameters)` | Modifie velocityOffsetThreshold et/ou isEnabled via CMU.applyParameter ; un changement de isEnabled est propagé aux fournisseurs et composants sous la clé "tractionControl.isEnabled". | 223 |
| `controller_drivingDynamics_supervisors_tractionControl.shutdown()` | Désactive le superviseur (isActive=false, updateGFX et update mis à nil). | 208 |
| `controller_drivingDynamics_supervisors_tractionControl.updateFixedStep(dt)` | Pas fixe : calcule le glissement par groupe via les fournisseurs puis laisse les composants agir ; mémorise si au moins un composant est intervenu. *(interne)* | 42 |
| `controller_drivingDynamics_supervisors_tractionControl.updateGFX(dt)` | Met à jour les valeurs electrics du voyant TCS (remplacé par une version avec paquet de debug si setDebugMode(true)). *(interne)* | 72 |

### Détail des paramètres

#### `controller_drivingDynamics_supervisors_tractionControl.getConfig()`

Renvoie une copie de la configuration courante.

- **renvoie** : table Copie de {isEnabled, velocityOffsetThreshold}.

#### `controller_drivingDynamics_supervisors_tractionControl.init(jbeamData)`

Vide les listes de fournisseurs et composants, lit velocityOffsetThreshold et passe isActive à true.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_drivingDynamics_supervisors_tractionControl.initLastStage(jbeamData)`

Trie fournisseurs de glissement et composants selon leur ordre.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_drivingDynamics_supervisors_tractionControl.initSecondStage(jbeamData)`

Construit les groupes de roues à partir de tractionControlledMotors (powertrain.getDevice / getChildWheels), initialise lissage et glissement par roue, met electrics.values.hasTCS à true et sauvegarde les paramètres initiaux.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_drivingDynamics_supervisors_tractionControl.registerCMU(cmu)`

Mémorise la référence au CMU (accès à virtualSensors, sensorHub, applyParameter, sendDebugPacket).

- `cmu` (*table*) : Contrôleur CMU.

#### `controller_drivingDynamics_supervisors_tractionControl.registerComponent(component)`

Ajoute un composant qui doit exposer actAsTractionControl(wheelGroup, dt) et setParameters.

- `component` (*table*) : Composant de contrôle.

#### `controller_drivingDynamics_supervisors_tractionControl.registerSlipProvider(slipProvider)`

Ajoute un fournisseur qui doit exposer calculateSlipTractionControl(wheelGroup, steeringCoef, velocityOffset, dt) renvoyant vrai si le glissement a été calculé, et setParameters.

- `slipProvider` (*table*) : Fournisseur de glissement.

#### `controller_drivingDynamics_supervisors_tractionControl.setConfig(configTable)`

Remplace toute la configuration (controlParameters) et propage isEnabled.

- `configTable` (*table*) : Table {isEnabled, velocityOffsetThreshold}.

#### `controller_drivingDynamics_supervisors_tractionControl.setDebugMode(debugEnabled)`

Active/désactive l'envoi de paquets de debug (vitesse de roue, glissement, slipRange) au CMU.

- `debugEnabled` (*boolean*) : Vrai pour activer.

#### `controller_drivingDynamics_supervisors_tractionControl.setParameters(parameters)`

Modifie velocityOffsetThreshold et/ou isEnabled via CMU.applyParameter ; un changement de isEnabled est propagé aux fournisseurs et composants sous la clé "tractionControl.isEnabled".

- `parameters` (*table<string, any>*) : Paramètres à appliquer, ex. {isEnabled = false}.

#### `controller_drivingDynamics_supervisors_tractionControl.updateFixedStep(dt)`

Pas fixe : calcule le glissement par groupe via les fournisseurs puis laisse les composants agir ; mémorise si au moins un composant est intervenu.

- `dt` (*number*) : Pas de temps (s).

#### `controller_drivingDynamics_supervisors_tractionControl.updateGFX(dt)`

Met à jour les valeurs electrics du voyant TCS (remplacé par une version avec paquet de debug si setDebugMode(true)).

- `dt` (*number*) : Pas de temps graphique (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultOrder` | number | Ordre d'exécution par défaut (65). |
| `isActing` | boolean | Vrai quand le TCS intervient de façon soutenue (indicateur lissé >= 1). |
| `isActive` | boolean | Vrai après init, faux après shutdown. |
| `tractionControlledWheels` | table | Liste de {wheel = wd de la roue, wheelGroup = groupe}, remplie à initSecondStage. |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua`.*
