---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/missionTypes/baseMission.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Base class of a mission. The object carries the mission data (missionType, etc.) provided via the options table.
---@class gameplay_missions_missionTypes_baseMission
local gameplay_missions_missionTypes_baseMission = {}

--- Returns the translation key of a progress key ("default", "custom"); if unknown, returns the key as is.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/baseMission.lua:13
---@param progressKey string Progress key.
---@return string  Translation key or progressKey.
function gameplay_missions_missionTypes_baseMission:getProgressKeyTranslation(progressKey) end

--- Called when a mission of this type is created. Sets self.missionTypeLabel = "bigMap.missionLabels."..self.missionType and self.progressKeyTranslations = {default, custom} (translation keys missions.progressKeyLabels.*).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/missionTypes/baseMission.lua:8
function gameplay_missions_missionTypes_baseMission:init() end

--- Called when the mission starts. Empty in the base, to be overridden.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/missionTypes/baseMission.lua:23
function gameplay_missions_missionTypes_baseMission:onStart() end

--- Called when the mission stops. `data` (the attempt) can be nil. Empty in the base.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/missionTypes/baseMission.lua:27
---@param data table|nil End of mission / attempt data.
function gameplay_missions_missionTypes_baseMission:onStop(data) end

--- Called every frame during the mission. Empty in the base, to be overridden.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/missionTypes/baseMission.lua:25
---@param dtReal number Elapsed real time (s).
---@param dtSim number Simulation elapsed time (s).
---@param dtRaw number Raw elapsed time (s).
function gameplay_missions_missionTypes_baseMission:onUpdate(dtReal, dtSim, dtRaw) end

