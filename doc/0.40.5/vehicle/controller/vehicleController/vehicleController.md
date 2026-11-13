# `controller_vehicleController_vehicleController`

*Fichier : `lua/vehicle/controller/vehicleController/vehicleController.lua` · VM : Véhicule · 1261 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `vehicleController/vehicleController` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur principal (type "main", defaultOrder 500) du véhicule. Il lit les entrées du conducteur (input.throttle/brake/clutch, ou les overrides electrics), charge le module de logique de boîte (dossier shiftLogic/, choisi par le type du device « gearbox » ou par la clé jbeam shiftLogicName), gère le mode de boîte arcade/realistic, le calcul d'agressivité de conduite, la prévention de passage de rapport sur glissement/saut, le frein de parking intelligent, la limite de vitesse, et publie plus de 30 valeurs dans electrics.values (throttle, brake, clutch, gear, rpm, fuel, engineRunning…). Un moddeur s'en sert via controller.mainController pour changer de rapport, de mode de boîte, couper l'allumage ou limiter la vitesse.

## Exemple

```lua
local vc = controller.mainController
vc.setGearboxMode("realistic")
vc.shiftUpOnDown()
vc.setTopSpeedLimitTemporary(20) -- m/s
vc.setTopSpeedLimitTemporaryActive(true)
```

## Remarques

