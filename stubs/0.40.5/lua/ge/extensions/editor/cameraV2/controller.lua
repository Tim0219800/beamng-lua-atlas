---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/cameraV2/controller.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Camera V2 controller: processes the mouse input routed to Camera V2 and applies it to the existing free camera (core_camera, global "free" camera). It handles mouse panning (right or middle click depending on the swapPanOrbitButtons preference), delegates orbit to editor/cameraV2/orbit and zoom to editor/cameraV2/zoom, animates focus on left double click (centering on the targeted point with an overshoot easing), and sets the planar WASD translation of the free camera. It relies on core/cameraControllerRegistry (acquire/release/isOwner with the id "editor.cameraV2") so that a gesture is handled by only one input path.
--- Access: extension `editor_cameraV2_controller`: `extensions.load("editor_cameraV2_controller")`, then the global `editor_cameraV2_controller`
---@class editor_cameraV2_controller
editor_cameraV2_controller = {}

--- Activates the controller and cancels any movement in progress. Called by cameraV2 on registration.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/cameraV2/controller.lua:458
function editor_cameraV2_controller.activate() end

--- Cancels the current pan, zoom, orbit and focus, resets the pending wheel to zero, shows the cursor again if needed and releases ownership in the controller registry.
---Source: lua/ge/extensions/editor/cameraV2/controller.lua:463
function editor_cameraV2_controller.cancel() end

--- Detects (once per frame, result cached) a valid left double click and, if the raycast hits a reasonable point in front of the camera, starts the focus transition. Also called from cameraV2.consumeFocusDoubleClick so that the editor does not treat this click as a selection.
---Source: lua/ge/extensions/editor/cameraV2/controller.lua:291
---@return boolean  true if the double click was consumed and focus started
function editor_cameraV2_controller.consumeFocusDoubleClick() end

--- Deactivates the controller, cancels everything and resets the orbit.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/cameraV2/controller.lua:477
function editor_cameraV2_controller.deactivate() end

--- Relays zoom.lastZoomUsedTerrainOnly() (debug).
---Source: lua/ge/extensions/editor/cameraV2/controller.lua:483
---@return boolean  see zoom
function editor_cameraV2_controller.lastZoomUsedTerrainOnly() end

--- Editor wheel hook: if Camera V2 is active, the free camera is active and the view is hovered, cancels pan/orbit/focus, takes over the registry and accumulates the value in pendingWheel for update().
---Source: lua/ge/extensions/editor/cameraV2/controller.lua:346
---@param value number Wheel notches
---@return boolean  true if the event is consumed; false if the controller is inactive or not acquired
function editor_cameraV2_controller.onEditorMouseWheel(value) end

--- Relative input hook (mouse movement): if the pan button is held, acquires the registry; if the orbit button is held, passes the axes to orbit.onMouseInput; otherwise blocks or lets the input through depending on the state. Only handles player 0.
---Source: lua/ge/extensions/editor/cameraV2/controller.lua:358
---@param axis string|integer Relative input axis (passed as is to orbit.onMouseInput)
---@param value number Movement value
---@param player integer|nil Player index (nil = 0)
---@return boolean  true if Camera V2 consumes the input
function editor_cameraV2_controller.onRelativeInput(axis, value, player) end

--- Relays orbit.getDebugState() (orbit pivot, distance, source, movement in progress) for the debug window.
---Source: lua/ge/extensions/editor/cameraV2/controller.lua:487
---@return table|nil  Orbit debug state
function editor_cameraV2_controller.orbitDebugState() end

--- Pan debug state: hit point and distance to the point, either from the current gesture or from the last planar scale computation.
---Source: lua/ge/extensions/editor/cameraV2/controller.lua:491
---@return table|nil  {point = vec3, distance = number|nil}, or nil
function editor_cameraV2_controller.panDebugState() end

--- Enables or disables WASD translation in the XY plane on the free camera ("pan" WASD mode). Clears residual planar movements and inputs and resets the planarTranslation* parameters of the free camera to zero.
---Source: lua/ge/extensions/editor/cameraV2/controller.lua:504
---@param planar boolean true for planar mode (anything else is false)
function editor_cameraV2_controller.setPlanarTranslation(planar) end

--- Main loop called every frame by cameraV2.onUpdate: updates the planar translation scale, handles the focus double click, the wheel (zoom), controller acquisition, smoothed zoom, pan, orbit and focus, then releases the registry when nothing moves anymore.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/cameraV2/controller.lua:397
---@param deltaTime number|nil Seconds; clamped to [0; 0.05]
function editor_cameraV2_controller.update(deltaTime) end

