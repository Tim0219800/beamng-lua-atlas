---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua
---@class flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C
local flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C = {}

---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:115
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:_executionStarted() end

---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:290
---@param value any
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:applyPick(value) end

---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:154
---@param mission any
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:buildBoolSettings(mission) end

---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:125
---@param loopManager any
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:buildLoopOptions(loopManager) end

---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:140
---@param rm any
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:buildStageOptions(rm) end

---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:120
---@param loopManager any
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:getMission(loopManager) end

---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:102
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:init() end

---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:236
---@param value any
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:onCoDriverSelectedByPanel(value) end

--- Update the mission's session-local settings immediately so the loop manager can
---  reliably re-read them in its own Start hook regardless of extension hook order.
---  Cloud persistence remains deferred until Start is committed.
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:252
---@param key any
---@param value any
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:onRallyStartSettingChanged(key, value) end

---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:276
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:onUIStartButtonClicked() end

---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:232
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:243
---@param value any
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:onVisualPacenotesChangedByPanel(value) end

---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:224
---@param entry any
---@param audioObjs any
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:playSample(entry, audioObjs) end

---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:214
---@param value any
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:resolveEntry(value) end

---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:173
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:work() end

