---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/ui/simplePowertrainControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bridge between the vehicle and the simplified powertrain control buttons shown in the UI. setButton sends the UI event `ChangePowerTrainButtons` (create, update or remove a button); updateButtons asks powertrain and the controllers to republish their buttons. The powertrain/controller modules use it, a modder can add their own buttons to it.
--- Access: extension `ui_simplePowertrainControl`: `extensions.load (vehicle VM)("ui_simplePowertrainControl")`, then the global `ui_simplePowertrainControl`
---@class ui_simplePowertrainControl
ui_simplePowertrainControl = {}

--- Vehicle initialization hook; empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/ui/simplePowertrainControl.lua:49
function ui_simplePowertrainControl.onInit() end

--- Vehicle reset hook; empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/ui/simplePowertrainControl.lua:46
function ui_simplePowertrainControl.onReset() end

--- Publishes a simplified control button to the UI via guihooks.trigger('ChangePowerTrainButtons', {...}).
---Source: lua/vehicle/extensions/ui/simplePowertrainControl.lua:17
---@param id string Button identifier.
---@param uiName string Tooltip text (tooltip field).
---@param icon string Icon identifier.
---@param color string|nil Hexadecimal color; '#' added if missing.
---@param ringValue number|any Value of the button's progress ring (passed as is).
---@param onClickCallback string|any Callback passed to the UI (onClick field).
---@param remove boolean|nil true to remove the button.
---@param active boolean|nil Active state of the button.
function ui_simplePowertrainControl.setButton(id, uiName, icon, color, ringValue, onClickCallback, remove, active) end

--- Calls powertrain.updateSimpleControlButtons() then controller.updateSimpleControlButtons() so that each module republishes its buttons.
---Source: lua/vehicle/extensions/ui/simplePowertrainControl.lua:41
function ui_simplePowertrainControl.updateButtons() end

