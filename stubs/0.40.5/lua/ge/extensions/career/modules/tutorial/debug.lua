---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tutorial/debug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career tutorial imgui debug menu. It shows the current step, buttons to start/advance/end the tutorial, jump to a step, open the contract signing screen, simulate a damaged vehicle or leaving the zone, and manage the display of bounds zones. It also calls onDebugMenu(im) of the current step's extension if it has one.
--- Access: extension `career_modules_tutorial_debug`: `extensions.load("career_modules_tutorial_debug")`, then the global `career_modules_tutorial_debug`
---@class career_modules_tutorial_debug
---@field debugName string Debug tab name: "Tutorial".
---@field debugOrder number Display order: 100.
career_modules_tutorial_debug = {}

--- Draws the imgui content of the tutorial debug menu (called every frame by the debug system).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/debug.lua:19
---@param dt number Time delta.
function career_modules_tutorial_debug.drawDebugMenu(dt) end

