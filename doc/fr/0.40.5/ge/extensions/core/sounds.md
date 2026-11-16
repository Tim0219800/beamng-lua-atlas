# `core_sounds`

*Fichier : `lua/ge/extensions/core/sounds.lua` · VM : Game Engine (GE) · 263 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_sounds` : `extensions.load("core_sounds")`, puis la globale `core_sounds`

Pont entre le jeu et le moteur audio FMOD côté GE. Chaque rendu (onPreRender), il pousse des paramètres globaux (vitesse et rotation de caméra, heure du jour, vent, vitesse du véhicule joueur, caméra intérieure, sous l'eau, hauteur au sol et à la mer, flou audio). Il fournit aussi des fonctions pour initialiser et piloter les sons moteur/échappement d'un véhicule, et gère le flou audio quand un menu de mission est ouvert.

## Exemple

```lua
core_sounds.setAudioBlur(1) -- flou audio actif
core_sounds.setAudioBlur(0)
```

## Remarques

- onPreRender alterne à chaque appel (frameFlag) entre deux lots de paramètres : une image sur deux pour g_Tod, g_WindSpeedMS, g_CamRotationAngle, g_VehicleSpeedPlayerMS ; l'autre pour g_CamOnboard, c_CabinFilterReverbStrength, g_CamFree, g_CamUnderwater, g_UnderwaterDepth, g_CamHeightToGround, g_CamHeightToSea. g_GameAudioBlur, g_CamSpeedMS et g_CamRotationSpeedMS sont mis à jour à chaque image.
- Heure du jour : tod.time vaut 0 à midi, 0.25 à 18h, 0.5 à minuit, 0.75 à 6h ; le code la convertit en heures (0 à 24) pour g_Tod.
- g_CamOnboard = AudioInsideModifier (réglage) puissance 4, multiplié par le résultat de core_camera.isCameraInside.
- Le rayon castRayStatic vers le bas pour g_CamHeightToGround est limité à 200 m.
- Le flou audio automatique ne s'active que si une interaction avec un marqueur de mission est en cours (missionMarkerInteraction, posé par onActivityAcceptGatherData).
- Le commentaire « debugEnabled » dit qu'il faut changer la ligne pour activer les logs de flou audio ; la variable est locale et vaut false.

**Dépendances (chargées avant) :** `core_camera`, `core_settings_settings`, `core_input_bindings`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_sounds.initEngineSound(vehicleId, engineId, jsonPath, nodeIdArray, noloadVol, loadVol)` | Initialise le son moteur d'un véhicule : vehicle:engineSoundInit puis fixe wet_level = 0 et dry_level = 1. Ne fait rien si le véhicule n'existe pas. | 95 |
| `core_sounds.initExhaustSound(vehicleId, engineId, jsonPath, nodeIdPairArray, noloadVol, loadVol)` | Comme initEngineSound mais pour l'échappement, avec des paires de noeuds. Appelle aussi vehicle:engineSoundInit (même appel moteur). | 106 |
| `core_sounds.onActivityAcceptGatherData(elemData, activityData)` | Hook appelé quand une activité collecte ses données d'acceptation. Mémorise si l'un des éléments est de type "mission". *(interne)* *(hook)* | 202 |
| `core_sounds.onDeserialized(data)` | Hook appelé après rechargement des extensions Lua : relance sounds.updateCabinFilter() sur tous les véhicules pour restaurer cabinFilterStrength. *(interne)* *(hook)* | 232 |
| `core_sounds.onMissionAvailabilityChanged(data)` | Hook : si data.missionCount vaut 0, désactive l'interaction mission. *(interne)* *(hook)* | 214 |
| `core_sounds.onMissionInfoChangedState(fromState, toState, content)` | Hook appelé quand la fenêtre d'info mission change d'état : passe à 'opened' active l'interaction ; 'opened' vers 'closed' la désactive et remet le flou à 0. Sans effet si aucun marqueur de mission actif. *(interne)* *(hook)* | 186 |
| `core_sounds.onPreRender(dtReal, dtSim, dtRaw)` | Hook de rendu. Met à jour les paramètres globaux FMOD (Engine.Audio.getGlobalParams) si disponibles. Voir notes pour la liste des paramètres. *(interne)* *(hook)* | 32 |
| `core_sounds.onSettingsChanged()` | Hook appelé quand les réglages changent : relit AudioInsideModifier. *(interne)* *(hook)* | 143 |
| `core_sounds.onUiChangedState(toState, fromState)` | Hook appelé quand l'état de l'UI change. Si un marqueur de mission est actif, gère gameAudioBlurValue : 1 tant qu'on interagit avec l'UI mission, remis à 0 pour les transitions vers play (depuis scenario.start, menu, fadeScreen, blank) ou vers scenario.end. *(interne)* *(hook)* | 147 |
| `core_sounds.onVehicleSwitched(oldId, newId, player)` | Hook : quand le véhicule du joueur 0 change, exécute sounds.updateCabinFilter() dans la VM du nouveau véhicule. *(interne)* *(hook)* | 225 |
| `core_sounds.setAudioBlur(value)` | Fixe manuellement la valeur du flou audio global (paramètre g_GameAudioBlur). | 255 |
| `core_sounds.setCabinFilterStrength(objId, value)` | Fixe cabinFilterStrength, mais seulement si objId est le véhicule joueur 0. Appelé typiquement depuis la VM véhicule. | 220 |
| `core_sounds.setEngineSoundParameter(vehicleId, engineId, paramName, paramValue)` | Fixe un paramètre du son moteur (vehicle:engineSoundParameter). | 124 |
| `core_sounds.setEngineSoundParameterList(vehicleId, engineId, parameters)` | Fixe plusieurs paramètres du son moteur d'un coup. | 130 |
| `core_sounds.setExhaustSoundNodes(vehicleId, engineId, nodeIdPairArray)` | Change les noeuds d'émission du son d'échappement (vehicle:engineSoundNodes). | 136 |
| `core_sounds.updateEngineSound(vehicleId, engineId, rpm, onLoad, engineVolume)` | Met à jour le son moteur (vehicle:engineSoundUpdate). | 118 |

