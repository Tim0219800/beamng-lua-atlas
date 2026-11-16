---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/stuntZones/donut.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Donut zone. Fields: data = {id, zoneData = {pos, scl (radius), cooldown}, drawData}, activeData = {isActive, currCooldown, totalDriftAngle, completedPerc}.
---@class gameplay_drift_stuntZones_donut
local gameplay_drift_stuntZones_donut = {}

--- Success: resets the accumulated angle to 0, starts the cooldown and emits onAnyStuntZoneAccomplished (sub-hook onDonutDriftAccomplished, points = donut base).
---Source: lua/ge/extensions/gameplay/drift/stuntZones/donut.lua:25
function gameplay_drift_stuntZones_donut:accomplish() end

--- Adds the frame's drift angle variation (gameplay_drift_drift.getAngleDiff) to the accumulated angle; at 360° or more, calls accomplish.
---Source: lua/ge/extensions/gameplay/drift/stuntZones/donut.lua:39
function gameplay_drift_stuntZones_donut:detectStunt() end

--- Internal constructor: stores the zone data and calls reset().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/stuntZones/donut.lua:20
---@param data table {id, zoneData, drawData, nearDist}.
function gameplay_drift_stuntZones_donut:init(data) end

--- Returns whether the cooldown has elapsed.
---Source: lua/ge/extensions/gameplay/drift/stuntZones/donut.lua:49
---@return boolean  true if the zone can be validated.
function gameplay_drift_stuntZones_donut:isAvailable() end

--- Tests whether the vehicle is within scl of pos; otherwise resets the accumulated angle to 0.
---Source: lua/ge/extensions/gameplay/drift/stuntZones/donut.lua:53
---@return boolean  true if the player is inside the circle.
function gameplay_drift_stuntZones_donut:isPlayerInside() end

--- Called every frame by the manager: draws the circle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/stuntZones/donut.lua:61
function gameplay_drift_stuntZones_donut:onUpdate() end

--- Resets activeData (cooldown to 0, accumulated angle to 0).
---Source: lua/ge/extensions/gameplay/drift/stuntZones/donut.lua:11
function gameplay_drift_stuntZones_donut:reset() end

--- Draws the circle with debugDrawer:drawLineInstance, colored according to progress and cooldown (if drawing is enabled).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/stuntZones/donut.lua:68
function gameplay_drift_stuntZones_donut:sendDecals() end

