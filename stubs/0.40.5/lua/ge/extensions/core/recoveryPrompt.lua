---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/recoveryPrompt.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Player "recovery" menu (tow to the road, flip upright, repair, return to garage, quick travel, reset the vehicle, restart or submit a mission, give back a delivery or loaned vehicle). It keeps a table of buttons (buttonOptions) with target type (vehicle, walk, none), inclusion and activation conditions, price and function run during a screen fade. The buttons are exposed in the radial menu (core_quickAccess) and in the pause menu rails. A modder adds their own buttons with addButton and controls which ones are active.
--- Access: extension `core_recoveryPrompt`: `extensions.load("core_recoveryPrompt")`, then the global `core_recoveryPrompt`
---@class core_recoveryPrompt
core_recoveryPrompt = {}

--- Adds a custom button (implicit type 'none' since there is no type field: it only appears in the list of 'none' targets). Refuses to overwrite a built-in button.
---Source: lua/ge/extensions/core/recoveryPrompt.lua:535
---@param id string Unique identifier.
---@param label string|nil Translation key; default 'ui.career.recovery.noLabel'.
---@param atFadeFunction function|nil Function run during the fade; receives the target {type, vehId}.
---@param order number|nil Display order; default = largest existing order + 1.
---@param message string|nil Translation key of the message displayed after the action.
---@param active boolean|nil Active, true by default.
---@param enabled boolean|function|nil Clickable.
---@param fadeActive boolean|nil Play a screen fade, true by default.
---@param icon string|nil Icon name.
function core_recoveryPrompt.addButton(id, label, atFadeFunction, order, message, active, enabled, fadeActive, icon) end

--- Runs the recovery process for a button: optional part snapshot, then screen fade (start sound then ui_fadeScreen.start) before the action, or immediate action if fadeActive is false.
---Source: lua/ge/extensions/core/recoveryPrompt.lua:642
---@param buttonId string Button identifier.
---@param target {type: string, vehId: integer|nil} Target: type 'vehicle', 'walk' or 'none', and vehId for a vehicle.
function core_recoveryPrompt.buttonPressed(buttonId, target) end

--- Disables all buttons (the menu stays in its state).
---Source: lua/ge/extensions/core/recoveryPrompt.lua:507
function core_recoveryPrompt.deactivateAllButtons() end

--- Restores the state produced by serializeState.
---Source: lua/ge/extensions/core/recoveryPrompt.lua:629
---@param data table {active, buttons}.
function core_recoveryPrompt.deserializeState(data) end

--- Indicates whether a button is active.
---Source: lua/ge/extensions/core/recoveryPrompt.lua:514
---@param id string Button identifier.
---@return boolean|nil  nil if the id is unknown.
function core_recoveryPrompt.getButtonActiveById(id) end

--- Returns each button's limit and counter.
---Source: lua/ge/extensions/core/recoveryPrompt.lua:606
---@return table<string, {limit: integer|nil, count: integer|nil}>  By button id.
function core_recoveryPrompt.getButtonLimitsAndCounts() end

--- Returns a cleaned list of recovery options (active or not): active, enabled, label (translated if text), icon, isRecoveryOption.
---Source: lua/ge/extensions/core/recoveryPrompt.lua:978
---@return table<string, table>  By button id.
function core_recoveryPrompt.getCustomRecoveryOptionsActiveState() end

--- Buttons of the right rail of the pause menu in career: flipUpright and towToRoad for the player's vehicle.
---Source: lua/ge/extensions/core/recoveryPrompt.lua:863
---@return table[]  Buttons sorted by order.
function core_recoveryPrompt.getPauseCareerRightRailButtons() end

--- Buttons to display in the right rail of the pause menu in a mission: restartMission, flipMission, recoverMission, towToRoad (player vehicle and none targets). Each entry: id, title, icon, holdToClick, enabled, disableReason, order, startSlot, targetType, targetVehId.
---Source: lua/ge/extensions/core/recoveryPrompt.lua:841
---@return table[]  Buttons sorted by order.
function core_recoveryPrompt.getPauseMissionRightRailButtons() end

--- Runs the current recovery option (called at the end of the fade): hook onRecoveryPromptButtonPressed, atFadeFunction, counter, message, end of fade and UI router reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/recoveryPrompt.lua:669
function core_recoveryPrompt.handleCurrRecoveryOption() end

