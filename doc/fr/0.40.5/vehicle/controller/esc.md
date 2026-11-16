# `controller_esc`

*Fichier : `lua/vehicle/controller/esc.lua` · VM : Véhicule · 1106 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `esc` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire (type "auxiliary", defaultOrder 50) qui implémente le contrôle de stabilité (ESC) et l'antipatinage (TCS) de la voiture. L'ESC compare le taux de lacet mesuré à un taux de lacet désiré (calculé depuis l'angle des roues avant, la vitesse, une vitesse caractéristique et une accélération latérale max) et freine une roue pour corriger survirage ou sous-virage. Le TCS compare la vitesse de chaque roue motrice à celle de la roue diagonale et réduit la poussée du moteur (facteurs d'accélérateur écrits dans electrics.values) et/ou freine la roue qui patine. Un moddeur s'en sert en déclarant le contrôleur dans le jbeam avec un bloc de configurations, ou le pilote par ses fonctions de mode (toggleESCMode, setESCMode). Il écrit electrics.values.esc, tcs, escActive, tcsActive, hasESC, hasTCS et un ou plusieurs facteurs d'accélérateur (par défaut electrics.values.throttleFactor), qui doivent être lus par le moteur/l'accélérateur pour que le TCS agisse.

## Exemple

```lua
local esc = controller.getControllerSafe('esc')
if esc then
  esc.setESCMode(1)       -- 1 = première configuration triée par 'order'
  esc.toggleESCMode()    -- configuration suivante (revient à 1 après la dernière)
  esc.pauseESCAction = true -- suspend l'action de l'ESC et du TCS
end
```

## Remarques

