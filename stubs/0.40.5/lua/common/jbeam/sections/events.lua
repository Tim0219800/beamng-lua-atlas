---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/events.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Processes the jbeam interaction sections: events (input events, simply cleaned), triggers (3D box/sphere trigger zones created in the engine with addTrigger, position, rotation, size, color, label, meshes to highlight) and triggerEventLinks / triggerEventLinks2 (links between a trigger and an input action). Builds vehicle.triggerEventLinksDict[triggerId][input] = list of links and migrates the old links (v1, to vehicle.events) to the v2 format (inputActions). Loads the core_vehicleTriggers extension if at least one trigger was created.
--- Access: `require("jbeam/sections/events")`
---@class jbeam_sections_events
local jbeam_sections_events = {}

--- Processes the vehicle's events, triggers and trigger-event links (creates the triggers in the engine and fills vehicle.triggerEventLinksDict).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/sections/events.lua:324
---@param objID integer Vehicle identifier (unused).
---@param vehicleObj userdata Engine vehicle object (addTrigger, getTrigger).
---@param vehicle table Vehicle jbeam data (modified in place).
function jbeam_sections_events.process(objID, vehicleObj, vehicle) end

return jbeam_sections_events
