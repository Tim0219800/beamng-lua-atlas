# `editor_rallyEditor_aiCompetitorsEditorTexts`

*File: `lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorTexts.lua` · VM: Game Engine (GE) · 166 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_rallyEditor_aiCompetitorsEditorTexts`: `extensions.load("editor_rallyEditor_aiCompetitorsEditorTexts")`, then the global `editor_rallyEditor_aiCompetitorsEditorTexts`

Table of texts (labels, section titles, tooltips) in English for the rally editor's "AI Competitors" tab. No code: the module only contains strings read by aiCompetitorsTab and aiCompetitorsEditorPlot. Useful to find the meaning of each of the 26 general parameters of the model and of a competitor's traits.

## Notes

- In the UI, the model's "skill" trait is presented under the name "Pace" (driverTraitTooltips.Pace).
- The reference time is, according to the help text, replaced in game by the "silver" bar time.

## Fields

| Field | Type | Description |
|---|---|---|
| `chart` | table<string, string> | Chart texts: title, subtitle, legendHint, axisLabel, plotTooSmall. |
| `competitorNavigationTooltip` | string | Tooltip of the competitor selector (saving writes the whole list). |
| `driverPreviewSection` | table<string, string> | Texts of the Driver preview section (title, subtitle, emptyCompetitors). |
| `driverTraitTooltips` | table<string, string> | Tooltips for the Pace, Consistency, Risk traits. |
| `generalGroupPresentation` | table<integer, {title: string, blurb: string}> | Title and description of the 6 general parameter groups (same order as the model's generalParamGroups). |
| `generalParamLabels` | table<string, string> | Displayed label of each general parameter (key = snake_case name). |
| `generalParamTooltips` | table<string, string> | Tooltip of each general parameter. |
| `globalSection` | table<string, string> | Title and subtitle of the Global parameters section. |
| `outcomeLabels` | table<integer, string> | Short labels of the 5 outcomes: Clean, Push, Minor incident, Major incident, DNF. |
| `playerReferenceHelp` | string | Help for the stage reference time (seconds), the basis of the model and the preview. |
| `previewSection` | table<string, string> | Title and subtitle of the Preview section. |
| `referenceSection` | table<string, string> | Texts of the reference time and drivers section (title, subtitle, referenceTimeLabel). |
| `toolbar` | table<string, string> | Toolbar texts: header, configPathPrefix, reload, save. |
| `windowDescription` | string | Tab title: "AI Competitors Configuration". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorTexts.lua`.*
