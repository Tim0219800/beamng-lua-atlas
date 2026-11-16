# `core_recoveryPrompt`

*File: `lua/ge/extensions/core/recoveryPrompt.lua` · VM: Game Engine (GE) · 1009 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_recoveryPrompt`: `extensions.load("core_recoveryPrompt")`, then the global `core_recoveryPrompt`

Player "recovery" menu (tow to the road, flip upright, repair, return to garage, quick travel, reset the vehicle, restart or submit a mission, give back a delivery or loaned vehicle). It keeps a table of buttons (buttonOptions) with target type (vehicle, walk, none), inclusion and activation conditions, price and function run during a screen fade. The buttons are exposed in the radial menu (core_quickAccess) and in the pause menu rails. A modder adds their own buttons with addButton and controls which ones are active.

## Example

```lua
core_recoveryPrompt.addButton('myTeleport', 'My teleport', function(target) --[[ ... ]] end, 30, nil, true, true, true, 'car')
core_recoveryPrompt.setButtonActiveById('myTeleport', false)
```

## Notes

- Built-in buttons: towToRoad, flipUpright, getFavoriteVehicle, flipMission, recoverMission, submitMission, restartMission, repairHere, resetVehicle, stopTestdrive, giveBackDeliveryVehicle, returnLoanedVehicle; plus, in career, towTo<garage> and quickTravelTo<garage> and quickTravelToVehicle (added by setDefaultsForCareer).
- Only buttons added with addButton (customButton) can be removed by removeButtonById or overwritten by a new addButton.
- Flow: buttonPressed stores the button and its target; if fadeActive, plays the sound, starts ui_fadeScreen.start(0.3); onScreenFadeState then calls handleCurrRecoveryOption, which emits the hook onRecoveryPromptButtonPressed(id), runs atFadeFunction(target), increments the counter, displays the message, stops the fade. In career outside the market and outside a mission, a 'beforeTeleport' part state snapshot is created beforehand.
- Thresholds: vehicleSlow = speed < 10 m/s; vehicleStopped = speed < 0.5 m/s.
- Career prices: 50 for flipUpright, 75 for towToRoad, free if roadside assistance is free for the vehicle.
- Probable BUG: in getButtonsForTarget, the loop over includeConditions overwrites 'add' on each condition, so only the last condition counts.
- Probable BUG: addButton, on an order collision, reads o.id which does not exist on the entries (the log message contains nil); and its first log('E', ...) passes the message in place of the tag.
- Probable BUG: setButtonLimits crashes if a key of limits is not an existing button identifier (buttonOptions[id] is nil). createPopupData uses the undefined variable 'title' (is nil, so the title is always the default translation).
- This module calls career_career, gameplay_walk, gameplay_missions_missionManager, etc. without protection; it assumes these extensions are loaded.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_recoveryPrompt.addButton(id, label, atFadeFunction, order, message, active, enabled, fadeActive, icon)` | Adds a custom button (implicit type 'none' since there is no type field: it only appears in the list of 'none' targets). Refuses to overwrite a built-in button. | 535 |
| `core_recoveryPrompt.buttonPressed(buttonId, target)` | Runs the recovery process for a button: optional part snapshot, then screen fade (start sound then ui_fadeScreen.start) before the action, or immediate action if fadeActive is false. | 642 |
| `core_recoveryPrompt.deactivateAllButtons()` | Disables all buttons (the menu stays in its state). | 507 |
| `core_recoveryPrompt.deserializeState(data)` | Restores the state produced by serializeState. | 629 |
| `core_recoveryPrompt.getButtonActiveById(id)` | Indicates whether a button is active. | 514 |
| `core_recoveryPrompt.getButtonLimitsAndCounts()` | Returns each button's limit and counter. | 606 |
| `core_recoveryPrompt.getCustomRecoveryOptionsActiveState()` | Returns a cleaned list of recovery options (active or not): active, enabled, label (translated if text), icon, isRecoveryOption. | 978 |
| `core_recoveryPrompt.getPauseCareerRightRailButtons()` | Buttons of the right rail of the pause menu in career: flipUpright and towToRoad for the player's vehicle. | 863 |
| `core_recoveryPrompt.getPauseMissionRightRailButtons()` | Buttons to display in the right rail of the pause menu in a mission: restartMission, flipMission, recoverMission, towToRoad (player vehicle and none targets). Each entry: id, title, icon, holdToClick, enabled, disableReason, order, startSlot, targetType, targetVehId. | 841 |
| `core_recoveryPrompt.handleCurrRecoveryOption()` | Runs the current recovery option (called at the end of the fade): hook onRecoveryPromptButtonPressed, atFadeFunction, counter, message, end of fade and UI router reload. *(internal)* | 669 |
| `core_recoveryPrompt.isActive()` | Indicates whether the recovery menu is globally active. | 472 |
| `core_recoveryPrompt.onBeforeRadialOpened()` | Hook called before the radial menu opens: the first time, registers the recovery entries in core_quickAccess (root, quickTravel/, towing/). *(internal)* *(hook)* | 960 |
| `core_recoveryPrompt.onExtensionLoaded()` | Load hook: builds the button table (setupButtonOptions). *(internal)* *(hook)* | 955 |
| `core_recoveryPrompt.onHideRadialMenu()` | Hook: the radial menu is closed, the popup data is cleared. *(internal)* *(hook)* | 969 |
| `core_recoveryPrompt.onPopupClosed()` | Popup close hook: forgets the current option and the popup data. *(internal)* *(hook)* | 663 |
| `core_recoveryPrompt.onQuickAccessLoaded()` | Hook: core_quickAccess was reloaded, the entries will need to be re-registered the next time it opens. *(internal)* *(hook)* | 973 |
| `core_recoveryPrompt.onResetGameplay(playerID)` | Hook called when gameplay is reset: if the menu is active and no recovery is in progress, opens the quick menu (core_quickAccess) on the career, mission or quick root depending on the context. *(internal)* *(hook)* | 879 |
| `core_recoveryPrompt.onScreenFadeState(state)` | ui_fadeScreen hook: on each state change, calls handleCurrRecoveryOption (which does nothing if there is no pending request). *(internal)* *(hook)* | 699 |
| `core_recoveryPrompt.removeButtonById(id)` | Removes a custom button. Refused for built-in buttons. | 565 |
| `core_recoveryPrompt.resetButtonLimitCounters(onlyFor)` | Resets the buttons' use counter to 0. | 598 |
| `core_recoveryPrompt.serializeState()` | Serializes the state (global active and each button's active state) for saving. | 619 |
| `core_recoveryPrompt.setActive(a)` | Enables or disables the recovery menu globally. | 473 |
| `core_recoveryPrompt.setButtonActiveById(id, a)` | Enables or disables a button. Logs a warning if the id is unknown. | 509 |
| `core_recoveryPrompt.setButtonEnabledById(id, e)` | Changes the enabled state of a button; if e is true, the button also becomes active. | 519 |
| `core_recoveryPrompt.setButtonLimits(limits)` | Sets the maximum number of uses per button (resets all limits first; -1 = unlimited). When a limit exists, the label shows the remaining uses. | 587 |
| `core_recoveryPrompt.setDefaultsForCareer()` | Career setting: enables the menu, keeps only towToRoad, flipUpright, getFavoriteVehicle, stopTestdrive, giveBackDeliveryVehicle, returnLoanedVehicle active, and adds the tow and quick travel buttons to the level's garages. | 479 |
| `core_recoveryPrompt.setDefaultsForFreeroam()` | Freeroam setting: disables the menu and all buttons. | 474 |
| `core_recoveryPrompt.setDefaultsForTutorial()` | Tutorial setting: enables the menu with only towToRoad, repairHere and flipUpright. | 493 |
| `core_recoveryPrompt.setEverythingActive()` | Enables the menu and all buttons. | 502 |

### Parameter details

#### `core_recoveryPrompt.addButton(id, label, atFadeFunction, order, message, active, enabled, fadeActive, icon)`

Adds a custom button (implicit type 'none' since there is no type field: it only appears in the list of 'none' targets). Refuses to overwrite a built-in button.

- `id` (*string*) : Unique identifier.
- `label` (*string|nil*) : Translation key; default 'ui.career.recovery.noLabel'.
- `atFadeFunction` (*function|nil*) : Function run during the fade; receives the target {type, vehId}.
- `order` (*number|nil*) : Display order; default = largest existing order + 1.
- `message` (*string|nil*) : Translation key of the message displayed after the action.
- `active` (*boolean|nil*) : Active, true by default.
- `enabled` (*boolean|function|nil*) : Clickable.
- `fadeActive` (*boolean|nil*) : Play a screen fade, true by default.
- `icon` (*string|nil*) : Icon name.

#### `core_recoveryPrompt.buttonPressed(buttonId, target)`

Runs the recovery process for a button: optional part snapshot, then screen fade (start sound then ui_fadeScreen.start) before the action, or immediate action if fadeActive is false.

- `buttonId` (*string*) : Button identifier.
- `target` (*{type: string, vehId: integer|nil}*) : Target: type 'vehicle', 'walk' or 'none', and vehId for a vehicle.

#### `core_recoveryPrompt.deserializeState(data)`

Restores the state produced by serializeState.

- `data` (*table*) : {active, buttons}.

#### `core_recoveryPrompt.getButtonActiveById(id)`

Indicates whether a button is active.

- `id` (*string*) : Button identifier.
- **returns**: boolean|nil nil if the id is unknown.

#### `core_recoveryPrompt.getButtonLimitsAndCounts()`

Returns each button's limit and counter.

- **returns**: table<string, {limit: integer|nil, count: integer|nil}> By button id.

#### `core_recoveryPrompt.getCustomRecoveryOptionsActiveState()`

Returns a cleaned list of recovery options (active or not): active, enabled, label (translated if text), icon, isRecoveryOption.

- **returns**: table<string, table> By button id.

#### `core_recoveryPrompt.getPauseCareerRightRailButtons()`

Buttons of the right rail of the pause menu in career: flipUpright and towToRoad for the player's vehicle.

- **returns**: table[] Buttons sorted by order.

#### `core_recoveryPrompt.getPauseMissionRightRailButtons()`

Buttons to display in the right rail of the pause menu in a mission: restartMission, flipMission, recoverMission, towToRoad (player vehicle and none targets). Each entry: id, title, icon, holdToClick, enabled, disableReason, order, startSlot, targetType, targetVehId.

- **returns**: table[] Buttons sorted by order.

#### `core_recoveryPrompt.isActive()`

Indicates whether the recovery menu is globally active.

- **returns**: boolean Active state.

#### `core_recoveryPrompt.onResetGameplay(playerID)`

Hook called when gameplay is reset: if the menu is active and no recovery is in progress, opens the quick menu (core_quickAccess) on the career, mission or quick root depending on the context.

- `playerID` (*integer*) : Player concerned (unused).

#### `core_recoveryPrompt.onScreenFadeState(state)`

ui_fadeScreen hook: on each state change, calls handleCurrRecoveryOption (which does nothing if there is no pending request).

- `state` (*any*) : Fade state (unused).

#### `core_recoveryPrompt.removeButtonById(id)`

Removes a custom button. Refused for built-in buttons.

- `id` (*string*) : Button identifier.

#### `core_recoveryPrompt.resetButtonLimitCounters(onlyFor)`

Resets the buttons' use counter to 0.

- `onlyFor` (*table<string, boolean>|nil*) : Set of ids concerned; nil = all.

#### `core_recoveryPrompt.serializeState()`

Serializes the state (global active and each button's active state) for saving.

- **returns**: {active: boolean, buttons: table<string, boolean>} State.

#### `core_recoveryPrompt.setActive(a)`

Enables or disables the recovery menu globally.

- `a` (*boolean*) : New state.

#### `core_recoveryPrompt.setButtonActiveById(id, a)`

Enables or disables a button. Logs a warning if the id is unknown.

- `id` (*string*) : Button identifier.
- `a` (*boolean*) : Active or not.

#### `core_recoveryPrompt.setButtonEnabledById(id, e)`

Changes the enabled state of a button; if e is true, the button also becomes active.

- `id` (*string*) : Button identifier.
- `e` (*boolean*) : Enabled.

#### `core_recoveryPrompt.setButtonLimits(limits)`

Sets the maximum number of uses per button (resets all limits first; -1 = unlimited). When a limit exists, the label shows the remaining uses.

- `limits` (*table<string, integer>|nil*) : Button id -> limit.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onRecoveryPromptButtonPressed` — listened to by 2 module(s)
- `onRecoveryPromptRepairHereUsed` — listened to by 1 module(s)

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`, `resetVehicle`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/recoveryPrompt.lua`.*