- Clés jbeam lues (jbeamData, table de configuration) : actionedWheels (liste de noms de roues, obligatoire, 4 roues attendues : avant/arrière gauche/droite déduites de leur position), offColor (couleur LED éteinte, défaut "343434"), throttleFactorAssingment (table d'en-tête wheelName/throttleFactorName ; l'orthographe « Assingment » est celle du code ; défaut : un facteur "throttleFactor" pour toutes les roues), defaultConfig (index de la configuration par défaut, 1 sinon), isDebugMode (nombre ; le code compare isDebugMode > 0 sans valeur par défaut, donc nil provoquerait une erreur), blacklistedEngines (liste de noms de moteurs exclus de la limitation temporaire du régime), configurations (table nom -> configuration).
- Clés d'une configuration (seulement celles avec escConfigurationEnabled vrai sont gardées, triées par le champ order croissant) : escEnabled (false par défaut), activeColor ("98FB00"), characteristicSpeed (0 = calculée depuis skewStiffnessFront/Rear et la géométrie), proportionalFactor (1), integralFactor (0), maxIntegralPart (2), maxSideAcceleration (0), brakeForceMultiplier (0), escThreshold (999), skewStiffnessFront/Rear (1), desiredYawRateSmoothing (500), slipThreshold (0), tcsWheelSpeedThreshold (10), throttleProportionalFactor (1.5), throttleIntegralFactor (1), throttleIntegralReductionFactor (2*slipThreshold), brakingProportionalFactor (1.2), brakingIntegralFactor (0), maxBrakingFactor (0, borné 0..1), minThrottleFactor (1, borné 0..1), brakeThrottleSwitchThreshold (10), overrideESCPulse/overrideTCSPulse (force la valeur de electrics.values.esc/tcs).
- Les réglages utilisateur v.userSettings.escConfig sont fusionnés récursivement dans la configuration au initSecondStage.
- L'ESC n'agit que si la vitesse dépasse 6 m/s (escEnableThreshold) et si l'écart de lacet dépasse escThreshold ; les valeurs de lacet sont en rad/s, la vitesse en m/s. Le TCS est désactivé si vitesse < 0.55 m/s ou accélérateur < 0.01 (sauf pendant un changement de rapport), ou si pauseESCAction est vrai.
- L'ESC est totalement désactivé en marche arrière (electrics.values.gearIndex < 0) ou si escEnabled est faux dans la configuration courante : les facteurs d'accélérateur sont remis à 1.
- Si le nombre de roues change (roue arrachée), escFailure passe à true : updateWheelsIntermediate est remplacé par nop, les voyants esc et tcs restent allumés (1) et les modes ne sont plus modifiables jusqu'au prochain initSecondStage (reset du véhicule).
- En cas de roue actionnée introuvable, initSecondStage met M.update et M.graphicsStep à nop (noms qui ne sont pas ceux utilisés par le contrôleur, qui n'a que updateWheelsIntermediate/updateGFX) et sort sans définir updateGFX : probable incohérence du code du jeu.
- Les champs M.stiffnessFront/Rear, calibrationMeasurementReady, calibrationSettled, doMeasure, doSettle servent à une procédure interne de calibration (startESCCalibration) ; M.wheelAngleFront/Rear sont l'angle réel des roues avant/arrière en rad (signe positif = virage à gauche).
- Hook : updateWheelsIntermediate(dt) est appelé par la boucle des contrôleurs après la mise à jour des roues ; updateGFX(dt) est appelé à chaque image graphique. Les deux sont à nil tant que initSecondStage n'a pas réussi.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_esc.deserialize(data)` | Restaure la configuration à partir de serialize(). | 1062 |
| `controller_esc.getCarData()` | Renvoie la géométrie calculée du véhicule, ou nil si la masse est nulle. | 621 |
| `controller_esc.getCurrentConfigData()` | Renvoie la table de la configuration ESC courante (champs sanitisés, avec name). | 640 |
| `controller_esc.getState()` | Renvoie la table d'état (clé "<nomContrôleur>ConfigKey" = indice courant) pour la sauvegarde/synchronisation du véhicule. | 1068 |
| `controller_esc.init(jbeamData)` | Mémorise les données jbeam, crée la table d'état pour la sauvegarde et réinitialise la couleur de LED. Appelé par le chargement des contrôleurs. *(interne)* | 820 |
| `controller_esc.initSecondStage()` | Construit les caches de roues, identifie par géométrie les roues avant/arrière gauche/droite, charge et trie les configurations, calcule empattement, répartition de masse, vitesse caractéristique, enregistre l'entrée du menu radial et installe updateWheelsIntermediate et updateGFX. Appelé après l'init de tous les contrôleurs. *(interne)* | 828 |
| `controller_esc.nextESCMode()` | Passe à la configuration suivante, sans boucler (reste sur la dernière). | 715 |
| `controller_esc.previousESCMode()` | Passe à la configuration précédente, sans boucler (reste sur la première). | 720 |
| `controller_esc.serialize()` | Renvoie l'état à sauvegarder : l'indice de configuration courant. | 1058 |
| `controller_esc.setESCMode(key, silent)` | Active la configuration d'indice key (retombe à 1 si key dépasse le nombre de configurations), recalcule les valeurs précalculées et affiche un message d'interface sauf si silent. Ne fait rien si le véhicule n'a pas d'ESC ou a perdu une roue. | 684 |
| `controller_esc.setState(data)` | Applique un état renvoyé par getState si l'indice est un entier valide et différent de l'actuel (sans message). | 1075 |
| `controller_esc.startESCCalibration()` | Remet à zéro les compteurs et résultats de calibration puis active le calcul de rigidité de dérive à chaque pas (à utiliser avec doMeasure/doSettle). | 603 |
| `controller_esc.stopESCCalibration()` | Désactive le calcul de calibration. | 617 |
| `controller_esc.toggleESCMode()` | Passe à la configuration ESC suivante ; après la dernière, revient à la première. Appelé par le bouton de l'interface. | 709 |
| `controller_esc.updateGFX(dt)` | Fait clignoter les voyants esc/tcs (période 0.15 s quand actifs), écrit electrics.values.esc/tcs/escActive/tcsActive et remplit debugData. Défini dynamiquement par initSecondStage. (assignée dynamiquement) *(interne)* | dyn |
| `controller_esc.updateSimpleControlButtons()` | Force la (re)création du bouton « ESC & TC » dans le panneau de contrôle simplifié du groupe motopropulseur (ui_simplePowertrainControl), avec la couleur de la configuration courante. | 147 |
| `controller_esc.updateWheelsIntermediate(dt)` | Boucle ESC + TCS + décision à chaque pas physique (voir notes du module). Défini dynamiquement par initSecondStage. (assignée dynamiquement) *(interne)* | dyn |

### Détail des paramètres

#### `controller_esc.deserialize(data)`

Restaure la configuration à partir de serialize().

- `data` (*table|nil*) : Table renvoyée par serialize.

#### `controller_esc.getCarData()`

Renvoie la géométrie calculée du véhicule, ou nil si la masse est nulle.

- **renvoie** : table|nil {wheels, frontLeftWheelId, frontRightWheelId, rearLeftWheelId, rearRightWheelId, wheelBase (m), trackWidth (m), distanceCOGRearAxle (m), distanceCOGFrontAxle (m), mass (kg)}

#### `controller_esc.getCurrentConfigData()`

Renvoie la table de la configuration ESC courante (champs sanitisés, avec name).

- **renvoie** : table|nil Configuration courante ; nil si pas d'ESC.

#### `controller_esc.getState()`

Renvoie la table d'état (clé "<nomContrôleur>ConfigKey" = indice courant) pour la sauvegarde/synchronisation du véhicule.

- **renvoie** : table Table d'état partagée (réutilisée).

#### `controller_esc.init(jbeamData)`

Mémorise les données jbeam, crée la table d'état pour la sauvegarde et réinitialise la couleur de LED. Appelé par le chargement des contrôleurs.

- `jbeamData` (*table*) : Données du contrôleur dans le jbeam (voir notes).

#### `controller_esc.serialize()`

Renvoie l'état à sauvegarder : l'indice de configuration courant.

- **renvoie** : table {escConfigKey = integer}

#### `controller_esc.setESCMode(key, silent)`

Active la configuration d'indice key (retombe à 1 si key dépasse le nombre de configurations), recalcule les valeurs précalculées et affiche un message d'interface sauf si silent. Ne fait rien si le véhicule n'a pas d'ESC ou a perdu une roue.

- `key` (*integer*) : Indice 1..n dans la liste de configurations triée par order.
- `silent` (*boolean|nil*) : Si vrai, pas de message guihooks.

#### `controller_esc.setState(data)`

Applique un état renvoyé par getState si l'indice est un entier valide et différent de l'actuel (sans message).

- `data` (*table|nil*) : Table d'état.

#### `controller_esc.updateGFX(dt)`

Fait clignoter les voyants esc/tcs (période 0.15 s quand actifs), écrit electrics.values.esc/tcs/escActive/tcsActive et remplit debugData. Défini dynamiquement par initSecondStage. (assignée dynamiquement)

- `dt` (*number*) : Pas de temps graphique en secondes.

#### `controller_esc.updateWheelsIntermediate(dt)`

Boucle ESC + TCS + décision à chaque pas physique (voir notes du module). Défini dynamiquement par initSecondStage. (assignée dynamiquement)

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `calibrationMeasurementReady` | boolean | Vrai quand la mesure de rigidité de calibration est terminée. |
| `calibrationSettled` | boolean | Vrai quand la phase de stabilisation de la calibration est terminée. |
| `debugData` | table | Données pour l'appli de debug : debugData.esc (steeringAngle, yawRate, desiredYawRate, difference, desiredYawRateAcceleration, desiredYawRateSteering, speed) et debugData.tcs (wheelBrakeFactors, wheelSlips, slipThreshold, throttleFactors, allWheelSlips). Seuls yawRate, desiredYawRate, difference et les champs tcs sont mis à jour ; steeringAngle, desiredYawRateAcceleration/Steering et speed restent à 0. |
| `defaultOrder` | number | Ordre d'exécution par défaut du contrôleur (50). |
| `doMeasure` | boolean | À mettre à true pour lancer la phase de mesure de la calibration (3500 pas) ; repasse à false à la fin. |
| `doSettle` | boolean | À mettre à true pour lancer la phase de stabilisation de la calibration (1500 pas) ; repasse à false à la fin. |
| `isExisting` | boolean | Toujours true : sert de marqueur indiquant qu'un ESC existe. |
| `pauseESCAction` | boolean | Si vrai, l'ESC ne freine plus et le TCS est traité comme désactivé. Remis à false à initSecondStage. |
| `stiffnessFront` | number | Rigidité de dérive moyenne estimée de l'essieu avant par la calibration. |
| `stiffnessRear` | number | Rigidité de dérive moyenne estimée de l'essieu arrière par la calibration. |
| `type` | string | Toujours "auxiliary". |
| `wheelAngleFront` | number | Angle de braquage réel des roues avant (rad), mis à jour à chaque pas. |
| `wheelAngleRear` | number | Angle de braquage réel des roues arrière (rad), mis à jour à chaque pas. |

## Appels vers le moteur (C++)

- `obj:` `calcBeamStats`, `getDirectionVector`, `getVelocity`, `getYawAngularVelocity`, `nodeLength`, `nodeVecPlanarCosRightForward`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/esc.lua`.*
