# `ui_pause_providers_routeData_career`

*File: `lua/ge/extensions/ui/pause/providers/routeData/career.lua` · VM: Game Engine (GE) · 222 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_pause_providers_routeData_career`: `extensions.load("ui_pause_providers_routeData_career")`, then the global `ui_pause_providers_routeData_career`

Pause menu data provider for the career screens: progression (digest and suggested APM missions), history (financial, gameplay, milestones, logbook) and history detail. The functions return tables describing the content (panels, Vue components, button rail) that the pause UI displays. The data comes from career_modules_playerAttributes, career_modules_milestones_milestones and career_career.

## Notes

- Button navigation goes through extensions.ui_router.navigate in a pcall; success is ok and result and result.result ~= false.
- The digest's history entries are limited to 5 (getHistoryChanges(type, 5)); the full view has no limit.
- Known history types: "financial" (default) and "gameplay".

**Dependencies (loaded first):** `career_career`, `career_saveSystem`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_pause_providers_routeData_career.getCareerHistoryData(context)` | Returns the history page data: a rail of four buttons (financial, gameplay, milestones with an indicator if there are unclaimed ones, logbook) and the overview side panels (last 5 entries, milestones digest). | 150 |
| `ui_pause_providers_routeData_career.getCareerHistoryDetailData(context, historyType)` | Returns the full view of a history (CareerHistoryDigest component with full = true), with the title provided by career_modules_playerAttributes.getCareerHistoryInfo or a default title. | 200 |
| `ui_pause_providers_routeData_career.getCareerProgressData(context)` | Returns the progression page data: title ui.career.landingPage.name, main panel (ProgressDigest, ApmSuggestedMissions) and ProgressDomainInfo side panels for the domains apm, bmra, logistics and freestyle. | 127 |
| `ui_pause_providers_routeData_career.isCareerProgressAvailable()` | Returns whether the career progression screen is available: false during the career tutorial, otherwise true only if the starting vehicle has been purchased. | 26 |

### Parameter details

#### `ui_pause_providers_routeData_career.getCareerHistoryData(context)`

Returns the history page data: a rail of four buttons (financial, gameplay, milestones with an indicator if there are unclaimed ones, logbook) and the overview side panels (last 5 entries, milestones digest).

- `context` (*table*) : Pause menu context (field read: mode).
- **returns**: table {mode, heading, rail, focusSidePanelContents}

#### `ui_pause_providers_routeData_career.getCareerHistoryDetailData(context, historyType)`

Returns the full view of a history (CareerHistoryDigest component with full = true), with the title provided by career_modules_playerAttributes.getCareerHistoryInfo or a default title.

- `context` (*table*) : Pause menu context (field read: mode).
- `historyType` (*string*) : "financial" or "gameplay".
- **returns**: table {mode, heading, mainCardClass, mainPanelContent}

#### `ui_pause_providers_routeData_career.getCareerProgressData(context)`

Returns the progression page data: title ui.career.landingPage.name, main panel (ProgressDigest, ApmSuggestedMissions) and ProgressDomainInfo side panels for the domains apm, bmra, logistics and freestyle.

- `context` (*table*) : Pause menu context (field read: mode).
- **returns**: table {mode, heading, mainPanelContent, focusSidePanelContents}

#### `ui_pause_providers_routeData_career.isCareerProgressAvailable()`

Returns whether the career progression screen is available: false during the career tutorial, otherwise true only if the starting vehicle has been purchased.

- **returns**: boolean|nil Availability (may be nil if career_career is absent).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"career_career", "career_saveSystem"} |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/pause/providers/routeData/career.lua`.*
