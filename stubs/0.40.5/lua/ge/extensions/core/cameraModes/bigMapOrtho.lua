---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/bigMapOrtho.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance of the bigMapOrtho camera. Fields: fovMin (50), fovMax (1000, replaced by the map size), angle, rotAngle, posTransitionTime (2.4), movementSpeed (20), nearClipValue, drawIcons, initialCamData, mapBoundaries, manualzoom, bigMapCamPosition, bigMapCamRotation.
---@class core_cameraModes_bigMapOrtho
local core_cameraModes_bigMapOrtho = {}

--- Relative zoom level in three stages: 0, 0.5 or 1.
---Source: lua/ge/extensions/core/cameraModes/bigMapOrtho.lua:108
---@param fov number Current ortho size
---@return number  0, 0.5 or 1
function core_cameraModes_bigMapOrtho:getZoomStage(fov) end

--- Initializes the default parameters, marks the camera as global and hidden, creates the manual zoom.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/bigMapOrtho.lua:19
function core_cameraModes_bigMapOrtho:init() end

--- Focus gain or loss: the vehicle's render distance is raised to 5000 (then restored); on focus loss, disables the orthographic camera (core_orthoCamera.enable(false)) and abandons the drag.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/bigMapOrtho.lua:47
---@param focused boolean true if the camera becomes active
function core_cameraModes_bigMapOrtho:onCameraChanged(focused) end

--- After Lua reload: init then rebuilds mapBoundaries as a Box3F.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/bigMapOrtho.lua:230
function core_cameraModes_bigMapOrtho:onDeserialized() end

--- Start/end of the map drag.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/bigMapOrtho.lua:215
---@param buttonDown boolean true on press
---@param mouseDragging boolean Unused
function core_cameraModes_bigMapOrtho:onMouseButton(buttonDown, mouseDragging) end

--- Converts mapBoundaries (Box3F) to a table before Lua reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/bigMapOrtho.lua:224
function core_cameraModes_bigMapOrtho:onSerialize() end

--- Smoothly recenters on a world position (bigMapPan.setTarget).
---Source: lua/ge/extensions/core/cameraModes/bigMapOrtho.lua:116
---@param worldPos vec3 World position
function core_cameraModes_bigMapOrtho:panToWorldPos(worldPos) end

--- Resets the manual zoom to zero.
---Source: lua/ge/extensions/core/cameraModes/bigMapOrtho.lua:39
function core_cameraModes_bigMapOrtho:reset() end

--- Receives {initialCamData = {pos, rot}}, computes the point looked at, enables the orthographic camera at the average map size and sets fovMax.
---Source: lua/ge/extensions/core/cameraModes/bigMapOrtho.lua:90
---@param data table|nil {initialCamData = {pos = vec3, rot = quat}}
function core_cameraModes_bigMapOrtho:setCustomData(data) end

--- Reinitializes (calls init) to apply the level properties.
---Source: lua/ge/extensions/core/cameraModes/bigMapOrtho.lua:43
function core_cameraModes_bigMapOrtho:setLevelProperties() end

--- Per-frame computation (like bigMap) then sets the ortho camera options (size, nearClip, farClip) via core_orthoCamera.setOptions.
---Source: lua/ge/extensions/core/cameraModes/bigMapOrtho.lua:125
---@param data table Frame data: dtReal, res {pos, rot, fov}
---@return boolean  Always true
function core_cameraModes_bigMapOrtho:update(data) end

--- Applies one zoom notch (wheel) with acceleration and stores the ground point under the mouse.
---Source: lua/ge/extensions/core/cameraModes/bigMapOrtho.lua:76
---@param value number Signed wheel notch
function core_cameraModes_bigMapOrtho:zoom(value) end

--- Smoothly zooms toward a given factor.
---Source: lua/ge/extensions/core/cameraModes/bigMapOrtho.lua:120
---@param factor number Zoom factor
function core_cameraModes_bigMapOrtho:zoomToFactor(factor) end

