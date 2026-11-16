# `ui_pause_actions`

*File: `lua/ge/extensions/ui/pause/actions.lua` · VM: Game Engine (GE) · 223 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_pause_actions`: `extensions.load("ui_pause_actions")`, then the global `ui_pause_actions`

Pause menu action registry. It registers buttons (via ui/gridSelectorUtils/buttonModule) executable by id, handles the "save the career then run a callback" chain, and maintains the tabs and buttons added by mods to the pause menu. A mod can declare a tab and buttons there; the module notifies the UI through the GUI hook PauseModActionsChanged.

## Example

```lua
ui_pause_actions.registerModButton({id = "monBouton", tabId = "mods", label = "Mon outil", icon = "wrench", componentName = "MonComposant"})
```

## Notes

- If tabId is "mods" and the tab does not exist, it is created automatically (label ui.dashboard.mods, icon wrench) then removed when it no longer has any button. Any other unknown tabId gives reason = "unknown_tab".
- getVisibleModTabs only returns tabs that have at least one button; their tabId is prefixed with "mod:".
- saveCareerThen: the callback expires after 30 s (a failed save never triggers onSaveFinished); it is then ignored.
- The extension switches to manual unloading (setExtensionUnloadMode manual) when it loads.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_pause_actions.clearActions()` | Clears all buttons registered via registerButton and cancels the pending save callback. Does not touch the mods' tabs/buttons. | 24 |
| `ui_pause_actions.executeAction(buttonId, payload)` | Executes the registered button with this id. | 42 |
| `ui_pause_actions.getAllButtonInfos()` | Returns the info of all registered buttons. | 50 |
| `ui_pause_actions.getVisibleModTabs()` | Returns the non-empty mod tabs, in the format expected by buildPauseTabs (tabId "mod:<id>", isModTab, label, icon, buttons, visible, enabled). | 194 |
| `ui_pause_actions.onExtensionLoaded()` | Hook called on load; sets the unload mode to manual. *(internal)* *(hook)* | 54 |
| `ui_pause_actions.onSaveFinished()` | Hook called when a career save finishes; runs the pending saveCareerThen callback if it has not expired. *(internal)* *(hook)* | 34 |
| `ui_pause_actions.registerButton(metadata, callback)` | Registers an action button and returns a copy of the metadata with buttonId. If metadata.visible == false, nothing is registered and the metadata is returned as is. | 46 |
| `ui_pause_actions.registerModButton(button)` | Adds or updates a mod button in a tab (moves the button if its tabId changes) and notifies the UI. | 133 |
| `ui_pause_actions.registerModTab(tab)` | Creates or updates a mod tab (keeps the order of existing buttons) and notifies the UI. | 102 |
| `ui_pause_actions.saveCareerThen(callback)` | Stores a callback then launches career_saveSystem.saveCurrent(). The callback is called in onSaveFinished if it is no more than 30 s old. | 29 |
| `ui_pause_actions.unregisterModButton(id)` | Removes a mod button; removes the "mods" tab if it becomes empty; notifies the UI. | 173 |
| `ui_pause_actions.unregisterModTab(id)` | Removes a mod tab and its buttons, then notifies the UI. | 124 |

### Parameter details

#### `ui_pause_actions.executeAction(buttonId, payload)`

Executes the registered button with this id.

- `buttonId` (*any*) : Id assigned by registerButton.
- `payload` (*any*) : Data passed to the button's callback.
- **returns**: any Result of buttonInstance.executeButton.

#### `ui_pause_actions.getAllButtonInfos()`

Returns the info of all registered buttons.

- **returns**: table Result of buttonInstance.getAllButtonInfos.

#### `ui_pause_actions.getVisibleModTabs()`

Returns the non-empty mod tabs, in the format expected by buildPauseTabs (tabId "mod:<id>", isModTab, label, icon, buttons, visible, enabled).

- **returns**: table[] List of tabs.

#### `ui_pause_actions.registerButton(metadata, callback)`

Registers an action button and returns a copy of the metadata with buttonId. If metadata.visible == false, nothing is registered and the metadata is returned as is.

- `metadata` (*table|nil*) : Button description (nil becomes {}).
- `callback` (*function|nil*) : Function called on execution; default: a function returning false.
- **returns**: table Copy of the metadata, with buttonId if registered.

#### `ui_pause_actions.registerModButton(button)`

Adds or updates a mod button in a tab (moves the button if its tabId changes) and notifies the UI.

- `button` (*table*) : Fields: id and tabId (required), label, icon, componentName, props, card2ComponentName, card2Props.
- **returns**: table {success = true} or {success = false, reason = "missing_id_or_tab" | "unknown_tab"}.

#### `ui_pause_actions.registerModTab(tab)`

Creates or updates a mod tab (keeps the order of existing buttons) and notifies the UI.

- `tab` (*table*) : Fields: id (required), label (default id), icon, card2ComponentName, card2Props.
- **returns**: table {success = true} or {success = false, reason = "missing_id"}.

#### `ui_pause_actions.saveCareerThen(callback)`

Stores a callback then launches career_saveSystem.saveCurrent(). The callback is called in onSaveFinished if it is no more than 30 s old.

- `callback` (*function*) : Function with no argument called after the save.

#### `ui_pause_actions.unregisterModButton(id)`

Removes a mod button; removes the "mods" tab if it becomes empty; notifies the UI.

- `id` (*string*) : Button id.
- **returns**: table {success = true} or {success = false, reason = "not_found"}.

#### `ui_pause_actions.unregisterModTab(id)`

Removes a mod tab and its buttons, then notifies the UI.

- `id` (*string*) : Tab id.
- **returns**: table {success = true} or {success = false, reason = "not_found"}.

**UI events (guihooks.trigger):** `PauseModActionsChanged`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/pause/actions.lua`.*
