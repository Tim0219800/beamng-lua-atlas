---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_meshAuditionMgr` : `extensions.load("editor_toolUtilities_meshAuditionMgr")`, puis la globale `editor_toolUtilities_meshAuditionMgr`
---@class editor_toolUtilities_meshAuditionMgr
editor_toolUtilities_meshAuditionMgr = {}

--- Add/replace the mesh under audition with the mesh with the given index.
---Source : lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:97
---@param selectedMeshIdx any
---@param callback any
function editor_toolUtilities_meshAuditionMgr.addMeshToAudition(selectedMeshIdx, callback) end

--- Function to get the list of available static meshes.
---Source : lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:53
function editor_toolUtilities_meshAuditionMgr.getAvailableStaticMeshes() end

--- Moves the camera to the mesh audition preview pose. [Also adjusts the timing parameters respectively].
---Source : lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:143
---@param timer any
---@param time any
function editor_toolUtilities_meshAuditionMgr.goToMeshView(timer, time) end

--- Returns the camera to the stored old view.
---Source : lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:163
function editor_toolUtilities_meshAuditionMgr.goToOldView() end

--- Handles the static mesh audition selection window.
---Source : lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:184
---@param meshTarget any
---@param onMeshSelectedFunct any
function editor_toolUtilities_meshAuditionMgr.handleMeshAuditionAndSelection(meshTarget, onMeshSelectedFunct) end

--- Handles the leaving of the audition view (moves camera back and removes audition mesh) then handles the closing of the mesh selection window.
---Source : lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:174
function editor_toolUtilities_meshAuditionMgr.leaveAuditionView() end

--- Manages the rotation of the audition camera.
---Source : lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:154
function editor_toolUtilities_meshAuditionMgr.manageRotateCam() end

--- Populates the list of available static meshes.
---Source : lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:56
function editor_toolUtilities_meshAuditionMgr.populateAvailableStaticMeshes() end

--- Registers the mesh selection window.
---Source : lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:171
function editor_toolUtilities_meshAuditionMgr.registerWindow() end

--- Removes the static mesh under audition.
---Source : lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:78
function editor_toolUtilities_meshAuditionMgr.removeAuditionMesh() end

--- Updates the camera position upon changing of selected mesh.
---Source : lua/ge/extensions/editor/toolUtilities/meshAuditionMgr.lua:89
function editor_toolUtilities_meshAuditionMgr.updateCameraPose() end

