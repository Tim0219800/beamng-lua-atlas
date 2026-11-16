# `ui_missionInfo`

*File: `lua/ge/extensions/ui/missionInfo.lua` · VM: Game Engine (GE) · 115 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_missionInfo`: `extensions.load("ui_missionInfo")`, then the global `ui_missionInfo`

Manages the mission info window and the activity prompt ("activity accept") displayed in game. It stores the active buttons, sends the content to the UI via guihooks, plays the opening sound, tracks the opened/closed state and emits the corresponding hooks. It also blocks, during the prompt on the "play" route, the actions that share the same keys as gameplay_interact.

## Notes

- guihooks events emitted: MissionInfoUpdate, ActivityAcceptUpdate, ActivityAcceptClose.
- Hooks emitted: onActivityAcceptUpdate(content), onActivityIndexVisible(data), onMissionInfoChangedState(oldState, newState[, content]); the state is "opened" or "closed" (nil at start).
- performAction runs button.cmd with loadstring, without protection against errors.
- setActivityIndexVisible assumes elemDataTable exists (created by openActivityAcceptDialogue); otherwise error.
- closeDialogue pops the action map MissionUIActionMap; openActivityAcceptDialogue does not push it (commented-out code).

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_missionInfo.closeDialogue()` | Closes the window/prompt: pops MissionUIActionMap, empties buttonsTable, lifts the action blocking, sends MissionInfoUpdate(nil) and ActivityAcceptClose, switches to the "closed" state. | 82 |
| `ui_missionInfo.onAfterRouteChange(routeEntry)` | Hook called after a UI route change; enables blocking of conflicting actions only if the prompt has content and the route is "play". *(internal)* *(hook)* | 109 |
| `ui_missionInfo.onInputBindingsChanged()` | Hook called when key bindings change; recomputes the action filter if blocking is active. *(internal)* *(hook)* | 105 |
| `ui_missionInfo.openActivityAcceptDialogue(content)` | Displays the activities prompt: stores elem.buttonFun and elem.data of each element, enables or not the blocking of conflicting actions, emits onActivityAcceptUpdate then ActivityAcceptUpdate and switches to the "opened" state. | 58 |
| `ui_missionInfo.openDialogue(content)` | Opens the info window: pushes the action map MissionUIActionMap (unless content.actionMap == false), stores content.buttons, sends MissionInfoUpdate to the UI and plays the sound UI>Missions>Info_Open. | 38 |
| `ui_missionInfo.performAction(actionName)` | Looks in buttonsTable for the button whose action equals actionName and runs its Lua command (button.cmd). | 26 |
| `ui_missionInfo.performActivityAction(id)` | Calls the function of the button with index id in buttonsTable (nothing if it does not exist). | 51 |
| `ui_missionInfo.setActivityIndexVisible(index)` | Signals which prompt element is visible: emits onActivityIndexVisible with its data, or nil if index is -1. | 96 |

### Parameter details

#### `ui_missionInfo.onAfterRouteChange(routeEntry)`

Hook called after a UI route change; enables blocking of conflicting actions only if the prompt has content and the route is "play".

- `routeEntry` (*table*) : Route entry (resolved.name).

#### `ui_missionInfo.openActivityAcceptDialogue(content)`

Displays the activities prompt: stores elem.buttonFun and elem.data of each element, enables or not the blocking of conflicting actions, emits onActivityAcceptUpdate then ActivityAcceptUpdate and switches to the "opened" state.

- `content` (*table*) : List of elements {buttonFun, data, ...}; empty to remove the prompt.

#### `ui_missionInfo.openDialogue(content)`

Opens the info window: pushes the action map MissionUIActionMap (unless content.actionMap == false), stores content.buttons, sends MissionInfoUpdate to the UI and plays the sound UI>Missions>Info_Open.

- `content` (*table|nil*) : Content to display, optionally with buttons and actionMap.

#### `ui_missionInfo.performAction(actionName)`

Looks in buttonsTable for the button whose action equals actionName and runs its Lua command (button.cmd).

- `actionName` (*string*) : Button action name.

#### `ui_missionInfo.performActivityAction(id)`

Calls the function of the button with index id in buttonsTable (nothing if it does not exist).

- `id` (*integer*) : Button index (the element's missionInfoPerformActionIndex).

#### `ui_missionInfo.setActivityIndexVisible(index)`

Signals which prompt element is visible: emits onActivityIndexVisible with its data, or nil if index is -1.

- `index` (*integer*) : 0-based index on the UI side (-1 for none); converted to a Lua index +1.

## Fields

| Field | Type | Description |
|---|---|---|
| `buttonsTable` | table|nil | Buttons/functions of the current dialogue (keyed by action or by number depending on the opening type). |
| `openState` | string|nil | "opened" or "closed"; nil before the first opening. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onActivityAcceptUpdate`
- `onActivityIndexVisible` — listened to by 1 module(s)
- `onMissionInfoChangedState` — listened to by 1 module(s)

**UI events (guihooks.trigger):** `ActivityAcceptClose`, `ActivityAcceptUpdate`, `MissionInfoUpdate`

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/missionInfo.lua`.*
