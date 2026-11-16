---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicle/partpreview.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_vehicle_partpreview`: temporary preview of parts in the configuration UI (hover in partpacks), without respawning the vehicle. Compares the meshes (flexbodies) of a slot's current part with those of a candidate part, hides the current part's meshes (alpha 0) and shows the candidate's (alpha 1), remembering the original alphas to restore them.
--- Access: extension `core_vehicle_partpreview`: `extensions.load("core_vehicle_partpreview")`, then the global `core_vehicle_partpreview`
---@class core_vehicle_partpreview
core_vehicle_partpreview = {}

--- Restores the original alpha of all meshes modified by the preview for the vehicle and forgets the state.
---Source: lua/ge/extensions/core/vehicle/partpreview.lua:99
---@param inVehID integer|nil vehicle; nil = player 0
function core_vehicle_partpreview.clearPartPreview(inVehID) end

--- Computes which flexbody meshes disappear or appear if the candidate parts replaced the current parts of their slots.
---Source: lua/ge/extensions/core/vehicle/partpreview.lua:110
---@param partsBySlot table<string, string> [slot] = candidate part name (empty values ignored)
---@param inVehID integer|nil vehicle; nil = player 0
---@return table[]  list of {slotName, oldPartName, newPartName, oldMesh, newMesh} (oldMesh nil = new mesh; newMesh nil = removed mesh)
function core_vehicle_partpreview.getFlexmeshChanges(partsBySlot, inVehID) end

--- Shows the preview of the candidate parts: clears the previous preview, hides the current part's meshes for each slot and shows those of the candidate (flexbody and prop meshes).
---Source: lua/ge/extensions/core/vehicle/partpreview.lua:171
---@param partsBySlot table<string, string> [slot] = candidate part name
---@param inVehID integer|nil vehicle; nil = player 0
function core_vehicle_partpreview.previewPartMeshes(partsBySlot, inVehID) end

--- Forgets all stored preview states, without restoring the alphas (use when vehicles have been recreated).
---Source: lua/ge/extensions/core/vehicle/partpreview.lua:210
function core_vehicle_partpreview.reset() end

