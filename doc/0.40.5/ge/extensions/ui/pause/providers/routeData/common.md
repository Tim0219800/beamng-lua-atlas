# `ui_pause_providers_routeData_common`

*File: `lua/ge/extensions/ui/pause/providers/routeData/common.lua` · VM: Game Engine (GE) · 90 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_pause_providers_routeData_common`: `extensions.load("ui_pause_providers_routeData_common")`, then the global `ui_pause_providers_routeData_common`

Tools shared by the pause menu routeData providers: navigation by state sequence, button registration via ui_pause_actions, exit confirmation (level or game) adapted to career, execution of an exit with prior save, and building of rail groups. The confirmation text ids are exposed in ExitLevelTexts and ExitGameTexts.

## Notes

- asRailGroup returns nil (and not an empty group) when the action list is empty: this prevents the JSON from encoding the actions as an object instead of an array.
- withExitConfirm in career: if a save exists, confirmText = {txt = texts.career} and confirmSince = save date (the UI fills {{time}}); otherwise notSaved text, and if career_career.isAutosaveEnabled() the button offers "Save and quit" (confirmDestructive = false) with a "Quit without saving" option (altLabel).
- registerPauseButton requires ui_pause_actions to be loaded (unprotected global variable).

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_pause_providers_routeData_common.asRailGroup(id, actions)` | Creates a rail group {id, actions}, or nil if the list is empty. | 81 |
| `ui_pause_providers_routeData_common.bool(value)` | Converts any value to a boolean (truthy -> true, otherwise false). | 7 |
| `ui_pause_providers_routeData_common.registerPauseButton(button)` | Registers a pause button: extracts button.callback, copies the rest of the metadata and calls ui_pause_actions.registerButton. Without a callback, uses a function that returns false. | 21 |
| `ui_pause_providers_routeData_common.runExit(exitFn, payload)` | Executes the exit function; if payload.saveFirst is true, first saves the career via ui_pause_actions.saveCareerThen. | 72 |
| `ui_pause_providers_routeData_common.tryPushStateSequence(states)` | Tries to navigate to each state via ui_router.navigate (in a pcall) until one succeeds (result.result ~= false). | 11 |
| `ui_pause_providers_routeData_common.withExitConfirm(button, context, texts)` | Completes an exit button with the confirmation fields (cancelLabel, confirmText, confirmSince, confirmLabel, altLabel...) depending on the mode (career or not) and the save state. | 49 |

### Parameter details

#### `ui_pause_providers_routeData_common.asRailGroup(id, actions)`

Creates a rail group {id, actions}, or nil if the list is empty.

- `id` (*string*) : Group id.
- `actions` (*table[]|nil*) : Group buttons.
- **returns**: table|nil Group or nil.

#### `ui_pause_providers_routeData_common.bool(value)`

Converts any value to a boolean (truthy -> true, otherwise false).

- `value` (*any*) : Value to convert.
- **returns**: boolean Boolean.

#### `ui_pause_providers_routeData_common.registerPauseButton(button)`

Registers a pause button: extracts button.callback, copies the rest of the metadata and calls ui_pause_actions.registerButton. Without a callback, uses a function that returns false.

- `button` (*table|nil*) : Button metadata plus callback.
- **returns**: table|nil Registered metadata (with buttonId) or nil if button is nil.

#### `ui_pause_providers_routeData_common.runExit(exitFn, payload)`

Executes the exit function; if payload.saveFirst is true, first saves the career via ui_pause_actions.saveCareerThen.

- `exitFn` (*function*) : Exit function (returnToMainMenu, quit...).
- `payload` (*table|nil*) : Button payload (field read: saveFirst).

#### `ui_pause_providers_routeData_common.tryPushStateSequence(states)`

Tries to navigate to each state via ui_router.navigate (in a pcall) until one succeeds (result.result ~= false).

- `states` (*string|string[]|nil*) : State name or list of states to try in order.
- **returns**: boolean true if a navigation succeeded.

#### `ui_pause_providers_routeData_common.withExitConfirm(button, context, texts)`

Completes an exit button with the confirmation fields (cancelLabel, confirmText, confirmSince, confirmLabel, altLabel...) depending on the mode (career or not) and the save state.

- `button` (*table*) : Button metadata, modified in place.
- `context` (*table*) : Pause context (field read: mode).
- `texts` (*table*) : ExitLevelTexts or ExitGameTexts.
- **returns**: table The same button.

## Fields

| Field | Type | Description |
|---|---|---|
| `ExitGameTexts` | table<string, string> | Translation ids for quitting the game: default, career, notSaved. |
| `ExitLevelTexts` | table<string, string> | Translation ids for quitting the level: default, career, notSaved. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/pause/providers/routeData/common.lua`.*
