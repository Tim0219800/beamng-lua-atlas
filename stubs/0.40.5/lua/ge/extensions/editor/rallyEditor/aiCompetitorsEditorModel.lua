---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Data model of the rally editor's "AI Competitors" tab. It reads and writes the JSON file gameplay/rally/aiCompetitorsConfig.json (sections general, competitors, ui), provides the default values of the 26 general parameters of the result mixture model (Safe, Push, Minor Mistake, Major Issue, DNF) and of 5 competitors (A to E, skill/consistency/risk traits at 0.5), the slider bounds, value formatting and the parameter groups shown in the UI. The mixture computations come from gameplay/rally/aiCompetitors, re-exposed here (computeMixtureWeights, mixtureDensityTimes).
--- Access: extension `editor_rallyEditor_aiCompetitorsEditorModel`: `extensions.load("editor_rallyEditor_aiCompetitorsEditorModel")`, then the global `editor_rallyEditor_aiCompetitorsEditorModel`
---@class editor_rallyEditor_aiCompetitorsEditorModel
---@field computeMixtureWeights function Alias of gameplay/rally/aiCompetitors.computeMixtureWeights.
---@field configPath string Configuration file path: "gameplay/rally/aiCompetitorsConfig.json".
---@field generalFieldNames table<integer, string> Names of the general parameters, sorted alphabetically.
---@field generalParamGroups table<integer, table> Display groups {title, blurb, fields}: Stage limits, Safe & Push, Incidents & DNF, Pace vs reference, Base std dev, Consistency on std dev.
---@field generalSliderBounds table<string, {lo: number, hi: number}> Slider min/max bounds for each general parameter.
---@field mixtureDensityTimes function Alias of gameplay/rally/aiCompetitors.mixtureDensityTimes.
---@field numOutcomes integer Number of possible outcomes (5).
---@field outcomeDnf integer Index (5) of the DNF / Terminal outcome.
---@field outcomeLabels table<integer, string> Labels: Safe / Clean, Push / Aggressive, Minor Mistake, Major Issue, DNF / Terminal.
editor_rallyEditor_aiCompetitorsEditorModel = {}

--- Clamps a value to the parameter's slider range (unchanged if the parameter is unknown).
---Source: lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua:284
---@param fieldName string General parameter name.
---@param value number|string Value (converted by tonumber, 0 if invalid).
---@return number  Clamped value.
function editor_rallyEditor_aiCompetitorsEditorModel.clampParamToSliderRange(fieldName, value) end

--- Completes a raw configuration with default values: merged general, normalized competitors (traits in [0,1]), merged ui.
---Source: lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua:135
---@param raw table|nil Configuration read (general, competitors or drivers, ui).
---@return table  general.
---@return table<integer, table>  List of normalized competitors.
---@return table  ui.
function editor_rallyEditor_aiCompetitorsEditorModel.configWithDefaults(raw) end

--- Returns the default UI settings: default_player_time_sec 100, default_appearance_mode "dark", default_color_theme "blue", window_min_width 1100, window_min_height 720, slider_min 0, slider_max 1, default_slider_value 0.5.
---Source: lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua:70
---@return table  Default ui table.
function editor_rallyEditor_aiCompetitorsEditorModel.defaultUiDict() end

--- Turns a snake_case name into a label (e.g. "risk_tail_exponent" gives "Risk Tail Exponent").
---Source: lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua:314
---@param snakeName string Parameter name.
---@return string  Label.
function editor_rallyEditor_aiCompetitorsEditorModel.fieldLabel(snakeName) end

--- Formats a parameter according to its magnitude: 2 decimals if |v| ≥ 100, 3 if ≥ 10, 4 if ≥ 1, otherwise 5 significant digits.
---Source: lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua:299
---@param value number|string Value to format.
---@return string  Formatted text.
function editor_rallyEditor_aiCompetitorsEditorModel.formatParamValue(value) end

--- Reads configPath with jsonReadFile; returns an empty table if the file is missing or invalid.
---Source: lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua:160
---@return table  Raw data.
function editor_rallyEditor_aiCompetitorsEditorModel.loadRawConfig() end

--- Returns a copy of the default general parameters, overridden by the known, non-nil keys of overrides.
---Source: lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua:58
---@param overrides table|nil Values to override.
---@return table<string, number>  Complete general parameters.
function editor_rallyEditor_aiCompetitorsEditorModel.mergeGeneral(overrides) end

--- Writes {general, competitors, ui} (numbers rounded to 3 decimals) to configPath with jsonWriteFile (pretty format).
---Source: lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua:211
---@param generalTable table General parameters.
---@param competitorsList table<integer, table> List of competitors.
---@param uiTable table UI settings.
---@return boolean  Result of jsonWriteFile.
function editor_rallyEditor_aiCompetitorsEditorModel.saveConfig(generalTable, competitorsList, uiTable) end

--- Converts a slider value to [0, 1]; if the span is ≤ 0, simply clamps the value.
---Source: lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua:322
---@param value number Slider value.
---@param sliderMin number Slider minimum.
---@param sliderMax number Slider maximum.
---@return number  Normalized value between 0 and 1.
function editor_rallyEditor_aiCompetitorsEditorModel.sliderToUnit(value, sliderMin, sliderMax) end

