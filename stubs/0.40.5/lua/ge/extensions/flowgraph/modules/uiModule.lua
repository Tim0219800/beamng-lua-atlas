---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/uiModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/flowgraph/modules/uiModule.lua
---@class flowgraph_modules_uiModule_C
local flowgraph_modules_uiModule_C = {}

---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:275
---@param fun any
---@param meta any
function flowgraph_modules_uiModule_C:addButton(fun, meta) end

---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:484
---@param stepDetails any
function flowgraph_modules_uiModule_C:addCrashAnalysisStepDetails(stepDetails) end

---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:506
---@param driftStats any
function flowgraph_modules_uiModule_C:addDriftStats(driftStats) end

---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:267
---@param header any
function flowgraph_modules_uiModule_C:addHeader(header) end

---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:614
---@param state any
---@param attempt any
function flowgraph_modules_uiModule_C:addLaptimesForVehicle(state, attempt) end

---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:301
---@param change any
---@param pages any
function flowgraph_modules_uiModule_C:addObjectives(change, pages) end

---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:397
---@param change any
function flowgraph_modules_uiModule_C:addRatings(change) end

---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:204
function flowgraph_modules_uiModule_C:addReplayPanelAndSupportsReplay() end

--- Buttons added before finishUIBuilding appear above the start button.
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:291
---@param fun any
---@param meta any
function flowgraph_modules_uiModule_C:addScreenButton(fun, meta) end

---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:259
---@param element any
function flowgraph_modules_uiModule_C:addUIElement(element) end

--- Elements --
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:235
---@param items any
function flowgraph_modules_uiModule_C:buildListText(items) end

---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:18
function flowgraph_modules_uiModule_C:clear() end

---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:40
function flowgraph_modules_uiModule_C:clearButtonFunctions() end

---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:669
function flowgraph_modules_uiModule_C:executionStarted() end

---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:684
function flowgraph_modules_uiModule_C:executionStopped() end

---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:166
function flowgraph_modules_uiModule_C:finishUIBuilding() end

---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:9
function flowgraph_modules_uiModule_C:getFreeId() end

---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:14
function flowgraph_modules_uiModule_C:init() end

---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:36
---@param keep any
function flowgraph_modules_uiModule_C:keepGameState(keep) end

--- will probably only be used by startPage
---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:664
function flowgraph_modules_uiModule_C:nextPage() end

---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:229
---@param screensActive any
function flowgraph_modules_uiModule_C:onGetIsMissionStartOrEndScreenActive(screensActive) end

---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:246
---@param button any
function flowgraph_modules_uiModule_C:onMissionScreenButtonClicked(button) end

---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:219
---@param mode any
function flowgraph_modules_uiModule_C:onRequestMissionScreenData(mode) end

---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:29
---@param context any
function flowgraph_modules_uiModule_C:setAppContainerContext(context) end

---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:25
---@param ... any
function flowgraph_modules_uiModule_C:setGameState(...) end

---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:56
---@param pageName any
---@param icon any
function flowgraph_modules_uiModule_C:setPageIcon(pageName, icon) end

---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:393
---@param text any
function flowgraph_modules_uiModule_C:setStartButtonText(text) end

---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:200
function flowgraph_modules_uiModule_C:setStartScreenAsSimple() end

---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:61
function flowgraph_modules_uiModule_C:setupPages() end

---Source : lua/ge/extensions/flowgraph/modules/uiModule.lua:44
---@param uiMode any
---@param node any
function flowgraph_modules_uiModule_C:startUIBuilding(uiMode, node) end

