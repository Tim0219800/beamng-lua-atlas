# `core_input_actions`

*File: `lua/ge/extensions/core/input/actions.lua` · VM: Game Engine (GE) · 374 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_input_actions`: `extensions.load("core_input_actions")`, then the global `core_input_actions`

GE extension `core_input_actions`: registry of input actions (what keys/controllers can trigger). It reads the files lua/ge/extensions/core/input/actions/*.json (common actions) and vehicles/<vehicle>/input_actions*.json plus the inputActions of jbeam files (vehicle-specific actions), caches them, creates the required ActionMaps on the C++ side and translates an action into command parameters for the engine. A modder uses it to trigger an action by name or list the available actions.

## Example

```lua
extensions.load('core_input_actions')
local actions = core_input_actions.getActiveActions()   -- table uniqueName -> definition
core_input_actions.triggerDownUp('toggleMenues')       -- simulates press + release
```

## Notes

- Unique name: a vehicle action is renamed '<vehicle>__<action>' (nameToUniqueName) to avoid collisions between vehicles; common actions keep their name.
- Fields of an action definition (read in the code): cat (category, see core_input_categories), ctx ('vlua' default for vehicle, 'tlua', 'elua', 'bvlua'; 'slua' replaced by 'elua', 'ts' and 'ui' deprecated), actionMap, onDown / onUp / onChange / onRelative (Lua code strings), isCentered, vehicle, namespace ('common' = not specific), source (added = file path).
- Tokens replaced in the command strings by executeCommand: VALUE, VEHICLEID, FILTERTYPE (-1), PLAYER (0 by default), TRIGGERID, ANGLE (900), LOCKTYPE (0). Replacement by simple substring gsub: avoid these words in an action's code.
- Active/inactive: an action is inactive if license.isAllowedActionsPath refuses its file, or if the path contains '_nonshipping' in a shipping build.
- The caches are cleared at the first update, on vehicle change and when an actions/*.json file is modified.
- Inconsistencies: the comment of executeCommand announces 'returns the executed action count' but for the vlua context it returns the return value of queueCmd, which returns nothing (nil); the duplicate action messages use `vid`, out of scope in the normal actions loop (prints nil).

**Dependencies (loaded first):** `core_input_categories`, `core_input_deprecatedActions`, `license`

## Functions

| Function | Description | Line |
|---|---|---|
| `core_input_actions.actionToCommands(actionName, actionCache)` | Converts an action into parameters used by the engine on triggering. Determines the ActionMap (Normal, Menu, VehicleCommon, VehicleSpecific, or the action's own), the onChange/onDown/onUp callbacks, the command context and isCentered. Logs invalid categories and deprecated contexts. | 203 |
| `core_input_actions.executeCommand(evt, actionValue, vehicleId, player, triggerId)` | Executes an action's code: vlua -> sent to vehicle vehicleId; elua/tlua -> Lua:queueLuaCommand (GE); bvlua -> to all objects. onDown is used if actionValue == 1, onUp if actionValue == 0, otherwise onChange. The tokens VALUE, VEHICLEID, PLAYER, TRIGGERID… are replaced in the code. | 307 |
| `core_input_actions.getActiveActions()` | Currently active actions: actions of existing vehicles (marked cat 'vehicle_specific' if usable, otherwise 'vehicle_specific_unusable') plus the common actions. Creates the missing C++ ActionMaps along the way. | 360 |
| `core_input_actions.getInactiveActions()` | Disabled actions (license or _nonshipping files in a shipping build). | 361 |
| `core_input_actions.nameToUniqueName(actionName, vehicleName)` | Prefixes the action name with the vehicle name: '<vehicle>__<action>'. | 16 |
| `core_input_actions.onFileChanged(filename)` | File modification hook: if a JSON under /lua/ge/extensions/core/input/actions changes, clears the caches. *(internal)* *(hook)* | 265 |
| `core_input_actions.onFirstUpdate()` | Hook at first update: clears the actions cache. *(internal)* *(hook)* | 257 |
| `core_input_actions.onVehicleSwitched(oldId, newId, player)` | Hook on player vehicle change: clears the actions cache (the specific actions change). *(internal)* *(hook)* | 261 |
| `core_input_actions.triggerDown(actionName)` | Simulates the press of a named action (ActionMap.triggerBindingByNameDigital(name, true)). | 273 |
| `core_input_actions.triggerDownUp(actionName)` | Simulates an immediate press then release. | 279 |
| `core_input_actions.triggerUp(actionName)` | Simulates the release of a named action. | 276 |
| `core_input_actions.uniqueNameToName(uniqueActionName, vehicleName)` | Inverse operation: removes the '<vehicle>__' prefix. Logs an error and returns the name unchanged if the prefix is missing. | 20 |
| `core_input_actions.upgradeAction(action)` | Resolves an action name: returns the name if it is active; recursively follows the replacements of core_input_deprecatedActions; returns nil (with a log) if the action is inactive, obsolete or unknown. | 171 |

### Parameter details

#### `core_input_actions.actionToCommands(actionName, actionCache)`

Converts an action into parameters used by the engine on triggering. Determines the ActionMap (Normal, Menu, VehicleCommon, VehicleSpecific, or the action's own), the onChange/onDown/onUp callbacks, the command context and isCentered. Logs invalid categories and deprecated contexts.

- `actionName` (*string*) : Unique name of the action.
- `actionCache` (*table|nil*) : Already known definition of the action; only needed when the call comes from getActions (avoids infinite recursion).
- **returns**: boolean true.
- **returns**: string Name of the actionmap.
- **returns**: boolean actsOnChange.
- **returns**: string onChange (or onRelative) code.
- **returns**: boolean actsOnDown.
- **returns**: string onDown code.
- **returns**: boolean actsOnUp.
- **returns**: string onUp code.
- **returns**: boolean isRelative (onRelative used).
- **returns**: userdata ActionMapCommandContext (type VLUA/ELUA/TLUA/BVLUA/TS).
- **returns**: boolean isCentered.

#### `core_input_actions.executeCommand(evt, actionValue, vehicleId, player, triggerId)`

Executes an action's code: vlua -> sent to vehicle vehicleId; elua/tlua -> Lua:queueLuaCommand (GE); bvlua -> to all objects. onDown is used if actionValue == 1, onUp if actionValue == 0, otherwise onChange. The tokens VALUE, VEHICLEID, PLAYER, TRIGGERID… are replaced in the code.

- `evt` (*table*) : Action definition with ctx (nil = vlua), onDown, onUp, onChange.
- `actionValue` (*number*) : Action value (1 = press, 0 = release, or analog value for onChange).
- `vehicleId` (*integer*) : Id of the target vehicle (vlua context).
- `player` (*integer|nil*) : Player index; default 0.
- `triggerId` (*any*) : Value for TRIGGERID (empty string if nil).
- **returns**: integer|nil 1 for GE/bvlua if a command was sent, 0 otherwise; for vlua the return value of queueCmd, hence nil (see notes).

#### `core_input_actions.getActiveActions()`

Currently active actions: actions of existing vehicles (marked cat 'vehicle_specific' if usable, otherwise 'vehicle_specific_unusable') plus the common actions. Creates the missing C++ ActionMaps along the way.

- **returns**: table<string, table> Unique action name -> definition.

#### `core_input_actions.getInactiveActions()`

Disabled actions (license or _nonshipping files in a shipping build).

- **returns**: table<string, table> Unique name -> definition.

#### `core_input_actions.nameToUniqueName(actionName, vehicleName)`

Prefixes the action name with the vehicle name: '<vehicle>__<action>'.

- `actionName` (*string*) : Short name.
- `vehicleName` (*string|nil*) : Vehicle name; nil = name unchanged.
- **returns**: string Unique name.

#### `core_input_actions.onFileChanged(filename)`

File modification hook: if a JSON under /lua/ge/extensions/core/input/actions changes, clears the caches.

- `filename` (*string*) : Path of the modified file.

#### `core_input_actions.onVehicleSwitched(oldId, newId, player)`

Hook on player vehicle change: clears the actions cache (the specific actions change).

- `oldId` (*integer*) : Old vehicle.
- `newId` (*integer*) : New vehicle.
- `player` (*integer*) : Player index.

#### `core_input_actions.triggerDown(actionName)`

Simulates the press of a named action (ActionMap.triggerBindingByNameDigital(name, true)).

- `actionName` (*string*) : Name of the action.

#### `core_input_actions.triggerDownUp(actionName)`

Simulates an immediate press then release.

- `actionName` (*string*) : Name of the action.

#### `core_input_actions.triggerUp(actionName)`

Simulates the release of a named action.

- `actionName` (*string*) : Name of the action.

#### `core_input_actions.uniqueNameToName(uniqueActionName, vehicleName)`

Inverse operation: removes the '<vehicle>__' prefix. Logs an error and returns the name unchanged if the prefix is missing.

- `uniqueActionName` (*string*) : Unique name.
- `vehicleName` (*string|nil*) : Vehicle name.
- **returns**: string Short name.

#### `core_input_actions.upgradeAction(action)`

Resolves an action name: returns the name if it is active; recursively follows the replacements of core_input_deprecatedActions; returns nil (with a log) if the action is inactive, obsolete or unknown.

- `action` (*string*) : Unique name of the action.
- **returns**: string|nil Valid name or nil.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'core_input_categories', 'core_input_deprecatedActions', 'license'}. |
| `menuActionMapNames` | table<string, boolean> | Set of 'menu independent' ActionMap names (pushed as soon as they are created). Cleared and rebuilt on every read of the active actions. |
| `menuIndependentPrefix` | string | 'MenuIndependent_': prefix of the ActionMaps whose action declares actionMap = 'MenuIndependent'. |

## Calls into the engine (C++)

- `FS:` `findFiles`
- `Lua:` `queueLuaCommand`
- `be:` `getPlayerVehicleID`, `queueAllObjectLua`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/input/actions.lua`.*
