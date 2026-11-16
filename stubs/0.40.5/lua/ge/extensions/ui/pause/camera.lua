---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/camera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Automatic orbit camera of the pause menu: intended to switch the player's camera to orbit mode and make it rotate slowly around the vehicle during the pause, then restore the original camera and orbit state. It stops if the player rotates the camera by hand. In 0.40.5, this feature is disabled in the code.
--- Access: extension `ui_pause_camera`: `extensions.load("ui_pause_camera")`, then the global `ui_pause_camera`
---@class ui_pause_camera
ui_pause_camera = {}

--- Intended to store the camera, vehicle and orbit state at the start of the pause. No effect in 0.40.5 (immediate return).
---Source: lua/ge/extensions/ui/pause/camera.lua:155
function ui_pause_camera.beginPauseSession() end

--- Returns a deep copy of the internal state (pauseSessionActive, active, orbiting, stoppedByManualInput, previousCameraName, etc.) for debugging.
---Source: lua/ge/extensions/ui/pause/camera.lua:214
---@return table  Copy of the state.
function ui_pause_camera.debugState() end

--- Intended to stop the orbit and restore the camera and orbit state from before the pause. No effect in 0.40.5 (immediate return).
---Source: lua/ge/extensions/ui/pause/camera.lua:160
function ui_pause_camera.endPauseSession() end

--- Hook called every frame; rotates the orbit camera around the player vehicle if the session is active. No effect while start is disabled.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/camera.lua:181
---@param dtReal number Real time elapsed since the previous frame, in seconds.
function ui_pause_camera.onUpdate(dtReal) end

--- Intended to switch the player's camera to orbit and start the automatic rotation. No effect in 0.40.5 (immediate return).
---Source: lua/ge/extensions/ui/pause/camera.lua:114
function ui_pause_camera.start() end

--- Intended to stop the automatic rotation and return to the previous camera. No effect in 0.40.5 (immediate return).
---Source: lua/ge/extensions/ui/pause/camera.lua:136
function ui_pause_camera.stop() end

