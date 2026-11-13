# `freeroam_freeroam`

*Fichier : `lua/ge/extensions/freeroam/freeroam.lua` · VM : Game Engine (GE) · 419 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `freeroam_freeroam` : `extensions.load("freeroam_freeroam")`, puis la globale `freeroam_freeroam`

Mode de jeu « freeroam » (balade libre) : démarre un niveau en freeroam, applique les options de spawn (trafic, véhicules garés, heure du jour, date, écoulement du temps), lance les flowgraphs associés au niveau, gère la remise à zéro du joueur et les messages de radars. Un moddeur l'utilise pour lancer un niveau (startFreeroam / startFreeroamByName) ou pour préconfigurer le trafic et l'heure via spawningOptionsHelper avant le lancement. Global : freeroam_freeroam.

## Exemple

```lua
freeroam_freeroam.spawningOptionsHelper.trafficMode = 'enabled'
freeroam_freeroam.spawningOptionsHelper.trafficAmount = 10
freeroam_freeroam.spawningOptionsHelper.timeOfDay = 0.5 -- midi
freeroam_freeroam.startFreeroamByName('gridmap_v2')
```

## Remarques

- M.state.freeroamActive est mis à true au démarrage et remis à false dans onClientEndMission.
- Les options environnement (timeOfDay, date, timePlay) sont remises par défaut après application dans onClientPostStartMission. Le reste n'est remis à zéro que si resetSpawningOptions est appelée (champ resetOptionsAfterStartingFreeroam non lu dans ce fichier).
- Si un niveau est déjà chargé (scenetree.MissionGroup existe), le démarrage est différé : le jeu termine d'abord le mode actif (endActiveGameMode) puis relance startFreeroam.
- Le hook onFreeroamLoaded(levelPath) est émis dans onClientStartMission quand le freeroam est actif.
- Dans onClientPostStartMission, le flowgraph associé n'est lancé que s'il n'y a pas de scénario actif.
- Dans onPlayerCameraReady, trafficMode 'fromSetting' (valeur par défaut) est traité comme « désactivé » (seul 'enabled' charge le trafic), et le champ resetOptionsAfterStartingFreeroam n'est pas utilisé dans ce fichier.

