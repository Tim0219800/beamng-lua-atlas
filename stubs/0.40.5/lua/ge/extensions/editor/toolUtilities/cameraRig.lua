---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/cameraRig.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Reusable camera rig for editor tools: pan state (pan, near-aerial view with north up) and orbit state with inertia, which produces a pose (pos, yaw, pitch, roll) for a script-driven camera (scriptedFree). Pure state and math module, with no engine coupling: the host tool reads the inputs, calls update() every frame and pushes the returned pose. Timed transitions between focuses remain the host's responsibility.
--- Access: extension `editor_toolUtilities_cameraRig`: `extensions.load("editor_toolUtilities_cameraRig")`, then the global `editor_toolUtilities_cameraRig`
---@class editor_toolUtilities_cameraRig
editor_toolUtilities_cameraRig = {}

--- Switches to PAN mode centered on the origin of a footprint and returns its target top-down pose.
---Source: lua/ge/extensions/editor/toolUtilities/cameraRig.lua:196
---@param originXY table|nil {x=,y=} center (0,0 if nil).
---@param terrainH number|nil Ground altitude; if nil the last known one is kept.
---@param height number|nil Camera height above the ground (clamped to 15-3000 m).
---@return vec3  Position
---@return number  yaw
---@return number  pitch
---@return number  roll
function editor_toolUtilities_cameraRig.focusFootprint(originXY, terrainH, height) end

--- Switches to ORBIT mode centered on the centroid of a building and returns its 3/4 target pose. The distance is radius*2.4 (clamped), otherwise 130 m.
---Source: lua/ge/extensions/editor/toolUtilities/cameraRig.lua:209
---@param centroid vec3|nil Pivot (origin if nil).
---@param radius number|nil Bounding radius; used only if > 1.
---@param yawDeg number|nil Initial yaw (default 30).
---@param pitchDeg number|nil Initial pitch (default 32, clamped -30..88).
---@return vec3  Position
---@return number  yaw
---@return number  pitch
---@return number  roll (0)
function editor_toolUtilities_cameraRig.focusMassing(centroid, radius, yawDeg, pitchDeg) end

--- Current mode of the rig.
---Source: lua/ge/extensions/editor/toolUtilities/cameraRig.lua:241
---@return string  'pan' (footprint) or 'orbit' (volume).
function editor_toolUtilities_cameraRig.getMode() end

--- Moves the orbit PIVOT to `centroid` while keeping yaw/pitch/distance, and returns the pose that preserves the framing. Switches to orbit mode and cancels inertia.
---Source: lua/ge/extensions/editor/toolUtilities/cameraRig.lua:223
---@param centroid vec3|nil New pivot (each missing component keeps the old one).
---@return vec3  Position
---@return number  yaw
---@return number  pitch
---@return number  roll (0)
function editor_toolUtilities_cameraRig.recenter(centroid) end

--- Cancels any residual inertia (pan and orbit) and the drag state; to be called when a timed transition ends before handing control back to interaction.
---Source: lua/ge/extensions/editor/toolUtilities/cameraRig.lua:234
function editor_toolUtilities_cameraRig.settle() end

--- Advances the interactive camera by one frame and returns the pose to push. In pan, a drag grabs the ground (with inertia); in orbit it rotates around the pivot (with inertia); the wheel zooms/dollies.
---Source: lua/ge/extensions/editor/toolUtilities/cameraRig.lua:98
---@param dt number|nil Frame duration in seconds (capped at 0.05).
---@param input table|nil { dragActive:boolean, dragDX:number, dragDY:number (screen pixels), wheel:number (notches), groundZAt:function(x,y[,heightAbove])->number|nil (ground altitude; average over the view if heightAbove), limitXY:function(x,y)->x,y (bounds the pan center) }
---@return vec3  Camera position (shared vec3).
---@return number  yaw in degrees
---@return number  pitch in degrees
---@return number  roll in degrees
function editor_toolUtilities_cameraRig.update(dt, input) end

