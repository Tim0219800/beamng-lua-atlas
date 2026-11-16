---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/propAnimation/googlyEyes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Humorous vehicle "eyes" auxiliary controller: enlarges or shrinks tagged beams (eye beams, limiters, attachments) according to the vertical acceleration (sensors.gz) to make the eyes bulge; they are at maximum size at ignition 3 (starter).
--- Access: controller `propAnimation/googlyEyes` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_propAnimation_googlyEyes
---@field type string "auxiliary".
local controller_propAnimation_googlyEyes = {}

--- Finds the beams by tag, stores their rest lengths and reads the jbeam coefficients.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/propAnimation/googlyEyes.lua:52
---@param jbeamData table Controller jbeam data.
function controller_propAnimation_googlyEyes.init(jbeamData) end

--- Resets the size smoother to 1.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/propAnimation/googlyEyes.lua:48
---@param jbeamData table Jbeam data.
function controller_propAnimation_googlyEyes.reset(jbeamData) end

--- Every frame: computes the size coefficient according to sensors.gz and adjusts the beam lengths and bounds.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/propAnimation/googlyEyes.lua:23
---@param dt number Time step in seconds.
function controller_propAnimation_googlyEyes.updateGFX(dt) end

return controller_propAnimation_googlyEyes
