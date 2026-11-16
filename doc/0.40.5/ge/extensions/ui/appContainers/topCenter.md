# `ui_appContainers_topCenter`

*File: `lua/ge/extensions/ui/appContainers/topCenter.lua` · VM: Game Engine (GE) · 326 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_appContainers_topCenter`: `extensions.load("ui_appContainers_topCenter")`, then the global `ui_appContainers_topCenter`

"topCenter" app container (top-center of the interface: arrowGPS, rally, drift, drag, pointsBar, speedTargetBar, flashMessage, countdown, moveOff; UI trigger setTopCenterAppVisibility). It delegates visibility to ui_appContainers and adds a flash message queue (event TopCenterAppsFlashMessage), scenario countdown handling and the speed target of the speedTargetBar. A modder mostly uses it to show a flash message or a speed target.

## Example

```lua
ui_appContainers_topCenter.showFlashMessage('Well done!', 4, true)
ui_appContainers_topCenter.showApp('topCenter', 'pointsBar')
```

## Notes

- All the visibility functions (setAppVisibility, showApp, hideApp, toggleApp, hideAllApps, getVisibleApps, getAvailableApps) are simple pass-throughs to ui_appContainers.
- setContainerContext, getContainerContext, resetContainerContext and getAvailableContexts are deprecated (warning only if setVerboseLogging(true)): a "context" equals a single visible app.
- clearSpeedTarget only resets the local value to nil: it sends nothing to the interface, unlike setSpeedTarget.
- onGameplayFlashMessage ignores the message if the matching app (drift or drag) is not visible at the time of the call.
- The duration of a queued message is messageData[1][2] (3 s by default); it is counted down in simulation time (dtSim), whereas showFlashMessage counts down in real time (dtReal).
- The queue is limited to 50 messages: beyond that, the oldest is removed.
- The countdown is detected when a scenario message starts with a number or with the key 'ui.scenarios.go'; the countdown app is then shown and hidden after the "go" ttl (field M._countdownHideTimer).

**Dependencies (loaded first):** `ui_appContainers`, `ui_firstDrive_moveOff`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_appContainers_topCenter.clearAllFlashMessages()` | Empties the queue, the current message and the active message, and hides the flashMessage app. | 183 |
| `ui_appContainers_topCenter.clearMessagesFromSource(source)` | Removes from the queue the messages of a given source (drift, drag…); if the current message comes from it, moves on to the next or hides flashMessage. | 166 |
| `ui_appContainers_topCenter.clearSpeedTarget()` | Forgets the stored speed target (without notifying the interface). | 60 |
| `ui_appContainers_topCenter.getActiveFlashMessage()` | Used by the HUD app to catch up on a message sent before it was mounted: returns the active message with the remaining ttl, or nil if there is none or if the flashMessage app is hidden. | 200 |
| `ui_appContainers_topCenter.getAppVisibility(containerId, appId)` | Pass-through to ui_appContainers.getAppVisibility. | 27 |
| `ui_appContainers_topCenter.getAvailableApps(containerId)` | Returns a copy of the container's declared apps with their visibility. | 64 |
| `ui_appContainers_topCenter.getAvailableContexts(containerId)` | Deprecated alias of getAvailableApps. | 64 |
| `ui_appContainers_topCenter.getContainerContext(containerId)` | Deprecated: returns the first visible app in the list (order not guaranteed if there are several). | 87 |
| `ui_appContainers_topCenter.getSpeedTarget()` | Returns the last stored speed target. | 56 |
| `ui_appContainers_topCenter.getVisibleApps(containerId)` | Lists the visible apps of the container (via ui_appContainers). | 47 |
| `ui_appContainers_topCenter.hideAllApps(containerId)` | Hides all apps of the container (via ui_appContainers). | 31 |
| `ui_appContainers_topCenter.hideApp(containerId, appId)` | Hides an app of the container. | 39 |
| `ui_appContainers_topCenter.onExtensionLoaded()` | Load hook: registers the topCenter container and its nine apps (all hidden at start). *(internal)* *(hook)* | 267 |
| `ui_appContainers_topCenter.onExtensionUnloaded()` | Unload hook: empties the queue and the active messages. *(internal)* *(hook)* | 285 |
| `ui_appContainers_topCenter.onGameplayFlashMessage(data)` | Hook: gameplay flash message. Only accepts the sources 'drift' and 'drag', and only if the app of the same name is visible; then queues the message and starts the next one. *(internal)* *(hook)* | 206 |
| `ui_appContainers_topCenter.onScenarioFlashMessage(data)` | Hook: scenario flash message. Shows flashMessage if the list is not empty, and countdown if an item starts with a number or 'ui.scenarios.go' (in the latter case, hides countdown after the ttl). *(internal)* *(hook)* | 103 |
| `ui_appContainers_topCenter.onScenarioFlashMessageClear()` | Hook: hides the flashMessage app when the scenario clears its messages. *(internal)* *(hook)* | 130 |
| `ui_appContainers_topCenter.onScenarioNotRunning()` | Hook: hides flashMessage when no scenario is running. *(internal)* *(hook)* | 134 |
| `ui_appContainers_topCenter.onUpdate(dtReal, dtSim, dtRaw)` | Frame hook: counts down the active message, advances the message queue, handles the deferred hiding of the countdown and draws the debug window. *(internal)* *(hook)* | 229 |
| `ui_appContainers_topCenter.resetContainerContext(containerId)` | Deprecated: equivalent to hideAllApps. | 80 |
| `ui_appContainers_topCenter.setAppVisibility(containerId, appId, visible)` | Pass-through to ui_appContainers.setAppVisibility. | 23 |
| `ui_appContainers_topCenter.setContainerContext(containerId, context)` | Deprecated. Hides all apps then shows only the app named by context (if context is nil, everything is hidden). | 68 |
| `ui_appContainers_topCenter.setDebug(enabled)` | Enables a small "TopCenter App Containers Debug" ImGui window (queue size, active message). | 95 |
| `ui_appContainers_topCenter.setSpeedTarget(data)` | Stores the active speed target and sends it to the interface via guihooks.trigger('TechDriverTrainingSpeedBarTarget', data) for the speedTargetBar. | 51 |
| `ui_appContainers_topCenter.setVerboseLogging(enabled)` | Enables deprecation warnings and logs of invalid messages. | 99 |
| `ui_appContainers_topCenter.showApp(containerId, appId)` | Shows an app of the container. | 35 |
| `ui_appContainers_topCenter.showFlashMessage(msg, ttl, big)` | Shows a single flash message, shows the flashMessage app and sends {msg, ttl, big} on the TopCenterAppsFlashMessage event. The message is kept for ttl so that an app mounted late can retrieve it. | 191 |
| `ui_appContainers_topCenter.toggleApp(containerId, appId)` | Toggles the visibility of an app of the container. | 43 |

