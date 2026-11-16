---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/optickRollingCapture.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Rolling" capture for the Optick profiler. A first call to toggle() starts a recording that keeps only the last 20 seconds; a second call stops the recording, saves the capture to <user folder>/optick/optick_rolling_<date>.opt and opens Optick if the global function launchOptick exists. A 10 s UI message confirms each step.
--- Access: extension `util_optickRollingCapture`: `extensions.load("util_optickRollingCapture")`, then the global `util_optickRollingCapture`
---@class util_optickRollingCapture
util_optickRollingCapture = {}

--- Starts a 20 s rolling capture if no capture is in progress; otherwise stops the capture, saves it to the user's optick/ folder and launches Optick on it.
---Source: lua/ge/extensions/util/optickRollingCapture.lua:18
function util_optickRollingCapture.toggle() end

