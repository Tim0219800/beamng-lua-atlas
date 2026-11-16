# `ui_appContainers`

*File: `lua/ge/extensions/ui/appContainers.lua` · VM: Game Engine (GE) · 255 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_appContainers`: `extensions.load("ui_appContainers")`, then the global `ui_appContainers`

Generic registry of UI app "containers" (topLeft, topCenter, topRight) and of the visibility of each app. The topLeft/topCenter/topRight extensions register with registerContainer; this module keeps the visible/hidden state of each app and notifies the Vue interface via guihooks.trigger on the container's trigger. It saves and restores visibility via onSerialize/onDeserialize (Lua reload) and offers a debug ImGui window.

## Notes

- Old identifiers accepted everywhere: utilityApps -> topLeft, gameplayApps -> topCenter, secondaryApps -> topRight (resolveContainerId).
- setVerboseLogging does nothing useful: it simply returns enabled as a boolean without storing anything.
- The write functions log an error and return without doing anything if the container or the app is unknown; getAppVisibility then returns false.
- onDeserialize calls setAppVisibility again for each app, so it emits one UI trigger per restored app.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_appContainers.getAppVisibility(containerId, appId)` | Returns the current visibility of an app (false if container or app unknown). | 78 |
| `ui_appContainers.getAvailableApps(containerId)` | Returns a copy of a container's apps table in the form {[appId]={visible=boolean}}. | 142 |
| `ui_appContainers.getVisibleApps(containerId)` | Lists the identifiers of the visible apps of a container (order not guaranteed, pairs iteration). | 125 |
| `ui_appContainers.hideAllApps(containerId)` | Hides all apps of a container, sends {hideAll=true, allApps} to the interface then emits the hook onUIContainerAppsHidden(resolved containerId). | 94 |
| `ui_appContainers.hideApp(containerId, appId)` | Shortcut for setAppVisibility(containerId, appId, false). | 117 |
| `ui_appContainers.onDeserialize(data)` | Restore hook after a reload: reapplies the saved visibility via setAppVisibility (accepts old identifiers). *(internal)* *(hook)* | 163 |
| `ui_appContainers.onExtensionLoaded()` | Extension load hook; does nothing. *(internal)* *(hook)* | 186 |
| `ui_appContainers.onExtensionUnloaded()` | Unload hook: empties the containers table. *(internal)* *(hook)* | 189 |
| `ui_appContainers.onSerialize()` | Serialization hook (extension reload): returns {[containerId]={[appId]=visible}}. *(internal)* *(hook)* | 152 |
| `ui_appContainers.onUpdate()` | Called every frame by the extension system; draws the debug ImGui window only if setDebug(true). *(internal)* *(hook)* | 193 |
| `ui_appContainers.registerContainer(config)` | Registers a new container. Requires config.id; refuses (with a warning) an already registered identifier. Copies the apps table (visible forced to boolean). | 35 |
| `ui_appContainers.resolveContainerId(containerId)` | Converts an old container identifier (utilityApps, gameplayApps, secondaryApps) to the current identifier; returns the argument as is otherwise. | 18 |
| `ui_appContainers.setAppVisibility(containerId, appId, visible)` | Shows or hides an app of a container and sends {appId, visible, allApps} to the interface via the container's trigger. | 56 |
| `ui_appContainers.setDebug(enabled)` | Enables or disables the "App Containers Debug" ImGui window (Show/Hide buttons per app, Hide All, Show All). | 178 |
| `ui_appContainers.setVerboseLogging(enabled)` | No real effect: returns enabled converted to a boolean. | 182 |
| `ui_appContainers.showApp(containerId, appId)` | Shortcut for setAppVisibility(containerId, appId, true). | 113 |
| `ui_appContainers.toggleApp(containerId, appId)` | Toggles an app's visibility. | 121 |

### Parameter details

#### `ui_appContainers.getAppVisibility(containerId, appId)`

Returns the current visibility of an app (false if container or app unknown).

- `containerId` (*string*) : Container identifier.
- `appId` (*string*) : App identifier.
- **returns**: boolean true if visible.

#### `ui_appContainers.getAvailableApps(containerId)`

Returns a copy of a container's apps table in the form {[appId]={visible=boolean}}.

- `containerId` (*string*) : Container.
- **returns**: table<string, table> Copy of the apps; empty if container unknown.

#### `ui_appContainers.getVisibleApps(containerId)`

Lists the identifiers of the visible apps of a container (order not guaranteed, pairs iteration).

- `containerId` (*string*) : Container.
- **returns**: table<integer, string> Array of appId; empty if container unknown.

#### `ui_appContainers.hideAllApps(containerId)`

Hides all apps of a container, sends {hideAll=true, allApps} to the interface then emits the hook onUIContainerAppsHidden(resolved containerId).

- `containerId` (*string*) : Container identifier.

#### `ui_appContainers.hideApp(containerId, appId)`

Shortcut for setAppVisibility(containerId, appId, false).

- `containerId` (*string*) : Container.
- `appId` (*string*) : App.

#### `ui_appContainers.onDeserialize(data)`

Restore hook after a reload: reapplies the saved visibility via setAppVisibility (accepts old identifiers).

- `data` (*table*) : Table produced by onSerialize.

#### `ui_appContainers.onSerialize()`

Serialization hook (extension reload): returns {[containerId]={[appId]=visible}}.

- **returns**: table Visibility of all apps.

#### `ui_appContainers.registerContainer(config)`

Registers a new container. Requires config.id; refuses (with a warning) an already registered identifier. Copies the apps table (visible forced to boolean).

- `config` (*table*) : {id=string, trigger=string (guihook name), debugLabel=string|nil, apps={[appId]={visible=boolean}}}.
- **returns**: boolean true if registered, false otherwise.

#### `ui_appContainers.resolveContainerId(containerId)`

Converts an old container identifier (utilityApps, gameplayApps, secondaryApps) to the current identifier; returns the argument as is otherwise.

- `containerId` (*string*) : Container identifier, old or new.
- **returns**: string Current identifier.

#### `ui_appContainers.setAppVisibility(containerId, appId, visible)`

Shows or hides an app of a container and sends {appId, visible, allApps} to the interface via the container's trigger.

- `containerId` (*string*) : Container identifier.
- `appId` (*string*) : App identifier (must be declared in the container).
- `visible` (*boolean*) : New visibility.

#### `ui_appContainers.setDebug(enabled)`

Enables or disables the "App Containers Debug" ImGui window (Show/Hide buttons per app, Hide All, Show All).

- `enabled` (*boolean*) : true to display the window.

#### `ui_appContainers.setVerboseLogging(enabled)`

No real effect: returns enabled converted to a boolean.

- `enabled` (*boolean*) : Ignored.
- **returns**: boolean enabled as a boolean.

#### `ui_appContainers.showApp(containerId, appId)`

Shortcut for setAppVisibility(containerId, appId, true).

- `containerId` (*string*) : Container.
- `appId` (*string*) : App.

#### `ui_appContainers.toggleApp(containerId, appId)`

Toggles an app's visibility.

- `containerId` (*string*) : Container.
- `appId` (*string*) : App.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onUIContainerAppsHidden`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/appContainers.lua`.*