### Détail des paramètres

#### `core_sounds.initEngineSound(vehicleId, engineId, jsonPath, nodeIdArray, noloadVol, loadVol)`

Initialise le son moteur d'un véhicule : vehicle:engineSoundInit puis fixe wet_level = 0 et dry_level = 1. Ne fait rien si le véhicule n'existe pas.

- `vehicleId` (*integer*) : Id de l'objet véhicule.
- `engineId` (*integer*) : Identifiant du moteur (déduit du code).
- `jsonPath` (*string*) : Chemin du fichier de description du son.
- `nodeIdArray` (*integer|integer[]*) : Noeud(s) d'émission ; un nombre seul est mis en tableau.
- `noloadVol` (*number|nil*) : Volume sans charge, 1 par défaut.
- `loadVol` (*number|nil*) : Volume en charge, 1 par défaut.

#### `core_sounds.initExhaustSound(vehicleId, engineId, jsonPath, nodeIdPairArray, noloadVol, loadVol)`

Comme initEngineSound mais pour l'échappement, avec des paires de noeuds. Appelle aussi vehicle:engineSoundInit (même appel moteur).

- `vehicleId` (*integer*) : Id du véhicule.
- `engineId` (*integer*) : Identifiant du moteur.
- `jsonPath` (*string*) : Chemin du fichier de son.
- `nodeIdPairArray` (*table|integer*) : Tableau de paires de noeuds ; un nombre seul devient {{n, n}}.
- `noloadVol` (*number|nil*) : Volume sans charge, 1 par défaut.
- `loadVol` (*number|nil*) : Volume en charge, 1 par défaut.

#### `core_sounds.onActivityAcceptGatherData(elemData, activityData)`

Hook appelé quand une activité collecte ses données d'acceptation. Mémorise si l'un des éléments est de type "mission".

- `elemData` (*table[]*) : Liste d'éléments avec un champ type.
- `activityData` (*any*) : Non utilisé (log seulement).

#### `core_sounds.onDeserialized(data)`

Hook appelé après rechargement des extensions Lua : relance sounds.updateCabinFilter() sur tous les véhicules pour restaurer cabinFilterStrength.

- `data` (*any*) : Non utilisé.

#### `core_sounds.onMissionAvailabilityChanged(data)`

Hook : si data.missionCount vaut 0, désactive l'interaction mission.

- `data` (*table|nil*) : Table avec missionCount.

#### `core_sounds.onMissionInfoChangedState(fromState, toState, content)`

