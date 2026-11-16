---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicle/vehicleTriggerHighlight.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_vehicle_vehicleTriggerHighlight`: highlights vehicle triggers (interaction zones defined in the jbeam) in the 3D world. Every frame, onUpdate draws with debugDrawer a sphere (with a camera-facing circle) or a pulsing box (oscillating alpha) and, if requested, a label 'id - name [section]'. Useful for trigger debug/editing tools.
--- Access: extension `core_vehicle_vehicleTriggerHighlight`: `extensions.load("core_vehicle_vehicleTriggerHighlight")`, then the global `core_vehicle_vehicleTriggerHighlight`
---@class core_vehicle_vehicleTriggerHighlight
core_vehicle_vehicleTriggerHighlight = {}

--- Removes all highlights from all vehicles.
---Source: lua/ge/extensions/core/vehicle/vehicleTriggerHighlight.lua:207
function core_vehicle_vehicleTriggerHighlight.clearHighlightedTrigger() end

--- Exports the highlights as a serializable list.
---Source: lua/ge/extensions/core/vehicle/vehicleTriggerHighlight.lua:211
---@return table[]  list of {vehId, triggerId, options}
function core_vehicle_vehicleTriggerHighlight.getSerializedHighlightedTriggerData() end

--- Indicates whether at least one trigger is highlighted.
---Source: lua/ge/extensions/core/vehicle/vehicleTriggerHighlight.lua:154
---@return boolean  true if there is one
function core_vehicle_vehicleTriggerHighlight.hasHighlightedTriggers() end

--- Indicates whether a given trigger is highlighted.
---Source: lua/ge/extensions/core/vehicle/vehicleTriggerHighlight.lua:158
---@param vehId integer vehicle
---@param triggerId integer|string trigger cid
---@return boolean  true if highlighted
function core_vehicle_vehicleTriggerHighlight.isHighlightedTrigger(vehId, triggerId) end

--- Per-frame hook: draws each highlighted trigger (sphere or pulsing box, label).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/vehicleTriggerHighlight.lua:282
---@param dt number elapsed time (s), used to pulse the alpha
function core_vehicle_vehicleTriggerHighlight.onUpdate(dt) end

--- Adds a trigger to the highlight (does not clear the others).
---Source: lua/ge/extensions/core/vehicle/vehicleTriggerHighlight.lua:164
---@param vehId integer vehicle
---@param triggerId integer|string trigger cid
---@param options table|nil {showTriggerIdAsLabel = boolean}
function core_vehicle_vehicleTriggerHighlight.setHighlightedTrigger(vehId, triggerId, options) end

--- Like setHighlightedTrigger but finds the trigger by its name, its jbeam id or its cid in the vehicle's vdata.triggers.
---Source: lua/ge/extensions/core/vehicle/vehicleTriggerHighlight.lua:189
---@param vehId integer vehicle
---@param triggerName string|number trigger name, id or cid
---@param options table|nil {showTriggerIdAsLabel = boolean}
---@return boolean  false if the trigger is not found
function core_vehicle_vehicleTriggerHighlight.setHighlightedTriggerByName(vehId, triggerName, options) end

--- Replaces all highlights with those of the given list (getSerialized... format). Also accepts the legacy format of a single {vehId, triggerId} tuple.
---Source: lua/ge/extensions/core/vehicle/vehicleTriggerHighlight.lua:224
---@param data table list of {vehId, triggerId, options}
function core_vehicle_vehicleTriggerHighlight.setSerializedHighlightedTriggerData(data) end

--- Removes a trigger from the highlight.
---Source: lua/ge/extensions/core/vehicle/vehicleTriggerHighlight.lua:196
---@param vehId integer vehicle
---@param triggerId integer|string trigger cid
function core_vehicle_vehicleTriggerHighlight.unhighlightTrigger(vehId, triggerId) end

