---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorTexts.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Table of texts (labels, section titles, tooltips) in English for the rally editor's "AI Competitors" tab. No code: the module only contains strings read by aiCompetitorsTab and aiCompetitorsEditorPlot. Useful to find the meaning of each of the 26 general parameters of the model and of a competitor's traits.
--- Access: extension `editor_rallyEditor_aiCompetitorsEditorTexts`: `extensions.load("editor_rallyEditor_aiCompetitorsEditorTexts")`, then the global `editor_rallyEditor_aiCompetitorsEditorTexts`
---@class editor_rallyEditor_aiCompetitorsEditorTexts
---@field chart table<string, string> Chart texts: title, subtitle, legendHint, axisLabel, plotTooSmall.
---@field competitorNavigationTooltip string Tooltip of the competitor selector (saving writes the whole list).
---@field driverPreviewSection table<string, string> Texts of the Driver preview section (title, subtitle, emptyCompetitors).
---@field driverTraitTooltips table<string, string> Tooltips for the Pace, Consistency, Risk traits.
---@field generalGroupPresentation table<integer, {title: string, blurb: string}> Title and description of the 6 general parameter groups (same order as the model's generalParamGroups).
---@field generalParamLabels table<string, string> Displayed label of each general parameter (key = snake_case name).
---@field generalParamTooltips table<string, string> Tooltip of each general parameter.
---@field globalSection table<string, string> Title and subtitle of the Global parameters section.
---@field outcomeLabels table<integer, string> Short labels of the 5 outcomes: Clean, Push, Minor incident, Major incident, DNF.
---@field playerReferenceHelp string Help for the stage reference time (seconds), the basis of the model and the preview.
---@field previewSection table<string, string> Title and subtitle of the Preview section.
---@field referenceSection table<string, string> Texts of the reference time and drivers section (title, subtitle, referenceTimeLabel).
---@field toolbar table<string, string> Toolbar texts: header, configPathPrefix, reload, save.
---@field windowDescription string Tab title: "AI Competitors Configuration".
editor_rallyEditor_aiCompetitorsEditorTexts = {}

