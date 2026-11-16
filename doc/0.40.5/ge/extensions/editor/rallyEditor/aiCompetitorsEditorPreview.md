# `editor_rallyEditor_aiCompetitorsEditorPreview`

*File: `lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorPreview.lua` · VM: Game Engine (GE) · 144 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_rallyEditor_aiCompetitorsEditorPreview`: `extensions.load("editor_rallyEditor_aiCompetitorsEditorPreview")`, then the global `editor_rallyEditor_aiCompetitorsEditorPreview`

Computation of the preview data for the rally editor's "AI Competitors" tab. From the general parameters, the reference time and a competitor's traits (skill, consistency, risk, in [0,1]), it computes the outcome mixture density over 500 samples: a first pass over a wide range, an automatic zoom onto the area where the mixture is significant, then a second pass over the zoomed range. It also returns the weight of each outcome and the y-axis maximum. Uses aiCompetitorsEditorModel.mixtureDensityTimes (hence gameplay/rally/aiCompetitors).

## Notes

- Wide range: from 0.65 × reference to min(reference × max_time_multiplier_vs_reference [2.35 default], reference × 2.8).
- The zoom keeps the area where the mixture exceeds 2% of the peak, with a 10% margin (at least 1% of the wide range) and a minimum width of 5.5% of the wide range; the zoom is only kept if it covers less than 90% of the wide range.
- Only the first 4 outcomes (excluding DNF) have density components.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_rallyEditor_aiCompetitorsEditorPreview.computeVisualization(input)` | Computes everything needed to draw the preview: outcome weights, densities over the zoomed range, weighted components of the first 4 outcomes, y-axis maximum and time bounds. | 67 |
| `editor_rallyEditor_aiCompetitorsEditorPreview.narrowTimeRangeFromMixture(densityResult, broadTimeLo, broadTimeHi)` | Narrows the time range to the area where the mixture density exceeds 2% of its peak, with margin and minimum width. Returns the wide range unchanged if the peak is almost zero (≤ 1e-30), if the wide range is zero or if the zoom keeps more than 90% of the range. | 21 |

### Parameter details

#### `editor_rallyEditor_aiCompetitorsEditorPreview.computeVisualization(input)`

Computes everything needed to draw the preview: outcome weights, densities over the zoomed range, weighted components of the first 4 outcomes, y-axis maximum and time bounds.

- `input` (*table*) : {general (general parameters), referenceSec (reference time in s), skillUnit, consistencyUnit, riskUnit (each in [0,1])}.
- **returns**: table {weights, density, weightedComponents, yMax, timeLo, timeHi}.

#### `editor_rallyEditor_aiCompetitorsEditorPreview.narrowTimeRangeFromMixture(densityResult, broadTimeLo, broadTimeHi)`

Narrows the time range to the area where the mixture density exceeds 2% of its peak, with margin and minimum width. Returns the wide range unchanged if the peak is almost zero (≤ 1e-30), if the wide range is zero or if the zoom keeps more than 90% of the range.

- `densityResult` (*table*) : Result of mixtureDensityTimes: mixture, times, sampleCount.
- `broadTimeLo` (*number*) : Lower bound of the wide range (seconds).
- `broadTimeHi` (*number*) : Upper bound of the wide range (seconds).
- **returns**: number Lower bound kept (s).
- **returns**: number Upper bound kept (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `chartSampleCount` | integer | Number of curve samples (500). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorPreview.lua`.*
