---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/browser.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_dynamicDecals_browser` : `extensions.load("editor_dynamicDecals_browser")`, puis la globale `editor_dynamicDecals_browser`
---@class editor_dynamicDecals_browser
editor_dynamicDecals_browser = {}

---Source : lua/ge/extensions/editor/dynamicDecals/browser.lua:43
---@param path any
---@param value any
function editor_dynamicDecals_browser.editorPreferenceValueChanged(path, value) end

---Source : lua/ge/extensions/editor/dynamicDecals/browser.lua:80
function editor_dynamicDecals_browser.hideWindow() end

---Source : lua/ge/extensions/editor/dynamicDecals/browser.lua:84
function editor_dynamicDecals_browser.isWindowVisible() end

---Source : lua/ge/extensions/editor/dynamicDecals/browser.lua:20
function editor_dynamicDecals_browser.onGui() end

---Source : lua/ge/extensions/editor/dynamicDecals/browser.lua:71
---@param name any
---@param guiFn any
---@param order any
function editor_dynamicDecals_browser.registerBrowserTab(name, guiFn, order) end

---Source : lua/ge/extensions/editor/dynamicDecals/browser.lua:37
---@param prefsRegistry any
function editor_dynamicDecals_browser.registerEditorPreferences(prefsRegistry) end

---Source : lua/ge/extensions/editor/dynamicDecals/browser.lua:60
---@param tool_in any
function editor_dynamicDecals_browser.setup(tool_in) end

---Source : lua/ge/extensions/editor/dynamicDecals/browser.lua:76
function editor_dynamicDecals_browser.showWindow() end

