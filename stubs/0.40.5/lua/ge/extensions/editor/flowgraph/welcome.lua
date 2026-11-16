---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/welcome.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Window class (windowName 'fg_welcome', windowDescription 'Welcome').
---@class editor_flowgraph_welcome_C
local editor_flowgraph_welcome_C = {}

--- Deserialization hook: empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/welcome.lua:240
---@param data table Restored data.
function editor_flowgraph_welcome_C:_onDeserialized(data) end

--- Serialization hook: empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/welcome.lua:236
---@param data table Save table.
function editor_flowgraph_welcome_C:_onSerialize(data) end

--- Stores the current manager.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/welcome.lua:15
---@param mgr table Flowgraph manager.
function editor_flowgraph_welcome_C:attach(mgr) end

--- Draws the "Welcome" window if it is visible. Called every frame.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/welcome.lua:183
function editor_flowgraph_welcome_C:draw() end

--- Assembles the images and the two columns of the window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/welcome.lua:192
function editor_flowgraph_welcome_C:drawContent() end

--- Draws "Projects" (New Project via core_flowgraphManager.addManager, Open Project... via the file dialog) and "Recent Files".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/welcome.lua:96
function editor_flowgraph_welcome_C:drawLeftColumn() end

--- Draws the editor's introduction text.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/welcome.lua:126
function editor_flowgraph_welcome_C:drawRightColumn() end

--- Registers the window (150x300, visible by default), loads the header and side textures, prepares the list of demo projects.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/welcome.lua:19
function editor_flowgraph_welcome_C:init() end

