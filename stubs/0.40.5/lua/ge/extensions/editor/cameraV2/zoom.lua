---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/cameraV2/zoom.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Camera V2 zoom: replaces the standard wheel movement with a smoothed dolly along the view center. Each wheel notch changes the distance to the focal point proportionally (in logarithmic space), with exponential smoothing and collision against the terrain and static geometry so as not to pass through the scenery. Reads the preferences camera.cameraV2.zoomMinDistance, zoomMaxDistance, zoomFactorPerNotch and zoomResponse.
--- Access: extension `editor_cameraV2_zoom`: `extensions.load("editor_cameraV2_zoom")`, then the global `editor_cameraV2_zoom`
---@class editor_cameraV2_zoom
editor_cameraV2_zoom = {}

--- Abandons the zoom in progress.
---Source: lua/ge/extensions/editor/cameraV2/zoom.lua:254
function editor_cameraV2_zoom.cancel() end

--- Indicates whether a smoothed zoom is in progress.
---Source: lua/ge/extensions/editor/cameraV2/zoom.lua:258
---@return boolean  true if a zoom state exists
function editor_cameraV2_zoom.isActive() end

--- Indicates whether the last zoom used only terrain collision (see notes: always false in the current code).
---Source: lua/ge/extensions/editor/cameraV2/zoom.lua:262
---@return boolean  last terrainOnly
function editor_cameraV2_zoom.lastZoomUsedTerrainOnly() end

--- Starts or extends a zoom: computes the focal point, the current distance and the target distance (distance * factor^-value, clamped), then stores the state that update() makes converge. Successive notches in the same direction accumulate.
---Source: lua/ge/extensions/editor/cameraV2/zoom.lua:171
---@param value number Wheel notches; > 0 moves closer (zoom in), < 0 moves away. |value| <= 0.0001 is ignored
---@param fixedFocus vec3|nil Imposed focal point (if reasonable) instead of the central raycast
---@return boolean  false if the value is negligible, true otherwise (event handled, even if validation fails)
function editor_cameraV2_zoom.onMouseWheel(value, fixedFocus) end

--- Advances the smoothed zoom by one frame: moves the camera along the direction toward the focus. Ends the zoom (state cancelled) in case of a mouse gesture, an inconsistent pose or a collision.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/cameraV2/zoom.lua:234
---@param deltaTime number|nil Seconds; clamped to [0; 0.05], defaults to ui_imgui.GetIO().DeltaTime
function editor_cameraV2_zoom.update(deltaTime) end

