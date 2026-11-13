---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_missions_missionTypes_editorHelper
local gameplay_missions_missionTypes_editorHelper = {}

---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:32
---@param label any
---@param fieldName any
---@param defaultValue any
---@param hideElementList any
---@param displayOptions any
function gameplay_missions_missionTypes_editorHelper:addBool(label, fieldName, defaultValue, hideElementList, displayOptions) end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:19
---@param label any
---@param getNewFunction any
---@param setMissionFunction any
---@param drawFunction any
function gameplay_missions_missionTypes_editorHelper:addCustomElement(label, getNewFunction, setMissionFunction, drawFunction) end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:197
---@param height any
function gameplay_missions_missionTypes_editorHelper:addDecoDummy(height) end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:193
---@param text any
---@param color any
function gameplay_missions_missionTypes_editorHelper:addDecoHeader(text, color) end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:195
function gameplay_missions_missionTypes_editorHelper:addDecoSeparator() end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:196
function gameplay_missions_missionTypes_editorHelper:addDecoSpacer() end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:194
---@param text any
---@param tooltip any
function gameplay_missions_missionTypes_editorHelper:addDecoText(text, tooltip) end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:166
---@param label any
---@param fieldName any
---@param values any
---@param defaultValue any
---@param valueTooltips any
function gameplay_missions_missionTypes_editorHelper:addDropdown(label, fieldName, values, defaultValue, valueTooltips) end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:198
---@param element any
function gameplay_missions_missionTypes_editorHelper:addElement(element) end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:104
---@param label any
---@param fieldName any
---@param defaultValue any
---@param allowedExtensions any
---@param displayOptions any
function gameplay_missions_missionTypes_editorHelper:addFile(label, fieldName, defaultValue, allowedExtensions, displayOptions) end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:113
---@param label any
---@param filepathsInMissionfolder any
---@param displayOptions any
function gameplay_missions_missionTypes_editorHelper:addFixedFile(label, filepathsInMissionfolder, displayOptions) end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:141
---@param label any
---@param fieldName any
---@param defaultCount any
---@param defaultBest any
---@param defaultMedium any
---@param defaultWorst any
function gameplay_missions_missionTypes_editorHelper:addLeaderboard(label, fieldName, defaultCount, defaultBest, defaultMedium, defaultWorst) end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:176
---@param label any
---@param fieldName any
---@param defaultValue any
---@param displayOptions any
function gameplay_missions_missionTypes_editorHelper:addMissionId(label, fieldName, defaultValue, displayOptions) end

--- function C:addModelConfig(label, fieldName, defaultModel, defaultConfig)
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:93
---@param label any
---@param fieldName any
---@param defaultModel any
---@param defaultConfig any
---@param displayOptions any
function gameplay_missions_missionTypes_editorHelper:addModelConfig(label, fieldName, defaultModel, defaultConfig, displayOptions) end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:22
---@param label any
---@param fieldName any
---@param defaultValue any
---@param displayOptions any
function gameplay_missions_missionTypes_editorHelper:addNumeric(label, fieldName, defaultValue, displayOptions) end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:125
---@param label any
---@param fieldName any
---@param defaultValue any
---@param ... any
function gameplay_missions_missionTypes_editorHelper:addRace(label, fieldName, defaultValue, ...) end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:161
---@param label any
---@param fieldName any
---@param defaultValue any
function gameplay_missions_missionTypes_editorHelper:addReward(label, fieldName, defaultValue) end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:130
---@param label any
---@param fieldName any
---@param displayOptions any
function gameplay_missions_missionTypes_editorHelper:addSimpleLapConfig(label, fieldName, displayOptions) end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:136
---@param label any
---@param fieldName any
---@param defaultValue any
function gameplay_missions_missionTypes_editorHelper:addSites(label, fieldName, defaultValue) end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:26
---@param label any
---@param fieldName any
---@param defaultValue any
---@param len any
---@param displayOptions any
function gameplay_missions_missionTypes_editorHelper:addString(label, fieldName, defaultValue, len, displayOptions) end

--- function C:addTransform(label, fieldName, {defaultPos, defaultRot, defaultScl, hasPos, hasRot, hasScl, oneDimScale}, {drawMode, drawColor, ...})
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:55
---@param label any
---@param fieldName any
---@param valueOptions any
---@param displayOptions any
function gameplay_missions_missionTypes_editorHelper:addTransform(label, fieldName, valueOptions, displayOptions) end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:374
---@param m any
---@param fix any
function gameplay_missions_missionTypes_editorHelper:checkMission(m, fix) end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:211
function gameplay_missions_missionTypes_editorHelper:clear() end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:1024
---@param filterOptions any
function gameplay_missions_missionTypes_editorHelper:draw(filterOptions) end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:1179
---@param corner any
---@param x any
---@param y any
---@param z any
---@param clr any
function gameplay_missions_missionTypes_editorHelper:drawAxisBox(corner, x, y, z, clr) end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:1066
---@param e any
function gameplay_missions_missionTypes_editorHelper:drawTransformAsSphereDir(e) end

--- other helper functions
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:1105
---@param e any
function gameplay_missions_missionTypes_editorHelper:drawTransformAsVehicle(e) end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:1011
function gameplay_missions_missionTypes_editorHelper:editingAnyTransform() end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:1278
function gameplay_missions_missionTypes_editorHelper:getAllFieldNames() end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:256
function gameplay_missions_missionTypes_editorHelper:getNewData() end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:1288
---@param key any
---@param auto any
function gameplay_missions_missionTypes_editorHelper:setAutoAdditionalAttributes(key, auto) end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:297
---@param m any
function gameplay_missions_missionTypes_editorHelper:setMission(m) end

---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:946
---@param mission any
function gameplay_missions_missionTypes_editorHelper:updateMouseInfo(mission) end

