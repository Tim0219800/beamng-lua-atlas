---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamTableVis.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "JBeam Table Visualizer" app of the vehicle editor's Static Editor. It loads a .jbeam file chosen via a file selector, recursively looks for tables of numbers that can be plotted as a curve (for example an engine's torque curves), and displays them with plotHelperUtil (Catmull-Rom curve, auto scaling). A Refresh button re-reads the file from disk.
--- Access: extension `editor_vehicleEditor_staticEditor_veJBeamTableVis`: `extensions.load("editor_vehicleEditor_staticEditor_veJBeamTableVis")`, then the global `editor_vehicleEditor_staticEditor_veJBeamTableVis`
---@class editor_vehicleEditor_staticEditor_veJBeamTableVis
---@field menuEntry string Text of the Apps menu entry: "JBeam Table Visualizer".
editor_vehicleEditor_staticEditor_veJBeamTableVis = {}

--- Hook called after a Lua reload: restores the window state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamTableVis.lua:190
---@param data table table produced by onSerialize
function editor_vehicleEditor_staticEditor_veJBeamTableVis.onDeserialized(data) end

--- Hook called before a Lua reload: saves the open/closed state of the window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamTableVis.lua:184
---@return table  {windowOpen = boolean}
function editor_vehicleEditor_staticEditor_veJBeamTableVis.onSerialize() end

--- Extension hook called every frame: if the window is open and a vehicle is loaded in the editor, draws the file open button, the list of plottable data, the Refresh button and the graph.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamTableVis.lua:136
---@param dt number time delta (s), passed to the plot
function editor_vehicleEditor_staticEditor_veJBeamTableVis.onUpdate(dt) end

--- Opens the app window (windowOpen[0] = true). Called by the Static Editor's Apps menu.
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamTableVis.lua:180
function editor_vehicleEditor_staticEditor_veJBeamTableVis.open() end

