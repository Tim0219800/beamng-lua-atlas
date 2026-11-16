---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/modelSelection.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Models selection" tab of the thumbnail creation tool (ImGui): lists all vehicle models (core_vehicles.getModelList), grouped by type, with checkboxes to choose which ones will be photographed. It offers filters by type (Cars, Trucks, Heavy Machinery, Trailers, Props, Other), Player Vehicle Model, Select All, Unselect All, Invert Selection buttons, and two "Unselected / Selected Models" columns. The job.lua module queries it via getSelectedModels to build the work list.
--- Access: extension `util_screenshotCreator_modelSelection`: `extensions.load("util_screenshotCreator_modelSelection")`, then the global `util_screenshotCreator_modelSelection`
---@class util_screenshotCreator_modelSelection
---@field dependencies string[] Extensions loaded before: ui_imgui, ui_vehicleSelector_tileGrouping, core_vehicles, util_screenshotCreator_settings, util_screenshotCreator_shippedConfigs.
util_screenshotCreator_modelSelection = {}

--- Draws the ImGui "Models selection" tab (filters, buttons, lists). To be called every frame in the tool window, between BeginTabBar and EndTabBar; draws nothing if the tab is not active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/modelSelection.lua:128
function util_screenshotCreator_modelSelection.drawTab() end

--- Counts the checked and visible models.
---Source: lua/ge/extensions/util/screenshotCreator/modelSelection.lua:204
---@return integer  Number of selected models.
function util_screenshotCreator_modelSelection.getSelectedCount() end

--- Returns the keys of the checked and visible models. If none is checked, returns the player vehicle's model.
---Source: lua/ge/extensions/util/screenshotCreator/modelSelection.lua:188
---@return string[]  Model keys (vehicle folder, e.g. "pickup").
function util_screenshotCreator_modelSelection.getSelectedModels() end

--- Rebuilds the model list from core_vehicles.getModelList(); all selections are lost.
---Source: lua/ge/extensions/util/screenshotCreator/modelSelection.lua:215
function util_screenshotCreator_modelSelection.repopulate() end

--- Checks only the player vehicle's model (compared with JBeam) and unchecks all the others. Logs an error (tag selectCurVeh) if there is no player vehicle.
---Source: lua/ge/extensions/util/screenshotCreator/modelSelection.lua:116
function util_screenshotCreator_modelSelection.selectPlayerVehicle() end

