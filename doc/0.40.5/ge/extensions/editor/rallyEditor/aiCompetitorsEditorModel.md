# `editor_rallyEditor_aiCompetitorsEditorModel`

*Fichier : `lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua` · VM : Game Engine (GE) · 409 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_rallyEditor_aiCompetitorsEditorModel` : `extensions.load("editor_rallyEditor_aiCompetitorsEditorModel")`, puis la globale `editor_rallyEditor_aiCompetitorsEditorModel`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_rallyEditor_aiCompetitorsEditorModel.clampParamToSliderRange(fieldName, value)` |  | 284 |
| `editor_rallyEditor_aiCompetitorsEditorModel.configWithDefaults(raw)` |  | 135 |
| `editor_rallyEditor_aiCompetitorsEditorModel.defaultUiDict()` |  | 70 |
| `editor_rallyEditor_aiCompetitorsEditorModel.fieldLabel(snakeName)` |  | 314 |
| `editor_rallyEditor_aiCompetitorsEditorModel.formatParamValue(value)` |  | 299 |
| `editor_rallyEditor_aiCompetitorsEditorModel.loadRawConfig()` |  | 160 |
| `editor_rallyEditor_aiCompetitorsEditorModel.mergeGeneral(overrides)` |  | 58 |
| `editor_rallyEditor_aiCompetitorsEditorModel.saveConfig(generalTable, competitorsList, uiTable)` |  | 211 |
| `editor_rallyEditor_aiCompetitorsEditorModel.sliderToUnit(value, sliderMin, sliderMax)` |  | 322 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `computeMixtureWeights` | any |  |
| `configPath` | string |  |
| `generalFieldNames` | table |  |
| `generalParamGroups` | table |  |
| `generalSliderBounds` | any |  |
| `mixtureDensityTimes` | any |  |
| `numOutcomes` | number |  |
| `outcomeDnf` | number |  |
| `outcomeLabels` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/aiCompetitorsEditorModel.lua`.*
