---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/liveEditor/veJBeamPicker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- 'JBeam Picker' window of the live Vehicle Editor: lets you choose nodes and beams of the vehicle (with the mouse, or by typing an ID/name with suggestions) and follow their data live. 'Nodes' / 'Beams' tab: tree of the chosen elements, choice of the data to display (node: velocity, relative velocity, force; beam: length, speed, force, stress, damping), filter by beam type (NORMALTYPE, BEAM_ANISOTROPIC, BEAM_BOUNDED, BEAM_PRESSURED, BEAM_LBEAM, BEAM_BROKEN, BEAM_HYDRO, BEAM_SUPPORT) and graphs (1000 points). Picking uses the game's Node/Beam debug modes (Ctrl+M / Ctrl+B).
--- Access: extension `editor_vehicleEditor_liveEditor_veJBeamPicker`: `extensions.load("editor_vehicleEditor_liveEditor_veJBeamPicker")`, then the global `editor_vehicleEditor_liveEditor_veJBeamPicker`
---@class editor_vehicleEditor_liveEditor_veJBeamPicker
---@field beamDataFromVELua table<integer, table<string, any>> Beam data returned by the vehicle VM, keyed by beam ID then data name (speed, force, stress, damping).
---@field menuEntry string 'JBeam Picker'.
---@field nodeDataFromVELua table<integer, table<string, any>> Node data returned by the vehicle VM, keyed by node ID then data name (e.g. force).
editor_vehicleEditor_liveEditor_veJBeamPicker = {}

--- Restores the open state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veJBeamPicker.lua:790
---@param data table onSerialize table.
function editor_vehicleEditor_liveEditor_veJBeamPicker.onDeserialized(data) end

--- Called at editor initialization: creates the beam type checkboxes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veJBeamPicker.lua:776
function editor_vehicleEditor_liveEditor_veJBeamPicker.onEditorInitialized() end

--- Returns {windowOpen}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veJBeamPicker.lua:784
---@return table  {windowOpen = boolean}
function editor_vehicleEditor_liveEditor_veJBeamPicker.onSerialize() end

--- Called every frame: draws the Nodes/Beams tabbed window and advances the graph offset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veJBeamPicker.lua:733
---@param dt number Time delta.
function editor_vehicleEditor_liveEditor_veJBeamPicker.onUpdate(dt) end

--- Render hook emitted by editor_veMain: draws the chosen elements and runs the node or beam picking depending on the state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veJBeamPicker.lua:720
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation time delta (s).
---@param dtRaw number Raw time delta (s).
function editor_vehicleEditor_liveEditor_veJBeamPicker.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw) end

--- Opens the window.
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veJBeamPicker.lua:772
function editor_vehicleEditor_liveEditor_veJBeamPicker.open() end

--- Callback of the drawn-beams request: remembers the available beams and their scale (selection radius = 5 x scale).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veJBeamPicker.lua:172
---@param beams table Beams available for picking.
---@param scale number Drawing scale of the beams.
function editor_vehicleEditor_liveEditor_veJBeamPicker.requestDrawnBeamsCallback(beams, scale) end

--- Callback of the drawn-nodes request: remembers the list of nodes available for picking and their display scale (selection radius = 2 x scale).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veJBeamPicker.lua:165
---@param nodes table Nodes available for picking.
---@param scale number Drawing scale of the nodes.
function editor_vehicleEditor_liveEditor_veJBeamPicker.requestDrawnNodesCallback(nodes, scale) end

