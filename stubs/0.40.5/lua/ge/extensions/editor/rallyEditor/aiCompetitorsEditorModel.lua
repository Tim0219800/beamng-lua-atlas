---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_rallyEditor_aiCompetitorsEditorModel` : `extensions.load("editor_rallyEditor_aiCompetitorsEditorModel")`, puis la globale `editor_rallyEditor_aiCompetitorsEditorModel`
---@class editor_rallyEditor_aiCompetitorsEditorModel
---@field computeMixtureWeights any
---@field configPath string
---@field generalFieldNames table
---@field generalParamGroups table
---@field generalSliderBounds any
---@field mixtureDensityTimes any
---@field numOutcomes number
---@field outcomeDnf number
---@field outcomeLabels table
editor_rallyEditor_aiCompetitorsEditorModel = {}

---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua:284
---@param fieldName any
---@param value any
function editor_rallyEditor_aiCompetitorsEditorModel.clampParamToSliderRange(fieldName, value) end

---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua:135
---@param raw any
function editor_rallyEditor_aiCompetitorsEditorModel.configWithDefaults(raw) end

---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua:70
function editor_rallyEditor_aiCompetitorsEditorModel.defaultUiDict() end

---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua:314
---@param snakeName any
function editor_rallyEditor_aiCompetitorsEditorModel.fieldLabel(snakeName) end

---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua:299
---@param value any
function editor_rallyEditor_aiCompetitorsEditorModel.formatParamValue(value) end

---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua:160
function editor_rallyEditor_aiCompetitorsEditorModel.loadRawConfig() end

---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua:58
---@param overrides any
function editor_rallyEditor_aiCompetitorsEditorModel.mergeGeneral(overrides) end

---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua:211
---@param generalTable any
---@param competitorsList any
---@param uiTable any
function editor_rallyEditor_aiCompetitorsEditorModel.saveConfig(generalTable, competitorsList, uiTable) end

---Source : lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua:322
---@param value any
---@param sliderMin any
---@param sliderMax any
function editor_rallyEditor_aiCompetitorsEditorModel.sliderToUnit(value, sliderMin, sliderMax) end

