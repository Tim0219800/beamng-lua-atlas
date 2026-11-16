# `core_quickAccess`

*File: `lua/ge/extensions/core/quickAccess.lua` · VM: Game Engine (GE) · 2782 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_quickAccess`: `extensions.load("core_quickAccess")`, then the global `core_quickAccess`

GE extension `core_quickAccess`: the game's radial menu (quick menu). It keeps a menu tree (paths like '/root/sandbox/other/'), assembles it on opening (static entries, generators, entries requested from the player vehicle), positions it on the 8 slots of the circle then sends it to the UI (guihooks 'radialMenuUpdated', UI route 'radial'). It slows down time while the menu is open, remembers recent actions and the dynamic slot configuration (settings/radialRecentActions.json and settings/radialDynamicSlotSettings.json). A mod adds its own buttons with core_quickAccess.addEntry, preferably in the onRegisterQuickAccessMenus hook.

## Example

```lua
-- in the mod's extension (GE)
local M = {}
local function onRegisterQuickAccessMenus()
  if not core_quickAccess then return end
  core_quickAccess.addEntry({
    level = '/root/sandbox/other/',   -- "Other" submenu
    uniqueID = 'monModAction',        -- replaces the entry if already present, enables recent actions
    generator = function(entries)     -- called on every opening, adds buttons to `entries`
      table.insert(entries, {
        title = 'My action', icon = 'wrench', uniqueID = 'monModAction',
        onSelect = function() log('I','','click') return {'hide'} end,
      })
    end,
  })
