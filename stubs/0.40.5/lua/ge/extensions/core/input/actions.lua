---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/input/actions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_input_actions`: registry of input actions (what keys/controllers can trigger). It reads the files lua/ge/extensions/core/input/actions/*.json (common actions) and vehicles/<vehicle>/input_actions*.json plus the inputActions of jbeam files (vehicle-specific actions), caches them, creates the required ActionMaps on the C++ side and translates an action into command parameters for the engine. A modder uses it to trigger an action by name or list the available actions.
--- Access: extension `core_input_actions`: `extensions.load("core_input_actions")`, then the global `core_input_actions`
---@class core_input_actions
---@field dependencies string[] {'core_input_categories', 'core_input_deprecatedActions', 'license'}.
---@field menuActionMapNames table<string, boolean> Set of 'menu independent' ActionMap names (pushed as soon as they are created). Cleared and rebuilt on every read of the active actions.
---@field menuIndependentPrefix string 'MenuIndependent_': prefix of the ActionMaps whose action declares actionMap = 'MenuIndependent'.
core_input_actions = {}

--- Converts an action into parameters used by the engine on triggering. Determines the ActionMap (Normal, Menu, VehicleCommon, VehicleSpecific, or the action's own), the onChange/onDown/onUp callbacks, the command context and isCentered. Logs invalid categories and deprecated contexts.
---Source: lua/ge/extensions/core/input/actions.lua:203
---@param actionName string Unique name of the action.
---@param actionCache table|nil Already known definition of the action; only needed when the call comes from getActions (avoids infinite recursion).
---@return boolean  true.
---@return string  Name of the actionmap.
---@return boolean  actsOnChange.
---@return string  onChange (or onRelative) code.
---@return boolean  actsOnDown.
---@return string  onDown code.
---@return boolean  actsOnUp.
---@return string  onUp code.
---@return boolean  isRelative (onRelative used).
---@return userdata  ActionMapCommandContext (type VLUA/ELUA/TLUA/BVLUA/TS).
---@return boolean  isCentered.
function core_input_actions.actionToCommands(actionName, actionCache) end

--- Executes an action's code: vlua -> sent to vehicle vehicleId; elua/tlua -> Lua:queueLuaCommand (GE); bvlua -> to all objects. onDown is used if actionValue == 1, onUp if actionValue == 0, otherwise onChange. The tokens VALUE, VEHICLEID, PLAYER, TRIGGERID… are replaced in the code.
---Source: lua/ge/extensions/core/input/actions.lua:307
---@param evt table Action definition with ctx (nil = vlua), onDown, onUp, onChange.
---@param actionValue number Action value (1 = press, 0 = release, or analog value for onChange).
---@param vehicleId integer Id of the target vehicle (vlua context).
---@param player integer|nil Player index; default 0.
---@param triggerId any Value for TRIGGERID (empty string if nil).
---@return integer|nil  1 for GE/bvlua if a command was sent, 0 otherwise; for vlua the return value of queueCmd, hence nil (see notes).
function core_input_actions.executeCommand(evt, actionValue, vehicleId, player, triggerId) end

--- Currently active actions: actions of existing vehicles (marked cat 'vehicle_specific' if usable, otherwise 'vehicle_specific_unusable') plus the common actions. Creates the missing C++ ActionMaps along the way.
---Source: lua/ge/extensions/core/input/actions.lua:360
---@return table<string, table>  Unique action name -> definition.
function core_input_actions.getActiveActions() end

--- Disabled actions (license or _nonshipping files in a shipping build).
---Source: lua/ge/extensions/core/input/actions.lua:361
---@return table<string, table>  Unique name -> definition.
function core_input_actions.getInactiveActions() end

--- Prefixes the action name with the vehicle name: '<vehicle>__<action>'.
---Source: lua/ge/extensions/core/input/actions.lua:16
---@param actionName string Short name.
---@param vehicleName string|nil Vehicle name; nil = name unchanged.
---@return string  Unique name.
function core_input_actions.nameToUniqueName(actionName, vehicleName) end

--- File modification hook: if a JSON under /lua/ge/extensions/core/input/actions changes, clears the caches.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/input/actions.lua:265
---@param filename string Path of the modified file.
function core_input_actions.onFileChanged(filename) end

--- Hook at first update: clears the actions cache.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/input/actions.lua:257
function core_input_actions.onFirstUpdate() end

--- Hook on player vehicle change: clears the actions cache (the specific actions change).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/input/actions.lua:261
---@param oldId integer Old vehicle.
---@param newId integer New vehicle.
---@param player integer Player index.
function core_input_actions.onVehicleSwitched(oldId, newId, player) end

--- Simulates the press of a named action (ActionMap.triggerBindingByNameDigital(name, true)).
---Source: lua/ge/extensions/core/input/actions.lua:273
---@param actionName string Name of the action.
function core_input_actions.triggerDown(actionName) end

--- Simulates an immediate press then release.
---Source: lua/ge/extensions/core/input/actions.lua:279
---@param actionName string Name of the action.
function core_input_actions.triggerDownUp(actionName) end

--- Simulates the release of a named action.
---Source: lua/ge/extensions/core/input/actions.lua:276
---@param actionName string Name of the action.
function core_input_actions.triggerUp(actionName) end

--- Inverse operation: removes the '<vehicle>__' prefix. Logs an error and returns the name unchanged if the prefix is missing.
---Source: lua/ge/extensions/core/input/actions.lua:20
---@param uniqueActionName string Unique name.
---@param vehicleName string|nil Vehicle name.
---@return string  Short name.
function core_input_actions.uniqueNameToName(uniqueActionName, vehicleName) end

--- Resolves an action name: returns the name if it is active; recursively follows the replacements of core_input_deprecatedActions; returns nil (with a log) if the action is inactive, obsolete or unknown.
---Source: lua/ge/extensions/core/input/actions.lua:171
---@param action string Unique name of the action.
---@return string|nil  Valid name or nil.
function core_input_actions.upgradeAction(action) end

