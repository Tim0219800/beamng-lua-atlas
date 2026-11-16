---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Static mesh "audition" utility and imgui selection window, shared between editor tools. It lists .dae files (by default art/shapes/objects and art/shapes/garage_and_dealership/Clutter, or a chosen folder), creates a temporary TSStatic 'Temp Audition Mesh' at 1000 m altitude, rotates the camera around it and calls a callback with the chosen mesh. On close, the camera returns to its former pose and the temporary mesh is deleted.
--- Access: extension `editor_toolUtilities_meshAuditionMgr`: `extensions.load("editor_toolUtilities_meshAuditionMgr")`, then the global `editor_toolUtilities_meshAuditionMgr`
---@class editor_toolUtilities_meshAuditionMgr
editor_toolUtilities_meshAuditionMgr = {}

--- Adds or replaces the mesh under audition with the one at the given index: deletes the old one, opens the window if needed, creates the temporary TSStatic (position 0, 0, 1000), adjusts the camera if the audition view is active, then calls the callback.
---Source: lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:97
---@param selectedMeshIdx integer Index in the list of available meshes (1-based).
---@param callback function|nil callback(auditionMesh, path) called after creation.
function editor_toolUtilities_meshAuditionMgr.addMeshToAudition(selectedMeshIdx, callback) end

--- Returns the (uncopied) list of available static meshes: { path, filename }.
---Source: lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:53
---@return table[]  Items { path = full path, filename = file name }.
function editor_toolUtilities_meshAuditionMgr.getAvailableStaticMeshes() end

--- Moves the camera to the audition pose (remembers the old pose, resets the timer to zero). No effect if already there. Returns the reset time (0.0) on first entry, otherwise the elapsed time.
---Source: lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:143
---@param timer hptimer Timer to reset.
---@param time number Current accumulated time (s).
---@return number  New accumulated time.
function editor_toolUtilities_meshAuditionMgr.goToMeshView(timer, time) end

--- Brings the camera back to the pose saved before the audition and leaves the audition view.
---Source: lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:163
function editor_toolUtilities_meshAuditionMgr.goToOldView() end

--- To be called every imgui frame: rotates the camera and draws the 'Static Mesh Selector' window (search, folder choice, reset to default folders, filterable list, Close button). Clicking a name puts the mesh under audition and calls the callback.
---Source: lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:184
---@param meshTarget string Name of the component for which a mesh is being chosen (shown in the header).
---@param onMeshSelectedFunct function|nil callback(auditionMesh, path) on each selection.
function editor_toolUtilities_meshAuditionMgr.handleMeshAuditionAndSelection(meshTarget, onMeshSelectedFunct) end

--- Exits the audition: deletes the temporary mesh, restores the camera and hides the window. No effect if the window is not open.
---Source: lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:174
function editor_toolUtilities_meshAuditionMgr.leaveAuditionView() end

--- Advances the camera one step around the audition center (angle modulo 2 pi).
---Source: lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:154
function editor_toolUtilities_meshAuditionMgr.manageRotateCam() end

--- Rebuilds the list of *.dae files (recursive search in the current folders via FS:findFiles) and sorts it by file name.
---Source: lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:56
function editor_toolUtilities_meshAuditionMgr.populateAvailableStaticMeshes() end

--- Registers the 'meshSelect' selection window in the editor.
---Source: lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:171
function editor_toolUtilities_meshAuditionMgr.registerWindow() end

--- Deletes the mesh under audition if it exists.
---Source: lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:78
function editor_toolUtilities_meshAuditionMgr.removeAuditionMesh() end

--- Places the free camera facing the audition center according to the current mesh's radius (distance 1.6 times the radius, elevation 0.8 times).
---Source: lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:89
function editor_toolUtilities_meshAuditionMgr.updateCameraPose() end

