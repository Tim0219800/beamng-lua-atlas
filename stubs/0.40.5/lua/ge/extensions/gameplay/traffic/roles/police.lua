---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/traffic/roles/police.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Police role class, completed by baseRole (self.veh, self.flags, self.state, self.targetId, setAction, setTarget, resetAction...).
---@class gameplay_traffic_roles_police
local gameplay_traffic_roles_police = {}

--- Compares the pursuit scores of non-police traffic vehicles whose pursuit mode is >= 1 and returns the id of the one with the best score.
---Source: lua/ge/extensions/gameplay/traffic/roles/police.lua:107
---@return integer|nil  Id of the best target, or nil if there is none.
function gameplay_traffic_roles_police:checkTarget() end

--- Configures the role: 'emergency' class, aggression +0.1, drivability 0.5, and defines the actions pursuitStart (starts a pursuit: mode 1 = passive following with intermittent siren, mode > 1 = aggressive pursuit with light bar on), pursuitEnd (AI stop, light bar in mode 1, cooldown), chaseTarget, avoidTarget (temporary 'flee' mode) and roadblock (stop, light bar on). Then merges the baseActions.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/roles/police.lua:7
function gameplay_traffic_roles_police:init() end

--- Called when the role is refreshed. Leaves the 'disabled' state, resets the timers, resets the action if needed, then looks for a target: if there is one, starts pursuitStart; otherwise cancels the ongoing pursuit. Warns in the log if the player is targeted without their pursuit having been correctly triggered.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/roles/police.lua:124
function gameplay_traffic_roles_police:onRefresh() end

--- Called on each traffic tick. Updates the potential targets (distance, visibility), counts the police officers who see the target, triggers head-on collision avoidance, disables the police vehicle that is too damaged, and handles the freezing of traffic lights according to the light bar (speed >= 6 m/s).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/roles/police.lua:153
---@param dt number Tick duration in seconds (not used in the body).
function gameplay_traffic_roles_police:onTrafficTick(dt) end

--- Called every frame. Handles siren pulses, the cooldown countdown (which calls onRefresh again at the end), stopping the pursuit if the target is no longer fleeing, leaving roadblocks, pulling over ('pullOver') near an almost stopped target, and the delays of temporary actions.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/roles/police.lua:225
---@param dt number Real time delta (s).
---@param dtSim number Simulation time delta (s).
function gameplay_traffic_roles_police:onUpdate(dt, dtSim) end