### Parameter details

#### `ui_appContainers_topCenter.clearMessagesFromSource(source)`

Removes from the queue the messages of a given source (drift, drag…); if the current message comes from it, moves on to the next or hides flashMessage.

- `source` (*string*) : Source name.

#### `ui_appContainers_topCenter.getActiveFlashMessage()`

Used by the HUD app to catch up on a message sent before it was mounted: returns the active message with the remaining ttl, or nil if there is none or if the flashMessage app is hidden.

- **returns**: table|nil {msg, ttl (remaining), big}.

#### `ui_appContainers_topCenter.getAppVisibility(containerId, appId)`

Pass-through to ui_appContainers.getAppVisibility.

- `containerId` (*string*) : Container.
- `appId` (*string*) : App.
- **returns**: boolean true if visible.

#### `ui_appContainers_topCenter.getAvailableApps(containerId)`

Returns a copy of the container's declared apps with their visibility.

- `containerId` (*string*) : Container.
- **returns**: table<string, table> {[appId]={visible=boolean}}.

#### `ui_appContainers_topCenter.getAvailableContexts(containerId)`

Deprecated alias of getAvailableApps.

- `containerId` (*string*) : Container.
- **returns**: table<string, table> See getAvailableApps.

#### `ui_appContainers_topCenter.getContainerContext(containerId)`

Deprecated: returns the first visible app in the list (order not guaranteed if there are several).

- `containerId` (*string*) : Container.
- **returns**: string|nil appId or nil.

