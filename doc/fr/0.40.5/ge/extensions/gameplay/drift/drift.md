# `gameplay_drift_drift`

*Fichier : `lua/ge/extensions/gameplay/drift/drift.lua` · VM : Game Engine (GE) · 1206 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drift_drift` : `extensions.load("gameplay_drift_drift")`, puis la globale `gameplay_drift_drift`

Moteur de détection du drift. Pour chaque véhicule suivi (un état par vehId, le véhicule du joueur 0 est suivi automatiquement), calcule à chaque frame l'angle de dérive, le survirage, la vitesse, la distance aux murs (raycasts avant/arrière), les crashs et spinouts, et décide si le véhicule drifte. Gère les structures driftActiveData (drift en cours) et driftChainActiveData (chaîne de drifts) et émet les hooks onDriftChainStarted, onDriftStatusChanged, onDriftTransition, onDriftActiveDataFinished, onDriftCompleted, onDriftCrash et onDriftSpinout que consomment scoring, display, quickMessages, statistics, etc. C'est le module à lire pour savoir si le joueur drifte et avec quel angle.

## Exemple

```lua
if gameplay_drift_drift.getIsDrifting() then
  local d = gameplay_drift_drift.getDriftActiveData()
  print(d.currDegAngle, gameplay_drift_drift.getAirSpeed())
