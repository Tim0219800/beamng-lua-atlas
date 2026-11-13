---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/missions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_missions_missions` : `extensions.load("gameplay_missions_missions")`, puis la globale `gameplay_missions_missions`
---@class gameplay_missions_missions
---@field dependencies table
---@field onModManagerReady any
gameplay_missions_missions = {}

---Source : lua/ge/extensions/gameplay/missions/missions.lua:1024
function gameplay_missions_missions.areAllMissionsLoaded() end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:1311
---@param C any
---@param ... any
function gameplay_missions_missions.baseMission(C, ...) end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:1298
function gameplay_missions_missions.clearCache() end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:855
---@param id any
---@param data any
function gameplay_missions_missions.createMission(id, data) end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:1313
---@param C any
---@param ... any
function gameplay_missions_missions.editorHelper(C, ...) end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:1289
---@param id any
function gameplay_missions_missions.existsMission(id) end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:1312
---@param C any
---@param ... any
function gameplay_missions_missions.flowMission(C, ...) end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:1113
---@param m any
---@param elements any
---@param levelIdentifier any
function gameplay_missions_missions.formatMissionToRawPoi(m, elements, levelIdentifier) end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:75
function gameplay_missions_missions.getAdditionalAttributes() end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:1028
function gameplay_missions_missions.getAllIds() end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:999
function gameplay_missions_missions.getAllMissions() end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:834
---@param skipThumbnail any
function gameplay_missions_missions.getFilesData(skipThumbnail) end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:1071
---@param mission any
function gameplay_missions_missions.getLocations(mission) end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:967
---@param id any
---@param infoData any
function gameplay_missions_missions.getMissionById(id, infoData) end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:157
---@param missionTypeName any
function gameplay_missions_missions.getMissionEditorForType(missionTypeName) end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:189
---@param missionData any
function gameplay_missions_missions.getMissionPreviewFilepath(missionData) end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:118
---@param missionTypeName any
function gameplay_missions_missions.getMissionProgressSetupData(missionTypeName) end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:138
---@param missionTypeName any
function gameplay_missions_missions.getMissionStaticData(missionTypeName) end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:98
---@param missionTypeName any
function gameplay_missions_missions.getMissionTypeConstructor(missionTypeName) end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:701
---@param missionId any
function gameplay_missions_missions.getMissionTypeFromMissionId(missionId) end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:83
function gameplay_missions_missions.getMissionTypes() end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:1046
---@param filters any
function gameplay_missions_missions.getMissionsByFilter(filters) end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:1036
---@param type any
function gameplay_missions_missions.getMissionsByMissionType(type) end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:980
---@param levelIdentifier any
function gameplay_missions_missions.getMissionsOfLevel(levelIdentifier) end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:185
function gameplay_missions_missions.getNoPreviewFilepath() end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:186
function gameplay_missions_missions.getNoThumbFilepath() end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:187
function gameplay_missions_missions.getNoVehicleThumbFilepath() end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:11
function gameplay_missions_missions.getRecommendedAttributesList() end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:581
---@param missionDir any
---@param skipThumbnail any
function gameplay_missions_missions.loadMission(missionDir, skipThumbnail) end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:1213
---@param mission any
function gameplay_missions_missions.logMissionIssues(mission) end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:1145
---@param elemData any
---@param activityData any
function gameplay_missions_missions.onActivityAcceptGatherData(elemData, activityData) end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:1093
function gameplay_missions_missions.onExtensionLoaded() end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:1134
---@param levelIdentifier any
---@param elements any
function gameplay_missions_missions.onGetRawPoiListForLevel(levelIdentifier, elements) end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:347
---@param mId any
---@param cond any
function gameplay_missions_missions.recursiveRemoveNestedFromCondition(mId, cond) end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:1272
function gameplay_missions_missions.reloadCompleteMissionSystem() end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:272
---@param mission any
function gameplay_missions_missions.sanitizeMissionAfterCreation(mission) end

---Source : lua/ge/extensions/gameplay/missions/missions.lua:617
---@param missionData any
---@param newFolder any
function gameplay_missions_missions.saveMission(missionData, newFolder) end

