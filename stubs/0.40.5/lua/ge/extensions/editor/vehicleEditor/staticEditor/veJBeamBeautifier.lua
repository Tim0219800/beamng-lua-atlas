---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamBeautifier.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "JBeam Beautifier" app of the Static Editor. It reformats .jbeam files (one file or a whole folder) by aligning in columns the arrays of the chosen sections (beams, nodes, quads, slots, slots2, triangles), with an option to align the header line and round numbers (0 to 5 decimals). It works on the file's AST (json-ast) and only changes whitespace and, if requested, the rounding.
--- Access: extension `editor_vehicleEditor_staticEditor_veJBeamBeautifier`: `extensions.load("editor_vehicleEditor_staticEditor_veJBeamBeautifier")`, then the global `editor_vehicleEditor_staticEditor_veJBeamBeautifier`
---@class editor_vehicleEditor_staticEditor_veJBeamBeautifier
---@field menuEntry string Text of the Apps menu entry: "JBeam Beautifier".
editor_vehicleEditor_staticEditor_veJBeamBeautifier = {}

--- Hook called after a Lua reload: restores the window state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamBeautifier.lua:432
---@param data table table produced by onSerialize
function editor_vehicleEditor_staticEditor_veJBeamBeautifier.onDeserialized(data) end

--- Hook called before a Lua reload: saves the window state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamBeautifier.lua:426
---@return table  {windowOpen = boolean}
function editor_vehicleEditor_staticEditor_veJBeamBeautifier.onSerialize() end

--- Extension hook called every frame: draws the window (sections to process, settings, folder/file selection, launch button) when it is open.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamBeautifier.lua:361
function editor_vehicleEditor_staticEditor_veJBeamBeautifier.onUpdate() end

--- Opens the app window (windowOpen[0] = true).
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamBeautifier.lua:422
function editor_vehicleEditor_staticEditor_veJBeamBeautifier.open() end

