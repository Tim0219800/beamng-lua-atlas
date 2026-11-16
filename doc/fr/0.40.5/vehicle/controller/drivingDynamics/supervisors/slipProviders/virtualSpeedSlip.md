# `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip`

*Fichier : `lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua` · VM : Véhicule · 173 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `drivingDynamics/supervisors/slipProviders/virtualSpeedSlip` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Fournisseur de glissement (type "auxiliary", defaultOrder 70, providerOrder 10) qui compare la vitesse de chaque roue à la vitesse virtuelle du véhicule (virtualSensors.virtual.speed) pour estimer le glissement. Il s'enregistre auprès des superviseurs tractionControl et absControl (si présents) et leur répond via calculateSlipTractionControl et calculateSlipABSControl. Les résultats sont écrits dans les structures de roue du superviseur (wheelData.slip, wheelGroup.maxSlip/minSlip/slipRange).

## Remarques

- Glissement de traction = clamp((vitesseRoue + offset) / (vitesseVirtuelle + offset) - 1, 0, 0.5) * coefficient, lissé par wheelData.slipSmoother. Le coefficient est le minimum de : coefficient de couple (throttle du moteur, 0..0.01 -> 0..1), steeringCoef du superviseur, et la confiance de virtualSpeed (0.5..0.8 -> 0..1). La vitesse de roue est corrigée par vehicleData.turningCircleSpeedRatios.
- Glissement d'ABS = valeur absolue de (rapport - 1) bornée à 0.5, multipliée par la confiance de vitesse, aussi lissée.
- Paramètres modifiables : tractionControl.isEnabled, absControl.isEnabled. Quand le traction control est désactivé, les glissements sont remis à 0 et calculateSlipTractionControl renvoie false (le fournisseur suivant est alors essayé).
- Aucune clé jbeam n'est lue. Le fournisseur dépend de CMU.virtualSensors et CMU.vehicleData.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.calculateSlipABSControl(wheelData, velocityOffset, dt)` | Calcule le glissement (en valeur absolue) d'une seule roue pour l'ABS. Appelé par le superviseur absControl. | 65 |
| `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.calculateSlipTractionControl(wheelGroup, steeringCoef, velocityOffset, dt)` | Calcule le glissement de chaque roue d'un groupe motorisé et les extrêmes du groupe. Appelé par tractionControl. | 27 |
| `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.getConfig()` | Renvoie une copie de la configuration. | 144 |
| `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.init(jbeamData)` | Passe isActive à true. *(interne)* | 109 |
| `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.initLastStage(jbeamData)` | Sauvegarde les paramètres initiaux. *(interne)* | 125 |
| `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.initSecondStage(jbeamData)` | S'enregistre comme fournisseur de glissement auprès de tractionControl et absControl. *(interne)* | 113 |
| `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.registerCMU(cmu)` | Mémorise la référence au CMU. *(interne)* | 102 |
| `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.reset()` | Ne fait rien. *(interne)* | 106 |
| `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.sendConfigData()` | Envoie la configuration au CMU. | 148 |
| `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.setConfig(configTable)` | Remplace la configuration. | 140 |
| `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.setDebugMode(debugEnabled)` | Active/désactive les paquets de debug. | 96 |
| `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.setParameters(parameters)` | Applique tractionControl.isEnabled et absControl.isEnabled. | 135 |
| `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.shutdown()` | Désactive le fournisseur. | 129 |
| `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.updateGFX(dt)` | Vide (version debug : envoie l'état d'activation). *(interne)* | 84 |

### Détail des paramètres

#### `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.calculateSlipABSControl(wheelData, velocityOffset, dt)`

Calcule le glissement (en valeur absolue) d'une seule roue pour l'ABS. Appelé par le superviseur absControl.

- `wheelData` (*table*) : Données de roue {wd, slip, slipSmoother}.
- `velocityOffset` (*number*) : Décalage de vitesse (m/s).
- `dt` (*number*) : Pas de temps (s), non utilisé.
- **renvoie** : boolean Vrai si le glissement a été calculé, false si désactivé.

#### `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.calculateSlipTractionControl(wheelGroup, steeringCoef, velocityOffset, dt)`

Calcule le glissement de chaque roue d'un groupe motorisé et les extrêmes du groupe. Appelé par tractionControl.

- `wheelGroup` (*table*) : Groupe de roues {motor, wheels, wheelCount, maxSlip, minSlip, slipRange}.
- `steeringCoef` (*number*) : Facteur 0.5..1 lié au braquage.
- `velocityOffset` (*number*) : Décalage de vitesse (m/s) évitant la division par ~0 à basse vitesse.
- `dt` (*number*) : Pas de temps (s), non utilisé.
- **renvoie** : boolean Vrai si le glissement a été calculé, false si désactivé.

#### `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.getConfig()`

Renvoie une copie de la configuration.

- **renvoie** : table Copie.

#### `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.init(jbeamData)`

Passe isActive à true.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.initLastStage(jbeamData)`

Sauvegarde les paramètres initiaux.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.initSecondStage(jbeamData)`

S'enregistre comme fournisseur de glissement auprès de tractionControl et absControl.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.registerCMU(cmu)`

Mémorise la référence au CMU.

- `cmu` (*table*) : Contrôleur CMU.

#### `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.setConfig(configTable)`

Remplace la configuration.

- `configTable` (*table*) : Table {tractionControl = {isEnabled}, absControl = {isEnabled}}.

#### `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.setDebugMode(debugEnabled)`

Active/désactive les paquets de debug.

- `debugEnabled` (*boolean*) : Vrai pour activer.

#### `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.setParameters(parameters)`

Applique tractionControl.isEnabled et absControl.isEnabled.

- `parameters` (*table<string, any>*) : Paramètres à appliquer.

#### `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.updateGFX(dt)`

Vide (version debug : envoie l'état d'activation).

- `dt` (*number*) : Pas de temps graphique (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultOrder` | number | Ordre d'exécution par défaut (70). |
| `isActive` | boolean | Vrai après init. |
| `providerOrder` | number | Ordre de priorité parmi les fournisseurs (10, plus petit = essayé en premier). |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua`.*
