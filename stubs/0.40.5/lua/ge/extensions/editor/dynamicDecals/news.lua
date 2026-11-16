---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/news.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Vehicle Livery Creator - News" window (public name of the Dynamic Decals tool): welcome message, link to the BeamNG forum thread and version history (1.1.0, 1.0.1, 1.0.0, hardcoded texts). It opens automatically when the tool version (tool.version) exceeds the one stored in the preference `dynamicDecalsTool.general.version`, or as long as "do not show again" is not checked.
--- Access: extension `editor_dynamicDecals_news`: `extensions.load("editor_dynamicDecals_news")`, then the global `editor_dynamicDecals_news`
---@class editor_dynamicDecals_news
editor_dynamicDecals_news = {}

--- Hook called when a preference changes. Does nothing here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/news.lua:160
---@param path string Preference path.
---@param value any New value.
function editor_dynamicDecals_news.editorPreferenceValueChanged(path, value) end

--- Registers the bool preference `dynamicDecalsTool.news.doNotShowAgain` (default false).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/news.lua:154
---@param prefsRegistry table Editor preferences registry.
function editor_dynamicDecals_news.registerEditorPreferences(prefsRegistry) end

--- Called by the tool: gets helper, declares the editor window (640x640) and registers the window drawing via tool.registerOnEditorGuiFn.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/news.lua:145
---@param tool_in table Reference to the editor_dynamicDecalsTool tool.
function editor_dynamicDecals_news.setup(tool_in) end

--- Opens the news window.
---Source: lua/ge/extensions/editor/dynamicDecals/news.lua:164
function editor_dynamicDecals_news.showWindow() end

