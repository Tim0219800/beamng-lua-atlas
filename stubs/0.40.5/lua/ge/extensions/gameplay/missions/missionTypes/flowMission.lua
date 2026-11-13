---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_missions_missionTypes_flowMission
local gameplay_missions_missionTypes_flowMission = {}

---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:569
---@param name any
---@param value any
function gameplay_missions_missionTypes_flowMission:addOrSetVariable(name, value) end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:560
function gameplay_missions_missionTypes_flowMission:attemptAbandonMission() end

--- common settings that any mission type may use (vehicles, traffic, environment, etc.)
---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:111
function gameplay_missions_missionTypes_flowMission:getCommonSettingsData() end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:420
---@param key any
---@param userSettings any
function gameplay_missions_missionTypes_flowMission:getDynamicStarReward(key, userSettings) end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:409
---@param userSettings any
function gameplay_missions_missionTypes_flowMission:getEntryFee(userSettings) end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:616
function gameplay_missions_missionTypes_flowMission:getGameContextUiButtons() end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:63
---@param progressKey any
function gameplay_missions_missionTypes_flowMission:getProgressKeyTranslation(progressKey) end

--- This is called when a mission of this type is being created. Load files, initialize variables etc
---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:37
function gameplay_missions_missionTypes_flowMission:init() end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:491
---@param stateName any
---@param state any
---@param transData any
function gameplay_missions_missionTypes_flowMission:onFlowgraphStateStarted(stateName, state, transData) end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:497
---@param stateName any
---@param state any
function gameplay_missions_missionTypes_flowMission:onFlowgraphStateStopped(stateName, state) end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:503
---@param mode any
function gameplay_missions_missionTypes_flowMission:onMissionScreenReady(mode) end

--- when the activity starts.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:423
function gameplay_missions_missionTypes_flowMission:onStart() end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:537
---@param data any
function gameplay_missions_missionTypes_flowMission:onStop(data) end

--- update each frame
---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:520
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_missions_missionTypes_flowMission:onUpdate(dtReal, dtSim, dtRaw) end

--- apply common settings for the mission
---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:295
---@param flatSettings any
function gameplay_missions_missionTypes_flowMission:processCommonSettings(flatSettings) end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:324
---@param settings any
function gameplay_missions_missionTypes_flowMission:processUserSettings(settings) end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:598
function gameplay_missions_missionTypes_flowMission:retrieveProgressFromFlowgraph() end

--- enables backwards compatibility for older missions
---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:329
---@param keyAliases any
function gameplay_missions_missionTypes_flowMission:setBackwardsCompatibility(keyAliases) end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:241
---@param userSettings any
function gameplay_missions_missionTypes_flowMission:setPreviewsForCustomVehicles(userSettings) end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:69
---@param fgFile any
---@param variables any
function gameplay_missions_missionTypes_flowMission:setupFlowgraphManager(fgFile, variables) end