--- Indicates whether the recovery menu is globally active.
---Source: lua/ge/extensions/core/recoveryPrompt.lua:472
---@return boolean  Active state.
function core_recoveryPrompt.isActive() end

--- Hook called before the radial menu opens: the first time, registers the recovery entries in core_quickAccess (root, quickTravel/, towing/).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/recoveryPrompt.lua:960
function core_recoveryPrompt.onBeforeRadialOpened() end

--- Load hook: builds the button table (setupButtonOptions).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/recoveryPrompt.lua:955
function core_recoveryPrompt.onExtensionLoaded() end

--- Hook: the radial menu is closed, the popup data is cleared.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/recoveryPrompt.lua:969
function core_recoveryPrompt.onHideRadialMenu() end

--- Popup close hook: forgets the current option and the popup data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/recoveryPrompt.lua:663
function core_recoveryPrompt.onPopupClosed() end

--- Hook: core_quickAccess was reloaded, the entries will need to be re-registered the next time it opens.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/recoveryPrompt.lua:973
function core_recoveryPrompt.onQuickAccessLoaded() end

--- Hook called when gameplay is reset: if the menu is active and no recovery is in progress, opens the quick menu (core_quickAccess) on the career, mission or quick root depending on the context.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/recoveryPrompt.lua:879
---@param playerID integer Player concerned (unused).
function core_recoveryPrompt.onResetGameplay(playerID) end

--- ui_fadeScreen hook: on each state change, calls handleCurrRecoveryOption (which does nothing if there is no pending request).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/recoveryPrompt.lua:699
---@param state any Fade state (unused).
function core_recoveryPrompt.onScreenFadeState(state) end

--- Removes a custom button. Refused for built-in buttons.
---Source: lua/ge/extensions/core/recoveryPrompt.lua:565
---@param id string Button identifier.
function core_recoveryPrompt.removeButtonById(id) end

--- Resets the buttons' use counter to 0.
---Source: lua/ge/extensions/core/recoveryPrompt.lua:598
---@param onlyFor table<string, boolean>|nil Set of ids concerned; nil = all.
function core_recoveryPrompt.resetButtonLimitCounters(onlyFor) end

--- Serializes the state (global active and each button's active state) for saving.
---Source: lua/ge/extensions/core/recoveryPrompt.lua:619
---@return {active: boolean, buttons: table<string, boolean>}  State.
function core_recoveryPrompt.serializeState() end

--- Enables or disables the recovery menu globally.
---Source: lua/ge/extensions/core/recoveryPrompt.lua:473
---@param a boolean New state.
function core_recoveryPrompt.setActive(a) end

--- Enables or disables a button. Logs a warning if the id is unknown.
---Source: lua/ge/extensions/core/recoveryPrompt.lua:509
---@param id string Button identifier.
---@param a boolean Active or not.
function core_recoveryPrompt.setButtonActiveById(id, a) end

--- Changes the enabled state of a button; if e is true, the button also becomes active.
---Source: lua/ge/extensions/core/recoveryPrompt.lua:519
---@param id string Button identifier.
---@param e boolean Enabled.
function core_recoveryPrompt.setButtonEnabledById(id, e) end

--- Sets the maximum number of uses per button (resets all limits first; -1 = unlimited). When a limit exists, the label shows the remaining uses.
---Source: lua/ge/extensions/core/recoveryPrompt.lua:587
---@param limits table<string, integer>|nil Button id -> limit.
function core_recoveryPrompt.setButtonLimits(limits) end

--- Career setting: enables the menu, keeps only towToRoad, flipUpright, getFavoriteVehicle, stopTestdrive, giveBackDeliveryVehicle, returnLoanedVehicle active, and adds the tow and quick travel buttons to the level's garages.
---Source: lua/ge/extensions/core/recoveryPrompt.lua:479
function core_recoveryPrompt.setDefaultsForCareer() end

--- Freeroam setting: disables the menu and all buttons.
---Source: lua/ge/extensions/core/recoveryPrompt.lua:474
function core_recoveryPrompt.setDefaultsForFreeroam() end

--- Tutorial setting: enables the menu with only towToRoad, repairHere and flipUpright.
---Source: lua/ge/extensions/core/recoveryPrompt.lua:493
function core_recoveryPrompt.setDefaultsForTutorial() end

--- Enables the menu and all buttons.
---Source: lua/ge/extensions/core/recoveryPrompt.lua:502
function core_recoveryPrompt.setEverythingActive() end

