# `util_screenshotCreator_modelSelection`

*File: `lua/ge/extensions/util/screenshotCreator/modelSelection.lua` · VM: Game Engine (GE) · 220 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_screenshotCreator_modelSelection`: `extensions.load("util_screenshotCreator_modelSelection")`, then the global `util_screenshotCreator_modelSelection`

"Models selection" tab of the thumbnail creation tool (ImGui): lists all vehicle models (core_vehicles.getModelList), grouped by type, with checkboxes to choose which ones will be photographed. It offers filters by type (Cars, Trucks, Heavy Machinery, Trailers, Props, Other), Player Vehicle Model, Select All, Unselect All, Invert Selection buttons, and two "Unselected / Selected Models" columns. The job.lua module queries it via getSelectedModels to build the work list.

## Notes

- The list is built on first use (ensurePopulated) then kept; call repopulate() to rebuild it.
- If the shippedConfigsOnly setting is active, only the models shipped with the game (shippedConfigs.isModelShipped) are visible and selectable.
- Type filters are combined with OR; models that do not match stay displayed but grayed out.
- getSelectedModels returns the player vehicle's JBeam if nothing is checked: this causes a Lua error if there is no player vehicle (getPlayerVehicle(0) is nil).
- getSelectedCount, however, counts only the checked boxes (0 if none) and does not take this fallback into account.

**Dependencies (loaded first):** `ui_imgui`, `ui_vehicleSelector_tileGrouping`, `core_vehicles`, `util_screenshotCreator_settings`, `util_screenshotCreator_shippedConfigs`

## Functions

| Function | Description | Line |
|---|---|---|
| `util_screenshotCreator_modelSelection.drawTab()` | Draws the ImGui "Models selection" tab (filters, buttons, lists). To be called every frame in the tool window, between BeginTabBar and EndTabBar; draws nothing if the tab is not active. *(internal)* | 128 |
| `util_screenshotCreator_modelSelection.getSelectedCount()` | Counts the checked and visible models. | 204 |
| `util_screenshotCreator_modelSelection.getSelectedModels()` | Returns the keys of the checked and visible models. If none is checked, returns the player vehicle's model. | 188 |
| `util_screenshotCreator_modelSelection.repopulate()` | Rebuilds the model list from core_vehicles.getModelList(); all selections are lost. | 215 |
| `util_screenshotCreator_modelSelection.selectPlayerVehicle()` | Checks only the player vehicle's model (compared with JBeam) and unchecks all the others. Logs an error (tag selectCurVeh) if there is no player vehicle. | 116 |

### Parameter details

#### `util_screenshotCreator_modelSelection.getSelectedCount()`

Counts the checked and visible models.

- **returns**: integer Number of selected models.

#### `util_screenshotCreator_modelSelection.getSelectedModels()`

Returns the keys of the checked and visible models. If none is checked, returns the player vehicle's model.

- **returns**: string[] Model keys (vehicle folder, e.g. "pickup").

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded before: ui_imgui, ui_vehicleSelector_tileGrouping, core_vehicles, util_screenshotCreator_settings, util_screenshotCreator_shippedConfigs. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/screenshotCreator/modelSelection.lua`.*
