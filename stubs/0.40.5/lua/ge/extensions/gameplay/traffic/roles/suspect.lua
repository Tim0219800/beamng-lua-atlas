---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/traffic/roles/suspect.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Suspect role class, completed by baseRole (self.veh = traffic vehicle, self.flags, self.state, self.actions).
---@class gameplay_traffic_roles_suspect
local gameplay_traffic_roles_suspect = {}

--- Initializes the role: adds a +0.2 offset to aggression (personalityModifiers), defines the actions watchPolice / fleePolice / arrest / clear and sets pursuitMode = 2.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/roles/suspect.lua:7
function gameplay_traffic_roles_suspect:init() end

--- Called when the vehicle is no longer active in traffic. Same handling as onRoleEnded: if the flee flag is set, the suspect is declared to have escaped the police.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/roles/suspect.lua:55
function gameplay_traffic_roles_suspect:onActiveDone() end

--- Called when the role ends. If the suspect was fleeing, calls gameplay_police.evadeVehicle(vehId, gameplay_traffic.showMessages) and removes the flee flag.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/roles/suspect.lua:48
function gameplay_traffic_roles_suspect:onRoleEnded() end

--- Called on each traffic manager tick. If the state is 'wanted', the visibility value (pursuit.sightValue) reaches the threshold (0.25 for an AI, 1 for a player) and the speed reaches the threshold (1 m/s if driveCheck, otherwise 0), it looks for available police officers (neither in pursuit nor in reset), starts gameplay_police.setPursuitMode(pursuitMode, vehId, policeIds) and targets the closest police officer.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/roles/suspect.lua:62
---@param tickTime number Traffic tick duration in seconds (not used in the body).
function gameplay_traffic_roles_suspect:onTrafficTick(tickTime) end

--- Called every frame; empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/roles/suspect.lua:81
---@param dt number Real time delta (s).
---@param dtSim number Simulation time delta (s).
function gameplay_traffic_roles_suspect:onUpdate(dt, dtSim) end