#### `ui_appContainers_topCenter.getSpeedTarget()`

Returns the last stored speed target.

- **returns**: table|nil Last value passed to setSpeedTarget.

#### `ui_appContainers_topCenter.getVisibleApps(containerId)`

Lists the visible apps of the container (via ui_appContainers).

- `containerId` (*string*) : Container.
- **returns**: table<integer, string> Identifiers of the visible apps.

#### `ui_appContainers_topCenter.hideAllApps(containerId)`

Hides all apps of the container (via ui_appContainers).

- `containerId` (*string*) : Container.

#### `ui_appContainers_topCenter.hideApp(containerId, appId)`

Hides an app of the container.

- `containerId` (*string*) : Container.
- `appId` (*string*) : App.

#### `ui_appContainers_topCenter.onGameplayFlashMessage(data)`

Hook: gameplay flash message. Only accepts the sources 'drift' and 'drag', and only if the app of the same name is visible; then queues the message and starts the next one.

- `data` (*table*) : {source='drift'|'drag', data=list of messages (data[1][2] = duration)}.

#### `ui_appContainers_topCenter.onScenarioFlashMessage(data)`

Hook: scenario flash message. Shows flashMessage if the list is not empty, and countdown if an item starts with a number or 'ui.scenarios.go' (in the latter case, hides countdown after the ttl).

- `data` (*table*) : List of messages {text|number, ttl, …}.

#### `ui_appContainers_topCenter.onUpdate(dtReal, dtSim, dtRaw)`

Frame hook: counts down the active message, advances the message queue, handles the deferred hiding of the countdown and draws the debug window.

- `dtReal` (*number*) : Elapsed real time (s).
- `dtSim` (*number*) : Simulation elapsed time (s).
- `dtRaw` (*number*) : Raw time (not used).

#### `ui_appContainers_topCenter.resetContainerContext(containerId)`

Deprecated: equivalent to hideAllApps.

- `containerId` (*string*) : Container.

#### `ui_appContainers_topCenter.setAppVisibility(containerId, appId, visible)`

Pass-through to ui_appContainers.setAppVisibility.

- `containerId` (*string*) : Container (normally 'topCenter').
- `appId` (*string*) : App.
- `visible` (*boolean*) : Visibility.

#### `ui_appContainers_topCenter.setContainerContext(containerId, context)`

Deprecated. Hides all apps then shows only the app named by context (if context is nil, everything is hidden).

- `containerId` (*string*) : Container.
- `context` (*string|nil*) : appId to show.

#### `ui_appContainers_topCenter.setDebug(enabled)`

Enables a small "TopCenter App Containers Debug" ImGui window (queue size, active message).

- `enabled` (*boolean*) : true to show.

#### `ui_appContainers_topCenter.setSpeedTarget(data)`

Stores the active speed target and sends it to the interface via guihooks.trigger('TechDriverTrainingSpeedBarTarget', data) for the speedTargetBar.

- `data` (*table*) : Target data, passed as is to the interface (structure not defined here).

#### `ui_appContainers_topCenter.setVerboseLogging(enabled)`

Enables deprecation warnings and logs of invalid messages.

- `enabled` (*boolean*) : true to enable.

#### `ui_appContainers_topCenter.showApp(containerId, appId)`

Shows an app of the container.

- `containerId` (*string*) : Container.
- `appId` (*string*) : App.

#### `ui_appContainers_topCenter.showFlashMessage(msg, ttl, big)`

Shows a single flash message, shows the flashMessage app and sends {msg, ttl, big} on the TopCenterAppsFlashMessage event. The message is kept for ttl so that an app mounted late can retrieve it.

- `msg` (*string*) : Message text (or translation key).
- `ttl` (*number|nil*) : Duration in seconds, 3 by default.
- `big` (*boolean|nil*) : Display in large size.

#### `ui_appContainers_topCenter.toggleApp(containerId, appId)`

Toggles the visibility of an app of the container.

- `containerId` (*string*) : Container.
- `appId` (*string*) : App.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | { "ui_appContainers", "ui_firstDrive_moveOff" }: loaded before this module. |

**UI events (guihooks.trigger):** `TechDriverTrainingSpeedBarTarget`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/appContainers/topCenter.lua`.*
