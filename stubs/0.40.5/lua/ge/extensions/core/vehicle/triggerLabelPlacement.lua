---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicle/triggerLabelPlacement.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_vehicle_triggerLabelPlacement`: computes where to place the UI label of a vehicle trigger (jbeam interaction zones) around its box projected on screen. Rebuilds the trigger's basis (axes) from the idRef/idX/idY nodes and its rotations (reproducing the C++ code's sequence), derives the half-dimensions, projects the 8 corners onto the screen and picks the side (right, left, top, bottom) with the most room. Utility functions with no persistent state, used by the trigger UI/debug tools and by core_vehicle_vehicleTriggerHighlight.
--- Access: extension `core_vehicle_triggerLabelPlacement`: `extensions.load("core_vehicle_triggerLabelPlacement")`, then the global `core_vehicle_triggerLabelPlacement`
---@class core_vehicle_triggerLabelPlacement
core_vehicle_triggerLabelPlacement = {}

--- Computes the placement of a trigger's label: projects the trigger's box on screen and chooses the label side with its position (labelX, labelY as screen fraction) and CSS offsets (labelTx, labelTy, with 0.6em margin).
---Source: lua/ge/extensions/core/vehicle/triggerLabelPlacement.lua:282
---@param vehicleObj userdata vehicle carrying the trigger
---@param triggerObj userdata|nil trigger object (getCenter method); unnecessary if centerWorld is provided
---@param triggerData table trigger jbeam data (idRef, idX, idY, size, baseRotation, rotation...)
---@param worldToScreenPercent01 function|nil function(worldPos, output) -> {x, y} in screen fractions
---@param p table|nil optional profiler (add method) to measure the steps
---@param centerWorld vec3|nil trigger center in world space (otherwise triggerObj:getCenter())
---@param centerScreen table|nil center on screen, already computed (otherwise computed via worldToScreenPercent01)
---@return table|nil  {labelX, labelY, labelTx, labelTy, labelSide ('right'|'left'|'top'|'bottom'), bounds = {minX, maxX, minY, maxY, centerX, centerY}}; nil if projection is impossible
function core_vehicle_triggerLabelPlacement.computeForTrigger(vehicleObj, triggerObj, triggerData, worldToScreenPercent01, p, centerWorld, centerScreen) end

--- Returns the trigger's orthonormal basis and its half-dimensions, shared with the debug/highlight drawings to stay consistent with the placement.
---Source: lua/ge/extensions/core/vehicle/triggerLabelPlacement.lua:352
---@param vehicleObj userdata vehicle carrying the trigger
---@param triggerData table trigger data
---@return vec3  X axis
---@return vec3  Y axis
---@return vec3  Z axis
---@return number  X half-dimension
---@return number  Y half-dimension
---@return number  Z half-dimension
function core_vehicle_triggerLabelPlacement.computeTriggerBasisAndHalfExtents(vehicleObj, triggerData) end

