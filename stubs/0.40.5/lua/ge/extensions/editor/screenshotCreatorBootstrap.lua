---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/screenshotCreatorBootstrap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small editor bootstrap: adds the Window > Vehicles > "Vehicle Screenshot Creator" menu entry that opens the window of the util_screenshotCreator extension (vehicle screenshots).
--- Access: extension `editor_screenshotCreatorBootstrap`: `extensions.load("editor_screenshotCreatorBootstrap")`, then the global `editor_screenshotCreatorBootstrap`
---@class editor_screenshotCreatorBootstrap
editor_screenshotCreatorBootstrap = {}

--- Called when the editor initializes: creates the "Vehicle Screenshot Creator" menu item ("Vehicles" menu group). Its click calls extensions.util_screenshotCreator.openWindow().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/screenshotCreatorBootstrap.lua:13
function editor_screenshotCreatorBootstrap.onEditorInitialized() end

