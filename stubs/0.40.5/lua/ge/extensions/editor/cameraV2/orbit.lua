---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/cameraV2/orbit.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Camera V2 mouse look, editor style: either rotation in place from the current camera position (mode 0), or orbit around the surface at the view center (mode 1). The orbit is constrained so as not to put the camera under the terrain (binary search on the pitch) and has inertia when the button is released. Used by editor/cameraV2/controller, which passes it the relative mouse inputs and calls update() every frame.
--- Access: extension `editor_cameraV2_orbit`: `extensions.load("editor_cameraV2_orbit")`, then the global `editor_cameraV2_orbit`
---@class editor_cameraV2_orbit
editor_cameraV2_orbit = {}

--- Stops the orbit drag and inertia and abandons the rotation in place, keeping the orbit pose.
---Source: lua/ge/extensions/editor/cameraV2/orbit.lua:576
function editor_cameraV2_orbit.cancel() end

--- Orbit debug state for the Camera V2 Debug window.
---Source: lua/ge/extensions/editor/cameraV2/orbit.lua:563
---@return table|nil  {source, distance, pivot = vec3, moving = boolean}, or nil without a pose
function editor_cameraV2_orbit.getDebugState() end

--- Returns a copy of the current orbit pivot.
---Source: lua/ge/extensions/editor/cameraV2/orbit.lua:528
---@return vec3|nil  pivot, or nil without a pose
function editor_cameraV2_orbit.getPivot() end

--- Returns the pivot if it is real (source other than "virtual"), so that zoom uses it as a fixed focal point.
---Source: lua/ge/extensions/editor/cameraV2/orbit.lua:532
---@return vec3|nil  real pivot or nil
function editor_cameraV2_orbit.getZoomPivot() end

--- True if an orbit pose (pivot, distance) is stored.
---Source: lua/ge/extensions/editor/cameraV2/orbit.lua:524
---@return boolean  true if orbit exists
function editor_cameraV2_orbit.hasPose() end

--- True if an orbit is in progress (drag or inertia) or if a rotation in place is in progress.
---Source: lua/ge/extensions/editor/cameraV2/orbit.lua:515
---@return boolean  activity state
function editor_cameraV2_orbit.isActive() end

--- True only if an orbit around a pivot is in progress (drag or inertia).
---Source: lua/ge/extensions/editor/cameraV2/orbit.lua:520
---@return boolean  orbit state
function editor_cameraV2_orbit.isOrbitActive() end

--- Marks the orbit so that a new pivot is recomputed at the next drag start (after a combined WASD movement).
---Source: lua/ge/extensions/editor/cameraV2/orbit.lua:572
function editor_cameraV2_orbit.markForReacquire() end

--- Receives a relative mouse movement while an orbit button is held. On the initial click, starts the orbit (mode 1) or rotation in place; then accumulates the yaw or pitch input, applied by update().
---Source: lua/ge/extensions/editor/cameraV2/orbit.lua:278
---@param axis string "yaw" for the horizontal axis; any other value is treated as pitch
---@param value number Mouse movement; not finite = rejected; |value| > 250 = ignored (but consumed)
---@param mode integer 1 = orbit, otherwise rotation in place
---@param mouseButton integer Held imgui button (1 right, 2 middle)
---@return boolean  true if the input is consumed, false if the button is not active/viewport not hovered
function editor_cameraV2_orbit.onMouseInput(axis, value, mode, mouseButton) end

--- Completely forgets the orbit pose and the rotation in place.
---Source: lua/ge/extensions/editor/cameraV2/orbit.lua:584
function editor_cameraV2_orbit.reset() end

--- Sets the orbit pivot and recomputes yaw, pitch and distance from the camera position. Cancels drag and inertia.
---Source: lua/ge/extensions/editor/cameraV2/orbit.lua:536
---@param pivot vec3 New pivot; must be a reasonable point
---@param source string|nil Source label (default "focus")
---@return boolean  true if applied, false if pivot/camera invalid or distance zero
function editor_cameraV2_orbit.setPivot(pivot, source) end

--- Recomputes the orbit geometry (distance, yaw, pitch) from the current camera position while keeping the pivot and the source; used after a zoom toward the pivot.
---Source: lua/ge/extensions/editor/cameraV2/orbit.lua:553
---@return boolean  false without an orbit pose or in case of an invalid position
function editor_cameraV2_orbit.syncDistanceFromCamera() end

--- Advances the rotation in place or the orbit by one frame (smoothing, inertia, terrain constraint) and applies the pose to core_camera (setRotation or setPosRot).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/cameraV2/orbit.lua:495
---@param mode integer 1 = orbit, otherwise rotation in place
---@param mouseButton integer Orbit imgui button
---@param deltaTime number|nil Seconds, clamped to [0; 0.05]
function editor_cameraV2_orbit.update(mode, mouseButton, deltaTime) end

