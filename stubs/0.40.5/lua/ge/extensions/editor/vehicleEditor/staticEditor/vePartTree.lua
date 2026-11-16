---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartTree.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Part Tree" window of the Static Editor. It reads the JBeam file of the selected part, parses it into an AST (json-ast, with the Lua data in ast.transient.luaData / luaDataRaw) and displays it as a tree (key, value, elements). For each table, you can select it (highlights the matching AST nodes in Part Text View), hide it, or send it to Part Properties. It also draws the part's nodes and beams in the static render view (debugDrawer) and lets you pick them with the mouse (Shift for multi-selection); nodes that are referenced but defined in other parts are looked up and drawn in transparent blue ("virtual"). A "Spawn" button re-instantiates the vehicle with the selected part as the main part.
--- Access: extension `editor_vehicleEditor_staticEditor_vePartTree`: `extensions.load("editor_vehicleEditor_staticEditor_vePartTree")`, then the global `editor_vehicleEditor_staticEditor_vePartTree`
---@class editor_vehicleEditor_staticEditor_vePartTree
---@field menuEntry string Apps menu entry text: "Part Tree".
editor_vehicleEditor_staticEditor_vePartTree = {}

--- Editor hook called every frame: loads the AST of the selected part, draws the tree and calls the node and beam rendering/picking in the static view. No effect without a vehicle, vehData or selected part.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartTree.lua:560
function editor_vehicleEditor_staticEditor_vePartTree.onEditorGui() end

--- Editor hook called at initialization: registers the window (500x400, vehicleEditor tool).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartTree.lua:662
function editor_vehicleEditor_staticEditor_vePartTree.onEditorInitialized() end

--- Extension hook called when a watched file changes on disk. If it is the currently loaded JBeam file, invalidates the AST (ast = nil, vEditor.ast = nil) so it is re-read on the next frame.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartTree.lua:666
---@param filename string path of the modified file
---@param type string change type (unused)
function editor_vehicleEditor_staticEditor_vePartTree.onFileChanged(filename, type) end

--- Shows the "Part Tree" window (editor.showWindow).
---Source: lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartTree.lua:658
function editor_vehicleEditor_staticEditor_vePartTree.open() end

