---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/traffic/baseRole.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Traffic role instance. Fields: veh (traffic vehicle object), name, class, actionName, actionTimer, state, flags, actions (table name -> function(args)), baseActions (pullOver, disabled), driver {personality, aggression}, targetId, targetVisible, targetNear, flowgraph, lockAction, ignorePersonality, keepPersonalityOnRefresh, keepActionOnRefresh.
---@class gameplay_traffic_baseRole
local gameplay_traffic_baseRole = {}

--- Applies a personality (merged into driver.personality) and sends the aggression to the AI. If data is not a table, restores the neutral personality.
---Source: lua/ge/extensions/gameplay/traffic/baseRole.lua:171
---@param data table|nil aggression, patience, bravery values.
function gameplay_traffic_baseRole:applyPersonality(data) end

--- Tests by static raycast whether the target vehicle is visible from this vehicle (aimed point 1 m above the target).
---Source: lua/ge/extensions/gameplay/traffic/baseRole.lua:191
---@param id integer|nil Target; default self.targetId.
---@return boolean  true if visible.
function gameplay_traffic_baseRole:checkTargetVisible(id) end

--- Stops and removes the flowgraph, restores the default AI mode and unlocks the action.
---Source: lua/ge/extensions/gameplay/traffic/baseRole.lua:99
function gameplay_traffic_baseRole:clearFlowgraph() end

--- For emergency vehicles: forces the lights. When true, advances the sequences that have a green light, and freezes (timer stopped) those whose lights are all red; when false, restarts the frozen sequences. No effect if the traffic lights are not active.
---Source: lua/ge/extensions/gameplay/traffic/baseRole.lua:202
---@param state boolean true to freeze, false to release.
function gameplay_traffic_baseRole:freezeTrafficSignals(state) end

--- Generates a random personality (aggression, patience, bravery). Returns the neutral personality (0.5) if ignorePersonality.
---Source: lua/ge/extensions/gameplay/traffic/baseRole.lua:152
---@return table<string, number>|nil  Personality; nil if the vehicle is not AI.
function gameplay_traffic_baseRole:generatePersonality() end

--- Initializes the role's default fields and the base actions pullOver and disabled. Options read from data: ignorePersonality, keepPersonalityOnRefresh, keepActionOnRefresh.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/baseRole.lua:9
---@param veh table Associated traffic vehicle.
---@param name string|nil Role name, 'none' by default.
---@param data table|nil Options (see description).
function gameplay_traffic_baseRole:init(veh, name, data) end

--- Extension point (empty): called by the traffic system when the vehicle has finished being active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/baseRole.lua:243
function gameplay_traffic_baseRole:onActiveDone() end

--- Extension point (empty): collision of this vehicle with another.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/baseRole.lua:261
---@param otherId integer Other vehicle.
---@param data table Collision data.
function gameplay_traffic_baseRole:onCollision(otherId, data) end

--- Extension point (empty): crash damage on this vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/baseRole.lua:255
---@param data table Event data.
function gameplay_traffic_baseRole:onCrashDamage(data) end

--- Restores the role after a Lua reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/baseRole.lua:287
---@param data table Data from onSerialize.
---@param veh table|nil Traffic vehicle; default gameplay_traffic.getTraffic()[data.id].
function gameplay_traffic_baseRole:onDeserialized(data, veh) end

--- Extension point (empty): collision between two other vehicles.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/baseRole.lua:264
---@param id1 integer First vehicle.
---@param id2 integer Second vehicle.
---@param data table Collision data.
function gameplay_traffic_baseRole:onOtherCollision(id1, id2, data) end

--- Extension point (empty): crash damage on another vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/baseRole.lua:258
---@param otherId integer Vehicle hit.
---@param data table Event data.
function gameplay_traffic_baseRole:onOtherCrashDamage(otherId, data) end

--- Extension point (empty): event related to another vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/baseRole.lua:267
---@param eventType string Event type.
---@param otherId integer Other vehicle.
---@param data table Data.
function gameplay_traffic_baseRole:onOtherEvent(eventType, otherId, data) end

--- Extension point (empty): called by postInit, on vehicle creation and refresh.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/baseRole.lua:246
function gameplay_traffic_baseRole:onRefresh() end

--- Extension point (empty): called when the role ends.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/baseRole.lua:252
function gameplay_traffic_baseRole:onRoleEnded() end

--- Extension point (empty): called when the role becomes active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/baseRole.lua:249
function gameplay_traffic_baseRole:onRoleStarted() end

--- Serializes the vehicle id, name, state, action name and target.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/baseRole.lua:276
---@return table  Data {id, name, state, actionName, targetId}.
function gameplay_traffic_baseRole:onSerialize() end

--- Extension point (empty): periodic tick of the traffic system.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/baseRole.lua:270
---@param tickTime number Tick duration (s).
function gameplay_traffic_baseRole:onTrafficTick(tickTime) end

--- Extension point (empty): per-frame update.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/baseRole.lua:273
---@param dt number Real time (s).
---@param dtSim number Simulated time (s).
function gameplay_traffic_baseRole:onUpdate(dt, dtSim) end

--- Called after construction (and on each vehicle refresh): resets the action and regenerates the personality unless keepActionOnRefresh / keepPersonalityOnRefresh, then calls onRefresh.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/baseRole.lua:65
function gameplay_traffic_baseRole:postInit() end

--- Resets to the default action: default AI mode, parameters and electrics reset, flags cleared, state 'none', target cleared. No effect if lockAction. Called on each vehicle respawn unless keepActionOnRefresh.
---Source: lua/ge/extensions/gameplay/traffic/baseRole.lua:137
function gameplay_traffic_baseRole:resetAction() end

--- Runs the named action from self.actions (unless lockAction), stores its name and emits the hook onTrafficAction(vehId, name, {targetId, data}). Error logged if the action does not exist.
---Source: lua/ge/extensions/gameplay/traffic/baseRole.lua:118
---@param name string Name of the action.
---@param args table|nil Arguments passed to the action.
function gameplay_traffic_baseRole:setAction(name, args) end

--- Computes and sends to the vehicle's AI the aggression (ai.setAggression), taking personality into account unless ignored.
---Source: lua/ge/extensions/gameplay/traffic/baseRole.lua:130
---@param baseAggression number|nil Base value; default baseAggression of the traffic variables.
---@param ignorePersonality boolean|nil Do not apply the personality modifier.
function gameplay_traffic_baseRole:setAggression(baseAggression, ignorePersonality) end

--- Sets the target vehicle (if the identifier exists) and, for an AI vehicle, sends ai.setTargetObjectID.
---Source: lua/ge/extensions/gameplay/traffic/baseRole.lua:108
---@param id integer Target object identifier.
function gameplay_traffic_baseRole:setTarget(id) end

--- Loads a flowgraph specific to this vehicle, sets its variables, activates it (with keepTrafficState), sets the vehicle's AI to 'stop' mode and locks the action (lockAction). Logs an error if the file is not found.
---Source: lua/ge/extensions/gameplay/traffic/baseRole.lua:75
---@param fgFile string Flowgraph file path.
---@param varData table<string, any>|nil Flowgraph variable values (warning if the variable does not exist).
function gameplay_traffic_baseRole:setupFlowgraph(fgFile, varData) end

--- Extension point (empty): random event attempt of the role.
---Source: lua/ge/extensions/gameplay/traffic/baseRole.lua:240
function gameplay_traffic_baseRole:tryRandomEvent() end

