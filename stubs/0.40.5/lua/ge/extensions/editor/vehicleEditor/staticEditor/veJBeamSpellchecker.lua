---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamSpellchecker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "JBeam Spellchecker" app of the Static Editor. The "Start Analysis" button walks through all the *.jbeam files of the vehicles folder and checks that the modifiers (inline options or dictionary option lines) used in the flexbodies, props, nodes, beams, triangles, hydros, torsionbars, torsionHydros and variables sections are part of a whitelist hard-coded in the file. Any unknown modifier is reported by an error log "Section: X Modifier: 'Y' not valid!" with the file path.
--- Access: extension `editor_vehicleEditor_staticEditor_veJBeamSpellchecker`: `extensions.load("editor_vehicleEditor_staticEditor_veJBeamSpellchecker")`, then the global `editor_vehicleEditor_staticEditor_veJBeamSpellchecker`
---@class editor_vehicleEditor_staticEditor_veJBeamSpellchecker
---@field menuEntry string Text of the Apps menu entry: "JBeam Spellchecker".
editor_vehicleEditor_staticEditor_veJBeamSpellchecker = {}

--- Hook called after a Lua reload: restores the window state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamSpellchecker.lua:473
---@param data table table produced by onSerialize
function editor_vehicleEditor_staticEditor_veJBeamSpellchecker.onDeserialized(data) end

--- Hook called before a Lua reload: saves the window state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamSpellchecker.lua:467
---@return table  {windowOpen = boolean}
function editor_vehicleEditor_staticEditor_veJBeamSpellchecker.onSerialize() end

--- Extension hook called every frame: draws the window with the "Start Analysis" button when it is open.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamSpellchecker.lua:450
function editor_vehicleEditor_staticEditor_veJBeamSpellchecker.onUpdate() end

--- Opens the app window (windowOpen[0] = true).
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamSpellchecker.lua:463
function editor_vehicleEditor_staticEditor_veJBeamSpellchecker.open() end

