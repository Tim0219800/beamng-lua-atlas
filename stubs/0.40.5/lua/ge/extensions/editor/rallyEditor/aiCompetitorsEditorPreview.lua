---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorPreview.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Computation of the preview data for the rally editor's "AI Competitors" tab. From the general parameters, the reference time and a competitor's traits (skill, consistency, risk, in [0,1]), it computes the outcome mixture density over 500 samples: a first pass over a wide range, an automatic zoom onto the area where the mixture is significant, then a second pass over the zoomed range. It also returns the weight of each outcome and the y-axis maximum. Uses aiCompetitorsEditorModel.mixtureDensityTimes (hence gameplay/rally/aiCompetitors).
--- Access: extension `editor_rallyEditor_aiCompetitorsEditorPreview`: `extensions.load("editor_rallyEditor_aiCompetitorsEditorPreview")`, then the global `editor_rallyEditor_aiCompetitorsEditorPreview`
---@class editor_rallyEditor_aiCompetitorsEditorPreview
---@field chartSampleCount integer Number of curve samples (500).
editor_rallyEditor_aiCompetitorsEditorPreview = {}

--- Computes everything needed to draw the preview: outcome weights, densities over the zoomed range, weighted components of the first 4 outcomes, y-axis maximum and time bounds.
---Source: lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorPreview.lua:67
---@param input table {general (general parameters), referenceSec (reference time in s), skillUnit, consistencyUnit, riskUnit (each in [0,1])}.
---@return table  {weights, density, weightedComponents, yMax, timeLo, timeHi}.
function editor_rallyEditor_aiCompetitorsEditorPreview.computeVisualization(input) end

--- Narrows the time range to the area where the mixture density exceeds 2% of its peak, with margin and minimum width. Returns the wide range unchanged if the peak is almost zero (≤ 1e-30), if the wide range is zero or if the zoom keeps more than 90% of the range.
---Source: lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorPreview.lua:21
---@param densityResult table Result of mixtureDensityTimes: mixture, times, sampleCount.
---@param broadTimeLo number Lower bound of the wide range (seconds).
---@param broadTimeHi number Upper bound of the wide range (seconds).
---@return number  Lower bound kept (s).
---@return number  Upper bound kept (s).
function editor_rallyEditor_aiCompetitorsEditorPreview.narrowTimeRangeFromMixture(densityResult, broadTimeLo, broadTimeHi) end