- Clés jbeam lues dans init : arcadeAutoBrakeAmount (0.3), smartParkingBrakeActiveUponSpawn (true), gearboxDecisionSmoothingDown (2) / gearboxDecisionSmoothingUp (5), wheelSlipShiftUpSmoothingIn (10) / Out (20), aggressionSmoothingUp (1.5) / aggressionSmoothingDown (0.15), useSmartAggressionCalculation (true), topSpeedLimit (-1) et topSpeedLimitReverse (-1) en m/s (<=0 : pas de limite), wheelSlipUpThreshold (20000) / wheelSlipDownThreshold (30000), shiftPreventionSlipEnabled (true), shiftPreventionJumpEnabled (true), lowShiftDownRPM / highShiftDownRPM / lowShiftUpRPM / highShiftUpRPM (nombre ou tableau par rapport ; défauts 2000/3500/2500/5000), calculateOptimalLoadShiftPoints et shiftDownRPMOffsetCoef (1.3), transmissionShiftDelay (0.2), transmissionGearChangeDelay (0.5), neutralSelectionDelay (0.5), aggressionHoldOffThrottleDelay (2.25), revMatchExpired (1), shiftLogicName.
- Les points de passage sont stockés en vitesse angulaire (rad/s) en interne : rpm x 0.104719755. Les valeurs envoyées à l'UI (shiftDecisionData) sont reconverties en tr/min.
- Le module de boîte est chargé depuis controller/vehicleController/shiftLogic/<nom>, avec repli sur l'ancien chemin controller/shiftLogic-<nom> (log D « legacy »). Sans device « gearbox », le module « dummy » est utilisé.
- Les deux champs M.updateGFX et M.setDefaultForwardMode sont initialisés avec `nop` : il s'agit vraisemblablement d'un global fourni par le moteur (non défini dans ce fichier). updateGFX est remplacé par updateGFXGeneric dans init/reset ; setDefaultForwardMode est remplacé par celui du module de boîte (peut donc valoir nil si le module ne le définit pas).
- M.gearboxBehavior vaut nil à la création et n'est renseigné qu'après le premier setGearboxBehavior (appelé en fin d'init).
- updateGFX applique aussi la limite de vitesse : M.throttle est multiplié par (1 - sortie PID) quand wheelspeed dépasse la limite ; en marche arrière (nom de rapport commençant par « R ») c'est topSpeedLimitReverse.
- Quand le gel est actif (setFreeze(1)) est actif, M.brake est forcé à 1 et la boîte est verrouillée (gearbox:setLock).
- Incohérence mineure : smartParkingBrake appelle input.event("parkingbrake") quand electrics.values.wheelspeed est nil puis continue quand même et fait abs(speed) sur nil (erreur probable) ; il manque un return après le premier input.event.
- Valeurs d'electrics.values écrites à chaque frame : fuel, lowfuel, fuelCapacity, fuelVolume, throttle, brake, clutch (= 1 - clutchRatio), clutchRatio, isShifting, gear, gear_A, gearModeIndex, gearIndex, minGearIndex, maxGearIndex, rpm, idlerpm, maxrpm, oiltemp, watertemp, checkengine, ignition, running, engineThrottle, engineLoad, engineRunning, radiatorFanSpin, smoothShiftLogicAV, gearboxMode, freezeState.
- Streams GUI alimentés si demandés : engineInfo (tableau de 21 valeurs), gearboxData, shiftDecisionData.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_vehicleController_vehicleController.changeTopSpeedLimitTemporary(change)` | Ajoute une valeur à la limite temporaire (nil compte pour 0). | 163 |
| `controller_vehicleController_vehicleController.cycleGearboxModes()` | Passe au mode de boîte suivant dans la liste {"arcade", "realistic"} (avec bouclage) et affiche un message. | 670 |
| `controller_vehicleController_vehicleController.getState()` | Renvoie l'état compact du contrôleur pour la synchronisation : grb_bhv (mode de boîte), frzn (gelé), fusionné avec getState du module de boîte. | 1202 |
| `controller_vehicleController_vehicleController.init(jbeamData)` | Initialise le contrôleur : lit les clés jbeam, crée les lisseurs, calcule les points de passage, charge et initialise le module shiftLogic, enregistre le menu rapide « mode de boîte » et fixe le mode de boîte initial (précédent, réglage defaultGearboxBehavior, sinon arcade). Appelé par le moteur au chargement du véhicule. *(interne)* | 957 |
| `controller_vehicleController_vehicleController.initLastStage()` | Appelé après l'init de tous les contrôleurs : applique le frein de parking au spawn si autorisé. *(interne)* | 1169 |
| `controller_vehicleController_vehicleController.onDeserialize(data)` | Hook de chargement : restaure le mode de boîte, les données du module de boîte, puis réapplique le frein de parking. *(interne)* *(hook)* | 1181 |
| `controller_vehicleController_vehicleController.onSerialize()` | Hook de sauvegarde : renvoie {previousGearboxBehavior, controlLogicModuleData} (données du module de boîte si elle a onSerialize). *(interne)* *(hook)* | 1191 |
| `controller_vehicleController_vehicleController.reset(jbeamData)` | Remet à zéro timers, lisseurs, PID, état de frein de parking et réinitialise le module de boîte ; réapplique le mode de boîte. Appelé au reset du véhicule. *(interne)* | 863 |
| `controller_vehicleController_vehicleController.resetLastStage(jbeamData)` | Appelé en dernier au reset : réapplique le frein de parking de spawn et annule le démarrage automatique. *(interne)* | 951 |
| `controller_vehicleController_vehicleController.sendTorqueData()` | Demande au module de boîte d'envoyer les courbes de couple à l'UI ; ignoré si aucun joueur principal n'est assis. | 719 |
| `controller_vehicleController_vehicleController.setAggressionOverride(aggression)` | Force l'agressivité de conduite (0..1) utilisée par les points de passage ; nil rend la main au calcul automatique. | 175 |
| `controller_vehicleController_vehicleController.setEngineIgnition(enabled)` | Coupe ou allume l'allumage du moteur (engine:setIgnition 1/0) ou, sans moteur, appelle setIgnition du module de boîte. | 711 |
| `controller_vehicleController_vehicleController.setFreeze(mode)` | Gèle le véhicule : frein forcé à 1 et boîte verrouillée si mode == 1. | 704 |
| `controller_vehicleController_vehicleController.setGearboxMode(behavior)` | Définit le mode de boîte. Inconnu : log d'erreur et sans effet. Affiche un message, puis notifie le module (gearboxBehaviorChanged). | 189 |
| `controller_vehicleController_vehicleController.setStarter(enabled)` | Actionne ou coupe le démarreur du moteur principal ; ne s'active que si le régime est inférieur à 80% de starterMaxAV. | 694 |
| `controller_vehicleController_vehicleController.setState(data)` | Applique un état produit par getState (mode de boîte, gel, puis état du module de boîte). | 1211 |
| `controller_vehicleController_vehicleController.setTopSpeedLimitTemporary(speedLimit)` | Définit la limite de vitesse temporaire. Elle n'agit que si setTopSpeedLimitTemporaryActive(true). | 159 |
| `controller_vehicleController_vehicleController.setTopSpeedLimitTemporaryActive(active)` | Active ou désactive la limite de vitesse temporaire (remise à false au reset). | 167 |
| `controller_vehicleController_vehicleController.settingsChanged()` | Hook appelé quand les réglages utilisateur changent : relit autoClutch, autoThrottle, gearboxSafety et defaultGearboxBehavior (applique ce dernier au véhicule du joueur). *(interne)* | 773 |
| `controller_vehicleController_vehicleController.shiftDownOnDown()` | Rétrograde à l'appui de la touche : shiftDownOnDown du module, sinon shiftDown. | 652 |
| `controller_vehicleController_vehicleController.shiftDownOnUp()` | Relâchement de la touche de rétrogradage : shiftDownOnUp du module s'il existe. API obligatoire du contrôleur principal. | 660 |
| `controller_vehicleController_vehicleController.shiftToGearIndex(index)` | Passe directement au rapport d'index donné (négatif = marche arrière, 0 = point mort) en déléguant au module de boîte. | 666 |
| `controller_vehicleController_vehicleController.shiftUpOnDown()` | Passe au rapport supérieur à l'appui de la touche : appelle shiftUpOnDown du module de boîte, sinon shiftUp. | 639 |
| `controller_vehicleController_vehicleController.shiftUpOnUp()` | Relâchement de la touche de rapport supérieur : appelle shiftUpOnUp du module s'il existe. | 646 |
| `controller_vehicleController_vehicleController.smartParkingBrake(ivalue, filter, isAxisOverride)` | Entrée du frein à main « intelligente » : si le véhicule roule (> 2.8 m/s), dérape (glissement cumulé > 10000) ou si l'entrée est un axe, relaie l'événement parkingbrake tel quel (frein temporaire) ; sinon, à l'arrêt, un appui bascule le frein de parking, et un relâchement avec frein serré active le mode smartParkingBrakeActive (relâché dès que l'on accélère). | 432 |
| `controller_vehicleController_vehicleController.toggleTopSpeedLimitTemporaryActive()` | Bascule l'activation de la limite temporaire. | 171 |
| `controller_vehicleController_vehicleController.vehicleActivated()` | Hook appelé quand le véhicule devient actif : renvoie à l'UI les données de points de passage (ShiftPointDebugDataChanged) si un joueur est assis. *(interne)* | 1173 |

### Détail des paramètres

#### `controller_vehicleController_vehicleController.changeTopSpeedLimitTemporary(change)`

Ajoute une valeur à la limite temporaire (nil compte pour 0).

- `change` (*number*) : Variation en m/s.

#### `controller_vehicleController_vehicleController.getState()`

Renvoie l'état compact du contrôleur pour la synchronisation : grb_bhv (mode de boîte), frzn (gelé), fusionné avec getState du module de boîte.

- **renvoie** : table|nil Table d'état, nil si vide.

#### `controller_vehicleController_vehicleController.init(jbeamData)`

Initialise le contrôleur : lit les clés jbeam, crée les lisseurs, calcule les points de passage, charge et initialise le module shiftLogic, enregistre le menu rapide « mode de boîte » et fixe le mode de boîte initial (précédent, réglage defaultGearboxBehavior, sinon arcade). Appelé par le moteur au chargement du véhicule.

- `jbeamData` (*table*) : Données jbeam du contrôleur (voir notes pour les clés).

#### `controller_vehicleController_vehicleController.onDeserialize(data)`

Hook de chargement : restaure le mode de boîte, les données du module de boîte, puis réapplique le frein de parking.

- `data` (*table*) : Table produite par onSerialize.

#### `controller_vehicleController_vehicleController.onSerialize()`

Hook de sauvegarde : renvoie {previousGearboxBehavior, controlLogicModuleData} (données du module de boîte si elle a onSerialize).

- **renvoie** : table Données à sérialiser.

#### `controller_vehicleController_vehicleController.reset(jbeamData)`

Remet à zéro timers, lisseurs, PID, état de frein de parking et réinitialise le module de boîte ; réapplique le mode de boîte. Appelé au reset du véhicule.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_vehicleController_vehicleController.resetLastStage(jbeamData)`

Appelé en dernier au reset : réapplique le frein de parking de spawn et annule le démarrage automatique.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_vehicleController_vehicleController.setAggressionOverride(aggression)`

Force l'agressivité de conduite (0..1) utilisée par les points de passage ; nil rend la main au calcul automatique.

- `aggression` (*number|nil*) : Valeur imposée ou nil.

#### `controller_vehicleController_vehicleController.setEngineIgnition(enabled)`

Coupe ou allume l'allumage du moteur (engine:setIgnition 1/0) ou, sans moteur, appelle setIgnition du module de boîte.

- `enabled` (*boolean*) : Allumage actif ?

#### `controller_vehicleController_vehicleController.setFreeze(mode)`

Gèle le véhicule : frein forcé à 1 et boîte verrouillée si mode == 1.

- `mode` (*integer*) : 1 pour geler, autre valeur pour libérer.

#### `controller_vehicleController_vehicleController.setGearboxMode(behavior)`

Définit le mode de boîte. Inconnu : log d'erreur et sans effet. Affiche un message, puis notifie le module (gearboxBehaviorChanged).

- `behavior` (*string*) : "arcade" ou "realistic".

#### `controller_vehicleController_vehicleController.setStarter(enabled)`

Actionne ou coupe le démarreur du moteur principal ; ne s'active que si le régime est inférieur à 80% de starterMaxAV.

- `enabled` (*boolean*) : Démarreur actif ?

#### `controller_vehicleController_vehicleController.setState(data)`

Applique un état produit par getState (mode de boîte, gel, puis état du module de boîte).

- `data` (*table*) : Table avec grb_bhv, frzn et clés du module de boîte.

#### `controller_vehicleController_vehicleController.setTopSpeedLimitTemporary(speedLimit)`

Définit la limite de vitesse temporaire. Elle n'agit que si setTopSpeedLimitTemporaryActive(true).

- `speedLimit` (*number|nil*) : Limite en m/s.

#### `controller_vehicleController_vehicleController.setTopSpeedLimitTemporaryActive(active)`

Active ou désactive la limite de vitesse temporaire (remise à false au reset).

- `active` (*boolean*) : Activer ?

#### `controller_vehicleController_vehicleController.shiftToGearIndex(index)`

Passe directement au rapport d'index donné (négatif = marche arrière, 0 = point mort) en déléguant au module de boîte.

- `index` (*integer*) : Index de rapport.

#### `controller_vehicleController_vehicleController.smartParkingBrake(ivalue, filter, isAxisOverride)`

Entrée du frein à main « intelligente » : si le véhicule roule (> 2.8 m/s), dérape (glissement cumulé > 10000) ou si l'entrée est un axe, relaie l'événement parkingbrake tel quel (frein temporaire) ; sinon, à l'arrêt, un appui bascule le frein de parking, et un relâchement avec frein serré active le mode smartParkingBrakeActive (relâché dès que l'on accélère).

- `ivalue` (*number*) : Valeur de l'entrée (0..1).
- `filter` (*integer|nil*) : Filtre d'entrée (FILTER_*), FILTER_DIRECT par défaut.
- `isAxisOverride` (*boolean|nil*) : Force le traitement comme axe (true) ou touche (false), p. ex. pour les freins pneumatiques.

## Champs

| Champ | Type | Description |
|---|---|---|
| `brake` | number | Frein final (0..1) décidé par la logique de boîte (forcé à 1 si le véhicule est gelé). |
| `clutchRatio` | number | Taux d'embrayage (1 = embrayé, 0 = débrayé) fourni par la logique de boîte. electrics.values.clutch vaut 1 - clutchRatio. |
| `defaultOrder` | number | Ordre d'exécution par défaut du contrôleur (500). |
| `drivingAggression` | number | Agressivité de conduite lissée (0..1) qui interpole les points de passage bas/haut ; peut être forcée par setAggressionOverride. |
| `engineInfo` | table | Tableau de 21 valeurs envoyé au stream « engineInfo » : [1] ralenti tr/min, [2] max tr/min, [5] rpm, [6] nom du rapport, [7] maxGearIndex, [8] minGearIndex, [9] couple volant, [10] couple boîte, [11] vitesse sol, [12] volume carburant, [13] capacité, [14] "manual", [15] id objet, [17] gearIndex, [18] moteur tournant, [19] charge, [20] couple roues, [21] puissance roues en ch (x0.001x1.35962), [22] puissance moteur en ch. |
| `fireEngineTemperature` | number | Température d'échappement du moteur (engine.thermals.exhaustTemperature) ou température ambiante si pas de thermique. Mis à jour chaque frame. |
| `gearboxBehavior` | string|nil | Mode de boîte courant, "arcade" ou "realistic" ; nil avant le premier setGearboxBehavior. |
| `isArcadeSwitched` | boolean | Vrai quand le mode arcade a inversé les rôles accélérateur/frein (marche arrière automatique). Reporté depuis la logique de boîte. |
| `setDefaultForwardMode` | function|nil | Délégué vers la fonction du même nom du module de boîte (change le sens par défaut avant). Vaut `nop` ou nil si le module ne la fournit pas. |
| `shiftingAggression` | number | Agressivité de passage de rapport reportée par le module de boîte (0 si absent). |
| `throttle` | number | Accélérateur final (0..1) décidé par la logique de boîte, après limite de vitesse. |
| `type` | string | Toujours "main" : contrôleur principal obligatoire du véhicule. |
| `updateGFX` | function | Boucle graphique, remplacée par updateGFXGeneric(dt) à l'init (nop avant). |

## Classe `sharedFunctions`

Table d'utilitaires passée en second argument à init du module shiftLogic (controlLogicModule.init(jbeamData, sharedFunctions)). Non exposée dans M.

| Méthode | Description | Ligne |
|---|---|---|
| `sharedFunctions.getEnergyStorages(engines)` | Liste les noms de réservoirs des moteurs dont le type d'énergie correspond à requiredEnergyType. | 274 |
| `sharedFunctions.getShiftPoints()` | Renvoie la table des points de passage par index de rapport (lowShiftDownAV, highShiftDownAV, lowShiftUpAV, highShiftUpAV en rad/s). | 225 |
| `sharedFunctions.selectShiftPoints(gearIndex)` | Choisit les régimes (rad/s) de passage haut/bas du rapport en interpolant entre les valeurs low et high selon le carré de l'agressivité normalisée ; écrit shiftBehavior.shiftUpAV/shiftDownAV et le fournit au module. | 215 |
| `sharedFunctions.switchToRealisticBehavior(gearIndex)` | Affiche le message « utilisation du levier en H », passe en mode realistic et sélectionne le rapport demandé. | 229 |
| `sharedFunctions.updateAvgAVDeviceCategory(deviceCategory)` | Moyenne des outputAV1 de tous les devices d'une catégorie. Même piège de division par zéro. | 264 |
| `sharedFunctions.updateAvgAVDeviceType(deviceType)` | Moyenne des outputAV1 de tous les devices d'un type. Piège : division par zéro (NaN) s'il n'y a aucun device. | 254 |
| `sharedFunctions.updateAvgAVSingleDevice(deviceName, deviceProperty)` | Renvoie une vitesse angulaire d'un device du powertrain (0 si absent). | 248 |
| `sharedFunctions.warnCannotShiftSequential()` | Envoie à l'UI un message « impossible de passer en séquentiel » avec une action pour basculer le mode de boîte. | 235 |

**Évènements UI (guihooks.trigger) :** `Message`, `ShiftPointDebugDataChanged`

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `obj:` `getEnvTemperature`, `getGroundSpeed`, `getId`, `queueGameEngineLua`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/vehicleController/vehicleController.lua`.*