Hook appelé quand la fenêtre d'info mission change d'état : passe à 'opened' active l'interaction ; 'opened' vers 'closed' la désactive et remet le flou à 0. Sans effet si aucun marqueur de mission actif.

- `fromState` (*string*) : Ancien état.
- `toState` (*string*) : Nouvel état.
- `content` (*any*) : Non utilisé.

#### `core_sounds.onPreRender(dtReal, dtSim, dtRaw)`

Hook de rendu. Met à jour les paramètres globaux FMOD (Engine.Audio.getGlobalParams) si disponibles. Voir notes pour la liste des paramètres.

- `dtReal` (*number*) : Durée réelle de l'image (s).
- `dtSim` (*number*) : Durée simulée (s) ; si 0, les vitesses de caméra ne sont pas mises à jour.
- `dtRaw` (*number*) : Durée brute (non utilisée).

#### `core_sounds.onUiChangedState(toState, fromState)`

Hook appelé quand l'état de l'UI change. Si un marqueur de mission est actif, gère gameAudioBlurValue : 1 tant qu'on interagit avec l'UI mission, remis à 0 pour les transitions vers play (depuis scenario.start, menu, fadeScreen, blank) ou vers scenario.end.

- `toState` (*string*) : Nouvel état UI.
- `fromState` (*string*) : Ancien état UI.

#### `core_sounds.onVehicleSwitched(oldId, newId, player)`

Hook : quand le véhicule du joueur 0 change, exécute sounds.updateCabinFilter() dans la VM du nouveau véhicule.

- `oldId` (*integer*) : Ancien id.
- `newId` (*integer*) : Nouvel id.
- `player` (*integer*) : Index du joueur ; ignoré si différent de 0.

#### `core_sounds.setAudioBlur(value)`

Fixe manuellement la valeur du flou audio global (paramètre g_GameAudioBlur).

- `value` (*number*) : 0 = pas de flou, 1 = flou maximal (déduit du code).

#### `core_sounds.setCabinFilterStrength(objId, value)`

Fixe cabinFilterStrength, mais seulement si objId est le véhicule joueur 0. Appelé typiquement depuis la VM véhicule.

- `objId` (*integer*) : Id du véhicule émetteur.
- `value` (*number*) : Force 0 à 1.

#### `core_sounds.setEngineSoundParameter(vehicleId, engineId, paramName, paramValue)`

Fixe un paramètre du son moteur (vehicle:engineSoundParameter).

- `vehicleId` (*integer*) : Id du véhicule.
- `engineId` (*integer*) : Identifiant du moteur.
- `paramName` (*string*) : Nom du paramètre.
- `paramValue` (*number*) : Valeur.

#### `core_sounds.setEngineSoundParameterList(vehicleId, engineId, parameters)`

Fixe plusieurs paramètres du son moteur d'un coup.

- `vehicleId` (*integer*) : Id du véhicule.
- `engineId` (*integer*) : Identifiant du moteur.
- `parameters` (*table<string, number>*) : Nom -> valeur (déduit du code).

#### `core_sounds.setExhaustSoundNodes(vehicleId, engineId, nodeIdPairArray)`

Change les noeuds d'émission du son d'échappement (vehicle:engineSoundNodes).

- `vehicleId` (*integer*) : Id du véhicule.
- `engineId` (*integer*) : Identifiant du moteur.
- `nodeIdPairArray` (*table*) : Tableau de paires de noeuds.

#### `core_sounds.updateEngineSound(vehicleId, engineId, rpm, onLoad, engineVolume)`

Met à jour le son moteur (vehicle:engineSoundUpdate).

- `vehicleId` (*integer*) : Id du véhicule.
- `engineId` (*integer*) : Identifiant du moteur.
- `rpm` (*number*) : Régime moteur.
- `onLoad` (*number*) : Charge moteur (déduit du code).
- `engineVolume` (*number*) : Volume moteur.

## Champs

| Champ | Type | Description |
|---|---|---|
| `cabinFilterStrength` | number | Force du filtre/réverbération d'habitacle (0 à 1, borné à l'envoi) pour la caméra intérieure du véhicule joueur. Défaut 1. Écrit par setCabinFilterStrength. |
| `dependencies` | string[] | core_camera, core_settings_settings, core_input_bindings. |

## Appels vers le moteur (C++)

- `Sim.` `upcast`
- `core_environment.` `getGroundWind`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/sounds.lua`.*
