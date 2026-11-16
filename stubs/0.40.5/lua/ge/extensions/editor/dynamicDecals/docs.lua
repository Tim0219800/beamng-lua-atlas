---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/docs.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Documentation window built into the Dynamic Decals tool (table of contents + content). Each module of the tool registers a page there with register({section = {...}, guiFn = fn}); this module also provides the Introduction, Getting Started and Controls pages (controls are read from the input actions of the "dynamicDecals" action map, keyboard and mouse). selectSection opens the window on a given page.
--- Access: extension `editor_dynamicDecals_docs`: `extensions.load("editor_dynamicDecals_docs")`, then the global `editor_dynamicDecals_docs`
---@class editor_dynamicDecals_docs
editor_dynamicDecals_docs = {}

--- Hook called when a preference changes. Does nothing here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/docs.lua:314
---@param path string Preference path.
---@param value any New value.
function editor_dynamicDecals_docs.editorPreferenceValueChanged(path, value) end

--- Hides the documentation window.
---Source: lua/ge/extensions/editor/dynamicDecals/docs.lua:408
function editor_dynamicDecals_docs.hideWindow() end

--- Displays an image in the doc page (at the given width, keeping the ratio), with optional tooltip and gray caption.
---Source: lua/ge/extensions/editor/dynamicDecals/docs.lua:173
---@param path string Texture path.
---@param overrideWidth number|nil Width in pixels; default is the full available width.
---@param title string|nil Tooltip text.
---@param subtitle string|nil Caption below the image.
function editor_dynamicDecals_docs.image(path, overrideWidth, title, subtitle) end

--- Draws the "Introduction" page (welcome message and tool version).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/docs.lua:197
---@param docsSection table Current documentation section.
function editor_dynamicDecals_docs.introductionGui(docsSection) end

--- Indicates whether the documentation window is visible.
---Source: lua/ge/extensions/editor/dynamicDecals/docs.lua:412
---@return boolean  true if visible.
function editor_dynamicDecals_docs.isWindowVisible() end

--- Registers (or updates) a documentation page in the section tree.
---Source: lua/ge/extensions/editor/dynamicDecals/docs.lua:328
---@param data table {section = string[], guiFn = function(docsSection), order = number|nil}.
function editor_dynamicDecals_docs.register(data) end

--- Registers `dynamicDecalsTool.docs`: indentSpacing (int, default 8, from 0 to 64) for the table of contents and verticalSpacing (int, default 16, from 0 to 64).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/docs.lua:307
---@param prefsRegistry table Editor preferences registry.
function editor_dynamicDecals_docs.registerEditorPreferences(prefsRegistry) end

--- Selects a documentation page and, unless doNotOpenWindow, opens the window.
---Source: lua/ge/extensions/editor/dynamicDecals/docs.lua:386
---@param section string|string[] Page name, or path as a list of names.
---@param doNotOpenWindow boolean|nil If true, does not show the window.
function editor_dynamicDecals_docs.selectSection(section, doNotOpenWindow) end

--- Called by the tool: declares the window (640x640), registers the UI and update callbacks, the Introduction (order 0), Getting Started (10) and Controls (20) pages, and builds the list of keyboard/mouse controls of the dynamicDecals action map.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/docs.lua:278
---@param tool_in table Reference to the editor_dynamicDecalsTool tool.
function editor_dynamicDecals_docs.setup(tool_in) end

--- Sorts the sections then displays the documentation window.
---Source: lua/ge/extensions/editor/dynamicDecals/docs.lua:401
function editor_dynamicDecals_docs.showWindow() end

--- Inserts a vertical space of height `dynamicDecalsTool.docs.verticalSpacing` (default 16).
---Source: lua/ge/extensions/editor/dynamicDecals/docs.lua:193
function editor_dynamicDecals_docs.verticalSpacing() end

