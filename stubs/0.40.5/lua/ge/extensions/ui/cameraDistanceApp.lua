---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/cameraDistanceApp.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Camera distance" debug UI app. Every frame, measures the distance between the player vehicle and the camera, pushes it to the UI via guihooks.trigger('cameraDistance', distance) and draws in the world a red sphere of radius 0.5 m on the vehicle with the label "camera distance target".
--- Access: extension `ui_cameraDistanceApp`: `extensions.load("ui_cameraDistanceApp")`, then the global `ui_cameraDistanceApp`
---@class ui_cameraDistanceApp
ui_cameraDistanceApp = {}

--- Hook called every frame: draws the sphere and the debug text on the player vehicle and sends the vehicle-camera distance to the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/cameraDistanceApp.lua:11
---@param dtReal number Elapsed real time (s), unused.
---@param dtSim number Elapsed simulation time (s), unused.
---@param dtRaw number Elapsed raw time (s), unused.
function ui_cameraDistanceApp.onUpdate(dtReal, dtSim, dtRaw) end

