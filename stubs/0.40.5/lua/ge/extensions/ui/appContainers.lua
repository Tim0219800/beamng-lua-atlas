---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/appContainers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Generic registry of UI app "containers" (topLeft, topCenter, topRight) and of the visibility of each app. The topLeft/topCenter/topRight extensions register with registerContainer; this module keeps the visible/hidden state of each app and notifies the Vue interface via guihooks.trigger on the container's trigger. It saves and restores visibility via onSerialize/onDeserialize (Lua reload) and offers a debug ImGui window.
--- Access: extension `ui_appContainers`: `extensions.load("ui_appContainers")`, then the global `ui_appContainers`
---@class ui_appContainers
ui_appContainers = {}

--- Returns the current visibility of an app (false if container or app unknown).
---Source: lua/ge/extensions/ui/appContainers.lua:78
---@param containerId string Container identifier.
---@param appId string App identifier.
---@return boolean  true if visible.
function ui_appContainers.getAppVisibility(containerId, appId) end

--- Returns a copy of a container's apps table in the form {[appId]={visible=boolean}}.
---Source: lua/ge/extensions/ui/appContainers.lua:142
---@param containerId string Container.
---@return table<string, table>  Copy of the apps; empty if container unknown.
function ui_appContainers.getAvailableApps(containerId) end

--- Lists the identifiers of the visible apps of a container (order not guaranteed, pairs iteration).
---Source: lua/ge/extensions/ui/appContainers.lua:125
---@param containerId string Container.
---@return table<integer, string>  Array of appId; empty if container unknown.
function ui_appContainers.getVisibleApps(containerId) end

--- Hides all apps of a container, sends {hideAll=true, allApps} to the interface then emits the hook onUIContainerAppsHidden(resolved containerId).
---Source: lua/ge/extensions/ui/appContainers.lua:94
---@param containerId string Container identifier.
function ui_appContainers.hideAllApps(containerId) end

--- Shortcut for setAppVisibility(containerId, appId, false).
---Source: lua/ge/extensions/ui/appContainers.lua:117
---@param containerId string Container.
---@param appId string App.
function ui_appContainers.hideApp(containerId, appId) end

--- Restore hook after a reload: reapplies the saved visibility via setAppVisibility (accepts old identifiers).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/appContainers.lua:163
---@param data table Table produced by onSerialize.
function ui_appContainers.onDeserialize(data) end

--- Extension load hook; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/appContainers.lua:186
function ui_appContainers.onExtensionLoaded() end

--- Unload hook: empties the containers table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/appContainers.lua:189
function ui_appContainers.onExtensionUnloaded() end

--- Serialization hook (extension reload): returns {[containerId]={[appId]=visible}}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/appContainers.lua:152
---@return table  Visibility of all apps.
function ui_appContainers.onSerialize() end

--- Called every frame by the extension system; draws the debug ImGui window only if setDebug(true).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/appContainers.lua:193
function ui_appContainers.onUpdate() end

--- Registers a new container. Requires config.id; refuses (with a warning) an already registered identifier. Copies the apps table (visible forced to boolean).
---Source: lua/ge/extensions/ui/appContainers.lua:35
---@param config table {id=string, trigger=string (guihook name), debugLabel=string|nil, apps={[appId]={visible=boolean}}}.
---@return boolean  true if registered, false otherwise.
function ui_appContainers.registerContainer(config) end

--- Converts an old container identifier (utilityApps, gameplayApps, secondaryApps) to the current identifier; returns the argument as is otherwise.
---Source: lua/ge/extensions/ui/appContainers.lua:18
---@param containerId string Container identifier, old or new.
---@return string  Current identifier.
function ui_appContainers.resolveContainerId(containerId) end

--- Shows or hides an app of a container and sends {appId, visible, allApps} to the interface via the container's trigger.
---Source: lua/ge/extensions/ui/appContainers.lua:56
---@param containerId string Container identifier.
---@param appId string App identifier (must be declared in the container).
---@param visible boolean New visibility.
function ui_appContainers.setAppVisibility(containerId, appId, visible) end

--- Enables or disables the "App Containers Debug" ImGui window (Show/Hide buttons per app, Hide All, Show All).
---Source: lua/ge/extensions/ui/appContainers.lua:178
---@param enabled boolean true to display the window.
function ui_appContainers.setDebug(enabled) end

--- No real effect: returns enabled converted to a boolean.
---Source: lua/ge/extensions/ui/appContainers.lua:182
---@param enabled boolean Ignored.
---@return boolean  enabled as a boolean.
function ui_appContainers.setVerboseLogging(enabled) end

--- Shortcut for setAppVisibility(containerId, appId, true).
---Source: lua/ge/extensions/ui/appContainers.lua:113
---@param containerId string Container.
---@param appId string App.
function ui_appContainers.showApp(containerId, appId) end

--- Toggles an app's visibility.
---Source: lua/ge/extensions/ui/appContainers.lua:121
---@param containerId string Container.
---@param appId string App.
function ui_appContainers.toggleApp(containerId, appId) end

