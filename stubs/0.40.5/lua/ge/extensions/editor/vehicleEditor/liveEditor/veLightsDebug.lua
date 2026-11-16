---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/liveEditor/veLightsDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- 'Lights Debug' window of the live Vehicle Editor. Draws with debugDrawer the vehicle's light props (vdata.props whose mesh is SPOTLIGHT or POINTLIGHT): for a spot, a sphere, a direction line of length lightRange and an arrow head; for a point light, a sphere and a translucent sphere of radius lightRange. Options: spots, points, X-Ray (no depth test), names, unit vectors (length 1).
--- Access: extension `editor_vehicleEditor_liveEditor_veLightsDebug`: `extensions.load("editor_vehicleEditor_liveEditor_veLightsDebug")`, then the global `editor_vehicleEditor_liveEditor_veLightsDebug`
---@class editor_vehicleEditor_liveEditor_veLightsDebug
---@field menuEntry string 'Lights Debug'.
editor_vehicleEditor_liveEditor_veLightsDebug = {}

--- Restores the open state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veLightsDebug.lua:147
---@param data table onSerialize table.
function editor_vehicleEditor_liveEditor_veLightsDebug.onDeserialized(data) end

--- Returns {windowOpen}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veLightsDebug.lua:141
---@return table  {windowOpen = boolean}
function editor_vehicleEditor_liveEditor_veLightsDebug.onSerialize() end

--- Called every frame: draws the window with the checkboxes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veLightsDebug.lua:123
function editor_vehicleEditor_liveEditor_veLightsDebug.onUpdate() end

--- Hook emitted by editor_veMain every render frame: draws the spots and point lights of the vehicle's props if the window is open.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veLightsDebug.lua:32
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation time delta (s).
---@param dtRaw number Raw time delta (s).
function editor_vehicleEditor_liveEditor_veLightsDebug.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw) end

--- Opens the window.
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veLightsDebug.lua:137
function editor_vehicleEditor_liveEditor_veLightsDebug.open() end

