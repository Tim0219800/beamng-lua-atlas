---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/occupantSlots.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Processes the jbeam "occupantSlots" section (occupant seats). Normalizes each entry: id (id, name or table key), defaultPermissionMode (driver, passenger or unrestricted; otherwise inferred from the camera), seatSide (left/right/center, inferred from exitSide, driverSide or the L/R suffix of the id), cameraName 'occupant.<id>', entryTrigger 'enterSeat_<id>', cargoGroup '<id>Occupant' and actionMaps (always a table). Produces vehicle.occupantSlotsById and enables vehicle.occupantSystem.enabled if there are seats or if an active part exposes a slot of type 'seat_occupant'.
--- Access: `require("jbeam/sections/occupantSlots")`
---@class jbeam_sections_occupantSlots
local jbeam_sections_occupantSlots = {}

--- Normalizes the vehicle's occupantSlots and enables the occupant system if needed.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/sections/occupantSlots.lua:32
---@param _ any Vehicle id (ignored).
---@param vehicle table jbeam data (occupantSlots, occupantSystem).
---@param activePartsData table<string, table>|nil Active parts (used to detect a seat_occupant slot).
function jbeam_sections_occupantSlots.process(_, vehicle, activePartsData) end

return jbeam_sections_occupantSlots
