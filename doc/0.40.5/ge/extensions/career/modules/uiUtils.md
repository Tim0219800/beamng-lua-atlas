# `career_modules_uiUtils`

*File: `lua/ge/extensions/career/modules/uiUtils.lua` · VM: Game Engine (GE) · 140 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_uiUtils`: `extensions.load("career_modules_uiUtils")`, then the global `career_modules_uiUtils`

Utility functions for the career interface: status bar data (money, beamXP, vouchers, insurance score), simple per-branch statistics, contextual buttons of the career pause menu, and current level (map). Called by the Vue components (CareerStatus, CareerSimpleStats, pause menu).

## Notes

- The pause buttons are stored by index (functionId) in a local table; callCareerPauseContextButtons(functionId) then calls the corresponding function. Each call to getCareerPauseContextButtons rebuilds and replaces this table.
- Possible buttons: map (or "my cargo" in delivery mode), logbook, progress and milestones page (only outside the tutorial and after buying the starter vehicle), certification cancellation, test drive cancellation.

**Dependencies (loaded first):** `career_career`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_uiUtils.callCareerPauseContextButtons(functionId)` | Runs the pause button function with index functionId, if it exists. | 58 |
| `career_modules_uiUtils.getCareerCurrentLevelName()` | Returns the core_levels.getList() entry matching the loaded level (lowercase comparison with getCurrentLevelIdentifier()). | 130 |
| `career_modules_uiUtils.getCareerPauseContextButtons()` | Builds the list of contextual buttons of the career pause menu (depending on delivery, tutorial, certification, test drive) and stores them. | 62 |
| `career_modules_uiUtils.getCareerSimpleStats()` | Data for the CareerSimpleStats Vue component: save name and, for each non-skill branch, name, level label, value and min/max bounds of the level. | 21 |
| `career_modules_uiUtils.getCareerStatusData()` | Data for the CareerStatus Vue component: money, beamXP, vouchers and insurance driving score. | 10 |
| `career_modules_uiUtils.storeCareerPauseContextButtons(data)` | Stores the pause button functions and assigns each a functionId (index); clears the old table. | 51 |

### Parameter details

#### `career_modules_uiUtils.callCareerPauseContextButtons(functionId)`

Runs the pause button function with index functionId, if it exists.

- `functionId` (*integer*) : Index provided by getCareerPauseContextButtons.

#### `career_modules_uiUtils.getCareerCurrentLevelName()`

Returns the core_levels.getList() entry matching the loaded level (lowercase comparison with getCurrentLevelIdentifier()).

- **returns**: table|nil Level info, nil if not found.

#### `career_modules_uiUtils.getCareerPauseContextButtons()`

Builds the list of contextual buttons of the career pause menu (depending on delivery, tutorial, certification, test drive) and stores them.

- **returns**: table {buttons = {...}}.

#### `career_modules_uiUtils.getCareerSimpleStats()`

Data for the CareerSimpleStats Vue component: save name and, for each non-skill branch, name, level label, value and min/max bounds of the level.

- **returns**: table {saveSlotName, branches = {{name, levelLabel, min, value, max}, ...}}.

#### `career_modules_uiUtils.getCareerStatusData()`

Data for the CareerStatus Vue component: money, beamXP, vouchers and insurance driving score.

- **returns**: table {money, beamXP, vouchers, insuranceScore}.

#### `career_modules_uiUtils.storeCareerPauseContextButtons(data)`

Stores the pause button functions and assigns each a functionId (index); clears the old table.

- `data` (*table*) : Table with buttons (list of {label, icon, fun, showIndicator}); each button receives functionId.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"career_career"}. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/uiUtils.lua`.*
