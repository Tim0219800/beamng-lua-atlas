---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/input/actionFilter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_input_actionFilter`: blocks or allows input actions by named "filter" (e.g. scenario, competitive mode). Manages action groups, predefined action templates (teleportation, vehicle menus, cameras, cheats…) and player masks per ActionMap (for split-screen). A modder uses it to temporarily disable keys (reset, menus, free camera) during an activity.
--- Access: extension `core_input_actionFilter`: `extensions.load("core_input_actionFilter")`, then the global `core_input_actionFilter`
---@class core_input_actionFilter
core_input_actionFilter = {}

--- Adds (or removes if filtered = false) an action or a group to the filter, then fully rebuilds this filter on the C++ side and emits onActionFilterUpdated.
---Source: lua/ge/extensions/core/input/actionFilter.lua:96
---@param filter string Filter name.
---@param actionName string Action name, or name of a group defined by setGroup.
---@param filtered boolean true = block, false/nil = no longer block.
function core_input_actionFilter.addAction(filter, actionName, filtered) end

--- Removes all blocks of a filter (ActionMap.clearFilters). Does not emit onActionFilterUpdated.
---Source: lua/ge/extensions/core/input/actionFilter.lua:102
---@param filter string Filter name.
function core_input_actionFilter.clear(filter) end

--- Removes an owner's mask for an ActionMap and re-applies.
---Source: lua/ge/extensions/core/input/actionFilter.lua:146
---@param owner string Owner.
---@param mapName string ActionMap name.
function core_input_actionFilter.clearActionMapPlayerMask(owner, mapName) end

--- Removes all masks of an owner on all ActionMaps.
---Source: lua/ge/extensions/core/input/actionFilter.lua:155
---@param owner string Owner.
function core_input_actionFilter.clearActionMapPlayerMasks(owner) end

--- Builds an action list from existing templates. See notes: the names of the optional parameters are inverted relative to their effect.
---Source: lua/ge/extensions/core/input/actionFilter.lua:13
---@param templateNames string[] Template names to concatenate.
---@param actionWhitelist string[]|nil If provided: actions to EXCLUDE from the templates (inferred from code).
---@param actionBlackList string[]|nil Actions added at the end of the result.
---@return string[]  List of actions.
function core_input_actionFilter.createActionTemplate(templateNames, actionWhitelist, actionBlackList) end

--- Returns the action templates table (key = template name, value = list of actions).
---Source: lua/ge/extensions/core/input/actionFilter.lua:212
---@return table<string, string[]>  Templates.
function core_input_actionFilter.getActionTemplates() end

--- Debug: table filter -> {action = true} of the actions actually blocked on the C++ side.
---Source: lua/ge/extensions/core/input/actionFilter.lua:216
---@return table<string, table<string, boolean>>  Blocks.
function core_input_actionFilter.getBlockedActions() end

--- Returns the list of a group.
---Source: lua/ge/extensions/core/input/actionFilter.lua:111
---@param name string Group name.
---@return string[]|nil  Actions of the group.
function core_input_actionFilter.getGroup(name) end

--- Indicates whether an action is blocked by at least one filter.
---Source: lua/ge/extensions/core/input/actionFilter.lua:115
---@param actionName string Action name (not a group).
---@return boolean|nil  true if blocked, otherwise nil.
function core_input_actionFilter.isActionBlocked(actionName) end

--- Restore hook: reloads the saved data and re-applies the player masks.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/input/actionFilter.lua:190
---@param v table Table returned by onSerialize.
function core_input_actionFilter.onDeserialized(v) end

--- Extension unload hook: resets playerMask to -1 on the affected ActionMaps.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/input/actionFilter.lua:205
function core_input_actionFilter.onExtensionUnloaded() end

--- Hook called when the bindings change: re-applies the player masks (the ActionMaps may have been recreated).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/input/actionFilter.lua:199
function core_input_actionFilter.onInputBindingsChanged() end

--- Save hook before reload: returns groups, blocks and masks.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/input/actionFilter.lua:182
---@return table  {actionGroups, blockedActionGroups, actionMapPlayerMasks}.
function core_input_actionFilter.onSerialize() end

--- Blocks or unblocks a player (one bit) in an owner's mask for an ActionMap.
---Source: lua/ge/extensions/core/input/actionFilter.lua:168
---@param owner string Owner.
---@param mapName string ActionMap name.
---@param player integer Player index (0, 1…).
---@param blocked boolean true = removes the player's bit, false = puts it back.
---@return boolean  false if invalid arguments.
function core_input_actionFilter.setActionMapPlayerBlocked(owner, mapName, player, blocked) end

--- Sets the allowed player mask of an ActionMap for an owner and applies the AND of all masks to actionMap.playerMask.
---Source: lua/ge/extensions/core/input/actionFilter.lua:137
---@param owner string Name of the mask owner.
---@param mapName string ActionMap name ('ActionMap' suffix added if missing).
---@param playerMask integer Bit mask (bit n = player n), -1 = all.
---@return boolean  false if an argument is invalid.
function core_input_actionFilter.setActionMapPlayerMask(owner, mapName, playerMask) end

--- Defines a named action group, usable afterwards in addAction.
---Source: lua/ge/extensions/core/input/actionFilter.lua:107
---@param name string Group name.
---@param arrayValues string[] Action names of the group.
function core_input_actionFilter.setGroup(name, arrayValues) end

