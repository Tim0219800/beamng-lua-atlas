# `core_checkpoints`

*File: `lua/ge/extensions/core/checkpoints.lua` · VM: Game Engine (GE) · 311 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_checkpoints`: `extensions.load("core_checkpoints")`, then the global `core_checkpoints`

Stores, for each vehicle of a race scenario, the last waypoint reached (position, direction, up vector, waypoint indices). Used to put back at the last checkpoint the AI-driven vehicles that are stuck: every 4 s, a non-playable vehicle that has left its starting point (> 1 m) and has not moved more than 4 cm since the last sample is put back at the last checkpoint. Active only if the scenario is in the 'running' state and enableCheckpoints is true with more than one element in lapConfig.

## Notes

- M.state.vehicleCheckpoints[vehId] contains: vehicleName, checkTimer, pos, dirVec, upVec, currentWpName, currentWpIndex, nextWpIndex, initialPos, prevVehPos, raceOver. M.state.aiVehiclePath[vehId] keeps the argument of the AI's scenariohelper.setAiPath (the waypoints list loses each waypoint reached).
- Only vehicles that are playerUsable or controlled by the scenario's AI (scenario.aiControlledVehiclesById) are initialized (when the vehicle is created and when the scenario restarts).
- The reset to checkpoint is done by a local function ResetToSavedCheckpoint: resetBrokenFlexMesh, setPositionRotation, then a GE callback via queueGameEngineLua to completeReset, and recovery.clear() on the vehicle side.
- Inconsistency: completeReset indexes M.state.vehicleCheckpoints[vehicleId] without checking that it exists (Lua error if the vehicle has no checkpoint).
- Serialized in onSerialize/onDeserialized (keys converted id <-> vehicle name); the campaign save only records vehicleCheckpoints.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_checkpoints.completeReset(vehicleId, vehicleName)` | Called back (round trip vehicle -> GE) after the replacement: reapplies the saved AI path and informs scenario_waypoints of the checkpoint's waypoint indices. *(internal)* | 54 |
| `core_checkpoints.onClientEndMission(levelPath)` | Hook: on leaving the level, resets the data. *(internal)* *(hook)* | 266 |
| `core_checkpoints.onClientPreStartMission(levelPath)` | Hook: before a level loads, resets the data. *(internal)* *(hook)* | 261 |
| `core_checkpoints.onDeserialized(data)` | Hook: restores the serialized state (vehicle names converted back to ids). *(internal)* *(hook)* | 217 |
| `core_checkpoints.onPreRender(dt)` | Per-frame hook: detects stationary AI vehicles (see module description) and puts them back at the last checkpoint. *(internal)* *(hook)* | 168 |
| `core_checkpoints.onRaceWaypointReached(data)` | Hook: a vehicle reaches a race waypoint. Records the checkpoint (waypoint position; direction = the waypoint's curRot, otherwise the vehicle's velocity vector) and marks raceOver at the last waypoint. *(internal)* *(hook)* | 109 |
| `core_checkpoints.onResumeCampaign(campaignInProgress, data)` | Hook: campaign resume, restores vehicleCheckpoints. *(internal)* *(hook)* | 285 |
| `core_checkpoints.onSaveCampaign(saveCallback)` | Hook: campaign save; calls saveCallback(M.__globalAlias__, {vehicleCheckpoints}). *(internal)* *(hook)* | 277 |
| `core_checkpoints.onScenarioRestarted(scenario)` | Hook: resets the data then initializes a checkpoint for each vehicle of the scenario. *(internal)* *(hook)* | 198 |
| `core_checkpoints.onSerialize()` | Hook: returns vehicleCheckpoints and aiVehiclePath with keys converted to vehicle names (extension reload). *(internal)* *(hook)* | 206 |
| `core_checkpoints.onVehicleDestroyed(vid)` | Hook: removes the destroyed vehicle's checkpoint. *(internal)* *(hook)* | 244 |
| `core_checkpoints.onVehicleSpawned(vehId)` | Hook: initializes the checkpoint of a new vehicle if it has none. *(internal)* *(hook)* | 224 |
| `core_checkpoints.saveAIPath(vehicleName, arg)` | Stores the AI path (argument of setAiPath) of the vehicle designated by its name, to restore it when put back at the checkpoint. | 87 |
| `core_checkpoints.saveCheckpoint(vehicleId, vehicleName, cpData)` | Records a restart point for a vehicle and resets its timer to 0. Without cpData, uses the vehicle's current position and direction; the up vector is always the vehicle's. Does nothing (log) if the vehicle does not exist. | 25 |

