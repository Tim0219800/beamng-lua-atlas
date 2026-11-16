---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/actions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pause menu action registry. It registers buttons (via ui/gridSelectorUtils/buttonModule) executable by id, handles the "save the career then run a callback" chain, and maintains the tabs and buttons added by mods to the pause menu. A mod can declare a tab and buttons there; the module notifies the UI through the GUI hook PauseModActionsChanged.
--- Access: extension `ui_pause_actions`: `extensions.load("ui_pause_actions")`, then the global `ui_pause_actions`
---@class ui_pause_actions
ui_pause_actions = {}

--- Clears all buttons registered via registerButton and cancels the pending save callback. Does not touch the mods' tabs/buttons.
---Source: lua/ge/extensions/ui/pause/actions.lua:24
function ui_pause_actions.clearActions() end

--- Executes the registered button with this id.
---Source: lua/ge/extensions/ui/pause/actions.lua:42
---@param buttonId any Id assigned by registerButton.
---@param payload any Data passed to the button's callback.
---@return any  Result of buttonInstance.executeButton.
function ui_pause_actions.executeAction(buttonId, payload) end

--- Returns the info of all registered buttons.
---Source: lua/ge/extensions/ui/pause/actions.lua:50
---@return table  Result of buttonInstance.getAllButtonInfos.
function ui_pause_actions.getAllButtonInfos() end

--- Returns the non-empty mod tabs, in the format expected by buildPauseTabs (tabId "mod:<id>", isModTab, label, icon, buttons, visible, enabled).
---Source: lua/ge/extensions/ui/pause/actions.lua:194
---@return table[]  List of tabs.
function ui_pause_actions.getVisibleModTabs() end

--- Hook called on load; sets the unload mode to manual.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/actions.lua:54
function ui_pause_actions.onExtensionLoaded() end

--- Hook called when a career save finishes; runs the pending saveCareerThen callback if it has not expired.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/actions.lua:34
function ui_pause_actions.onSaveFinished() end

--- Registers an action button and returns a copy of the metadata with buttonId. If metadata.visible == false, nothing is registered and the metadata is returned as is.
---Source: lua/ge/extensions/ui/pause/actions.lua:46
---@param metadata table|nil Button description (nil becomes {}).
---@param callback function|nil Function called on execution; default: a function returning false.
---@return table  Copy of the metadata, with buttonId if registered.
function ui_pause_actions.registerButton(metadata, callback) end

--- Adds or updates a mod button in a tab (moves the button if its tabId changes) and notifies the UI.
---Source: lua/ge/extensions/ui/pause/actions.lua:133
---@param button table Fields: id and tabId (required), label, icon, componentName, props, card2ComponentName, card2Props.
---@return table  {success = true} or {success = false, reason = "missing_id_or_tab" | "unknown_tab"}.
function ui_pause_actions.registerModButton(button) end

--- Creates or updates a mod tab (keeps the order of existing buttons) and notifies the UI.
---Source: lua/ge/extensions/ui/pause/actions.lua:102
---@param tab table Fields: id (required), label (default id), icon, card2ComponentName, card2Props.
---@return table  {success = true} or {success = false, reason = "missing_id"}.
function ui_pause_actions.registerModTab(tab) end

--- Stores a callback then launches career_saveSystem.saveCurrent(). The callback is called in onSaveFinished if it is no more than 30 s old.
---Source: lua/ge/extensions/ui/pause/actions.lua:29
---@param callback function Function with no argument called after the save.
function ui_pause_actions.saveCareerThen(callback) end

--- Removes a mod button; removes the "mods" tab if it becomes empty; notifies the UI.
---Source: lua/ge/extensions/ui/pause/actions.lua:173
---@param id string Button id.
---@return table  {success = true} or {success = false, reason = "not_found"}.
function ui_pause_actions.unregisterModButton(id) end

--- Removes a mod tab and its buttons, then notifies the UI.
---Source: lua/ge/extensions/ui/pause/actions.lua:124
---@param id string Tab id.
---@return table  {success = true} or {success = false, reason = "not_found"}.
function ui_pause_actions.unregisterModTab(id) end

