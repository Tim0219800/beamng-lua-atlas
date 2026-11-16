---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/options.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small GE-side utility for the layout of the Vue options menu. It reads which layout.json / layout.dev.json files exist in the user folder and can save a layout in /ui/ui-vue/src/modules/options/runtime/ (therefore in the user folder). Useful to a modder who wants to override the options menu structure.
--- Access: extension `ui_options`: `extensions.load("ui_options")`, then the global `ui_options`
---@class ui_options
ui_options = {}

--- Lists those of the layout.json and layout.dev.json files whose real path is under the user folder (FS:getUserPath).
---Source: lua/ge/extensions/ui/options.lua:16
---@return string[]  File names found; empty if the user folder is unknown.
function ui_options.getUserFolderLayouts() end

--- Writes the JSON data to layout[.key].json under /ui/ui-vue/src/modules/options/runtime/ via writeFile.
---Source: lua/ge/extensions/ui/options.lua:30
---@param key string|nil File suffix (safe slug); nil or empty for layout.json.
---@param data string Already serialized JSON content.
---@return boolean  true if the write succeeded, false if data is not a string, the key is invalid or the write fails.
function ui_options.saveLayout(key, data) end