end
M.onRegisterQuickAccessMenus = onRegisterQuickAccessMenus
return M
```

## Notes

- HOW A MOD ADDS ENTRIES: (1) define the onRegisterQuickAccessMenus hook in your GE extension (called by registerDefaultMenus at the first onInit of core_quickAccess, after the base menus) and call core_quickAccess.addEntry(...) in it. (2) If the extension is loaded later, call addEntry directly or listen to onQuickAccessLoaded (emitted at quickAccess's onExtensionLoaded). Entries added after the first onInit are only taken into account the next time the menu is opened (the tree is copied on every show). core_quickAccess.registerMenu is deprecated: it just logs an error.
- Arguments of addEntry: `level` (menu path; default '/root/sandbox/general/'; if it does not start with '/root/' it is prefixed with '/root/sandbox'; a trailing '/' is added); either `generator = function(entries)` which inserts button tables into `entries`, or directly `title` + (`onSelect` or `goto`). If `uniqueID` is given, an existing entry of the same level with the same uniqueID is replaced. The argument is copied by deepcopy: do not put shared objects whose identity matters in it, but functions are kept.
- Button fields (read in the code): title (translation key or text), desc, icon (icon name; old names listed in ui/assets/iconMappings/iconTags.json are replaced with a warning), goto (submenu path: the button becomes a folder), onSelect/onSecondarySelect/onTertiarySelect(item) for actions 1, 2, 3, onDeselect/onSecondaryDeselect/onTertiaryDeselect(item) on release, startSlot/endSlot (position), priority, uniqueID, enabled (default true), categoryOrder (for categories), ignoreAsRecentAction, ignoreForCheckingIfMenuIsEmpty, contextAction (function, called by contextAction()), dynamicSlot = {id=...}.
- Return value of onSelect/onDeselect: a table whose 1st element is the command: {'hide'} closes the menu, {'reload'} rebuilds it, {'goto', path} opens a submenu, {'back'} goes back, {'hideMeOnly'} closes, {'temporaryHide'} hides the UI while restoring normal time (to aim/click), {'temporaryUnhide'} shows it again and slows down again, {'hideAndIgnoreSlowmotion'} closes without restoring time. Any other return (nil included) is logged as an 'invalid item result args' error: always return a table.
- Circle slots (maxSlotAmount = 8): 1 left, 3 top, 5 right, 7 bottom, 2/4/6/8 diagonals. startSlot alone = 1 slot; startSlot + endSlot = wide button covering the range. Two buttons at overlapping slots: the second loses its position with a warning. Buttons without a slot are distributed in the gaps. More buttons than room are still possible (they shrink).
- The valid root levels are '/root/playerVehicle/' (vehicle actions, default '/root/playerVehicle/general/') and '/root/sandbox/' (default '/root/sandbox/quick/'; replaced by '/root/sandbox/career/' in career and '/root/sandbox/mission/' during a challenge). Base sandbox categories: other, funStuff, repair, quick, mission, career, vehicles, traffic, ai. Missing goto buttons between levels are added automatically (title via toNiceName, icon 'material_traffic'). An empty level (no useful button) is removed from the tree except protected paths.
- Vehicle-side entries (vehicle VM) go through vehicle/extensions core_quickAccess.requestItems: on opening the GE sends requestItems(level) to the player vehicle and waits up to 4 GFX frames (vehicleWaitFrames). After that, onUpdate displays the menu anyway with a 'vehicle didn't respond in time' error. The vehicle calls back vehicleItemsCallback(objID, level, tree). Item selections coming from the vehicle are sent back to its extension via selectItem.
- Dynamic slots (dynamicSlot): slots configurable by the player (ids like root_up, sandbox_left, vehicle_down, funstuff_left...) with a mode 'recentActions', 'uniqueAction' (specific action identified by level + uniqueID) or 'empty'. Only actions with a uniqueID and without ignoreAsRecentAction are remembered as recent actions (10 max for 'all'). Giving a stable uniqueID therefore lets a mod appear in these slots.
- Probable bug: in _assembleMenuComplete, `if not item.title then item.title = toNiceName(str) end` uses a variable `str` that is never defined (nil), so a category without a title would cause an error in toNiceName (inferred from code).
- Inconsistency: at load, `recentActions` only contains the 'all' category, but clearRecentActions() replaces it with a table with playerVehicle, sandbox, other and all.
- In selectItem and contextAction, if the item does not exist, the error is logged but the code continues: selectItem calls itemAction(nil) (ignored) but contextAction reads m.contextAction on nil and crashes.
- Dependencies loaded beforehand: core_vehicleTriggers, core_funstuff. The module also uses the global ui_imgui (im) and reads settings/radialFavorites.json as a name (variable safeFile not used in the parts read).

**Dependencies (loaded first):** `core_vehicleTriggers`, `core_funstuff`

## Functions

| Function | Description | Line |
|---|---|---|
| `core_quickAccess.addEntry(_args)` | Adds (or replaces, if same uniqueID at the same level) an entry in the radial menu tree. See notes for all fields. Returns false only if `level` is not a string; a warning is logged if the entry has neither generator, nor title with onSelect/goto, but the entry is still added. | 619 |
| `core_quickAccess.adjustCruiseSpeed(direction)` | UI callback: asks the player vehicle to adjust the cruise control speed (vehicle-side extension). *(internal)* | 2480 |
| `core_quickAccess.back()` | Goes back to the previous level (history), or to the parent level according to the path if the history is empty. | 2182 |
| `core_quickAccess.beginRouteHandoff()` | Marks the transition from the radial menu to a child screen (e.g. radial.mirrors) without a real close, and temporarily hides the UI. *(internal)* | 2219 |
| `core_quickAccess.clearRecentActions()` | Clears the recent actions history and emits onQuickAccessClearRecentActions. | 2279 |
| `core_quickAccess.contextAction(id, buttonDown, actionIndex)` | Called by the UI for a button's context action (e.g. opening the configuration of a dynamic slot). *(internal)* | 2499 |
| `core_quickAccess.endRouteHandoff()` | Ends the handoff and shows the menu again (time slowed down again). *(internal)* | 2224 |
| `core_quickAccess.finishRouteHandoffExit()` | Cleans up the radial state when a child screen returns directly to the game, without navigating back to 'play'. *(internal)* | 2237 |
| `core_quickAccess.getDynamicSlotConfigurationData()` | Prepares for the UI the configuration data of the slot opened by openDynamicSlotConfigurator (menu tree and current setting). Crashes if no slot has been opened. *(internal)* | 467 |
| `core_quickAccess.getMostRecentAvailableActions(category, limit, dynamicItems)` | Returns the recent actions (of the given category) still available in the menu, excluding those already assigned to a 'uniqueAction' slot, limited to `limit`. *(internal)* | 1897 |
| `core_quickAccess.getMovedRadialLastTimeMs()` | Returns the time (system ms) of the last call to moved(). *(internal)* | 2537 |
| `core_quickAccess.getUiData()` | Returns the data sent to the menu UI: canGoBack, items, categories, pathBeforeCategory, selectedCategory, backButtonIndex, currentLevel, breadcrumbs, menuIcon, hasLRShoulderButtons, tutorialHighlightTargets. *(internal)* | 1765 |
| `core_quickAccess.getVehicleName(veh)` | Builds a readable vehicle name: brand, name and configuration from core_vehicles.getModel; otherwise the JBeam name. | 2660 |
| `core_quickAccess.gotoLevel(level)` | Goes to another menu level, pushing the current level onto the history (for back). | 2138 |
| `core_quickAccess.isEnabled()` | Indicates whether the radial menu is currently displayed. | 275 |
| `core_quickAccess.isRouteHandoffActive()` | Indicates whether a handoff to a child screen is in progress. *(internal)* | 2230 |
| `core_quickAccess.moved()` | Records the current time as the last movement of the radial cursor (called by the UI). *(internal)* | 2541 |
| `core_quickAccess.onBeforeBigMapActivated()` | Before the big map opens: closes the radial menu. *(internal)* *(hook)* | 2656 |
| `core_quickAccess.onClientEndMission()` | At the end of a level: saves the recent actions. *(internal)* *(hook)* | 2632 |
| `core_quickAccess.onExit()` | When the game closes: saves the recent actions. *(internal)* *(hook)* | 2628 |
| `core_quickAccess.onExtensionLoaded()` | On load: emits onQuickAccessLoaded, reads the recent actions and the dynamic slot settings. *(internal)* *(hook)* | 2618 |
| `core_quickAccess.onExtensionUnloaded()` | On unload: saves the recent actions. *(internal)* *(hook)* | 2624 |
| `core_quickAccess.onInit()` | Extension initialization hook: on the first call registers the default menus (then emits onRegisterQuickAccessMenus), then closes the menu. *(internal)* *(hook)* | 2471 |
| `core_quickAccess.onSerialize()` | Before a Lua reload: closes the menu and saves recent actions and dynamic slots. *(internal)* *(hook)* | 2650 |
| `core_quickAccess.onUiChangedState(toState)` | When the UI route changes: if another route takes over while the menu is visible, closes it without navigating; also ends a handoff when the state becomes 'play'. *(internal)* *(hook)* | 2640 |
| `core_quickAccess.onUpdate()` | Called every GFX frame: handles the wait delay for the vehicle's entries (4 frames) and forces assembly if the vehicle does not respond. *(internal)* *(hook)* | 2590 |
| `core_quickAccess.onVehicleSpawned()` | When a vehicle spawns: saves the recent actions. *(internal)* *(hook)* | 2636 |
| `core_quickAccess.onVehicleSwitched()` | When the player vehicle changes: reloads the menu if it is open. *(internal)* *(hook)* | 2611 |
| `core_quickAccess.openDynamicSlotConfigurator(dynamicSlotKey)` | Opens the configuration screen of a dynamic slot (guihooks 'OpenDynamicSlotConfigurator', hook onOpenDynamicSlotConfigurator). | 460 |
| `core_quickAccess.registerMenu()` | Deprecated: logs an error asking to use addEntry, does nothing else. | 2754 |
| `core_quickAccess.reload()` | Rebuilds and redisplays the current level (if the menu is open). | 2178 |
| `core_quickAccess.resetDynamicSlotSettings()` | Restores the default configuration of the dynamic slots, saves it and emits onQuickAccessResetDynamicSlotSettings. | 347 |
| `core_quickAccess.resetSlowMoFactor()` | Resets the slow-motion factor to its original value (0.01). | 26 |
| `core_quickAccess.selectItem(id, buttonDown, actionIndex)` | Called by the UI when the player presses/releases a button: runs the action of the item with index id in the current menu. *(internal)* | 2488 |
| `core_quickAccess.setDynamicSlotConfiguration(dynamicSlotKey, data)` | Saves the player's choice for a dynamic slot (modes uniqueAction, recentActions or empty), emits the hooks onQuickAccessSetUniqueAction / SetRecentActions / SetEmpty then onQuickAccessSetDynamicSlotConfiguration, saves and reloads the menu. | 534 |
| `core_quickAccess.setEnabled(enabled, level, force)` | Opens or closes the menu. Opening only happens if the UI state is 'play' or unknown, or if the menu is already visible, or if force. Emits the onQuickAccessOpened(level) hook. Closing is ignored during a route handoff. | 2511 |
| `core_quickAccess.setSlowMoFactor(factor)` | Sets the time factor (simTimeAuthority) applied while the radial menu is open. 0.01 by default. | 25 |
| `core_quickAccess.setTutorialHighlightTargets(targets)` | Sets the list of identifiers to highlight in the menu (tutorial). Non-string, empty or duplicate values are filtered out. Refreshes the UI if visible. | 1769 |
| `core_quickAccess.toNiceName(str)` | Turns an identifier into a readable name: '_' becomes a space, a space before each capital stuck to a lowercase letter, first letter of each word capitalized, the rest lowercase. | 562 |
| `core_quickAccess.toggle(level)` | Opens the menu if it is closed, closes it otherwise. Used by the 'toggleRadialMenuMulti' action. | 2528 |
| `core_quickAccess.tryAction(action)` | Runs an action tied to the menu keys among: toggleBigMap, toggleRadialMenuMulti, recoverVehicle, resetVehicle, activateStarterMotor. Ignored if core_input_actionFilter blocks it; an unknown action is logged as an error. | 2719 |
| `core_quickAccess.vehicleItemSelectCallback(objID, args)` | Callback from the vehicle after an item action has run: processes the returned command ({'hide'}, {'goto', ...}, etc.). *(internal)* | 2605 |
| `core_quickAccess.vehicleItemsCallback(objID, level, vehicleMenuTree)` | Callback from the player vehicle with its menu entries for a level: stores them and displays the menu. *(internal)* | 2125 |

### Parameter details

#### `core_quickAccess.addEntry(_args)`

Adds (or replaces, if same uniqueID at the same level) an entry in the radial menu tree. See notes for all fields. Returns false only if `level` is not a string; a warning is logged if the entry has neither generator, nor title with onSelect/goto, but the entry is still added.

- `_args` (*table*) : { level, generator | (title, onSelect|goto, icon, desc, uniqueID, priority, startSlot, endSlot, ... ) }
- **returns**: boolean true if added, false if level is invalid.

#### `core_quickAccess.adjustCruiseSpeed(direction)`

UI callback: asks the player vehicle to adjust the cruise control speed (vehicle-side extension).

- `direction` (*number*) : Positive = increase, negative = decrease; 0 or non-number ignored.

#### `core_quickAccess.back()`

Goes back to the previous level (history), or to the parent level according to the path if the history is empty.

- **returns**: boolean true if the level changed, false otherwise (menu closed or already at the top).

#### `core_quickAccess.contextAction(id, buttonDown, actionIndex)`

Called by the UI for a button's context action (e.g. opening the configuration of a dynamic slot).

- `id` (*integer*) : Item index.
- `buttonDown` (*boolean*) : Unused (inferred from code).
- `actionIndex` (*integer|nil*) : Unused (inferred from code).

#### `core_quickAccess.getDynamicSlotConfigurationData()`

Prepares for the UI the configuration data of the slot opened by openDynamicSlotConfigurator (menu tree and current setting). Crashes if no slot has been opened.

- **returns**: table Data for the UI.

#### `core_quickAccess.getMostRecentAvailableActions(category, limit, dynamicItems)`

Returns the recent actions (of the given category) still available in the menu, excluding those already assigned to a 'uniqueAction' slot, limited to `limit`.

- `category` (*string*) : Category (e.g. 'all').
- `limit` (*integer|nil*) : Max number; nil or 0 returns {}.
- `dynamicItems` (*table[]|nil*) : dynamicSlot-type items of the current level.
- **returns**: table[] Records { uniqueID, level, title, timestamp, icon }.

#### `core_quickAccess.getMovedRadialLastTimeMs()`

Returns the time (system ms) of the last call to moved().

- **returns**: number Milliseconds (0 if never).

#### `core_quickAccess.getUiData()`

Returns the data sent to the menu UI: canGoBack, items, categories, pathBeforeCategory, selectedCategory, backButtonIndex, currentLevel, breadcrumbs, menuIcon, hasLRShoulderButtons, tutorialHighlightTargets.

- **returns**: table|nil uiData, nil before the first opening.

#### `core_quickAccess.getVehicleName(veh)`

Builds a readable vehicle name: brand, name and configuration from core_vehicles.getModel; otherwise the JBeam name.

- `veh` (*userdata|nil*) : Vehicle object; nil returns the translation key 'ui.radialmenu2.noVehicle'.
- **returns**: string Vehicle name.

#### `core_quickAccess.gotoLevel(level)`

Goes to another menu level, pushing the current level onto the history (for back).

- `level` (*string*) : Path of the target level.

#### `core_quickAccess.isEnabled()`

Indicates whether the radial menu is currently displayed.

- **returns**: boolean true if the radial UI is visible.

#### `core_quickAccess.isRouteHandoffActive()`

Indicates whether a handoff to a child screen is in progress.

- **returns**: boolean true if active.

#### `core_quickAccess.onUiChangedState(toState)`

When the UI route changes: if another route takes over while the menu is visible, closes it without navigating; also ends a handoff when the state becomes 'play'.

- `toState` (*string*) : New UI state/route.

#### `core_quickAccess.openDynamicSlotConfigurator(dynamicSlotKey)`

Opens the configuration screen of a dynamic slot (guihooks 'OpenDynamicSlotConfigurator', hook onOpenDynamicSlotConfigurator).

- `dynamicSlotKey` (*string*) : Slot id (e.g. 'root_up').

#### `core_quickAccess.selectItem(id, buttonDown, actionIndex)`

Called by the UI when the player presses/releases a button: runs the action of the item with index id in the current menu.

- `id` (*integer*) : Index (1-based) of the item in currentMenuItems.
- `buttonDown` (*boolean*) : true on press, false on release.
- `actionIndex` (*integer|nil*) : 1 = primary, 2 = secondary, 3 = tertiary (default 1).

#### `core_quickAccess.setDynamicSlotConfiguration(dynamicSlotKey, data)`

Saves the player's choice for a dynamic slot (modes uniqueAction, recentActions or empty), emits the hooks onQuickAccessSetUniqueAction / SetRecentActions / SetEmpty then onQuickAccessSetDynamicSlotConfiguration, saves and reloads the menu.

- `dynamicSlotKey` (*string*) : Slot id.
- `data` (*table*) : { mode, uniqueID, level } or { mode, category }.

#### `core_quickAccess.setEnabled(enabled, level, force)`

Opens or closes the menu. Opening only happens if the UI state is 'play' or unknown, or if the menu is already visible, or if force. Emits the onQuickAccessOpened(level) hook. Closing is ignored during a route handoff.

- `enabled` (*boolean*) : true to open, false to close.
- `level` (*string|nil*) : Level to open (e.g. '/root/sandbox/other/'); nil = '/root/'.
- `force` (*boolean|nil*) : Opens even if another screen is active.

#### `core_quickAccess.setSlowMoFactor(factor)`

Sets the time factor (simTimeAuthority) applied while the radial menu is open. 0.01 by default.

- `factor` (*number*) : Simulation speed factor (1 = real time).

#### `core_quickAccess.setTutorialHighlightTargets(targets)`

Sets the list of identifiers to highlight in the menu (tutorial). Non-string, empty or duplicate values are filtered out. Refreshes the UI if visible.

- `targets` (*string[]*) : Target identifiers.

#### `core_quickAccess.toNiceName(str)`

Turns an identifier into a readable name: '_' becomes a space, a space before each capital stuck to a lowercase letter, first letter of each word capitalized, the rest lowercase.

- `str` (*string*) : Identifier, e.g. 'funStuff'.
- **returns**: string E.g. 'Fun Stuff'.

#### `core_quickAccess.toggle(level)`

Opens the menu if it is closed, closes it otherwise. Used by the 'toggleRadialMenuMulti' action.

- `level` (*string|nil*) : Level to open.

#### `core_quickAccess.tryAction(action)`

Runs an action tied to the menu keys among: toggleBigMap, toggleRadialMenuMulti, recoverVehicle, resetVehicle, activateStarterMotor. Ignored if core_input_actionFilter blocks it; an unknown action is logged as an error.

- `action` (*string*) : Name of the action.

#### `core_quickAccess.vehicleItemSelectCallback(objID, args)`

Callback from the vehicle after an item action has run: processes the returned command ({'hide'}, {'goto', ...}, etc.).

- `objID` (*integer*) : Vehicle id (unused).
- `args` (*table*) : Command to run, same format as the return of onSelect.

#### `core_quickAccess.vehicleItemsCallback(objID, level, vehicleMenuTree)`

Callback from the player vehicle with its menu entries for a level: stores them and displays the menu.

- `objID` (*integer*) : Vehicle id.
- `level` (*string*) : Requested level.
- `vehicleMenuTree` (*table*) : Table level -> list of entries.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | { 'core_vehicleTriggers', 'core_funstuff' }, loaded before this extension. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onBeforeRadialOpened` — listened to by 3 module(s)
- `onHideRadialMenu` — listened to by 1 module(s)
- `onOpenDynamicSlotConfigurator`
- `onQuickAccessClearRecentActions`
- `onQuickAccessItemSelected`
- `onQuickAccessLoaded` — listened to by 2 module(s)
- `onQuickAccessOpened`
- `onQuickAccessResetDynamicSlotSettings`
- `onQuickAccessSetDynamicSlotConfiguration`
- `onQuickAccessSetEmpty`
- `onQuickAccessSetRecentActions`
- `onQuickAccessSetUniqueAction`
- `onRegisterQuickAccessMenus` — listened to by 1 module(s)
- `onVehicleFlippedUpright` — listened to by 1 module(s)
- `trackNewVeh`
- `trackVehReset`

**UI events (guihooks.trigger):** `OpenDynamicSlotConfigurator`, `RadialTemporaryHide`, `radialMenuUpdated`

## Calls into the engine (C++)

- `be:` `enterNextVehicle`, `enterVehicle`, `getObject`, `getObjectCount`, `getPlayerVehicle`, `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/quickAccess.lua`.*
