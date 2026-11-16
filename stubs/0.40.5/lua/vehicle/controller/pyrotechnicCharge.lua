---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/pyrotechnicCharge.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary single-use pyrotechnic charge controller: as soon as one of the electrics listed in triggerElectrics equals 1 or true, it plays a sound, breaks breakgroups and detaches couplers, then displays a message. Used for explosive separations (bolts, stages, trailers). Can also be triggered manually by trigger().
--- Access: controller `pyrotechnicCharge` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_pyrotechnicCharge
---@field type string "auxiliary".
local controller_pyrotechnicCharge = {}

--- Reads the jbeam configuration and finds the sound node.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pyrotechnicCharge.lua:52
---@param jbeamData table Controller jbeam data.
function controller_pyrotechnicCharge.init(jbeamData) end

--- Rearms the charge (hasTriggered = false).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pyrotechnicCharge.lua:48
function controller_pyrotechnicCharge.reset() end

--- Fires the charge: plays the sound on the node, breaks the breakgroups, detaches the couplers and displays a 5 s message.
---Source: lua/vehicle/controller/pyrotechnicCharge.lua:19
function controller_pyrotechnicCharge.trigger() end

--- Every frame: if a trigger electric is active and the charge has not already been fired, calls trigger().
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pyrotechnicCharge.lua:32
---@param dt number Time step in seconds.
function controller_pyrotechnicCharge.updateGFX(dt) end

return controller_pyrotechnicCharge
