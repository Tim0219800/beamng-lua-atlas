# `core_checkpoints`

*Fichier : `lua/ge/extensions/core/checkpoints.lua` · VM : Game Engine (GE) · 311 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_checkpoints` : `extensions.load("core_checkpoints")`, puis la globale `core_checkpoints`

Mémorise, pour chaque véhicule d'un scénario de course, le dernier point de passage atteint (position, direction, vecteur haut, indices de waypoint). Sert à replacer au dernier checkpoint les véhicules pilotés par l'IA qui sont bloqués : toutes les 4 s, un véhicule non jouable qui a quitté son point de départ (> 1 m) et n'a pas bougé de plus de 4 cm depuis le dernier relevé est remis au dernier checkpoint. Actif seulement si le scénario est en état 'running' et que enableCheckpoints est vrai avec plus d'un élément dans lapConfig.

## Remarques

- M.state.vehicleCheckpoints[vehId] contient : vehicleName, checkTimer, pos, dirVec, upVec, currentWpName, currentWpIndex, nextWpIndex, initialPos, prevVehPos, raceOver. M.state.aiVehiclePath[vehId] garde l'argument de scenariohelper.setAiPath de l'IA (la liste waypoints perd chaque waypoint atteint).
- Seuls les véhicules playerUsable ou contrôlés par l'IA du scénario (scenario.aiControlledVehiclesById) sont initialisés (à la création du véhicule et au redémarrage du scénario).
- La remise au checkpoint est faite par une fonction locale ResetToSavedCheckpoint : resetBrokenFlexMesh, setPositionRotation, puis rappel GE via queueGameEngineLua vers completeReset, et recovery.clear() côté véhicule.
- Incohérence : completeReset indexe M.state.vehicleCheckpoints[vehicleId] sans vérifier qu'il existe (erreur Lua si le véhicule n'a pas de checkpoint).
- Sérialisé en onSerialize/onDeserialized (clés converties id <-> nom de véhicule) ; la sauvegarde de campagne n'enregistre que vehicleCheckpoints.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_checkpoints.completeReset(vehicleId, vehicleName)` | Appelé en retour (aller-retour véhicule -> GE) après le replacement : réapplique le chemin IA sauvegardé et informe scenario_waypoints des indices de waypoint du checkpoint. *(interne)* | 54 |
| `core_checkpoints.onClientEndMission(levelPath)` | Hook : à la sortie du niveau, remet les données à zéro. *(interne)* *(hook)* | 266 |
| `core_checkpoints.onClientPreStartMission(levelPath)` | Hook : avant le chargement d'un niveau, remet les données à zéro. *(interne)* *(hook)* | 261 |
| `core_checkpoints.onDeserialized(data)` | Hook : restaure l'état sérialisé (noms de véhicules reconvertis en ids). *(interne)* *(hook)* | 217 |
| `core_checkpoints.onPreRender(dt)` | Hook par image : détecte les véhicules IA immobiles (voir description du module) et les remet au dernier checkpoint. *(interne)* *(hook)* | 168 |
| `core_checkpoints.onRaceWaypointReached(data)` | Hook : un véhicule atteint un waypoint de course. Enregistre le checkpoint (position du waypoint ; direction = curRot du waypoint, sinon vecteur vitesse du véhicule) et marque raceOver au dernier waypoint. *(interne)* *(hook)* | 109 |
| `core_checkpoints.onResumeCampaign(campaignInProgress, data)` | Hook : reprise de campagne, restaure vehicleCheckpoints. *(interne)* *(hook)* | 285 |
| `core_checkpoints.onSaveCampaign(saveCallback)` | Hook : sauvegarde de campagne ; appelle saveCallback(M.__globalAlias__, {vehicleCheckpoints}). *(interne)* *(hook)* | 277 |
| `core_checkpoints.onScenarioRestarted(scenario)` | Hook : remet à zéro les données puis initialise un checkpoint pour chaque véhicule du scénario. *(interne)* *(hook)* | 198 |
| `core_checkpoints.onSerialize()` | Hook : renvoie vehicleCheckpoints et aiVehiclePath avec clés converties en noms de véhicules (rechargement des extensions). *(interne)* *(hook)* | 206 |
| `core_checkpoints.onVehicleDestroyed(vid)` | Hook : supprime le checkpoint du véhicule détruit. *(interne)* *(hook)* | 244 |
| `core_checkpoints.onVehicleSpawned(vehId)` | Hook : initialise le checkpoint d'un nouveau véhicule s'il n'en a pas. *(interne)* *(hook)* | 224 |
| `core_checkpoints.saveAIPath(vehicleName, arg)` | Mémorise le chemin IA (argument de setAiPath) du véhicule désigné par son nom, pour le restaurer à la remise au checkpoint. | 87 |
| `core_checkpoints.saveCheckpoint(vehicleId, vehicleName, cpData)` | Enregistre un point de reprise pour un véhicule et remet son chrono à 0. Sans cpData, utilise la position et la direction actuelles du véhicule ; le vecteur haut est toujours celui du véhicule. Ne fait rien (journal) si le véhicule n'existe pas. | 25 |

