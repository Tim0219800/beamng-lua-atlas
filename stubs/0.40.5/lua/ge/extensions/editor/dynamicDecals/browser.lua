---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/browser.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Dynamic Decals Tool - Browser" window of the editor's dynamic liveries tool: a central tabbed hub (Textures, Brushes, Fonts...) where other modules register their content with registerBrowserTab. Assets can be dragged and dropped onto the decal system widgets. The module is initialized by the main tool via setup(tool).
--- Access: extension `editor_dynamicDecals_browser`: `extensions.load("editor_dynamicDecals_browser")`, then the global `editor_dynamicDecals_browser`
---@class editor_dynamicDecals_browser
editor_dynamicDecals_browser = {}

--- Hook called when a preference changes: currently does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/browser.lua:43
---@param path string preference path
---@param value any new value
function editor_dynamicDecals_browser.editorPreferenceValueChanged(path, value) end

--- Hides the browser window.
---Source: lua/ge/extensions/editor/dynamicDecals/browser.lua:80
function editor_dynamicDecals_browser.hideWindow() end

--- Indicates whether the window is visible.
---Source: lua/ge/extensions/editor/dynamicDecals/browser.lua:84
---@return boolean  visibility
function editor_dynamicDecals_browser.isWindowVisible() end

--- Draws the window and its tab bar by calling the guiFn of each tab. Registered by setup() as the "browser" editor callback.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/browser.lua:20
function editor_dynamicDecals_browser.onGui() end

--- Adds a tab to the browser and re-sorts the list by order.
---Source: lua/ge/extensions/editor/dynamicDecals/browser.lua:71
---@param name string tab title
---@param guiFn function ImGui function drawing the tab content
---@param order number|nil sort rank, 1000 by default
function editor_dynamicDecals_browser.registerBrowserTab(name, guiFn, order) end

--- Editor preferences hook: currently does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/browser.lua:37
---@param prefsRegistry table preferences registry
function editor_dynamicDecals_browser.registerEditorPreferences(prefsRegistry) end

--- Initializes the module: gets the extensions editor_api_dynamicDecals, editor_dynamicDecals_textures and editor_dynamicDecals_docs, registers the window (800x400), the "browser" UI callback and the "Browser" documentation page.
---Source: lua/ge/extensions/editor/dynamicDecals/browser.lua:60
---@param tool_in table dynamic decals tool (provides registerOnEditorGuiFn)
function editor_dynamicDecals_browser.setup(tool_in) end

--- Shows the browser window.
---Source: lua/ge/extensions/editor/dynamicDecals/browser.lua:76
function editor_dynamicDecals_browser.showWindow() end

