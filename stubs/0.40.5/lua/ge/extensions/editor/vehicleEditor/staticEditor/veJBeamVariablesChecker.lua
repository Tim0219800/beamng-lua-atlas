---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamVariablesChecker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "JBeam Variables Checker" app of the Static Editor. The "Start Analysis" button walks through all the vehicle folders, reads their .pc (configuration) and .jbeam files, and checks that the variable values (defaults in the JBeam and values imposed by the .pc) respect the variable's min/max bounds. Out-of-range values are reported in the console with a warning (log W) indicating where the variable and the value are defined.
--- Access: extension `editor_vehicleEditor_staticEditor_veJBeamVariablesChecker`: `extensions.load("editor_vehicleEditor_staticEditor_veJBeamVariablesChecker")`, then the global `editor_vehicleEditor_staticEditor_veJBeamVariablesChecker`
---@class editor_vehicleEditor_staticEditor_veJBeamVariablesChecker
---@field menuEntry string Text of the Apps menu entry: "JBeam Variables Checker".
editor_vehicleEditor_staticEditor_veJBeamVariablesChecker = {}

--- Hook called after a Lua reload: restores the window state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamVariablesChecker.lua:127
---@param data table table produced by onSerialize
function editor_vehicleEditor_staticEditor_veJBeamVariablesChecker.onDeserialized(data) end

--- Hook called before a Lua reload: saves the window state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamVariablesChecker.lua:121
---@return table  {windowOpen = boolean}
function editor_vehicleEditor_staticEditor_veJBeamVariablesChecker.onSerialize() end

--- Extension hook called every frame: draws the window with the "Start Analysis" button when it is open.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamVariablesChecker.lua:102
function editor_vehicleEditor_staticEditor_veJBeamVariablesChecker.onUpdate() end

--- Opens the app window (windowOpen[0] = true).
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamVariablesChecker.lua:117
function editor_vehicleEditor_staticEditor_veJBeamVariablesChecker.open() end

