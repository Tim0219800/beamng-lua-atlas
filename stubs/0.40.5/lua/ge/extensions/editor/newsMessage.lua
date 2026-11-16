---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/newsMessage.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor extension that displays a "World Editor News" modal window with the important release notes, only once per message version (EditorNewsMessageVersion = 5), with links to the BeamNG support and forum. It remembers the display in two hidden preferences (newsMessage.general.newsMessageShown and newsMessageVersion).
--- Access: extension `editor_newsMessage`: `extensions.load("editor_newsMessage")`, then the global `editor_newsMessage`
---@class editor_newsMessage
editor_newsMessage = {}

--- Editor hook called every frame: opens the modal window if the message has not yet been seen for this version, then draws it (text, links, Close button).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/newsMessage.lua:13
function editor_newsMessage.onEditorGui() end

--- Hook called at editor initialization: registers the "newsModalDlg" modal window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/newsMessage.lua:54
function editor_newsMessage.onEditorInitialized() end

--- Preferences registration hook: creates the newsMessage category with the hidden preferences newsMessageShown (bool) and newsMessageVersion (int).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/newsMessage.lua:43
---@param prefsRegistry table Editor preferences registry.
function editor_newsMessage.onEditorRegisterPreferences(prefsRegistry) end

