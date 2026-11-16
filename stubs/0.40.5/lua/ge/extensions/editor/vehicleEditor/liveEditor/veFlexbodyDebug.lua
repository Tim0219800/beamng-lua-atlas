---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/liveEditor/veFlexbodyDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- 'Flexbody Debug' window of the live Vehicle Editor, to diagnose the vehicle's flexbodies (deformable meshes). 'Single Flexmesh' tab: choose a flexbody (sorted combo, favorites), set the mesh visibility, display the chosen flexbody, pick a node or a vertex with the mouse within a 'Max Dist from Cursor' radius (0 to 10 m) and visualize their relationships. 'All Flexmeshes' tab: find vertices without a nearby node and (expert mode) vertices with out-of-range coordinates. Depends on editor_veMain.
--- Access: extension `editor_vehicleEditor_liveEditor_veFlexbodyDebug`: `extensions.load("editor_vehicleEditor_liveEditor_veFlexbodyDebug")`, then the global `editor_vehicleEditor_liveEditor_veFlexbodyDebug`
---@class editor_vehicleEditor_liveEditor_veFlexbodyDebug
---@field dependencies table<integer, string> {'editor_veMain'}.
---@field menuEntry string 'Flexbody Debug'.
editor_vehicleEditor_liveEditor_veFlexbodyDebug = {}

--- Restores the open state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veFlexbodyDebug.lua:1157
---@param data table onSerialize table.
function editor_vehicleEditor_liveEditor_veFlexbodyDebug.onDeserialized(data) end

--- Returns {windowOpen}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veFlexbodyDebug.lua:1151
---@return table  {windowOpen = boolean}
function editor_vehicleEditor_liveEditor_veFlexbodyDebug.onSerialize() end

--- Called every frame: initializes the vehicle state, draws the tabbed window and the side windows (out-of-range vertices, vertices without nodes).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veFlexbodyDebug.lua:1108
---@param dt number Time delta.
function editor_vehicleEditor_liveEditor_veFlexbodyDebug.onUpdate(dt) end

--- Render hook emitted by editor_veMain: draws the selected flexbody and runs the node/vertex picking according to the current mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veFlexbodyDebug.lua:622
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation time delta (s).
---@param dtRaw number Raw time delta (s).
function editor_vehicleEditor_liveEditor_veFlexbodyDebug.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw) end

--- When a vehicle spawns, forgets its remembered data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veFlexbodyDebug.lua:1143
---@param id integer Vehicle ID.
function editor_vehicleEditor_liveEditor_veFlexbodyDebug.onVehicleSpawned(id) end

--- On vehicle change, switches to the state of the new vehicle (or creates it).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veFlexbodyDebug.lua:1139
---@param oldVehicle integer ID of the old vehicle.
---@param newVehicle integer ID of the new vehicle.
---@param player integer Player index.
function editor_vehicleEditor_liveEditor_veFlexbodyDebug.onVehicleSwitched(oldVehicle, newVehicle, player) end

--- Opens the window.
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veFlexbodyDebug.lua:1147
function editor_vehicleEditor_liveEditor_veFlexbodyDebug.open() end

