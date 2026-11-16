---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/mechanics/beamSegments.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mechanics controller (type "auxiliary") that distributes the length of a "sensor" beam over several "segment" beams: every frame, each segment receives the sensor length divided by the number of segments, multiplied by a factor. Used to build telescopic elements or chains of segments whose total length follows a sensor.
--- Access: controller `mechanics/beamSegments` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_mechanics_beamSegments
---@field type string "auxiliary".
local controller_mechanics_beamSegments = {}

--- Hook: called when a beam breaks; marks the controller inactive if it is a segment or the sensor (see notes).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/mechanics/beamSegments.lua:29
---@param id integer Identifier (cid) of the broken beam.
---@param energy number Break energy.
function controller_mechanics_beamSegments.beamBroken(id, energy) end

--- Finds the segment and sensor beams by tag.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/mechanics/beamSegments.lua:40
---@param jbeamData table Controller jbeam data.
function controller_mechanics_beamSegments.init(jbeamData) end

--- Reactivates the controller.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/mechanics/beamSegments.lua:36
---@param jbeamData table Controller jbeam data.
function controller_mechanics_beamSegments.reset(jbeamData) end

--- Sets the length of each segment from that of the sensor. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/mechanics/beamSegments.lua:dyn
---@param dt number Time step (s).
function controller_mechanics_beamSegments.updateGFX(dt) end

return controller_mechanics_beamSegments
