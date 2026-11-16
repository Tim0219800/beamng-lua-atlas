---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/toolCamera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Reusable tool camera: takes over the editor camera with BeamNG's script-driven 'scriptedFree' camera, drives it every frame with right-button drag and the wheel in the viewport (via cameraRig), and starts smoothed (smoothstep) transitions to a "pan" (top-down view) or "orbit" framing. While it drives, it blocks the editorCameraZoom and changeCameraSpeed actions in the 'toolCameraZoom' filter group.
--- Access: extension `editor_toolUtilities_toolCamera`: `extensions.load("editor_toolUtilities_toolCamera")`, then the global `editor_toolUtilities_toolCamera`
---@class editor_toolUtilities_toolCamera
editor_toolUtilities_toolCamera = {}

--- Interactive per-frame driving: collects the right-button drag and the wheel in the viewport (ignored if the UI or a busy state declared by the host captures the mouse) and applies the cameraRig pose to scriptedFree. Forces the cursor to be shown during the drag so that MouseDelta keeps being populated.
---Source: lua/ge/extensions/editor/toolUtilities/toolCamera.lua:183
---@param blocked boolean|nil True: do not move the camera (modal interaction of the tool).
function editor_toolUtilities_toolCamera.drive(blocked) end

--- Flight to an ORBIT framing on (x, y, z). `radius` sizes the pull-back to frame the subject properly; yaw and pitch replace the default 3/4 angle (to approach a detail from a known outside direction).
---Source: lua/ge/extensions/editor/toolUtilities/toolCamera.lua:160
---@param x number World X.
---@param y number World Y.
---@param z number World Z.
---@param radius number|nil Radius of the subject.
---@param yaw number|nil Imposed yaw.
---@param pitch number|nil Imposed pitch.
---@param time number|nil Duration in seconds (nil = depending on distance).
function editor_toolUtilities_toolCamera.flyOrbit(x, y, z, radius, yaw, pitch, time) end

--- Flight to a top-down PAN framing. The point is held within the terrain footprint. If groundZ is absent, the ground height is sampled from the terrain.
---Source: lua/ge/extensions/editor/toolUtilities/toolCamera.lua:137
---@param x number World X.
---@param y number World Y.
---@param groundZ number|nil Ground altitude under the point.
---@param height number|nil Absolute target altitude for the camera.
---@param time number|nil Duration in seconds (0 = immediate jump, nil = depending on distance).
function editor_toolUtilities_toolCamera.flyPan(x, y, groundZ, height, time) end

--- Gives the editor camera back: unblocks the wheel and returns to the remembered global camera. No effect if not driving.
---Source: lua/ge/extensions/editor/toolUtilities/toolCamera.lua:121
---@param animate boolean True: first returns to the pose remembered by a smoothed flight before handing back.
function editor_toolUtilities_toolCamera.handBack(animate) end

--- True if the module is driving scriptedFree.
---Source: lua/ge/extensions/editor/toolUtilities/toolCamera.lua:132
---@return boolean  Active state.
function editor_toolUtilities_toolCamera.isActive() end

--- Glides the orbit PIVOT to (x, y, z) while KEEPING yaw, pitch and distance: the gentle "recenter on what I just selected" gesture, unlike flyOrbit which reframes at 3/4.
---Source: lua/ge/extensions/editor/toolUtilities/toolCamera.lua:172
---@param x number World X.
---@param y number World Y.
---@param z number World Z.
---@param time number|nil Duration in seconds (0.5 by default).
function editor_toolUtilities_toolCamera.recenterOrbit(x, y, z, time) end

--- Takes over the editor camera: remembers the global camera and its pose, switches to 'scriptedFree' (locked, driveRot) at the same pose and blocks the standard zoom wheel. No effect if already active or without core_camera.
---Source: lua/ge/extensions/editor/toolUtilities/toolCamera.lua:96
function editor_toolUtilities_toolCamera.takeOver() end

