---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/appContainers/topCenter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "topCenter" app container (top-center of the interface: arrowGPS, rally, drift, drag, pointsBar, speedTargetBar, flashMessage, countdown, moveOff; UI trigger setTopCenterAppVisibility). It delegates visibility to ui_appContainers and adds a flash message queue (event TopCenterAppsFlashMessage), scenario countdown handling and the speed target of the speedTargetBar. A modder mostly uses it to show a flash message or a speed target.
--- Access: extension `ui_appContainers_topCenter`: `extensions.load("ui_appContainers_topCenter")`, then the global `ui_appContainers_topCenter`
---@class ui_appContainers_topCenter
---@field dependencies table<integer, string> { "ui_appContainers", "ui_firstDrive_moveOff" }: loaded before this module.
ui_appContainers_topCenter = {}

--- Empties the queue, the current message and the active message, and hides the flashMessage app.
---Source: lua/ge/extensions/ui/appContainers/topCenter.lua:183
function ui_appContainers_topCenter.clearAllFlashMessages() end

--- Removes from the queue the messages of a given source (drift, drag…); if the current message comes from it, moves on to the next or hides flashMessage.
---Source: lua/ge/extensions/ui/appContainers/topCenter.lua:166
---@param source string Source name.
function ui_appContainers_topCenter.clearMessagesFromSource(source) end

--- Forgets the stored speed target (without notifying the interface).
---Source: lua/ge/extensions/ui/appContainers/topCenter.lua:60
function ui_appContainers_topCenter.clearSpeedTarget() end

--- Used by the HUD app to catch up on a message sent before it was mounted: returns the active message with the remaining ttl, or nil if there is none or if the flashMessage app is hidden.
---Source: lua/ge/extensions/ui/appContainers/topCenter.lua:200
---@return table|nil  {msg, ttl (remaining), big}.
function ui_appContainers_topCenter.getActiveFlashMessage() end

--- Pass-through to ui_appContainers.getAppVisibility.
---Source: lua/ge/extensions/ui/appContainers/topCenter.lua:27
---@param containerId string Container.
---@param appId string App.
---@return boolean  true if visible.
function ui_appContainers_topCenter.getAppVisibility(containerId, appId) end

--- Returns a copy of the container's declared apps with their visibility.
---Source: lua/ge/extensions/ui/appContainers/topCenter.lua:64
---@param containerId string Container.
---@return table<string, table>  {[appId]={visible=boolean}}.
function ui_appContainers_topCenter.getAvailableApps(containerId) end

--- Deprecated alias of getAvailableApps.
---Source: lua/ge/extensions/ui/appContainers/topCenter.lua:64
---@param containerId string Container.
---@return table<string, table>  See getAvailableApps.
function ui_appContainers_topCenter.getAvailableContexts(containerId) end

--- Deprecated: returns the first visible app in the list (order not guaranteed if there are several).
---Source: lua/ge/extensions/ui/appContainers/topCenter.lua:87
---@param containerId string Container.
---@return string|nil  appId or nil.
function ui_appContainers_topCenter.getContainerContext(containerId) end

--- Returns the last stored speed target.
---Source: lua/ge/extensions/ui/appContainers/topCenter.lua:56
---@return table|nil  Last value passed to setSpeedTarget.
function ui_appContainers_topCenter.getSpeedTarget() end

--- Lists the visible apps of the container (via ui_appContainers).
---Source: lua/ge/extensions/ui/appContainers/topCenter.lua:47
---@param containerId string Container.
---@return table<integer, string>  Identifiers of the visible apps.
function ui_appContainers_topCenter.getVisibleApps(containerId) end

--- Hides all apps of the container (via ui_appContainers).
---Source: lua/ge/extensions/ui/appContainers/topCenter.lua:31
---@param containerId string Container.
function ui_appContainers_topCenter.hideAllApps(containerId) end

--- Hides an app of the container.
---Source: lua/ge/extensions/ui/appContainers/topCenter.lua:39
---@param containerId string Container.
---@param appId string App.
function ui_appContainers_topCenter.hideApp(containerId, appId) end

--- Load hook: registers the topCenter container and its nine apps (all hidden at start).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/appContainers/topCenter.lua:267
function ui_appContainers_topCenter.onExtensionLoaded() end

