---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/missionTypes/baseMission.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/missions/missionTypes/baseMission.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_missions_missionTypes_baseMission
local gameplay_missions_missionTypes_baseMission = {}

---Source : lua/ge/extensions/gameplay/missions/missionTypes/baseMission.lua:13
---@param progressKey any
function gameplay_missions_missionTypes_baseMission:getProgressKeyTranslation(progressKey) end

--- This is called when a mission of this type is being created. Load files, initialize variables etc
---Source : lua/ge/extensions/gameplay/missions/missionTypes/baseMission.lua:8
function gameplay_missions_missionTypes_baseMission:init() end

--- when the mission starts
---Source : lua/ge/extensions/gameplay/missions/missionTypes/baseMission.lua:23
function gameplay_missions_missionTypes_baseMission:onStart() end

--- called when the activity stops. attempt might be nil
---Source : lua/ge/extensions/gameplay/missions/missionTypes/baseMission.lua:27
---@param data any
function gameplay_missions_missionTypes_baseMission:onStop(data) end

--- called each frame
---Source : lua/ge/extensions/gameplay/missions/missionTypes/baseMission.lua:25
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_missions_missionTypes_baseMission:onUpdate(dtReal, dtSim, dtRaw) end

