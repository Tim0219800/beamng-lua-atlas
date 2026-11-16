---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/bigMap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance of the bigMap camera. Fields: fovMin (25), fovMax (42), angle (53), rotAngle (25), posTransitionTime (2.4), transitionActive, movementSpeed (20), nearClipValue (100), drawIcons, initialCamData, mapBoundaries (Box3F), manualzoom, bigMapCamPosition, bigMapCamRotation.
---@class core_cameraModes_bigMap
local core_cameraModes_bigMap = {}

--- Relative zoom level in three stages from the FOV: 0 (close, <= 33%), 0.5, 1 (wide).
---Source: lua/ge/extensions/core/cameraModes/bigMap.lua:102
---@param fov number Current FOV (degrees)
---@return number  0, 0.5 or 1
function core_cameraModes_bigMap:getZoomStage(fov) end

--- Initializes the default parameters, marks the camera as global and hidden, creates the manual zoom (from fovMax to fovMin).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/bigMap.lua:18
function core_cameraModes_bigMap:init() end

--- Called by camera.lua when the camera gains or loses focus: on activation, stores and raises the vehicle's render distance to 5000; on deactivation, restores the distance and abandons any mouse drag.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/bigMap.lua:46
---@param focused boolean true if the camera becomes active
function core_cameraModes_bigMap:onCameraChanged(focused) end

--- After Lua reload: reinitializes (init) and rebuilds mapBoundaries as a Box3F.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/bigMap.lua:218
function core_cameraModes_bigMap:onDeserialized() end

--- Called on mouse button press/release: starts or stops the map drag.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/bigMap.lua:203
---@param buttonDown boolean true on press
---@param mouseDragging boolean Drag indicator (unused)
function core_cameraModes_bigMap:onMouseButton(buttonDown, mouseDragging) end

--- Prepares serialization before Lua reload: converts mapBoundaries (Box3F) to a table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/bigMap.lua:212
function core_cameraModes_bigMap:onSerialize() end

--- Smoothly recenters the camera so that the world position (on the ground) is at the center of the screen (bigMapPan.setTarget).
---Source: lua/ge/extensions/core/cameraModes/bigMap.lua:110
---@param worldPos vec3 World position
function core_cameraModes_bigMap:panToWorldPos(worldPos) end

--- Resets the manual zoom to zero.
---Source: lua/ge/extensions/core/cameraModes/bigMap.lua:38
function core_cameraModes_bigMap:reset() end

--- Receives the activation data {initialCamData = {pos, rot}} from setByName, computes the camera vector toward the point looked at and prepares the zoom.
---Source: lua/ge/extensions/core/cameraModes/bigMap.lua:88
---@param data table|nil {initialCamData = {pos = vec3, rot = quat}}
function core_cameraModes_bigMap:setCustomData(data) end

--- Reinitializes (calls init) to apply the level properties (map size).
---Source: lua/ge/extensions/core/cameraModes/bigMap.lua:42
function core_cameraModes_bigMap:setLevelProperties() end

--- Per-frame computation: applies zoom, mouse drag, keyboard movement (MoveManager.forward/backward/left/right), animated recentering, map limits, then writes data.res.pos, rot, fov and nearClip (100).
---Source: lua/ge/extensions/core/cameraModes/bigMap.lua:118
---@param data table Frame data: dtReal, res {pos, rot, fov, nearClip}
---@return boolean  Always true
function core_cameraModes_bigMap:update(data) end

--- Applies one zoom notch (wheel): accelerates progressively and stores the ground point under the mouse to keep the cursor in place.
---Source: lua/ge/extensions/core/cameraModes/bigMap.lua:74
---@param value number Signed wheel notch (0 = nothing)
function core_cameraModes_bigMap:zoom(value) end

--- Smoothly zooms toward a given factor (bigMapPan.zoomToFactor).
---Source: lua/ge/extensions/core/cameraModes/bigMap.lua:114
---@param factor number Zoom factor
function core_cameraModes_bigMap:zoomToFactor(factor) end