end
```

## Remarques

- Condition de drift (isDrifting) : survirage détecté, pas de marche arrière « cheesing » (angle > 120° avec accélération lissée > -0.07), minAngle (7°) < angle < maxAngle (165°), vitesse moyenne des points de référence > minAirSpeed (4 km/h), pas en mode marche, véhicule au sol, pas de cooldown d'échec (1.65 s), pas de timer de reset (0.1 s), pas de crash en cours.
- Unités : angles en degrés ; getAirSpeed et kphAirSpeed en km/h (vel * 3.6) ; getVehVel renvoie la DIRECTION normalisée de la vitesse (velDir), pas la vitesse ; distances en mètres.
- Une chaîne de drifts se termine (hook onDriftCompleted) quand le temps de confirmation s'écoule sans drift et que le score en cache est > 0 ; ce temps va de 1.2 s (combo <= 5) à 2.25 s (combo >= 20). Les zones de cascade remettent ce temps au maximum.
- Les fonctions get* sans vehId utilisent le véhicule du joueur 0 s'il est suivi, sinon n'importe quel véhicule suivi ; avec un vehId inconnu elles renvoient nil/false/0.
- Crash : onVehicleCrashStarted marque le véhicule comme crashé seulement si son score en cache est > 0 ; le hook onDriftCrash est émis 0.3 s plus tard. Spinout : vitesse < 1.5 km/h avec angle > 110° après un drift avec score en cache > 0.
- Les murs sont détectés avec castRayStatic sur wallDetectionLength = 3 m, depuis l'avant et l'arrière du véhicule, avec un bruit bleu pour balayer la largeur ; les valeurs sont closestWallDistanceFront/Rear dans driftActiveData.
- driftActiveData : {driftDuration, driftDistance, closestWallDistanceFront/Rear, currDegAngle, direction ("left"/"right"), totalDriftAngle, totalDriftTime, angleVelocity, startPos, lastPos, score, totalAngles, totalSpeeds, totalPerformanceFactors, totalSteps, ...}. driftChainActiveData : {totalDriftDistance, totalDriftTime, rightDrifts, leftDrifts, chainedDrifts, currentCircleDrift = {totalAngle}}.
- Pas de détection pendant le tutoriel firstDrive, en marche à pied, en pause, quand dtSim <= 0, ni en multiseat hors contexte inSplitscreen.
- simulateADrift(data) (debug audio) force angle, vitesse, distance au mur et crash simulé ; passer nil arrête la simulation.
- Le champ driftDuration de driftActiveData n'est jamais mis à jour (reste 0) : utiliser totalDriftTime ou getCurrentDriftDuration.
- getVehCorners renvoie une nouvelle table de 4 vec3 partagés (réutilisés à chaque frame, ne pas les modifier).

**Dépendances (chargées avant) :** `gameplay_walk`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drift_drift.addTrackedVehicle(vehId, opts)` | Ajoute un véhicule au suivi de drift (crée son état) et renvoie cet état. Avec opts.playerId, associe le véhicule à un joueur et retire tout autre véhicule suivi pour ce même joueur. | 873 |
| `gameplay_drift_drift.doesPlHaveVeh(vehId)` | Indique si le véhicule suivi a des données de map valides. | 1000 |
| `gameplay_drift_drift.getAirSpeed(vehId)` | Renvoie la vitesse du véhicule en km/h (norme de la vitesse * 3.6). | 920 |
| `gameplay_drift_drift.getAngleDiff(vehId)` | Renvoie la variation d'angle de la direction de vitesse depuis la frame précédente (degrés), calculée pendant un drift. | 962 |
| `gameplay_drift_drift.getCurrDegAngleSigned(vehId)` | Renvoie l'angle de dérive actuel en degrés, signé (le signe donne le côté). | 950 |
| `gameplay_drift_drift.getCurrDriftCompletedTime(vehId)` | Renvoie la fraction (0..1) restante du temps de confirmation de la chaîne de drifts (1 = le drift vient d'avoir lieu, 0 = confirmé). | 956 |
| `gameplay_drift_drift.getCurrentDriftDuration(vehId)` | Renvoie la durée du drift en cours (totalDriftTime), 0 s'il ne drifte pas. | 972 |
| `gameplay_drift_drift.getDistSinceLastFrame(vehId)` | Renvoie la distance parcourue depuis la frame précédente, en mètres. | 967 |
| `gameplay_drift_drift.getDriftActiveData(vehId)` | Renvoie les données du drift en cours (nil s'il n'y en a pas). | 900 |
| `gameplay_drift_drift.getDriftChainActiveData(vehId)` | Renvoie les données de la chaîne de drifts en cours (nil si aucune). | 905 |
| `gameplay_drift_drift.getDriftChainChainedDrifts(vehId)` | Renvoie le nombre de drifts enchaînés dans la chaîne en cours. | 910 |
| `gameplay_drift_drift.getDriftDebugInfo()` | Renvoie {default=true, canBeChanged=true} pour la fenêtre de debug drift. | 1017 |
| `gameplay_drift_drift.getDriftOptions()` | Renvoie la table des réglages de détection : minAngle 7, maxAngle 165, allowDonut, allowTightDrifts, raycastHeight 0.5, wallDetectionLength 3, baseDriftCompleteTime 1.2, failPointsCooldown 1.65, minAirSpeed 4, maxWasDriftingTime 4, crashDamageThreshold 150, etc. Table vivante, modifiable. | 1005 |
| `gameplay_drift_drift.getGC()` | Renvoie la quantité de garbage mesurée par le profileur. | 1013 |
| `gameplay_drift_drift.getIsCrashing(vehId)` | Indique si le véhicule est en train de crasher (gameplay_util_crashDetection). | 995 |
| `gameplay_drift_drift.getIsDrifting(vehId)` | Indique si le véhicule est en train de drifter. | 915 |
| `gameplay_drift_drift.getIsInTheAir(vehId)` | Indique si le véhicule n'est pas sur ses roues. | 990 |
| `gameplay_drift_drift.getIsOverMinSpeedForDrift(vehId)` | Indique si la vitesse moyenne des points de référence dépasse minAirSpeed (4 km/h). | 985 |
| `gameplay_drift_drift.getIsOverSteering(vehId)` | Indique si le véhicule est en survirage (avant et centre vont dans le même sens que l'arrière). | 980 |
| `gameplay_drift_drift.getPlVeh()` | Renvoie l'objet véhicule principal suivi. | 935 |
| `gameplay_drift_drift.getPlayerIdForVehicle(vehId)` | Renvoie l'id de joueur associé à un véhicule suivi. | 859 |
| `gameplay_drift_drift.getTrackedVehicles()` | Renvoie la table des états de drift, indexée par vehId (table vivante). | 896 |
| `gameplay_drift_drift.getVehCorners()` | Renvoie les 4 coins de la boîte englobante utilisée pour les raycasts (avant droit, arrière droit, arrière gauche, avant gauche), à hauteur raycastHeight. | 1009 |
| `gameplay_drift_drift.getVehData(vehId)` | Renvoie les données de map.objects du véhicule (pos, vel, dirVec, ...). | 940 |
| `gameplay_drift_drift.getVehId()` | Renvoie l'id du véhicule principal suivi (joueur 0 si possible). | 930 |
| `gameplay_drift_drift.getVehPos(vehId)` | Renvoie la position du véhicule suivie par le module. | 925 |
| `gameplay_drift_drift.getVehVel(vehId)` | Renvoie la direction normalisée de la vitesse du véhicule (velDir), pas son module. | 945 |
| `gameplay_drift_drift.onAnyStuntZoneAccomplished()` | Hook : une zone de cascade est réussie ; remet le temps de confirmation de la chaîne de drifts au maximum. *(interne)* *(hook)* | 1080 |
| `gameplay_drift_drift.onClientEndMission()` | Hook : fin de niveau ; vide la liste des véhicules suivis. *(interne)* *(hook)* | 1076 |
| `gameplay_drift_drift.onDeserialized(data)` | Hook : restaure la case de debug. *(interne)* *(hook)* | 1151 |
| `gameplay_drift_drift.onDriftChallengeFinished()` | Hook : fin d'un défi de drift ; émet onDriftCompleted pour les chaînes en cours et onDriftActiveDataFinished pour les drifts en cours. *(interne)* *(hook)* | 1103 |
| `gameplay_drift_drift.onDriftContextChanged(context, oldContext)` | Hook : à un changement de contexte, ajoute les véhicules au suivi de crash (sauf en inAnotherMissionType, où ils en sont retirés). *(interne)* *(hook)* | 1087 |
| `gameplay_drift_drift.onDriftPlVehReset(vehId)` | Hook : véhicule remis en place ; réinitialise son état et active un timer de reset de 0.1 s pendant lequel il ne drifte pas. *(interne)* *(hook)* | 1130 |
| `gameplay_drift_drift.onSerialize()` | Hook : sauvegarde la case de debug avant rechargement Lua. *(interne)* *(hook)* | 1145 |
| `gameplay_drift_drift.onUpdate(dtReal, _dtSim, dtRaw)` | Appelé à chaque frame : suit automatiquement le véhicule du joueur 0 si rien n'est suivi, puis met à jour la détection pour chaque véhicule suivi. Sauté pendant firstDrive, la marche, la pause ou dtSim <= 0. *(interne)* *(hook)* | 807 |
| `gameplay_drift_drift.onVehicleCrashStarted(crashStartData)` | Hook : début de crash détecté par gameplay_util_crashDetection ; marque le véhicule comme crashé si son score en cache est > 0 (hors pause, gel, marche). *(interne)* *(hook)* | 1117 |
| `gameplay_drift_drift.onVehicleDestroyed(vehId)` | Hook : retire le véhicule détruit du suivi. *(interne)* *(hook)* | 1072 |
| `gameplay_drift_drift.onVehicleSwitched(oldId, newVehId, player)` | Hook : changement de véhicule d'un joueur ; retire l'ancien véhicule s'il appartenait à ce joueur et suit le nouveau (timer de reset 0.1 s). *(interne)* *(hook)* | 1056 |
| `gameplay_drift_drift.removeTrackedVehicle(vehId)` | Retire un véhicule du suivi de drift et du suivi de crash (gameplay_util_crashDetection). | 864 |
| `gameplay_drift_drift.reset(vehId)` | Réinitialise l'état de drift d'un véhicule (ou de tous si vehId est nil) : supprime drift/chaîne en cours, remet à zéro les données de crash. | 1045 |
| `gameplay_drift_drift.setAllowDonut(value)` | Active/désactive la prise en compte des donuts (driftOptions.allowDonut), lue par les zones de cascade. | 1021 |
| `gameplay_drift_drift.setAllowTightDrift(value)` | Active/désactive les drifts serrés (driftOptions.allowTightDrifts). | 1025 |
| `gameplay_drift_drift.setBalanceMode(_balanceMode, vehId)` | Active le mode « équilibre » : tant qu'il est actif le temps de confirmation reste figé à 1 et la chaîne de drifts n'est pas conclue. | 1038 |
| `gameplay_drift_drift.setVehId(newVehId)` | Ne suit plus que ce véhicule : retire tous les autres véhicules suivis puis l'ajoute. | 1029 |
| `gameplay_drift_drift.simulateADrift(data)` | Active une simulation de drift pour le debug audio ; nil l'arrête. | 855 |

### Détail des paramètres

#### `gameplay_drift_drift.addTrackedVehicle(vehId, opts)`

Ajoute un véhicule au suivi de drift (crée son état) et renvoie cet état. Avec opts.playerId, associe le véhicule à un joueur et retire tout autre véhicule suivi pour ce même joueur.

- `vehId` (*integer*) : Id du véhicule (ignoré si nil ou < 0).
- `opts` (*table|nil*) : {playerId = integer}.
- **renvoie** : table|nil État de drift du véhicule.

#### `gameplay_drift_drift.doesPlHaveVeh(vehId)`

Indique si le véhicule suivi a des données de map valides.

- `vehId` (*integer|nil*) : Id du véhicule.
- **renvoie** : boolean|nil true si vehData existe.

#### `gameplay_drift_drift.getAirSpeed(vehId)`

Renvoie la vitesse du véhicule en km/h (norme de la vitesse * 3.6).

- `vehId` (*integer|nil*) : Id du véhicule.
- **renvoie** : number|nil Vitesse en km/h.

#### `gameplay_drift_drift.getAngleDiff(vehId)`

Renvoie la variation d'angle de la direction de vitesse depuis la frame précédente (degrés), calculée pendant un drift.

- `vehId` (*integer|nil*) : Id du véhicule.
- **renvoie** : number|nil Variation en degrés.

#### `gameplay_drift_drift.getCurrDegAngleSigned(vehId)`

Renvoie l'angle de dérive actuel en degrés, signé (le signe donne le côté).

- `vehId` (*integer|nil*) : Id du véhicule.
- **renvoie** : number Angle en degrés.

#### `gameplay_drift_drift.getCurrDriftCompletedTime(vehId)`

Renvoie la fraction (0..1) restante du temps de confirmation de la chaîne de drifts (1 = le drift vient d'avoir lieu, 0 = confirmé).

- `vehId` (*integer|nil*) : Id du véhicule.
- **renvoie** : number Fraction du temps restant.

#### `gameplay_drift_drift.getCurrentDriftDuration(vehId)`

Renvoie la durée du drift en cours (totalDriftTime), 0 s'il ne drifte pas.

- `vehId` (*integer|nil*) : Id du véhicule.
- **renvoie** : number Durée en secondes.

#### `gameplay_drift_drift.getDistSinceLastFrame(vehId)`

Renvoie la distance parcourue depuis la frame précédente, en mètres.

- `vehId` (*integer|nil*) : Id du véhicule.
- **renvoie** : number Distance en m.

#### `gameplay_drift_drift.getDriftActiveData(vehId)`

Renvoie les données du drift en cours (nil s'il n'y en a pas).

- `vehId` (*integer|nil*) : Id du véhicule.
- **renvoie** : table|nil driftActiveData.

#### `gameplay_drift_drift.getDriftChainActiveData(vehId)`

Renvoie les données de la chaîne de drifts en cours (nil si aucune).

- `vehId` (*integer|nil*) : Id du véhicule.
- **renvoie** : table|nil driftChainActiveData.

#### `gameplay_drift_drift.getDriftChainChainedDrifts(vehId)`

Renvoie le nombre de drifts enchaînés dans la chaîne en cours.

- `vehId` (*integer|nil*) : Id du véhicule.
- **renvoie** : integer Nombre de drifts, 0 si aucune chaîne.

#### `gameplay_drift_drift.getDriftDebugInfo()`

Renvoie {default=true, canBeChanged=true} pour la fenêtre de debug drift.

- **renvoie** : table {default = true, canBeChanged = true}

#### `gameplay_drift_drift.getDriftOptions()`

Renvoie la table des réglages de détection : minAngle 7, maxAngle 165, allowDonut, allowTightDrifts, raycastHeight 0.5, wallDetectionLength 3, baseDriftCompleteTime 1.2, failPointsCooldown 1.65, minAirSpeed 4, maxWasDriftingTime 4, crashDamageThreshold 150, etc. Table vivante, modifiable.

- **renvoie** : table driftOptions.

#### `gameplay_drift_drift.getGC()`

Renvoie la quantité de garbage mesurée par le profileur.

- **renvoie** : number|nil nil tant que le debug général n'a jamais été actif.

#### `gameplay_drift_drift.getIsCrashing(vehId)`

Indique si le véhicule est en train de crasher (gameplay_util_crashDetection).

- `vehId` (*integer|nil*) : Id du véhicule.
- **renvoie** : boolean État de crash.

#### `gameplay_drift_drift.getIsDrifting(vehId)`

Indique si le véhicule est en train de drifter.

- `vehId` (*integer|nil*) : Id du véhicule.
- **renvoie** : boolean État de drift.

#### `gameplay_drift_drift.getIsInTheAir(vehId)`

Indique si le véhicule n'est pas sur ses roues.

- `vehId` (*integer|nil*) : Id du véhicule.
- **renvoie** : boolean true en l'air.

#### `gameplay_drift_drift.getIsOverMinSpeedForDrift(vehId)`

Indique si la vitesse moyenne des points de référence dépasse minAirSpeed (4 km/h).

- `vehId` (*integer|nil*) : Id du véhicule.
- **renvoie** : boolean true si assez rapide.

#### `gameplay_drift_drift.getIsOverSteering(vehId)`

Indique si le véhicule est en survirage (avant et centre vont dans le même sens que l'arrière).

- `vehId` (*integer|nil*) : Id du véhicule.
- **renvoie** : boolean État de survirage.

#### `gameplay_drift_drift.getPlVeh()`

Renvoie l'objet véhicule principal suivi.

- **renvoie** : userdata|nil Objet véhicule de la scène.

#### `gameplay_drift_drift.getPlayerIdForVehicle(vehId)`

Renvoie l'id de joueur associé à un véhicule suivi.

- `vehId` (*integer*) : Id du véhicule.
- **renvoie** : integer playerId, 0 si inconnu.

#### `gameplay_drift_drift.getTrackedVehicles()`

Renvoie la table des états de drift, indexée par vehId (table vivante).

- **renvoie** : table<integer, table> États de drift.

#### `gameplay_drift_drift.getVehCorners()`

Renvoie les 4 coins de la boîte englobante utilisée pour les raycasts (avant droit, arrière droit, arrière gauche, avant gauche), à hauteur raycastHeight.

- **renvoie** : vec3[] {corner_FR, corner_BR, corner_BL, corner_FL}

#### `gameplay_drift_drift.getVehData(vehId)`

Renvoie les données de map.objects du véhicule (pos, vel, dirVec, ...).

- `vehId` (*integer|nil*) : Id du véhicule.
- **renvoie** : table|nil Entrée map.objects.

#### `gameplay_drift_drift.getVehId()`

Renvoie l'id du véhicule principal suivi (joueur 0 si possible).

- **renvoie** : integer|nil Id du véhicule.

#### `gameplay_drift_drift.getVehPos(vehId)`

Renvoie la position du véhicule suivie par le module.

- `vehId` (*integer|nil*) : Id du véhicule.
- **renvoie** : vec3|nil Position (vec3 partagé, à ne pas modifier).

#### `gameplay_drift_drift.getVehVel(vehId)`

Renvoie la direction normalisée de la vitesse du véhicule (velDir), pas son module.

- `vehId` (*integer|nil*) : Id du véhicule.
- **renvoie** : vec3|nil Direction unitaire de la vitesse.

#### `gameplay_drift_drift.onDeserialized(data)`

Hook : restaure la case de debug.

- `data` (*table*) : Table de onSerialize.

#### `gameplay_drift_drift.onDriftContextChanged(context, oldContext)`

Hook : à un changement de contexte, ajoute les véhicules au suivi de crash (sauf en inAnotherMissionType, où ils en sont retirés).

- `context` (*string*) : Nouveau contexte.
- `oldContext` (*string|nil*) : Ancien contexte.

#### `gameplay_drift_drift.onDriftPlVehReset(vehId)`

Hook : véhicule remis en place ; réinitialise son état et active un timer de reset de 0.1 s pendant lequel il ne drifte pas.

- `vehId` (*integer|nil*) : Véhicule ; nil pour tous.

#### `gameplay_drift_drift.onSerialize()`

Hook : sauvegarde la case de debug avant rechargement Lua.

- **renvoie** : table {debugToggleSmothnessGraph}

#### `gameplay_drift_drift.onUpdate(dtReal, _dtSim, dtRaw)`

Appelé à chaque frame : suit automatiquement le véhicule du joueur 0 si rien n'est suivi, puis met à jour la détection pour chaque véhicule suivi. Sauté pendant firstDrive, la marche, la pause ou dtSim <= 0.

- `dtReal` (*number*) : Delta temps réel (inutilisé).
- `_dtSim` (*number*) : Delta temps simulé.
- `dtRaw` (*number*) : Delta temps brut (inutilisé).

#### `gameplay_drift_drift.onVehicleCrashStarted(crashStartData)`

Hook : début de crash détecté par gameplay_util_crashDetection ; marque le véhicule comme crashé si son score en cache est > 0 (hors pause, gel, marche).

- `crashStartData` (*table*) : Contient vehId.

#### `gameplay_drift_drift.onVehicleDestroyed(vehId)`

Hook : retire le véhicule détruit du suivi.

- `vehId` (*integer*) : Véhicule détruit.

#### `gameplay_drift_drift.onVehicleSwitched(oldId, newVehId, player)`

Hook : changement de véhicule d'un joueur ; retire l'ancien véhicule s'il appartenait à ce joueur et suit le nouveau (timer de reset 0.1 s).

- `oldId` (*integer*) : Ancien véhicule (-1 si aucun).
- `newVehId` (*integer*) : Nouveau véhicule.
- `player` (*integer|nil*) : Index du joueur (0 par défaut).

#### `gameplay_drift_drift.removeTrackedVehicle(vehId)`

Retire un véhicule du suivi de drift et du suivi de crash (gameplay_util_crashDetection).

- `vehId` (*integer*) : Id du véhicule.

#### `gameplay_drift_drift.reset(vehId)`

Réinitialise l'état de drift d'un véhicule (ou de tous si vehId est nil) : supprime drift/chaîne en cours, remet à zéro les données de crash.

- `vehId` (*integer|nil*) : Véhicule ; nil pour tous.

#### `gameplay_drift_drift.setAllowDonut(value)`

Active/désactive la prise en compte des donuts (driftOptions.allowDonut), lue par les zones de cascade.

- `value` (*boolean*) : true pour autoriser.

#### `gameplay_drift_drift.setAllowTightDrift(value)`

Active/désactive les drifts serrés (driftOptions.allowTightDrifts).

- `value` (*boolean*) : true pour autoriser.

#### `gameplay_drift_drift.setBalanceMode(_balanceMode, vehId)`

Active le mode « équilibre » : tant qu'il est actif le temps de confirmation reste figé à 1 et la chaîne de drifts n'est pas conclue.

- `_balanceMode` (*boolean*) : true pour activer.
- `vehId` (*integer|nil*) : Id du véhicule.

#### `gameplay_drift_drift.setVehId(newVehId)`

Ne suit plus que ce véhicule : retire tous les autres véhicules suivis puis l'ajoute.

- `newVehId` (*integer*) : Id du véhicule à suivre.

#### `gameplay_drift_drift.simulateADrift(data)`

Active une simulation de drift pour le debug audio ; nil l'arrête.

- `data` (*table|nil*) : {currDegAngle, airSpeed, wallDistance, isCrashing}.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_walk, chargé avant. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onDriftActiveDataFinished` — écouté par 2 module(s)
- `onDriftChainStarted` — écouté par 1 module(s)
- `onDriftCompleted` — écouté par 3 module(s)
- `onDriftCrash` — écouté par 7 module(s)
- `onDriftSpinout` — écouté par 6 module(s)
- `onDriftStatusChanged` — écouté par 2 module(s)
- `onDriftTransition` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `be:` `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfAxisXYZ`, `getPlayerVehicleID`
- `debugDrawer:` `drawLine`, `drawLineInstance`, `drawSphere`, `drawTextAdvanced`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/drift.lua`.*
