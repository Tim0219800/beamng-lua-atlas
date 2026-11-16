---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/missionInfo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the mission info window and the activity prompt ("activity accept") displayed in game. It stores the active buttons, sends the content to the UI via guihooks, plays the opening sound, tracks the opened/closed state and emits the corresponding hooks. It also blocks, during the prompt on the "play" route, the actions that share the same keys as gameplay_interact.
--- Access: extension `ui_missionInfo`: `extensions.load("ui_missionInfo")`, then the global `ui_missionInfo`
---@class ui_missionInfo
---@field buttonsTable table|nil Buttons/functions of the current dialogue (keyed by action or by number depending on the opening type).
---@field openState string|nil "opened" or "closed"; nil before the first opening.
ui_missionInfo = {}

--- Closes the window/prompt: pops MissionUIActionMap, empties buttonsTable, lifts the action blocking, sends MissionInfoUpdate(nil) and ActivityAcceptClose, switches to the "closed" state.
---Source: lua/ge/extensions/ui/missionInfo.lua:82
function ui_missionInfo.closeDialogue() end

--- Hook called after a UI route change; enables blocking of conflicting actions only if the prompt has content and the route is "play".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/missionInfo.lua:109
---@param routeEntry table Route entry (resolved.name).
function ui_missionInfo.onAfterRouteChange(routeEntry) end

--- Hook called when key bindings change; recomputes the action filter if blocking is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/missionInfo.lua:105
function ui_missionInfo.onInputBindingsChanged() end

--- Displays the activities prompt: stores elem.buttonFun and elem.data of each element, enables or not the blocking of conflicting actions, emits onActivityAcceptUpdate then ActivityAcceptUpdate and switches to the "opened" state.
---Source: lua/ge/extensions/ui/missionInfo.lua:58
---@param content table List of elements {buttonFun, data, ...}; empty to remove the prompt.
function ui_missionInfo.openActivityAcceptDialogue(content) end

--- Opens the info window: pushes the action map MissionUIActionMap (unless content.actionMap == false), stores content.buttons, sends MissionInfoUpdate to the UI and plays the sound UI>Missions>Info_Open.
---Source: lua/ge/extensions/ui/missionInfo.lua:38
---@param content table|nil Content to display, optionally with buttons and actionMap.
function ui_missionInfo.openDialogue(content) end

--- Looks in buttonsTable for the button whose action equals actionName and runs its Lua command (button.cmd).
---Source: lua/ge/extensions/ui/missionInfo.lua:26
---@param actionName string Button action name.
function ui_missionInfo.performAction(actionName) end

--- Calls the function of the button with index id in buttonsTable (nothing if it does not exist).
---Source: lua/ge/extensions/ui/missionInfo.lua:51
---@param id integer Button index (the element's missionInfoPerformActionIndex).
function ui_missionInfo.performActivityAction(id) end

--- Signals which prompt element is visible: emits onActivityIndexVisible with its data, or nil if index is -1.
---Source: lua/ge/extensions/ui/missionInfo.lua:96
---@param index integer 0-based index on the UI side (-1 for none); converted to a Lua index +1.
function ui_missionInfo.setActivityIndexVisible(index) end

