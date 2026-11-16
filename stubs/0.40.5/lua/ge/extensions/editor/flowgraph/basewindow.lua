---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/basewindow.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Base class of the Flowgraph editor windows (legend, history, events, garbageDebug, examples, execution, main...). It wraps the Begin/End of an editor window (editor.beginWindow with self.windowName), focus tracking (hasFocus) and open/close/toggle. use(fgEditor, derivedClass) creates a base instance and copies the derived class's fields onto it.
--- Access: extension `editor_flowgraph_basewindow`: `extensions.load("editor_flowgraph_basewindow")`, then the global `editor_flowgraph_basewindow`
---@class editor_flowgraph_basewindow
editor_flowgraph_basewindow = {}

--- Creates an instance of the base class and calls init(...).
---Source: lua/ge/extensions/editor/flowgraph/basewindow.lua:65
---@param ... any Arguments passed to init (fgEditor).
---@return table  Instance.
function editor_flowgraph_basewindow.createBase(...) end

--- Creates a base instance for fgEditor then copies all fields of derivedClass onto it (overrides); calls the derived init if it differs from the base one.
---Source: lua/ge/extensions/editor/flowgraph/basewindow.lua:73
---@param fgEditor table Owning Flowgraph editor.
---@param derivedClass table Window class (windowName, draw, init...).
---@return table  Window instance.
function editor_flowgraph_basewindow.use(fgEditor, derivedClass) end

--- Base class of a Flowgraph window.
---@class editor_flowgraph_basewindow_C
local editor_flowgraph_basewindow_C = {}

--- Opens the editor window self.windowName with the given title.
---Source: lua/ge/extensions/editor/flowgraph/basewindow.lua:15
---@param name string Displayed title.
---@param flags integer|nil ImGui window flags.
---@return boolean  Result of editor.beginWindow (visible).
function editor_flowgraph_basewindow_C:Begin(name, flags) end

--- Updates hasFocus (focus of child windows) then closes the editor window.
---Source: lua/ge/extensions/editor/flowgraph/basewindow.lua:19
function editor_flowgraph_basewindow_C:End() end

--- Calls _onDeserialized then resets hasFocus to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/basewindow.lua:58
---@param data table Data.
function editor_flowgraph_basewindow_C:__onDeserialized(data) end

--- Creates a table, calls _onSerialize and returns it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/basewindow.lua:49
---@return table  Serialized data.
function editor_flowgraph_basewindow_C:__onSerialize() end

--- Deserialization extension point, empty by default.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/basewindow.lua:55
---@param data table Data.
function editor_flowgraph_basewindow_C:_onDeserialized(data) end

--- Serialization extension point, empty by default.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/basewindow.lua:46
---@param res table Table to fill.
function editor_flowgraph_basewindow_C:_onSerialize(res) end

--- Associates the flowgraph project manager (self.mgr).
---Source: lua/ge/extensions/editor/flowgraph/basewindow.lua:24
---@param mgr table Flowgraph manager.
function editor_flowgraph_basewindow_C:attach(mgr) end

--- Hides the window and resets hasFocus to false.
---Source: lua/ge/extensions/editor/flowgraph/basewindow.lua:33
function editor_flowgraph_basewindow_C:close() end

--- Stores fgEditor and initializes hasFocus to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/basewindow.lua:10
---@param fgEditor table Flowgraph editor.
function editor_flowgraph_basewindow_C:init(fgEditor) end

--- Shows the window.
---Source: lua/ge/extensions/editor/flowgraph/basewindow.lua:28
function editor_flowgraph_basewindow_C:open() end

--- Toggles the window's visibility.
---Source: lua/ge/extensions/editor/flowgraph/basewindow.lua:38
function editor_flowgraph_basewindow_C:toggle() end