### Parameter details

#### `core_checkpoints.completeReset(vehicleId, vehicleName)`

Called back (round trip vehicle -> GE) after the replacement: reapplies the saved AI path and informs scenario_waypoints of the checkpoint's waypoint indices.

- `vehicleId` (*integer*) : vehicle id
- `vehicleName` (*string*) : vehicle name (log)

#### `core_checkpoints.onClientEndMission(levelPath)`

Hook: on leaving the level, resets the data.

- `levelPath` (*string*) : level path

#### `core_checkpoints.onClientPreStartMission(levelPath)`

Hook: before a level loads, resets the data.

- `levelPath` (*string*) : level path

#### `core_checkpoints.onDeserialized(data)`

Hook: restores the serialized state (vehicle names converted back to ids).

- `data` (*table*) : table returned by onSerialize

#### `core_checkpoints.onPreRender(dt)`

Per-frame hook: detects stationary AI vehicles (see module description) and puts them back at the last checkpoint.

- `dt` (*number*) : seconds

#### `core_checkpoints.onRaceWaypointReached(data)`

Hook: a vehicle reaches a race waypoint. Records the checkpoint (waypoint position; direction = the waypoint's curRot, otherwise the vehicle's velocity vector) and marks raceOver at the last waypoint.

- `data` (*table*) : vehicleId, vehicleName, curPos, curRot (optional), waypointName, cur, next

#### `core_checkpoints.onResumeCampaign(campaignInProgress, data)`

Hook: campaign resume, restores vehicleCheckpoints.

- `campaignInProgress` (*any*) : unused
- `data` (*table*) : data saved by onSaveCampaign

#### `core_checkpoints.onSaveCampaign(saveCallback)`

Hook: campaign save; calls saveCallback(M.__globalAlias__, {vehicleCheckpoints}).

- `saveCallback` (*function*) : campaign save function

#### `core_checkpoints.onScenarioRestarted(scenario)`

Hook: resets the data then initializes a checkpoint for each vehicle of the scenario.

- `scenario` (*table*) : scenario (uses vehicleNameToId)

#### `core_checkpoints.onSerialize()`

Hook: returns vehicleCheckpoints and aiVehiclePath with keys converted to vehicle names (extension reload).

- **returns**: table data to serialize

#### `core_checkpoints.onVehicleDestroyed(vid)`

Hook: removes the destroyed vehicle's checkpoint.

- `vid` (*integer*) : vehicle id

#### `core_checkpoints.onVehicleSpawned(vehId)`

Hook: initializes the checkpoint of a new vehicle if it has none.

- `vehId` (*integer*) : vehicle id

#### `core_checkpoints.saveAIPath(vehicleName, arg)`

Stores the AI path (argument of setAiPath) of the vehicle designated by its name, to restore it when put back at the checkpoint.

- `vehicleName` (*string*) : name of the vehicle object in scenetree
- `arg` (*table*) : table passed to scenario/scenariohelper.setAiPath (waypoints field = names)

#### `core_checkpoints.saveCheckpoint(vehicleId, vehicleName, cpData)`

Records a restart point for a vehicle and resets its timer to 0. Without cpData, uses the vehicle's current position and direction; the up vector is always the vehicle's. Does nothing (log) if the vehicle does not exist.

- `vehicleId` (*integer*) : vehicle id
- `vehicleName` (*string|nil*) : vehicle name; "unnamed_<id>" if nil
- `cpData` (*table|nil*) : desiredPos, desiredDir (vec3), currentWpName, currentWpIndex, nextWpIndex

## Fields

| Field | Type | Description |
|---|---|---|
| `state` | table | Internal state: vehicleCheckpoints (table<integer, table>) and aiVehiclePath (table<integer, table>), reset at level start/end. |

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/checkpoints.lua`.*
