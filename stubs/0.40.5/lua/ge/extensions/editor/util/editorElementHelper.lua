---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/util/editorElementHelper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/editor/util/editorElementHelper.lua (instanciée par la fonction renvoyée par le module)
---@class editor_util_editorElementHelper
local editor_util_editorElementHelper = {}

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:240
---@param text any
---@param color any
function editor_util_editorElementHelper:addBigDecoHeader(text, color) end

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:35
---@param label any
---@param fieldName any
---@param defaultValue any
---@param hideElementList any
---@param displayOptions any
function editor_util_editorElementHelper:addBool(label, fieldName, defaultValue, hideElementList, displayOptions) end

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:212
---@param label any
---@param fieldName any
---@param idType any
---@param defaultValue any
---@param displayOptions any
function editor_util_editorElementHelper:addContainerId(label, fieldName, idType, defaultValue, displayOptions) end

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:22
---@param label any
---@param getNewFunction any
---@param setContainerFunction any
---@param drawFunction any
function editor_util_editorElementHelper:addCustomElement(label, getNewFunction, setContainerFunction, drawFunction) end

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:245
---@param height any
function editor_util_editorElementHelper:addDecoDummy(height) end

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:241
---@param text any
---@param color any
function editor_util_editorElementHelper:addDecoHeader(text, color) end

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:243
function editor_util_editorElementHelper:addDecoSeparator() end

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:244
function editor_util_editorElementHelper:addDecoSpacer() end

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:242
---@param text any
---@param tooltip any
function editor_util_editorElementHelper:addDecoText(text, tooltip) end

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:177
---@param label any
---@param fieldName any
---@param values any
---@param defaultValue any
---@param valueTooltips any
function editor_util_editorElementHelper:addDropdown(label, fieldName, values, defaultValue, valueTooltips) end

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:246
---@param element any
function editor_util_editorElementHelper:addElement(element) end

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:107
---@param label any
---@param fieldName any
---@param defaultValue any
---@param allowedExtensions any
---@param displayOptions any
function editor_util_editorElementHelper:addFile(label, fieldName, defaultValue, allowedExtensions, displayOptions) end

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:120
---@param label any
---@param filepathsInfolder any
---@param displayOptions any
function editor_util_editorElementHelper:addFixedFile(label, filepathsInfolder, displayOptions) end

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:152
---@param label any
---@param fieldName any
---@param defaultCount any
---@param defaultBest any
---@param defaultMedium any
---@param defaultWorst any
function editor_util_editorElementHelper:addLeaderboard(label, fieldName, defaultCount, defaultBest, defaultMedium, defaultWorst) end

--- function C:addModelConfig(label, fieldName, defaultModel, defaultConfig)
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:96
---@param label any
---@param fieldName any
---@param defaultModel any
---@param defaultConfig any
---@param displayOptions any
function editor_util_editorElementHelper:addModelConfig(label, fieldName, defaultModel, defaultConfig, displayOptions) end

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:25
---@param label any
---@param fieldName any
---@param defaultValue any
---@param displayOptions any
function editor_util_editorElementHelper:addNumeric(label, fieldName, defaultValue, displayOptions) end

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:136
---@param label any
---@param fieldName any
---@param defaultValue any
---@param ... any
function editor_util_editorElementHelper:addRace(label, fieldName, defaultValue, ...) end

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:172
---@param label any
---@param fieldName any
---@param defaultValue any
function editor_util_editorElementHelper:addReward(label, fieldName, defaultValue) end

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:141
---@param label any
---@param fieldName any
---@param displayOptions any
function editor_util_editorElementHelper:addSimpleLapConfig(label, fieldName, displayOptions) end

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:147
---@param label any
---@param fieldName any
---@param defaultValue any
function editor_util_editorElementHelper:addSites(label, fieldName, defaultValue) end

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:29
---@param label any
---@param fieldName any
---@param defaultValue any
---@param len any
---@param displayOptions any
function editor_util_editorElementHelper:addString(label, fieldName, defaultValue, len, displayOptions) end

--- function C:addTransform(label, fieldName, {defaultPos, defaultRot, defaultScl, hasPos, hasRot, hasScl, oneDimScale}, {drawMode, drawColor, ...})
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:58
---@param label any
---@param fieldName any
---@param valueOptions any
---@param displayOptions any
function editor_util_editorElementHelper:addTransform(label, fieldName, valueOptions, displayOptions) end

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:187
---@param label any
---@param fieldName any
---@param displayOptions any
function editor_util_editorElementHelper:addVehicleFilter(label, fieldName, displayOptions) end

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:217
---@param label any
---@param fieldName any
---@param globalInfoFolderFieldName any
---@param displayOptions any
function editor_util_editorElementHelper:addZoneSelector(label, fieldName, globalInfoFolderFieldName, displayOptions) end

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:496
---@param c any
---@param fix any
---@param tags any
function editor_util_editorElementHelper:checkContainer(c, fix, tags) end

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:259
function editor_util_editorElementHelper:clear() end

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:1287
---@param filterOptions any
function editor_util_editorElementHelper:draw(filterOptions) end

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:1420
---@param corner any
---@param x any
---@param y any
---@param z any
---@param clr any
function editor_util_editorElementHelper:drawAxisBox(corner, x, y, z, clr) end

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:1327
---@param e any
function editor_util_editorElementHelper:drawTransformAsSphereDir(e) end

--- other helper functions
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:1346
---@param e any
function editor_util_editorElementHelper:drawTransformAsVehicle(e) end

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:1271
function editor_util_editorElementHelper:editingAnyTransform() end

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:1519
function editor_util_editorElementHelper:getAllFieldNames() end

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:327
function editor_util_editorElementHelper:getNewData() end

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:1529
---@param key any
---@param auto any
function editor_util_editorElementHelper:setAutoAdditionalAttributes(key, auto) end

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:380
---@param c any
function editor_util_editorElementHelper:setContainer(c) end

---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:1203
---@param container any
function editor_util_editorElementHelper:updateMouseInfo(container) end