**Dépendances (chargées avant) :** `core_environment`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `freeroam_freeroam.onClientEndMission(levelPath)` | Hook de fin de niveau : désactive freeroamActive, retire l'action map ExplorationCheckpointsActionMap et décharge mainLevel si chargé. *(interne)* *(hook)* | 301 |
| `freeroam_freeroam.onClientPostStartMission(levelPath)` | Hook après le démarrage : applique date, heure du jour et écoulement du temps demandés dans spawningOptionsHelper, les remet par défaut, puis lance les flowgraphs associés au niveau (sauf scénario actif). *(interne)* *(hook)* | 224 |
| `freeroam_freeroam.onClientPreStartMission(levelPath)` | Hook avant le démarrage du niveau : charge à la racine le fichier `mainLevel.lua` du dossier du niveau s'il existe et appelle son onClientPreStartMission. *(interne)* *(hook)* | 187 |
| `freeroam_freeroam.onClientStartMission(levelPath)` | Hook au démarrage du niveau : si freeroam actif, émet onFreeroamLoaded(levelPath) et pousse l'action map ExplorationCheckpointsActionMap si elle existe. *(interne)* *(hook)* | 197 |
| `freeroam_freeroam.onPlayerCameraReady()` | Hook appelé quand la caméra joueur est prête : si le freeroam est actif, décide du trafic et des véhicules garés d'après spawningOptionsHelper et du réglage trafficParkedVehicles, puis appelle gameplay_traffic.setupTrafficHelper. Ne fait rien si le niveau ne supporte pas le trafic. *(interne)* *(hook)* | 118 |
| `freeroam_freeroam.onRedLightCamTriggered(speedTrapData, playerSpeed)` | Hook de radar de feu rouge : en freeroam pour le véhicule joueur, affiche un message avec la plaque. *(interne)* *(hook)* | 393 |
| `freeroam_freeroam.onResetGameplay(playerID)` | Hook de remise à zéro du joueur : ignoré en scénario, campagne, invite de récupération, flowgraph bloquant ou session multijoueur ; sinon spawn.safeReset si le réglage enableSmartRecovery est actif, sinon be:resetVehicle. *(interne)* *(hook)* | 324 |
| `freeroam_freeroam.onSpeedTrapTriggered(speedTrapData, playerSpeed, overSpeed)` | Hook de radar : en freeroam, si le sujet est le véhicule joueur, enregistre le record dans gameplay_speedTrapLeaderboards et affiche les messages de vitesse et de record (ui_message). *(interne)* *(hook)* | 370 |
| `freeroam_freeroam.onTrafficOrParkingReady()` | Hook appelé quand trafic/véhicules garés sont prêts : retire l'écran de chargement « traffic ». *(interne)* *(hook)* | 181 |
| `freeroam_freeroam.onUpdate(dtReal, dtSim, dtRaw)` | Hook par frame : tant que worldReadyState vaut 0, initialise la caméra (commands.initCamera) et passe en caméra libre s'il n'y a pas de véhicule joueur. *(interne)* *(hook)* | 354 |
| `freeroam_freeroam.onVehicleSpawned(vehID)` | Hook d'apparition de véhicule : réinitialise les surbrillances de parts et appelle core_vehicle_partmgmt.setNewParts. *(interne)* *(hook)* | 319 |
| `freeroam_freeroam.onVehicleSwitched(oldId, newId, player)` | Hook de changement de véhicule : efface les surbrillances de parts de l'ancien véhicule (core_vehicle_partmgmt.clearVehicleHighlights). *(interne)* *(hook)* | 315 |
| `freeroam_freeroam.resetSpawningOptions()` | Remet spawningOptionsHelper à ses valeurs par défaut (copie profonde de l'état initial). | 31 |
| `freeroam_freeroam.startFreeroam(level, startPointName, wasDelayed, spawnVehicle, customLoadingFunction)` | Démarre le freeroam sur un niveau : affiche l'écran de chargement, décharge les extensions automatiques, charge les extensions de preset, vide le filtre d'actions, puis core_levels.startLevel. Si un niveau est déjà chargé, attend sa fin. | 83 |
| `freeroam_freeroam.startFreeroamByName(levelName, startPointName, wasDelayed, spawnVehicle, customLoadingFunction)` | Retrouve le niveau par nom (core_levels.getLevelByName) et appelle startFreeroam. | 109 |
| `freeroam_freeroam.startTrackBuilder(levelName, forceLoad)` | Charge l'extension trackbuilder_trackBuilder et appelle son enter(levelName, forceLoad). | 343 |

### Détail des paramètres

#### `freeroam_freeroam.onClientEndMission(levelPath)`

Hook de fin de niveau : désactive freeroamActive, retire l'action map ExplorationCheckpointsActionMap et décharge mainLevel si chargé.

- `levelPath` (*string*) : Chemin du niveau.

#### `freeroam_freeroam.onClientPostStartMission(levelPath)`

Hook après le démarrage : applique date, heure du jour et écoulement du temps demandés dans spawningOptionsHelper, les remet par défaut, puis lance les flowgraphs associés au niveau (sauf scénario actif).

- `levelPath` (*string*) : Chemin du niveau.

#### `freeroam_freeroam.onClientPreStartMission(levelPath)`

Hook avant le démarrage du niveau : charge à la racine le fichier `mainLevel.lua` du dossier du niveau s'il existe et appelle son onClientPreStartMission.

- `levelPath` (*string*) : Chemin du niveau.

#### `freeroam_freeroam.onClientStartMission(levelPath)`

Hook au démarrage du niveau : si freeroam actif, émet onFreeroamLoaded(levelPath) et pousse l'action map ExplorationCheckpointsActionMap si elle existe.

- `levelPath` (*string*) : Chemin du niveau.

#### `freeroam_freeroam.onRedLightCamTriggered(speedTrapData, playerSpeed)`

Hook de radar de feu rouge : en freeroam pour le véhicule joueur, affiche un message avec la plaque.

- `speedTrapData` (*table*) : Données du radar.
- `playerSpeed` (*number*) : Vitesse (non utilisée).

#### `freeroam_freeroam.onResetGameplay(playerID)`

Hook de remise à zéro du joueur : ignoré en scénario, campagne, invite de récupération, flowgraph bloquant ou session multijoueur ; sinon spawn.safeReset si le réglage enableSmartRecovery est actif, sinon be:resetVehicle.

- `playerID` (*integer*) : Joueur (-1 = aucun véhicule).

#### `freeroam_freeroam.onSpeedTrapTriggered(speedTrapData, playerSpeed, overSpeed)`

Hook de radar : en freeroam, si le sujet est le véhicule joueur, enregistre le record dans gameplay_speedTrapLeaderboards et affiche les messages de vitesse et de record (ui_message).

- `speedTrapData` (*table*) : Données du radar (speedLimit, subjectID…).
- `playerSpeed` (*number*) : Vitesse enregistrée (m/s, déduit du code).
- `overSpeed` (*number|boolean*) : Dépassement (déduit du code).

#### `freeroam_freeroam.onUpdate(dtReal, dtSim, dtRaw)`

Hook par frame : tant que worldReadyState vaut 0, initialise la caméra (commands.initCamera) et passe en caméra libre s'il n'y a pas de véhicule joueur.

- `dtReal` (*number*) : Durée réelle (s).
- `dtSim` (*number*) : Durée simulée (s).
- `dtRaw` (*number*) : Durée brute (s).

#### `freeroam_freeroam.onVehicleSpawned(vehID)`

Hook d'apparition de véhicule : réinitialise les surbrillances de parts et appelle core_vehicle_partmgmt.setNewParts.

- `vehID` (*integer*) : Id du véhicule.

#### `freeroam_freeroam.onVehicleSwitched(oldId, newId, player)`

Hook de changement de véhicule : efface les surbrillances de parts de l'ancien véhicule (core_vehicle_partmgmt.clearVehicleHighlights).

- `oldId` (*integer*) : Ancien véhicule.
- `newId` (*integer*) : Nouveau véhicule.
- `player` (*integer*) : Joueur (non utilisé).

#### `freeroam_freeroam.startFreeroam(level, startPointName, wasDelayed, spawnVehicle, customLoadingFunction)`

Démarre le freeroam sur un niveau : affiche l'écran de chargement, décharge les extensions automatiques, charge les extensions de preset, vide le filtre d'actions, puis core_levels.startLevel. Si un niveau est déjà chargé, attend sa fin.

- `level` (*table|string*) : Table niveau (levelName, misFilePath) ou chemin du fichier du niveau.
- `startPointName` (*string|nil*) : Nom du point de départ (utilisé seulement si level est une table, via setSpawnpoint.setDefaultSP).
- `wasDelayed` (*boolean|nil*) : Vrai quand l'appel vient d'un démarrage différé (non utilisé dans le corps actif).
- `spawnVehicle` (*boolean|nil*) : false = ne pas faire apparaître de véhicule (efface les variables $beamngVehicle*).
- `customLoadingFunction` (*function|nil*) : Fonction de chargement personnalisée transmise à core_levels.startLevel.

#### `freeroam_freeroam.startFreeroamByName(levelName, startPointName, wasDelayed, spawnVehicle, customLoadingFunction)`

Retrouve le niveau par nom (core_levels.getLevelByName) et appelle startFreeroam.

- `levelName` (*string*) : Nom du niveau.
- `startPointName` (*string|nil*) : Point de départ.
- `wasDelayed` (*boolean|nil*) : Voir startFreeroam.
- `spawnVehicle` (*boolean|nil*) : Voir startFreeroam.
- `customLoadingFunction` (*function|nil*) : Voir startFreeroam.
- **renvoie** : boolean true si le niveau existe.

#### `freeroam_freeroam.startTrackBuilder(levelName, forceLoad)`

Charge l'extension trackbuilder_trackBuilder et appelle son enter(levelName, forceLoad).

- `levelName` (*string*) : Niveau.
- `forceLoad` (*boolean|nil*) : Forcer le chargement.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'core_environment'} |
| `spawningOptionsHelper` | table | Options de lancement : trafficMode ('fromSetting'\|'disabled'\|'enabled'), trafficAmount (-1 auto, 0 aucun, N), trafficPolice ('disabled'\|'enabled'), trafficParked ('disabled'\|'enabled'), trafficParkedAmount (-1 auto), timeOfDay ('default'\|'current'\|'currentUtc'\|clé du niveau\|nombre 0..1), date (secondes epoch Unix), timePlay ('disabled'\|'level'\|'fast'\|'normal'\|'slow'\|'realtime'), resetOptionsAfterStartingFreeroam (boolean). |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onFreeroamLoaded`

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `be:` `getPlayerVehicleID`, `resetVehicle`
- `core_environment.` `getAuthoredDayLength`, `getDayCycleSeconds`, `getTimeOfDay`, `getTimeOfDayOptions`, `setTimeOfDay`, `syncTimeToRealClock`, `syncTimeToRealClockUtc`
- `scenetree.` `findObject`

**Charge les extensions :** `trackbuilder_trackBuilder`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/freeroam/freeroam.lua`.*