### Détail des paramètres

#### `core_checkpoints.completeReset(vehicleId, vehicleName)`

Appelé en retour (aller-retour véhicule -> GE) après le replacement : réapplique le chemin IA sauvegardé et informe scenario_waypoints des indices de waypoint du checkpoint.

- `vehicleId` (*integer*) : id du véhicule
- `vehicleName` (*string*) : nom du véhicule (journal)

#### `core_checkpoints.onClientEndMission(levelPath)`

Hook : à la sortie du niveau, remet les données à zéro.

- `levelPath` (*string*) : chemin du niveau

#### `core_checkpoints.onClientPreStartMission(levelPath)`

Hook : avant le chargement d'un niveau, remet les données à zéro.

- `levelPath` (*string*) : chemin du niveau

#### `core_checkpoints.onDeserialized(data)`

Hook : restaure l'état sérialisé (noms de véhicules reconvertis en ids).

- `data` (*table*) : table renvoyée par onSerialize

#### `core_checkpoints.onPreRender(dt)`

Hook par image : détecte les véhicules IA immobiles (voir description du module) et les remet au dernier checkpoint.

- `dt` (*number*) : secondes

#### `core_checkpoints.onRaceWaypointReached(data)`

Hook : un véhicule atteint un waypoint de course. Enregistre le checkpoint (position du waypoint ; direction = curRot du waypoint, sinon vecteur vitesse du véhicule) et marque raceOver au dernier waypoint.

- `data` (*table*) : vehicleId, vehicleName, curPos, curRot (optionnel), waypointName, cur, next

#### `core_checkpoints.onResumeCampaign(campaignInProgress, data)`

Hook : reprise de campagne, restaure vehicleCheckpoints.

- `campaignInProgress` (*any*) : non utilisé
- `data` (*table*) : données sauvegardées par onSaveCampaign

#### `core_checkpoints.onSaveCampaign(saveCallback)`

Hook : sauvegarde de campagne ; appelle saveCallback(M.__globalAlias__, {vehicleCheckpoints}).

- `saveCallback` (*function*) : fonction de sauvegarde de la campagne

#### `core_checkpoints.onScenarioRestarted(scenario)`

Hook : remet à zéro les données puis initialise un checkpoint pour chaque véhicule du scénario.

- `scenario` (*table*) : scénario (utilise vehicleNameToId)

#### `core_checkpoints.onSerialize()`

Hook : renvoie vehicleCheckpoints et aiVehiclePath avec clés converties en noms de véhicules (rechargement des extensions).

- **renvoie** : table données à sérialiser

#### `core_checkpoints.onVehicleDestroyed(vid)`

Hook : supprime le checkpoint du véhicule détruit.

- `vid` (*integer*) : id du véhicule

#### `core_checkpoints.onVehicleSpawned(vehId)`

Hook : initialise le checkpoint d'un nouveau véhicule s'il n'en a pas.

- `vehId` (*integer*) : id du véhicule

#### `core_checkpoints.saveAIPath(vehicleName, arg)`

Mémorise le chemin IA (argument de setAiPath) du véhicule désigné par son nom, pour le restaurer à la remise au checkpoint.

- `vehicleName` (*string*) : nom de l'objet véhicule dans scenetree
- `arg` (*table*) : table passée à scenario/scenariohelper.setAiPath (champ waypoints = noms)

#### `core_checkpoints.saveCheckpoint(vehicleId, vehicleName, cpData)`

Enregistre un point de reprise pour un véhicule et remet son chrono à 0. Sans cpData, utilise la position et la direction actuelles du véhicule ; le vecteur haut est toujours celui du véhicule. Ne fait rien (journal) si le véhicule n'existe pas.

- `vehicleId` (*integer*) : id du véhicule
- `vehicleName` (*string|nil*) : nom du véhicule ; « unnamed_<id> » si nil
- `cpData` (*table|nil*) : desiredPos, desiredDir (vec3), currentWpName, currentWpIndex, nextWpIndex

## Champs

| Champ | Type | Description |
|---|---|---|
| `state` | table | État interne : vehicleCheckpoints (table<integer, table>) et aiVehiclePath (table<integer, table>), remis à zéro au début/fin de niveau. |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/checkpoints.lua`.*
