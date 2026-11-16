# `editor_rallyEditor_aiCompetitorsEditorModel`

*File: `lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua` · VM: Game Engine (GE) · 409 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_rallyEditor_aiCompetitorsEditorModel`: `extensions.load("editor_rallyEditor_aiCompetitorsEditorModel")`, then the global `editor_rallyEditor_aiCompetitorsEditorModel`

Data model of the rally editor's "AI Competitors" tab. It reads and writes the JSON file gameplay/rally/aiCompetitorsConfig.json (sections general, competitors, ui), provides the default values of the 26 general parameters of the result mixture model (Safe, Push, Minor Mistake, Major Issue, DNF) and of 5 competitors (A to E, skill/consistency/risk traits at 0.5), the slider bounds, value formatting and the parameter groups shown in the UI. The mixture computations come from gameplay/rally/aiCompetitors, re-exposed here (computeMixtureWeights, mixtureDensityTimes).

## Notes

- A competitor's traits (skill, consistency, risk) are clamped to [0, 1]; if any of the three values exceeds 1, all three are divided by 100 (0-100 scale accepted). Strings are converted with tonumber (0.5 otherwise).
- On read, the competitors list is taken from raw.competitors, otherwise raw.drivers, otherwise the A to E preset.
- Only keys known to defaultGeneral are accepted in mergeGeneral; the others are ignored.
- On write, numbers are rounded to 3 decimals (nearly integer values become integers).
- The ui.rng_seed field is nil by default, so it does not appear in defaultUiDict.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_rallyEditor_aiCompetitorsEditorModel.clampParamToSliderRange(fieldName, value)` | Clamps a value to the parameter's slider range (unchanged if the parameter is unknown). | 284 |
| `editor_rallyEditor_aiCompetitorsEditorModel.configWithDefaults(raw)` | Completes a raw configuration with default values: merged general, normalized competitors (traits in [0,1]), merged ui. | 135 |
| `editor_rallyEditor_aiCompetitorsEditorModel.defaultUiDict()` | Returns the default UI settings: default_player_time_sec 100, default_appearance_mode "dark", default_color_theme "blue", window_min_width 1100, window_min_height 720, slider_min 0, slider_max 1, default_slider_value 0.5. | 70 |
| `editor_rallyEditor_aiCompetitorsEditorModel.fieldLabel(snakeName)` | Turns a snake_case name into a label (e.g. "risk_tail_exponent" gives "Risk Tail Exponent"). | 314 |
| `editor_rallyEditor_aiCompetitorsEditorModel.formatParamValue(value)` | Formats a parameter according to its magnitude: 2 decimals if \|v\| ≥ 100, 3 if ≥ 10, 4 if ≥ 1, otherwise 5 significant digits. | 299 |
| `editor_rallyEditor_aiCompetitorsEditorModel.loadRawConfig()` | Reads configPath with jsonReadFile; returns an empty table if the file is missing or invalid. | 160 |
| `editor_rallyEditor_aiCompetitorsEditorModel.mergeGeneral(overrides)` | Returns a copy of the default general parameters, overridden by the known, non-nil keys of overrides. | 58 |
| `editor_rallyEditor_aiCompetitorsEditorModel.saveConfig(generalTable, competitorsList, uiTable)` | Writes {general, competitors, ui} (numbers rounded to 3 decimals) to configPath with jsonWriteFile (pretty format). | 211 |
| `editor_rallyEditor_aiCompetitorsEditorModel.sliderToUnit(value, sliderMin, sliderMax)` | Converts a slider value to [0, 1]; if the span is ≤ 0, simply clamps the value. | 322 |

### Parameter details

#### `editor_rallyEditor_aiCompetitorsEditorModel.clampParamToSliderRange(fieldName, value)`

Clamps a value to the parameter's slider range (unchanged if the parameter is unknown).

- `fieldName` (*string*) : General parameter name.
- `value` (*number|string*) : Value (converted by tonumber, 0 if invalid).
- **returns**: number Clamped value.

