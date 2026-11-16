---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartList.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Part List" window of the vehicle editor's Static Editor. It lists the available JBeam parts of the loaded vehicle (or only the active parts, "Active" checkbox), with columns Name, Filename and Last modified, sorting by column and text search (name or file). Clicking a row selects the part (vEditor.selectedPart) and opens the Part Tree and Part Text View windows; double-clicking a column copies the part name or the file name to the clipboard; right click opens the file's folder.
--- Access: extension `editor_vehicleEditor_staticEditor_vePartList`: `extensions.load("editor_vehicleEditor_staticEditor_vePartList")`, then the global `editor_vehicleEditor_staticEditor_vePartList`
---@class editor_vehicleEditor_staticEditor_vePartList
---@field menuEntry string Apps menu entry text: "Part List".
editor_vehicleEditor_staticEditor_vePartList = {}

--- Hook called after a Lua reload: restores vEditor.selectedPart.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartList.lua:244
---@param data table table produced by onSerialize
function editor_vehicleEditor_staticEditor_vePartList.onDeserialized(data) end

--- Editor hook called every frame: builds the part list on the first pass (or after the Active filter changes), then draws the window, the sorted/filtered table and the context menu. Does nothing without a vehicle loaded in the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartList.lua:52
function editor_vehicleEditor_staticEditor_vePartList.onEditorGui() end

--- Editor hook called at initialization: registers the window (500x400, vehicleEditor tool).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartList.lua:233
function editor_vehicleEditor_staticEditor_vePartList.onEditorInitialized() end

--- Hook called before a Lua reload: saves the selected part.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartList.lua:238
---@return table  {selectedPart = string|nil}
function editor_vehicleEditor_staticEditor_vePartList.onSerialize() end

--- Shows the "Part List" window (editor.showWindow).
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartList.lua:229
function editor_vehicleEditor_staticEditor_vePartList.open() end

