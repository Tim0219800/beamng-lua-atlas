# `editor_rallyEditor_aiCompetitorsEditorPlot`

*File: `lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorPlot.lua` · VM: Game Engine (GE) · 179 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_rallyEditor_aiCompetitorsEditorPlot`: `extensions.load("editor_rallyEditor_aiCompetitorsEditorPlot")`, then the global `editor_rallyEditor_aiCompetitorsEditorPlot`

ImGui drawing (via the draw list) of the finish time distribution preview in the rally editor's "AI Competitors" tab. drawFinishTimeChart draws the grid, the axes, one curve per outcome (first 4 weighted outcomes) and the highlighted mixture curve; drawOutcomeShareRow displays the share (%) of each outcome in columns. The data comes from aiCompetitorsEditorPreview.computeVisualization.

## Notes

- The curve for outcome 5 (DNF) is not drawn: only outcomes 1 to 4 have a density curve (DNF has no finish time).
- The chart is 300 px high, with 20 horizontal and 10 vertical divisions; if the plot area is less than 48 px, the text chartCopy.plotTooSmall is displayed instead.
- Colors: blue 58a6ff, orange ffa657, green 3fb950, red f85149, gray 8b949e; the mixture is bluish white f0f6fc.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_rallyEditor_aiCompetitorsEditorPlot.drawFinishTimeChart(im, visualization, chartCopy)` | Reserves an area (available width x 300 px), draws the grid, axes graduated in seconds (density on the y axis), the weighted curves of outcomes 1 to 4 (line 1.2) and the mixture curve (line 2.4), all clipped to the plot area. | 113 |
| `editor_rallyEditor_aiCompetitorsEditorPlot.drawOutcomeShareRow(im, visualization, outcomeLabels, outcomeColors, modelModule)` | Displays on a numOutcomes-column row the colored label of each outcome and its percentage (100 × visualization.weights[i], 2 decimals). | 100 |

### Parameter details

#### `editor_rallyEditor_aiCompetitorsEditorPlot.drawFinishTimeChart(im, visualization, chartCopy)`

Reserves an area (available width x 300 px), draws the grid, axes graduated in seconds (density on the y axis), the weighted curves of outcomes 1 to 4 (line 1.2) and the mixture curve (line 2.4), all clipped to the plot area.

- `im` (*table*) : Module ui_imgui.
- `visualization` (*table*) : Result of computeVisualization: density.mixture, weightedComponents, yMax, timeLo, timeHi.
- `chartCopy` (*table*) : Texts (aiCompetitorsEditorTexts.chart): axisLabel and plotTooSmall.

#### `editor_rallyEditor_aiCompetitorsEditorPlot.drawOutcomeShareRow(im, visualization, outcomeLabels, outcomeColors, modelModule)`

Displays on a numOutcomes-column row the colored label of each outcome and its percentage (100 × visualization.weights[i], 2 decimals).

- `im` (*table*) : Module ui_imgui.
- `visualization` (*table*) : Result of computeVisualization (weights field).
- `outcomeLabels` (*table<integer, string>*) : Labels; otherwise those of modelModule.outcomeLabels.
- `outcomeColors` (*table<integer, ImVec4>*) : Text color of each outcome.
- `modelModule` (*table*) : Module aiCompetitorsEditorModel (numOutcomes, outcomeLabels).

## Fields

| Field | Type | Description |
|---|---|---|
| `outcomeLineColors` | table<integer, ImVec4> | Colors of the 5 outcomes (Safe, Push, Minor, Major, DNF), reusable for labels. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorPlot.lua`.*
