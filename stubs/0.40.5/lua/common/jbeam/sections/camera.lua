---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/camera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Processes the vehicle's jbeam camera sections (cameras, and the old camerasInternal/cameraExternal/camerasRelative/cameraChase). Migrates the old format to vehicle.cameras.{onboard, orbit, relative, chase}, creates for each onboard camera a camera node linked by beams to the nodes id1..id8, converts 'driver' cameras to occupants, builds the cameras per occupant seat (cameras.occupant) from the occupantSlots, computes the relative cameras with respect to the reference node and produces vehicle.cameraData, a lightened copy (indices 1..N) sent to the camera extension. Called in the GE VM only.
--- Access: `require("jbeam/sections/camera")`
---@class jbeam_sections_camera
local jbeam_sections_camera = {}

--- Performs all the conversions and creations related to the vehicle's cameras (vehicle.cameras, vehicle.cameraRefNodes, vehicle.cameraData).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/sections/camera.lua:244
---@param objID integer Vehicle identifier (unused).
---@param vehicle table Vehicle jbeam data (modified in place).
function jbeam_sections_camera.process(objID, vehicle) end

return jbeam_sections_camera