--- Unload hook: empties the queue and the active messages.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/appContainers/topCenter.lua:285
function ui_appContainers_topCenter.onExtensionUnloaded() end

--- Hook: gameplay flash message. Only accepts the sources 'drift' and 'drag', and only if the app of the same name is visible; then queues the message and starts the next one.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/appContainers/topCenter.lua:206
---@param data table {source='drift'|'drag', data=list of messages (data[1][2] = duration)}.
function ui_appContainers_topCenter.onGameplayFlashMessage(data) end

--- Hook: scenario flash message. Shows flashMessage if the list is not empty, and countdown if an item starts with a number or 'ui.scenarios.go' (in the latter case, hides countdown after the ttl).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/appContainers/topCenter.lua:103
---@param data table List of messages {text|number, ttl, …}.
function ui_appContainers_topCenter.onScenarioFlashMessage(data) end

--- Hook: hides the flashMessage app when the scenario clears its messages.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/appContainers/topCenter.lua:130
function ui_appContainers_topCenter.onScenarioFlashMessageClear() end

--- Hook: hides flashMessage when no scenario is running.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/appContainers/topCenter.lua:134
function ui_appContainers_topCenter.onScenarioNotRunning() end

--- Frame hook: counts down the active message, advances the message queue, handles the deferred hiding of the countdown and draws the debug window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/appContainers/topCenter.lua:229
---@param dtReal number Elapsed real time (s).
---@param dtSim number Simulation elapsed time (s).
---@param dtRaw number Raw time (not used).
function ui_appContainers_topCenter.onUpdate(dtReal, dtSim, dtRaw) end

--- Deprecated: equivalent to hideAllApps.
---Source: lua/ge/extensions/ui/appContainers/topCenter.lua:80
---@param containerId string Container.
function ui_appContainers_topCenter.resetContainerContext(containerId) end

--- Pass-through to ui_appContainers.setAppVisibility.
---Source: lua/ge/extensions/ui/appContainers/topCenter.lua:23
---@param containerId string Container (normally 'topCenter').
---@param appId string App.
---@param visible boolean Visibility.
function ui_appContainers_topCenter.setAppVisibility(containerId, appId, visible) end

--- Deprecated. Hides all apps then shows only the app named by context (if context is nil, everything is hidden).
---Source: lua/ge/extensions/ui/appContainers/topCenter.lua:68
---@param containerId string Container.
---@param context string|nil appId to show.
function ui_appContainers_topCenter.setContainerContext(containerId, context) end

--- Enables a small "TopCenter App Containers Debug" ImGui window (queue size, active message).
---Source: lua/ge/extensions/ui/appContainers/topCenter.lua:95
---@param enabled boolean true to show.
function ui_appContainers_topCenter.setDebug(enabled) end

--- Stores the active speed target and sends it to the interface via guihooks.trigger('TechDriverTrainingSpeedBarTarget', data) for the speedTargetBar.
---Source: lua/ge/extensions/ui/appContainers/topCenter.lua:51
---@param data table Target data, passed as is to the interface (structure not defined here).
function ui_appContainers_topCenter.setSpeedTarget(data) end

--- Enables deprecation warnings and logs of invalid messages.
---Source: lua/ge/extensions/ui/appContainers/topCenter.lua:99
---@param enabled boolean true to enable.
function ui_appContainers_topCenter.setVerboseLogging(enabled) end

--- Shows an app of the container.
---Source: lua/ge/extensions/ui/appContainers/topCenter.lua:35
---@param containerId string Container.
---@param appId string App.
function ui_appContainers_topCenter.showApp(containerId, appId) end

--- Shows a single flash message, shows the flashMessage app and sends {msg, ttl, big} on the TopCenterAppsFlashMessage event. The message is kept for ttl so that an app mounted late can retrieve it.
---Source: lua/ge/extensions/ui/appContainers/topCenter.lua:191
---@param msg string Message text (or translation key).
---@param ttl number|nil Duration in seconds, 3 by default.
---@param big boolean|nil Display in large size.
function ui_appContainers_topCenter.showFlashMessage(msg, ttl, big) end

--- Toggles the visibility of an app of the container.
---Source: lua/ge/extensions/ui/appContainers/topCenter.lua:43
---@param containerId string Container.
---@param appId string App.
function ui_appContainers_topCenter.toggleApp(containerId, appId) end

