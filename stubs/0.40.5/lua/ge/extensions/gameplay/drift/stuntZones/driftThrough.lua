---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/stuntZones/driftThrough.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- driftThrough zone. Fields: data = {id, zoneData = {pos, scl (vec3), rot (quat), cooldown}, x, y, z (half-axes), drawData = {pointA..D}}, activeData = {isActive, currCooldown, usedFlag}.
---@class gameplay_drift_stuntZones_driftThrough
local gameplay_drift_stuntZones_driftThrough = {}

--- Success: resets usedFlag to false, starts the cooldown and emits onAnyStuntZoneAccomplished (sub-hook onDriftThroughAccomplished with currDegAngle and points).
---Source: lua/ge/extensions/gameplay/drift/stuntZones/driftThrough.lua:24
function gameplay_drift_stuntZones_driftThrough:accomplish() end

--- Called when the player drifts in the zone; calls accomplish if usedFlag is true.
---Source: lua/ge/extensions/gameplay/drift/stuntZones/driftThrough.lua:41
function gameplay_drift_stuntZones_driftThrough:detectStunt() end

--- Internal constructor: stores the zone data and calls reset().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/stuntZones/driftThrough.lua:19
---@param data table {id, zoneData, x, y, z, drawData, nearDist}.
function gameplay_drift_stuntZones_driftThrough:init(data) end

--- Returns whether the cooldown has elapsed.
---Source: lua/ge/extensions/gameplay/drift/stuntZones/driftThrough.lua:47
---@return boolean  true if the zone can be validated.
function gameplay_drift_stuntZones_driftThrough:isAvailable() end

--- Uses containsOBB_point to test whether the vehicle is in the box; if it is not, sets usedFlag to true.
---Source: lua/ge/extensions/gameplay/drift/stuntZones/driftThrough.lua:51
---@return boolean  true if the player is in the box.
function gameplay_drift_stuntZones_driftThrough:isPlayerInside() end

--- Called every frame by the manager: draws the lines.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/stuntZones/driftThrough.lua:59
function gameplay_drift_stuntZones_driftThrough:onUpdate() end

--- Resets activeData (cooldown 0, usedFlag false).
---Source: lua/ge/extensions/gameplay/drift/stuntZones/driftThrough.lua:11
function gameplay_drift_stuntZones_driftThrough:reset() end

--- Draws the two edges of the zone with debugDrawer:drawLineInstance (if drawing is enabled).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/stuntZones/driftThrough.lua:70
function gameplay_drift_stuntZones_driftThrough:sendDecals() end

