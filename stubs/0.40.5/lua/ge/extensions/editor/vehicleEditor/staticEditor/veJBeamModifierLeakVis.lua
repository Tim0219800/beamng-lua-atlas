---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamModifierLeakVis.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "JBeam Modifier Leaking Visualizer" app of the Static Editor. In JBeam, a modifier (for example beamSpring, nodeWeight, frictionCoef) placed in a line stays active for the following lines, even in the following parts of a vehicle (it "leaks"). This tool analyzes the parts of the loaded vehicle in load order, with their AST data, computes which modifiers leak from one part to another in each section, and displays them in a table (sections as buttons, parts as rows, modifiers as columns). Sections that leak are colored red. An "Ignore Default Values" checkbox (EXPERIMENTAL) ignores the values equal to the engine's default values (hard-coded modifiersDefaultValues table).
--- Access: extension `editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis`: `extensions.load("editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis")`, then the global `editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis`
---@class editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis
---@field menuEntry string Text of the Apps menu entry: "JBeam Modifier Leaking Visualizer".
editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis = {}

--- Hook called after a Lua reload: restores the window state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamModifierLeakVis.lua:1091
---@param data table table produced by onSerialize
function editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis.onDeserialized(data) end

--- Hook called before a Lua reload: saves the window state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamModifierLeakVis.lua:1085
---@return table  {windowOpen = boolean}
function editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis.onSerialize() end

--- Extension hook called every frame: draws the "Start Analysis" button, the default values checkbox, the section buttons and the modifiers table when the window is open and a vehicle is loaded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamModifierLeakVis.lua:904
function editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis.onUpdate() end

--- Opens the app window (windowOpen[0] = true).
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamModifierLeakVis.lua:1081
function editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis.open() end

