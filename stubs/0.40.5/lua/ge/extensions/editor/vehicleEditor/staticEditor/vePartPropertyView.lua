---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartPropertyView.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Part Properties" window of the Static Editor. It shows in a generic inspector the scalar (non-table) properties of the table selected in the editor (vEditor.propertyTableEditTarget), and writes changes directly into that table. Numbers are editable as float, booleans as checkbox, everything else as string.
--- Access: extension `editor_vehicleEditor_staticEditor_vePartPropertyView`: `extensions.load("editor_vehicleEditor_staticEditor_vePartPropertyView")`, then the global `editor_vehicleEditor_staticEditor_vePartPropertyView`
---@class editor_vehicleEditor_staticEditor_vePartPropertyView
---@field menuEntry string Apps menu entry text: "Part Properties".
editor_vehicleEditor_staticEditor_vePartPropertyView = {}

--- Editor hook called every frame: rebuilds the field list when the edit target changes, then draws the generic inspector.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartPropertyView.lua:39
function editor_vehicleEditor_staticEditor_vePartPropertyView.onEditorGui() end

--- Editor hook called at initialization: registers the window (500x400, vehicleEditor tool) and creates the generic inspector with its setter.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartPropertyView.lua:55
function editor_vehicleEditor_staticEditor_vePartPropertyView.onEditorInitialized() end

--- Shows the "Part Properties" window (editor.showWindow).
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartPropertyView.lua:51
function editor_vehicleEditor_staticEditor_vePartPropertyView.open() end

