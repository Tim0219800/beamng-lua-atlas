---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/staticMeshMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_roadArchitect_staticMeshMgr` : `extensions.load("editor_roadArchitect_staticMeshMgr")`, puis la globale `editor_roadArchitect_staticMeshMgr`
---@class editor_roadArchitect_staticMeshMgr
---@field availStaticMeshes table
editor_roadArchitect_staticMeshMgr = {}

--- Add/replace the mesh under audition with the mesh with the given index.
---Source : lua/ge/extensions/editor/roadArchitect/staticMeshMgr.lua:72
---@param selectedMeshIdx any
---@param road any
---@param customIdx any
function editor_roadArchitect_staticMeshMgr.addMeshToAudition(selectedMeshIdx, road, customIdx) end

--- Fetch the list of available static meshes.
---Source : lua/ge/extensions/editor/roadArchitect/staticMeshMgr.lua:41
function editor_roadArchitect_staticMeshMgr.fetchAvailableStaticMeshes() end

--- Moves the camera to the mesh audition preview pose.
---  [Also adjusts the timing parameters respectively].
---Source : lua/ge/extensions/editor/roadArchitect/staticMeshMgr.lua:118
---@param timer any
---@param time any
function editor_roadArchitect_staticMeshMgr.goToMeshView(timer, time) end

--- Returns the camera to the stored old view.
---Source : lua/ge/extensions/editor/roadArchitect/staticMeshMgr.lua:138
function editor_roadArchitect_staticMeshMgr.goToOldView() end

--- Manages the rotation of the audition camera.
---Source : lua/ge/extensions/editor/roadArchitect/staticMeshMgr.lua:129
function editor_roadArchitect_staticMeshMgr.manageRotateCam() end

--- Removes the static mesh under audition.
---Source : lua/ge/extensions/editor/roadArchitect/staticMeshMgr.lua:55
function editor_roadArchitect_staticMeshMgr.removeAuditionMesh() end

--- Updates the camera position upon changing of selected mesh.
---Source : lua/ge/extensions/editor/roadArchitect/staticMeshMgr.lua:64
function editor_roadArchitect_staticMeshMgr.updateCameraPose() end

