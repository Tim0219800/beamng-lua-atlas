---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/checkpoints.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Stores, for each vehicle of a race scenario, the last waypoint reached (position, direction, up vector, waypoint indices). Used to put back at the last checkpoint the AI-driven vehicles that are stuck: every 4 s, a non-playable vehicle that has left its starting point (> 1 m) and has not moved more than 4 cm since the last sample is put back at the last checkpoint. Active only if the scenario is in the 'running' state and enableCheckpoints is true with more than one element in lapConfig.
--- Access: extension `core_checkpoints`: `extensions.load("core_checkpoints")`, then the global `core_checkpoints`
---@class core_checkpoints
---@field state table Internal state: vehicleCheckpoints (table<integer, table>) and aiVehiclePath (table<integer, table>), reset at level start/end.
core_checkpoints = {}

--- Called back (round trip vehicle -> GE) after the replacement: reapplies the saved AI path and informs scenario_waypoints of the checkpoint's waypoint indices.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/checkpoints.lua:54
---@param vehicleId integer vehicle id
---@param vehicleName string vehicle name (log)
function core_checkpoints.completeReset(vehicleId, vehicleName) end

--- Hook: on leaving the level, resets the data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/checkpoints.lua:266
---@param levelPath string level path
function core_checkpoints.onClientEndMission(levelPath) end

--- Hook: before a level loads, resets the data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/checkpoints.lua:261
---@param levelPath string level path
function core_checkpoints.onClientPreStartMission(levelPath) end

--- Hook: restores the serialized state (vehicle names converted back to ids).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/checkpoints.lua:217
---@param data table table returned by onSerialize
function core_checkpoints.onDeserialized(data) end

--- Per-frame hook: detects stationary AI vehicles (see module description) and puts them back at the last checkpoint.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/checkpoints.lua:168
---@param dt number seconds
function core_checkpoints.onPreRender(dt) end

--- Hook: a vehicle reaches a race waypoint. Records the checkpoint (waypoint position; direction = the waypoint's curRot, otherwise the vehicle's velocity vector) and marks raceOver at the last waypoint.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/checkpoints.lua:109
---@param data table vehicleId, vehicleName, curPos, curRot (optional), waypointName, cur, next
function core_checkpoints.onRaceWaypointReached(data) end

--- Hook: campaign resume, restores vehicleCheckpoints.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/checkpoints.lua:285
---@param campaignInProgress any unused
---@param data table data saved by onSaveCampaign
function core_checkpoints.onResumeCampaign(campaignInProgress, data) end

--- Hook: campaign save; calls saveCallback(M.__globalAlias__, {vehicleCheckpoints}).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/checkpoints.lua:277
---@param saveCallback function campaign save function
function core_checkpoints.onSaveCampaign(saveCallback) end

--- Hook: resets the data then initializes a checkpoint for each vehicle of the scenario.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/checkpoints.lua:198
---@param scenario table scenario (uses vehicleNameToId)
function core_checkpoints.onScenarioRestarted(scenario) end

--- Hook: returns vehicleCheckpoints and aiVehiclePath with keys converted to vehicle names (extension reload).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/checkpoints.lua:206
---@return table  data to serialize
function core_checkpoints.onSerialize() end

--- Hook: removes the destroyed vehicle's checkpoint.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/checkpoints.lua:244
---@param vid integer vehicle id
function core_checkpoints.onVehicleDestroyed(vid) end

--- Hook: initializes the checkpoint of a new vehicle if it has none.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/checkpoints.lua:224
---@param vehId integer vehicle id
function core_checkpoints.onVehicleSpawned(vehId) end

--- Stores the AI path (argument of setAiPath) of the vehicle designated by its name, to restore it when put back at the checkpoint.
---Source: lua/ge/extensions/core/checkpoints.lua:87
---@param vehicleName string name of the vehicle object in scenetree
---@param arg table table passed to scenario/scenariohelper.setAiPath (waypoints field = names)
function core_checkpoints.saveAIPath(vehicleName, arg) end

--- Records a restart point for a vehicle and resets its timer to 0. Without cpData, uses the vehicle's current position and direction; the up vector is always the vehicle's. Does nothing (log) if the vehicle does not exist.
---Source: lua/ge/extensions/core/checkpoints.lua:25
---@param vehicleId integer vehicle id
---@param vehicleName string|nil vehicle name; "unnamed_<id>" if nil
---@param cpData table|nil desiredPos, desiredDir (vec3), currentWpName, currentWpIndex, nextWpIndex
function core_checkpoints.saveCheckpoint(vehicleId, vehicleName, cpData) end

