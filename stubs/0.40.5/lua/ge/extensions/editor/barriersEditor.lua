---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/barriersEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Barriers Selector" window (Gameplay > Barriers Editor menu) to choose the barrier prefabs of a level. It searches /levels/<level>/ for .prefab files matching a pattern (default *barrier*), temporarily instantiates them to read the TSStatic positions, then displays them in two lists (unselected / selected) with debug spheres in the view. A "Barriers Selection" edit mode lets you click in the view (click = toggle, Shift = add only, Alt = remove only). Menu entries synchronize the selection with the race editor (editor_raceEditor, field path.prefabs).
--- Access: extension `editor_barriersEditor`: `extensions.load("editor_barriersEditor")`, then the global `editor_barriersEditor`
---@class editor_barriersEditor
---@field onExtensionLoaded nil Is nil: reference to a local variable that is never defined.
editor_barriersEditor = {}

--- Empty function.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/barriersEditor.lua:303
---@param data any Not used.
function editor_barriersEditor.onDeserialized(data) end

--- Called every editor frame: draws the window (Load / Race Editor menus, two prefab lists, > and < buttons) and the debug spheres of each prefab.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/barriersEditor.lua:77
function editor_barriersEditor.onEditorGui() end

--- Registers the window (1500x700), the "Barriers Editor" menu entry (Gameplay group) and the "Barriers Selection" edit mode with its mouse shortcuts.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/barriersEditor.lua:286
function editor_barriersEditor.onEditorInitialized() end

--- Empty function _anon(returns nothing).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/barriersEditor.lua:300
function editor_barriersEditor.onSerialize() end

--- Deselects the editor objects and shows the "Barriers Selector" window.
---Source: lua/ge/extensions/editor/barriersEditor.lua:281
function editor_barriersEditor.show() end

