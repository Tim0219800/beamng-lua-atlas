# `editor_rallyEditor_aiCompetitorsTab`

*File: `lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua` · VM: Game Engine (GE) · 344 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/rallyEditor/aiCompetitorsTab")` (file under extensions/ but not a regular extension)

"AI Competitors Configuration" tab of the rally editor. It lets you set the global parameters of the AI competitors' outcome model (26 grouped sliders), the stage reference time and the traits of one competitor at a time (Pace = skill, Consistency, Risk), with a live preview: share of each outcome in % and finish time distribution curve. Reload / Save buttons: reads or writes gameplay/rally/aiCompetitorsConfig.json via aiCompetitorsEditorModel. The module returns a function with no arguments that creates the tab: require('/lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab')().

## Notes

- Changes are only written to disk with the Save button; the entered reference time is stored in ui.default_player_time_sec (minimum 1 s, default 100 s).
- Loaded values are clamped to their slider's range (clampParamToSliderRange).
- Bug: drawTraitSliders reads aiCompetitorsTexts.driverPreviewSection.emptycompetitors (lowercase) while the defined key is emptyCompetitors; if the competitors list were empty, im.Text would receive nil. Unlikely in practice because configWithDefaults always provides at least one competitor.
- Only one competitor is previewed at a time; Prev / Next first copy the sliders into the current competitor.

## Class `Panel`

AI competitors configuration tab (windowDescription = "AI Competitors Configuration"). Main fields: competitors (list copied for editing), ui, selectedCompetitorIndex, generalFloatPtrs (one FloatPtr per general parameter), referenceTimePtr and traitSkillPtr / traitConsistencyPtr / traitRiskPtr. Called by the rally editor window (draw).

The module returns a constructor: `local obj = require("editor_rallyEditor_aiCompetitorsTab")(options)`.

| Method | Description | Line |
|---|---|---|
| `Panel:applyGeneralTable(general)` | Applies a general parameters table to the sliders, each value being clamped to its range. | 73 |
| `Panel:applySelectedCompetitorToTraitSliders()` | Sets the trait sliders to the selected competitor's values (index clamped to the list; default value ui.default_slider_value or 0.5 if the trait is missing). | 97 |
| `Panel:buildVisualization()` | Syncs the traits then computes the preview data (aiCompetitorsEditorPreview.computeVisualization) with the traits brought back to [0,1] according to slider_min/slider_max. | 146 |
| `Panel:competitorDisplayName(competitor)` | Returns a competitor's displayable name, or "?" if it is missing or empty. | 111 |
| `Panel:draw(_mouseInfo, _dtReal, _dtSim, _dtRaw)` | Called every frame by the rally editor window: toolbar (Reload / Save), outcome shares, chart, then two columns (general parameters, reference and competitors). Arguments are ignored. | 288 |
| `Panel:drawGeneralParameterGroups()` | Draws the general parameter slider groups with titles, descriptions, tooltips and formatted value. | 161 |
| `Panel:drawReferenceAndDriversColumn()` | Draws the right column: reference time field then the trait sliders. | 254 |
| `Panel:drawTraitSliders()` | Draws the Prev / Next navigation between competitors and the Pace, Consistency and Risk sliders. | 197 |
| `Panel:gatherGeneralTable()` | Reads the slider values back into a general parameters table. | 62 |
| `Panel:init()` | Creates the ImGui pointers (default general parameters, reference time, traits at 0.5) then loads the configuration file. | 46 |
| `Panel:loadFromDisk()` | Re-reads the configuration (loadRawConfig then configWithDefaults), updates sliders, competitors, ui and reference time, and reselects the first competitor. | 122 |
| `Panel:parseReferenceTimeSeconds()` | Validates the entered reference time: replaces an invalid value (NaN) with the default and enforces a minimum of 1 s. | 133 |
| `Panel:syncTraitsIntoSelectedCompetitor()` | Copies the three trait sliders into the selected competitor (no effect if no competitor or invalid index). | 82 |
| `Panel:trySaveToDisk()` | Syncs the traits, updates ui.default_player_time_sec and writes the file via saveConfig; logs "Wrote ..." (I) or "Failed to save ..." (E). | 271 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua`.*
