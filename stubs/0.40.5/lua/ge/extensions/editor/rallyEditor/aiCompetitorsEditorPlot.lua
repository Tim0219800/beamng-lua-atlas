---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorPlot.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- ImGui drawing (via the draw list) of the finish time distribution preview in the rally editor's "AI Competitors" tab. drawFinishTimeChart draws the grid, the axes, one curve per outcome (first 4 weighted outcomes) and the highlighted mixture curve; drawOutcomeShareRow displays the share (%) of each outcome in columns. The data comes from aiCompetitorsEditorPreview.computeVisualization.
--- Access: extension `editor_rallyEditor_aiCompetitorsEditorPlot`: `extensions.load("editor_rallyEditor_aiCompetitorsEditorPlot")`, then the global `editor_rallyEditor_aiCompetitorsEditorPlot`
---@class editor_rallyEditor_aiCompetitorsEditorPlot
---@field outcomeLineColors table<integer, ImVec4> Colors of the 5 outcomes (Safe, Push, Minor, Major, DNF), reusable for labels.
editor_rallyEditor_aiCompetitorsEditorPlot = {}

--- Reserves an area (available width x 300 px), draws the grid, axes graduated in seconds (density on the y axis), the weighted curves of outcomes 1 to 4 (line 1.2) and the mixture curve (line 2.4), all clipped to the plot area.
---Source: lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorPlot.lua:113
---@param im table Module ui_imgui.
---@param visualization table Result of computeVisualization: density.mixture, weightedComponents, yMax, timeLo, timeHi.
---@param chartCopy table Texts (aiCompetitorsEditorTexts.chart): axisLabel and plotTooSmall.
function editor_rallyEditor_aiCompetitorsEditorPlot.drawFinishTimeChart(im, visualization, chartCopy) end

--- Displays on a numOutcomes-column row the colored label of each outcome and its percentage (100 × visualization.weights[i], 2 decimals).
---Source: lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorPlot.lua:100
---@param im table Module ui_imgui.
---@param visualization table Result of computeVisualization (weights field).
---@param outcomeLabels table<integer, string> Labels; otherwise those of modelModule.outcomeLabels.
---@param outcomeColors table<integer, ImVec4> Text color of each outcome.
---@param modelModule table Module aiCompetitorsEditorModel (numOutcomes, outcomeLabels).
function editor_rallyEditor_aiCompetitorsEditorPlot.drawOutcomeShareRow(im, visualization, outcomeLabels, outcomeColors, modelModule) end

