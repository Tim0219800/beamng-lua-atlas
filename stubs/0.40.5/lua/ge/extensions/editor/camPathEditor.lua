---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/camPathEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Camera path editor of the World Editor ("Path Camera Tool" window, "Edit Camera Paths" edit mode). It edits the paths managed by core_paths: each path is a list of markers {pos, rot, time, fov, positionSmooth, trackPosition, trackOffset, bullettime, cut, movingStart, movingEnd...} sorted by time. You can create/load/save/delete a path, add markers (Shift + left click in edit mode, or "+ Add Marker" at the camera position), adjust timings (Even Speed, Set Duration, Reverse, Relax Timings, Auto-smooth), orient the camera FPV-style (bank/aim), preview, link the path to a replay (core_replay) and play it (core_paths.playPath), optionally closing the editor. It draws the paths (splines, camera frustums, marker spheres) and framing overlays (rule of thirds, 16:9, 9:16). Depends on core_camera.
--- Access: extension `editor_camPathEditor`: `extensions.load("editor_camPathEditor")`, then the global `editor_camPathEditor`
---@class editor_camPathEditor
---@field dependencies string[] {'core_camera'}: extensions loaded before this one.
---@field onExtensionLoaded nil Reference to a local variable that is never defined: is nil (see notes).
editor_camPathEditor = {}

--- Provides core/cameraModes/path with the vehicle tracking offset set in the editor.
---Source: lua/ge/extensions/editor/camPathEditor.lua:2476
---@return table|nil  {x = right/left, y = forward/back, z = up/down} in meters, or nil if all three values are 0
function editor_camPathEditor.getTrackingOffset() end

--- Called at the start of a level/mission: deselects the current path (selectPath(nil)).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/camPathEditor.lua:2471
function editor_camPathEditor.onClientStartMission() end

--- Draws the "Path Camera Tool" window (File menu: New, Load, Save, Delete, Render Options; path choice, replay, marker list and properties, timing tools, FOV, tracking, Play, Play (Close Editor) and Stop buttons) and the camera paths in the world. Called every frame by the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/camPathEditor.lua:2020
function editor_camPathEditor.onEditorGui() end

--- Registers the camPathEditMode edit mode (icon, actionMap "CamPathEditor", shortcut Shift + left click = "Add new marker") and the "pathCameraTool" (200x400) and "cameraPathPreviewWindow" (600x400) windows.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/camPathEditor.lua:2453
function editor_camPathEditor.onEditorInitialized() end

--- Called before rendering: if the editor is active in "Edit Camera Paths" mode, stores the window aspect ratio and draws the framing overlay.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/camPathEditor.lua:2433
function editor_camPathEditor.onPreRender() end

--- Per-frame hook, currently empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/camPathEditor.lua:2429
---@param dtReal number Real-time delta in seconds
---@param dtSim number Simulation time delta
---@param dtRaw number Raw time delta
function editor_camPathEditor.onUpdate(dtReal, dtSim, dtRaw) end

--- Selects a camera path: updates M.currentPath, deselects the marker, and loads the associated replay (path.replay) if it exists and differs from the loaded replay; otherwise stops the current replay.
---Source: lua/ge/extensions/editor/camPathEditor.lua:127
---@param path table|nil core_paths path, or nil to deselect
function editor_camPathEditor.selectPath(path) end