#### `editor_rallyEditor_aiCompetitorsEditorModel.configWithDefaults(raw)`

Completes a raw configuration with default values: merged general, normalized competitors (traits in [0,1]), merged ui.

- `raw` (*table|nil*) : Configuration read (general, competitors or drivers, ui).
- **returns**: table general.
- **returns**: table<integer, table> List of normalized competitors.
- **returns**: table ui.

#### `editor_rallyEditor_aiCompetitorsEditorModel.defaultUiDict()`

Returns the default UI settings: default_player_time_sec 100, default_appearance_mode "dark", default_color_theme "blue", window_min_width 1100, window_min_height 720, slider_min 0, slider_max 1, default_slider_value 0.5.

- **returns**: table Default ui table.

#### `editor_rallyEditor_aiCompetitorsEditorModel.fieldLabel(snakeName)`

Turns a snake_case name into a label (e.g. "risk_tail_exponent" gives "Risk Tail Exponent").

- `snakeName` (*string*) : Parameter name.
- **returns**: string Label.

#### `editor_rallyEditor_aiCompetitorsEditorModel.formatParamValue(value)`

Formats a parameter according to its magnitude: 2 decimals if |v| ≥ 100, 3 if ≥ 10, 4 if ≥ 1, otherwise 5 significant digits.

- `value` (*number|string*) : Value to format.
- **returns**: string Formatted text.

#### `editor_rallyEditor_aiCompetitorsEditorModel.loadRawConfig()`

Reads configPath with jsonReadFile; returns an empty table if the file is missing or invalid.

- **returns**: table Raw data.

#### `editor_rallyEditor_aiCompetitorsEditorModel.mergeGeneral(overrides)`

Returns a copy of the default general parameters, overridden by the known, non-nil keys of overrides.

- `overrides` (*table|nil*) : Values to override.
- **returns**: table<string, number> Complete general parameters.

#### `editor_rallyEditor_aiCompetitorsEditorModel.saveConfig(generalTable, competitorsList, uiTable)`

Writes {general, competitors, ui} (numbers rounded to 3 decimals) to configPath with jsonWriteFile (pretty format).

- `generalTable` (*table*) : General parameters.
- `competitorsList` (*table<integer, table>*) : List of competitors.
- `uiTable` (*table*) : UI settings.
- **returns**: boolean Result of jsonWriteFile.

#### `editor_rallyEditor_aiCompetitorsEditorModel.sliderToUnit(value, sliderMin, sliderMax)`

Converts a slider value to [0, 1]; if the span is ≤ 0, simply clamps the value.

- `value` (*number*) : Slider value.
- `sliderMin` (*number*) : Slider minimum.
- `sliderMax` (*number*) : Slider maximum.
- **returns**: number Normalized value between 0 and 1.

## Fields

| Field | Type | Description |
|---|---|---|
| `computeMixtureWeights` | function | Alias of gameplay/rally/aiCompetitors.computeMixtureWeights. |
| `configPath` | string | Configuration file path: "gameplay/rally/aiCompetitorsConfig.json". |
| `generalFieldNames` | table<integer, string> | Names of the general parameters, sorted alphabetically. |
| `generalParamGroups` | table<integer, table> | Display groups {title, blurb, fields}: Stage limits, Safe & Push, Incidents & DNF, Pace vs reference, Base std dev, Consistency on std dev. |
| `generalSliderBounds` | table<string, {lo: number, hi: number}> | Slider min/max bounds for each general parameter. |
| `mixtureDensityTimes` | function | Alias of gameplay/rally/aiCompetitors.mixtureDensityTimes. |
| `numOutcomes` | integer | Number of possible outcomes (5). |
| `outcomeDnf` | integer | Index (5) of the DNF / Terminal outcome. |
| `outcomeLabels` | table<integer, string> | Labels: Safe / Clean, Push / Aggressive, Minor Mistake, Major Issue, DNF / Terminal. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua`.*
