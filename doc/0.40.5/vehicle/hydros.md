# `hydros`

*Fichier : `lua/vehicle/hydros.lua` · VM : Véhicule · 790 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `hydros`

Gère les hydros jbeam (poutres/barres de torsion pilotées par une entrée : direction, bennes, grues, etc.) et le retour de force (FFB) du volant. À l'init il lit v.data.hydros (poutres) et v.data.torsionHydros, normalise leurs limites et centre, et sépare les hydros de direction (inputSource 'steering_input') des autres. À chaque pas de physique (update) il déplace chaque hydro vers sa commande (cmd, lue dans electrics.values via inputFlex) avec des taux inRate/outRate ; pour le volant physique, la position du volant pilote la direction et la force mesurée sur les poutres de direction est renvoyée au matériel (FFBcalc : lissage, compression, amortissement, butée logicielle « softlock »). Fournit aussi un volant virtuel pour les tests (enableVirtualWheel).

## Exemple

```lua
-- lire la force de volant normalisée (-1..1)
local f = hydros.forceAtWheelNorm
-- couper le FFB matériel temporairement
hydros.enableFFB = false
hydros.setFFBConfig({forceCoef = 80, smoothing = 40})
```

## Remarques

- UNITÉS/ÉCHELLES : FFmax = 10 (force maximale interne du pilote FFB). forceAtDriver est dans [-10, 10] ; forceAtDriverNorm et forceAtWheelNorm = valeur / 10 ; curForceLimit croît de 0 à wheelFFBForceLimit en quelques secondes après spawn/reset/pause (anti-pic), curForceLimitNorm = curForceLimit / 10. Les descriptions de champs générées automatiquement dans la page d'extraction sont décalées d'un cran ; les définitions ci-dessous sont celles du code.
- Chaque hydro (table dans M.hydros) reçoit à l'init : bcid (cid de la poutre ou de la barre), fIsBroken/fgetDisplacement/fsetRelDisplacement (fonctions obj adaptées poutre ou barre de torsion), center, multOut/multIn/cOut/cIn (conversion entrée -> état), cmd (commande), state (position -1..1 environ), _inrate/_outrate (par pas de physique), smoothrate. Clés jbeam utilisées : beamCID/cid, inputSource (ex. 'throttle', 'steering' -> normalisé en 'steering_input'), inputFactor, inputCenter, inputInLimit, inputOutLimit, inLimit, outLimit, inRate, outRate, autoCenterRate, analogue, forceLimit, steeringWheelLock, steeringAutocenterEnabled, lowspeedCoefFFB.
- Le mécanisme inputFlex permet à un hydro avec forceLimit de « céder » : si la contrainte de la poutre dépasse forceLimit, l'entrée source est décalée pour limiter l'effort (hystérésis).
- Le hook d'extension onFFBConfigChanged(config) est appelé par le moteur quand les périphériques FFB changent (périphériques steering / accelerate / brake). Il choisit FFBID, la fréquence d'envoi (30 Hz mini, jusqu'à 400 Hz par heuristique sur ffbSendms, ou la fréquence utilisateur plafonnée), la courbe de réponse corrigée (responseCurve), le mode vibration manette, et appelle input_haptics.
- Les mises à jour FFB sont limitées en temps réel (horloge murale os.clockhp) à FFBperiod (1/200 s par défaut), pas en temps simulé ; enableFFBflood supprime cette limite (debug).
- Bug repéré : sendHydroStateToGUI envoie `M.state` qui n'est défini nulle part dans ce fichier (nil). Le champ torqueCurrent n'est défini qu'après onFFBConfigChanged (valeur ffbParams.torqueCurrent ou 100).
- M.update et M.updateGFX sont remplacés par nop si le véhicule n'a aucun hydro (init/reset). isPhysicsStepUsed() renvoie vrai seulement quand update n'est pas nop (utilisé par main.lua).
- Un champ optionnel M.testHook(dtSim, simWheelPos, hydroPos) peut être défini par des outils de test (ex. ffbCalibration) pour intercepter le calcul FFB.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `hydros.debugDraw()` | Appelée par main.lua:onDebugDraw. Réinitialise le lisseur FFB quand le temps réel d'image est aberrant (moins de 10 fps ou à l'arrêt) pour éviter des pics. *(interne)* | 288 |
| `hydros.destroy()` | Appelée à la suppression du véhicule (main.lua:onDespawnObject) : coupe toutes les interfaces FFB (force 0). *(interne)* | 731 |
| `hydros.enableVirtualWheel(isEnabled, wheelAngleFun, sendForceFun)` | Active ou désactive un volant virtuel (simulation logicielle d'un volant FFB) : active FFB avec FFBID 0, remplace la fonction d'envoi de force et celle de lecture d'angle. | 116 |
| `hydros.getAngleFunction()` | Renvoie la fonction qui donne l'angle de volant actuel : celle du volant virtuel si activé, sinon une fonction lisant electrics.values.steering_input. | 761 |
| `hydros.getFFBConfig()` | Renvoie la configuration FFB courante. | 488 |
| `hydros.getFFBID()` | Renvoie l'identifiant du périphérique FFB de direction (-1 si aucun). | 753 |
| `hydros.getForceFeedbackFunction()` | Renvoie la fonction d'envoi de force courante (obj.sendForceFeedback, ou celle du volant virtuel). | 749 |
| `hydros.init()` | Prépare les hydros à partir de v.data.hydros et v.data.torsionHydros : calcul des multiplicateurs/centres, répartition direction / autres, inputFlex, coefficient FFB du véhicule (v.data.input.FFBcoef x 1.2), initialisation des haptiques, puis reset(). Appelée par main.lua (initSystems). *(interne)* | 603 |
| `hydros.isPhysicsStepUsed()` | Indique si hydros a besoin du pas de physique (update actif). *(interne)* | 745 |
| `hydros.onFFBConfigChanged(newFFBConfig)` | Hook appelé quand la configuration des périphériques FFB change : coupe les interfaces, relit steering/accelerate/brake, choisit FFBID, force, lissage, softlock, courbe de réponse, fréquence d'envoi et configure input_haptics. *(interne)* *(hook)* | 513 |
| `hydros.reset()` | Remet les états des hydros au centre, réinitialise lisseurs FFB et volant virtuel, coupe les interfaces FFB ; réactive update/updateGFX s'il y a des hydros (sinon nop). *(interne)* | 701 |
| `hydros.resetFFBSmoother()` | Remet à 0 le lisseur de force FFB et la limite de force (anti-pic). | 203 |
| `hydros.sendHydroStateToGUI()` | Envoie guihooks.trigger('HydrosUpdate', M.state) ; M.state n'est jamais défini dans ce fichier (voir notes). *(interne)* | 735 |
| `hydros.sendRPMLeds(currentRPM, rpmFirstLedTurnsOn, rpmRedLine)` | Envoie au périphérique FFB les LED de régime (obj:sendRPMLeds) si FFBID est valide et deviceLightingMode vaut 'default'. | 739 |
| `hydros.setExternalForce(force)` | Ajoute une force externe au calcul du FFB au volant (avant le coefficient de force). | 134 |
| `hydros.setFFBConfig(ffbParams)` | Met à jour des paramètres FFB à chaud (seuls les champs fournis sont modifiés) puis coupe les interfaces FFB. | 498 |
| `hydros.update(dtSim)` | Pas de physique (main.lua:onPhysicsStep, après controller.update). Avance chaque hydro vers sa commande ; pour les hydros de direction avec FFB actif, suit la position du volant réel et lance le calcul FFB (FFBcalc). *(interne)* | 418 |
| `hydros.updateGFX(dt)` | Frame graphique (après extensions et electrics, avant powertrain). Met à jour le volant virtuel, l'inputFlex, les commandes (cmd) et taux de lissage, le modèle de mouvement du volant pour le FFB, la limite de force, le coefficient de force selon la vitesse, et electrics.values.steering (angle en degrés). *(interne)* | 293 |

### Détail des paramètres

#### `hydros.enableVirtualWheel(isEnabled, wheelAngleFun, sendForceFun)`

Active ou désactive un volant virtuel (simulation logicielle d'un volant FFB) : active FFB avec FFBID 0, remplace la fonction d'envoi de force et celle de lecture d'angle.

- `isEnabled` (*boolean|nil*) : true (par défaut si nil) pour activer.
- `wheelAngleFun` (*function|nil*) : Fonction renvoyant l'angle de volant -1..1 (volant virtuel par défaut).
- `sendForceFun` (*function|nil*) : Fonction d'envoi de force (o, FFBID, torque, dampCoef, inertia, friction) ; virtualSendForceFeedback par défaut.

#### `hydros.getAngleFunction()`

Renvoie la fonction qui donne l'angle de volant actuel : celle du volant virtuel si activé, sinon une fonction lisant electrics.values.steering_input.

- **renvoie** : function Fonction sans argument renvoyant l'angle.

#### `hydros.getFFBConfig()`

Renvoie la configuration FFB courante.

- **renvoie** : table {forceCoef, softlockForce, smoothing, gforceCoef, wheelFFBDampLimit}.

#### `hydros.getFFBID()`

Renvoie l'identifiant du périphérique FFB de direction (-1 si aucun).

- **renvoie** : integer FFBID (>= 0 valide).

#### `hydros.getForceFeedbackFunction()`

Renvoie la fonction d'envoi de force courante (obj.sendForceFeedback, ou celle du volant virtuel).

- **renvoie** : function Fonction sendForceFeedback(obj, FFBID, force, ...).

#### `hydros.isPhysicsStepUsed()`

Indique si hydros a besoin du pas de physique (update actif).

- **renvoie** : boolean true si M.update ~= nop.

#### `hydros.onFFBConfigChanged(newFFBConfig)`

Hook appelé quand la configuration des périphériques FFB change : coupe les interfaces, relit steering/accelerate/brake, choisit FFBID, force, lissage, softlock, courbe de réponse, fréquence d'envoi et configure input_haptics.

- `newFFBConfig` (*table|nil*) : Config {steering = {FFBID, ffbParams, ffbSendms}, accelerate = {FFBID}, brake = {FFBID}} ; nil pour désactiver.

#### `hydros.sendRPMLeds(currentRPM, rpmFirstLedTurnsOn, rpmRedLine)`

Envoie au périphérique FFB les LED de régime (obj:sendRPMLeds) si FFBID est valide et deviceLightingMode vaut 'default'.

- `currentRPM` (*number*) : Régime moteur courant.
- `rpmFirstLedTurnsOn` (*number*) : Régime d'allumage de la première LED.
- `rpmRedLine` (*number*) : Régime de la zone rouge.

#### `hydros.setExternalForce(force)`

Ajoute une force externe au calcul du FFB au volant (avant le coefficient de force).

- `force` (*number*) : Force externe (même échelle que le déplacement de volant).

#### `hydros.setFFBConfig(ffbParams)`

Met à jour des paramètres FFB à chaud (seuls les champs fournis sont modifiés) puis coupe les interfaces FFB.

- `ffbParams` (*table*) : Champs possibles : forceCoef, softlockForce (0..1), smoothing, gforceCoef, enableThrottleForceFeedback, enableBrakeForceFeedback, deviceLightingMode, wheelFFBDampLimit.

#### `hydros.update(dtSim)`

Pas de physique (main.lua:onPhysicsStep, après controller.update). Avance chaque hydro vers sa commande ; pour les hydros de direction avec FFB actif, suit la position du volant réel et lance le calcul FFB (FFBcalc).

- `dtSim` (*number*) : Pas de physique en secondes.

#### `hydros.updateGFX(dt)`

Frame graphique (après extensions et electrics, avant powertrain). Met à jour le volant virtuel, l'inputFlex, les commandes (cmd) et taux de lissage, le modèle de mouvement du volant pour le FFB, la limite de force, le coefficient de force selon la vitesse, et electrics.values.steering (angle en degrés).

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `GforceCoef` | number | Coefficient d'effet des forces G latérales (sensors.gx) sur la force du volant (défaut 0). |
| `curForceLimit` | number | Limite de force courante (préventeur de pics) : repart de 0 après spawn/reload/pause et grimpe jusqu'à wheelFFBForceLimit. |
| `curForceLimitNorm` | number | curForceLimit / FFmax. |
| `deviceLightingMode` | string | Configuration d'éclairage du périphérique ('off' par défaut ; 'default' active l'envoi des LED de régime). |
| `enableBrakeForceFeedback` | boolean | Active le retour de force du frein en mode vibration de manette (défaut true). |
| `enableFFB` | boolean | true par défaut ; mis à false les requêtes réelles vers le matériel FFB sont ignorées (les calculs continuent). |
| `enableFFBflood` | boolean | false par défaut ; true = ignore les contrôles de temps et envoie à ~2 kHz (debug uniquement : sature les pilotes). |
| `enableThrottleForceFeedback` | boolean | Active le retour de force de l'accélérateur en mode vibration de manette (défaut true). |
| `enableVibration` | boolean | false par défaut ; true en mode vibration (manette), le FFB volant est alors désactivé (FFBHydrosExist = false). |
| `ffbSpeedFast` | number | Vitesse (m/s) au-delà de laquelle la force FFB atteint son coefficient normal (5 / 3.6). |
| `forceAtDriver` | number | Force envoyée au pilote matériel dans [-FFmax, FFmax]. |
| `forceAtDriverNorm` | number | Force envoyée au pilote matériel, normalisée. |
| `forceAtWheelNorm` | number | Force mesurée au volant, normalisée (force / FFmax). |
| `hydros` | table[] | Liste de tous les hydros (poutres puis barres de torsion) avec leurs champs calculés. |
| `wheelFFBForceCoef` | number | Coefficient de force FFB à vitesse normale (défaut 100). |
| `wheelFFBForceCoefCurrent` | number | Coefficient courant, interpolé entre bas régime et normal selon la vitesse (ffbSpeedFast), 0 quand l'IA conduit. |
| `wheelFFBForceCoefLowSpeed` | number | Coefficient de force aux vitesses de parking (initialement = wheelFFBForceCoef ; = forceCoef/10 si lowspeedCoef). |
| `wheelFFBForceCompressionCoef` | number | Part de la limite à partir de laquelle la force est comprimée (0..1, défaut 0.9). |
| `wheelFFBForceLimit` | number | Limite de force FFB stable (échelle 0..FFmax = 10). |
| `wheelPowerSteeringCoef` | number | Coefficient de direction assistée (défaut 1) appliqué au déplacement de volant dans la force FFB. |

**Évènements UI (guihooks.trigger) :** `HydrosUpdate`

## Appels vers le moteur (C++)

- `obj:` `getBeamRefLength`, `getBeamStress`, `getId`, `getRealdt`, `sendRPMLeds`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/hydros.lua`.*
