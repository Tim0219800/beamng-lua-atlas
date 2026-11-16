---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/activity.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tiny GE extension (core_activity): starts a named 'activity'. Today the only known activity is 'ContinueFreeroam', which launches extensions.freeroam_continueFreeroam.start() then signals the loading screen (core_gamestate.loadingScreenActive()). A modder can call it from the UI or a script.
--- Access: extension `core_activity`: `extensions.load("core_activity")`, then the global `core_activity`
---@class core_activity
core_activity = {}

--- Launches the activity with this name if it exists in the internal table, otherwise logs 'Unknown activity'.
---Source: lua/ge/extensions/core/activity.lua:16
---@param name string Activity name, currently 'ContinueFreeroam'
function core_activity.startActivity(name) end

