---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartTextView.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Part Text View" window of the Static Editor. It displays the JBeam file of the selected part as a sequence of colored syntax tree (AST, json-ast library) nodes (strings, comments, lists, objects), with line numbers and automatic scrolling to nodes selected elsewhere in the editor. Double-clicking a string, number or boolean node edits it ("Edit Node" modal window). The menu offers Reload, Save, Close and Delete.
--- Access: extension `editor_vehicleEditor_staticEditor_vePartTextView`: `extensions.load("editor_vehicleEditor_staticEditor_vePartTextView")`, then the global `editor_vehicleEditor_staticEditor_vePartTextView`
---@class editor_vehicleEditor_staticEditor_vePartTextView
---@field menuEntry string Apps menu entry text: "Part Text View".
editor_vehicleEditor_staticEditor_vePartTextView = {}

--- Editor hook called every frame: loads the selected part, draws the menu bar, the file info (creation and modification dates), the AST node table and the edit modal window. No effect without a vehicle or selected part.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartTextView.lua:175
function editor_vehicleEditor_staticEditor_vePartTextView.onEditorGui() end

--- Editor hook called at initialization: registers the window (500x400, vehicleEditor tool) and the "editASTNode" modal window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartTextView.lua:327
function editor_vehicleEditor_staticEditor_vePartTextView.onEditorInitialized() end

--- Shows the "Part Text View" window (editor.showWindow).
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartTextView.lua:323
function editor_vehicleEditor_staticEditor_vePartTextView.open() end

