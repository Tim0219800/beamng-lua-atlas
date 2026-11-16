---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/staticMeshMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the "audition" of static meshes in Road Architect: it lists the available .dae files (art/shapes/objects and art/shapes/garage_and_dealership/Clutter folders), displays a chosen mesh in the scene at 1000 m altitude and moves/rotates the free camera around it to preview it. It also fills in, in the relevant profile layer, the dimensions of the mesh (box). Used by the profile editing UI.
--- Access: extension `editor_roadArchitect_staticMeshMgr`: `extensions.load("editor_roadArchitect_staticMeshMgr")`, then the global `editor_roadArchitect_staticMeshMgr`
---@class editor_roadArchitect_staticMeshMgr
---@field availStaticMeshes table<integer, {path: string, filename: string}> .dae meshes found, sorted by file name. Filled by fetchAvailableStaticMeshes.
editor_roadArchitect_staticMeshMgr = {}

--- Replaces the mesh under audition with the one at the given index, adjusts the camera distance to its size, then writes into the profile layer the distances from the box to the center (boxXLeft/Right, boxYLeft/Right, boxZLeft/Right) and its extents (extentsL, extentsW, extentsH).
---Source: lua/ge/extensions/editor/roadArchitect/staticMeshMgr.lua:72
---@param selectedMeshIdx integer Index in availStaticMeshes.
---@param road table Road whose profile contains the layer.
---@param customIdx integer Index of the layer in road.profile.layers.
function editor_roadArchitect_staticMeshMgr.addMeshToAudition(selectedMeshIdx, road, customIdx) end

--- Recursively searches for *.dae in the predefined folders and fills availStaticMeshes (sorted by filename).
---Source: lua/ge/extensions/editor/roadArchitect/staticMeshMgr.lua:41
function editor_roadArchitect_staticMeshMgr.fetchAvailableStaticMeshes() end

--- If the camera is not already in audition view: stores its pose, stops and resets the timer, and applies the audition pose.
---Source: lua/ge/extensions/editor/roadArchitect/staticMeshMgr.lua:118
---@param timer table Timer with stopAndReset().
---@param time number Current time.
---@return number  0.0 on entering the view; otherwise the time value received.
function editor_roadArchitect_staticMeshMgr.goToMeshView(timer, time) end

--- Restores the camera pose stored before the audition and leaves the audition view.
---Source: lua/ge/extensions/editor/roadArchitect/staticMeshMgr.lua:138
function editor_roadArchitect_staticMeshMgr.goToOldView() end

--- Advances the camera rotation angle around the mesh by one step and applies the pose (to be called every frame).
---Source: lua/ge/extensions/editor/roadArchitect/staticMeshMgr.lua:129
function editor_roadArchitect_staticMeshMgr.manageRotateCam() end

--- Deletes the scene object of the mesh under audition if it exists.
---Source: lua/ge/extensions/editor/roadArchitect/staticMeshMgr.lua:55
function editor_roadArchitect_staticMeshMgr.removeAuditionMesh() end

--- Switches to free camera and places the camera at the audition pose (behind and above the mesh, looking at it).
---Source: lua/ge/extensions/editor/roadArchitect/staticMeshMgr.lua:64
function editor_roadArchitect_staticMeshMgr.updateCameraPose() end

