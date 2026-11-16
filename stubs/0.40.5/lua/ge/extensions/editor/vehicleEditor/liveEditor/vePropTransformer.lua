---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/liveEditor/vePropTransformer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- 'Prop Transformer' window of the live Vehicle Editor: lets you choose a prop (visual part such as a mirror or a lamp) of the vehicle by aiming at its reference node ('Pick Prop', wheel to cycle through overlapping props) then modify its transformation live: baseTranslation, baseTranslationGlobal (m), baseRotation, baseRotationGlobal (displayed in degrees, converted to radians for the engine), either by numeric fields or with the axis gizmo. The values "without nodeRotate/Offset/Move" can be copied to the clipboard in the JSON format "x":…, "y":…, "z":… to paste them into the jbeam.
--- Access: extension `editor_vehicleEditor_liveEditor_vePropTransformer`: `extensions.load("editor_vehicleEditor_liveEditor_vePropTransformer")`, then the global `editor_vehicleEditor_liveEditor_vePropTransformer`
---@class editor_vehicleEditor_liveEditor_vePropTransformer
---@field menuEntry string 'Prop Transformer'.
editor_vehicleEditor_liveEditor_vePropTransformer = {}

--- Restores the open state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/vePropTransformer.lua:560
---@param data table onSerialize table.
function editor_vehicleEditor_liveEditor_vePropTransformer.onDeserialized(data) end

--- Returns {windowOpen}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/vePropTransformer.lua:554
---@return table  {windowOpen = boolean}
function editor_vehicleEditor_liveEditor_vePropTransformer.onSerialize() end

--- Called every frame: draws the window (Pick Prop button, translation/rotation fields, copy and gizmo buttons).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/vePropTransformer.lua:452
---@param dt number Time delta.
function editor_vehicleEditor_liveEditor_vePropTransformer.onUpdate(dt) end

--- Render hook emitted by editor_veMain: initializes the state if needed, draws the chosen prop, applies the transformation via the gizmo and runs the prop picking (mode 2).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/vePropTransformer.lua:433
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation time delta (s).
---@param dtRaw number Raw time delta (s).
function editor_vehicleEditor_liveEditor_vePropTransformer.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw) end

--- When a vehicle spawns, forgets then recreates its state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/vePropTransformer.lua:545
---@param id integer Vehicle ID.
function editor_vehicleEditor_liveEditor_vePropTransformer.onVehicleSpawned(id) end

--- On vehicle change, switches to the state of the new vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/vePropTransformer.lua:541
---@param oldVehicle integer ID of the old vehicle.
---@param newVehicle integer ID of the new vehicle.
---@param player integer Player index.
function editor_vehicleEditor_liveEditor_vePropTransformer.onVehicleSwitched(oldVehicle, newVehicle, player) end

--- Opens the window.
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/vePropTransformer.lua:550
function editor_vehicleEditor_liveEditor_vePropTransformer.open() end

