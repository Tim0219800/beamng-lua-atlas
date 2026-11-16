---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/util/groundContact.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Minimal utility to know whether a vehicle is resting on its wheels. It casts a static ray downward from the bottom of the vehicle's bounding box (raised by 0.3 m) and compares the distance to the ground against a 1.1 m threshold.
--- Access: extension `gameplay_util_groundContact`: `extensions.load("gameplay_util_groundContact")`, then the global `gameplay_util_groundContact`
---@class gameplay_util_groundContact
gameplay_util_groundContact = {}

--- Tests proximity of the ground under the vehicle's center using a static ray cast downward.
---Source: lua/ge/extensions/gameplay/util/groundContact.lua:20
---@param vehId integer Vehicle id.
---@return boolean  true if the ground is 1.1 m away or less; false if the vehicle is missing from map.objects.
function gameplay_util_groundContact.isOnWheels(vehId) end

