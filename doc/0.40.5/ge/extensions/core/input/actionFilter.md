# `core_input_actionFilter`

*File: `lua/ge/extensions/core/input/actionFilter.lua` · VM: Game Engine (GE) · 241 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_input_actionFilter`: `extensions.load("core_input_actionFilter")`, then the global `core_input_actionFilter`

GE extension `core_input_actionFilter`: blocks or allows input actions by named "filter" (e.g. scenario, competitive mode). Manages action groups, predefined action templates (teleportation, vehicle menus, cameras, cheats…) and player masks per ActionMap (for split-screen). A modder uses it to temporarily disable keys (reset, menus, free camera) during an activity.

## Example

```lua
local f = core_input_actionFilter
local tpl = f.getActionTemplates()
f.setGroup('noCheats', tpl.competitive)
f.addAction('myMod', 'noCheats', true)   -- blocks the whole group under the filter 'myMod'
-- later
f.clear('myMod')
```

## Notes

- The first argument `filter` is a filter name (string); each filter keeps its own list of blocks, so several mods can block without overwriting each other. An action is blocked as long as at least one filter blocks it (isActionBlocked).
- addAction(filter, name, filtered): `name` can be a group defined by setGroup (then all its actions are filtered) or a single action name.
- Player masks: a mask is a bitwise integer (bit n = player n allowed, -1 = all). Several owners (`owner`) can define a mask for the same ActionMap; the effective mask is the bitwise AND of all of them. The ActionMap name gets the suffix 'ActionMap' if it is missing.
- Trap in createActionTemplate: the actionWhitelist parameter acts as an EXCLUSION LIST (the template's actions that are in the list are NOT added), and actionBlackList is ADDED as is to the result. The names are inverted relative to their meaning.
- Trap: actionTemplates.physicsControls receives the nodegrabber actions via arrayConcat when the module is created, so physicsControls already includes nodegrabber.
- Predefined templates (keys of getActionTemplates): vehicleTeleporting, vehicleMenues, nodegrabber, physicsControls, aiControls, vehicleSwitching, editor, freeCam, gameCam, funStuff, walkingMode, photoMode, trackBuilder, bigMap, couplers, vehicleTriggers, radialMenu, pause, missionPopup, resetPhysics, vehicleRecovery, vehicleTeleportOnly, appedit, miniMap, radialMenuActivate, setShifterMode, uiReloading, competitive (= teleporting + vehicle menus + physics + AI + vehicle switching + free camera + fun + editor).
- Emitted hook: `onActionFilterUpdated` after each filter update.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_input_actionFilter.addAction(filter, actionName, filtered)` | Adds (or removes if filtered = false) an action or a group to the filter, then fully rebuilds this filter on the C++ side and emits onActionFilterUpdated. | 96 |
| `core_input_actionFilter.clear(filter)` | Removes all blocks of a filter (ActionMap.clearFilters). Does not emit onActionFilterUpdated. | 102 |
| `core_input_actionFilter.clearActionMapPlayerMask(owner, mapName)` | Removes an owner's mask for an ActionMap and re-applies. | 146 |
| `core_input_actionFilter.clearActionMapPlayerMasks(owner)` | Removes all masks of an owner on all ActionMaps. | 155 |
| `core_input_actionFilter.createActionTemplate(templateNames, actionWhitelist, actionBlackList)` | Builds an action list from existing templates. See notes: the names of the optional parameters are inverted relative to their effect. | 13 |
| `core_input_actionFilter.getActionTemplates()` | Returns the action templates table (key = template name, value = list of actions). | 212 |
| `core_input_actionFilter.getBlockedActions()` | Debug: table filter -> {action = true} of the actions actually blocked on the C++ side. | 216 |
| `core_input_actionFilter.getGroup(name)` | Returns the list of a group. | 111 |
| `core_input_actionFilter.isActionBlocked(actionName)` | Indicates whether an action is blocked by at least one filter. | 115 |
| `core_input_actionFilter.onDeserialized(v)` | Restore hook: reloads the saved data and re-applies the player masks. *(internal)* *(hook)* | 190 |
| `core_input_actionFilter.onExtensionUnloaded()` | Extension unload hook: resets playerMask to -1 on the affected ActionMaps. *(internal)* *(hook)* | 205 |
| `core_input_actionFilter.onInputBindingsChanged()` | Hook called when the bindings change: re-applies the player masks (the ActionMaps may have been recreated). *(internal)* *(hook)* | 199 |
| `core_input_actionFilter.onSerialize()` | Save hook before reload: returns groups, blocks and masks. *(internal)* *(hook)* | 182 |
| `core_input_actionFilter.setActionMapPlayerBlocked(owner, mapName, player, blocked)` | Blocks or unblocks a player (one bit) in an owner's mask for an ActionMap. | 168 |
| `core_input_actionFilter.setActionMapPlayerMask(owner, mapName, playerMask)` | Sets the allowed player mask of an ActionMap for an owner and applies the AND of all masks to actionMap.playerMask. | 137 |
| `core_input_actionFilter.setGroup(name, arrayValues)` | Defines a named action group, usable afterwards in addAction. | 107 |

### Parameter details

#### `core_input_actionFilter.addAction(filter, actionName, filtered)`

Adds (or removes if filtered = false) an action or a group to the filter, then fully rebuilds this filter on the C++ side and emits onActionFilterUpdated.

- `filter` (*string*) : Filter name.
- `actionName` (*string*) : Action name, or name of a group defined by setGroup.
- `filtered` (*boolean*) : true = block, false/nil = no longer block.

#### `core_input_actionFilter.clear(filter)`

Removes all blocks of a filter (ActionMap.clearFilters). Does not emit onActionFilterUpdated.

- `filter` (*string*) : Filter name.

#### `core_input_actionFilter.clearActionMapPlayerMask(owner, mapName)`

Removes an owner's mask for an ActionMap and re-applies.

- `owner` (*string*) : Owner.
- `mapName` (*string*) : ActionMap name.

#### `core_input_actionFilter.clearActionMapPlayerMasks(owner)`

Removes all masks of an owner on all ActionMaps.

- `owner` (*string*) : Owner.

#### `core_input_actionFilter.createActionTemplate(templateNames, actionWhitelist, actionBlackList)`

Builds an action list from existing templates. See notes: the names of the optional parameters are inverted relative to their effect.

- `templateNames` (*string[]*) : Template names to concatenate.
- `actionWhitelist` (*string[]|nil*) : If provided: actions to EXCLUDE from the templates (inferred from code).
- `actionBlackList` (*string[]|nil*) : Actions added at the end of the result.
- **returns**: string[] List of actions.

#### `core_input_actionFilter.getActionTemplates()`

Returns the action templates table (key = template name, value = list of actions).

- **returns**: table<string, string[]> Templates.

#### `core_input_actionFilter.getBlockedActions()`

Debug: table filter -> {action = true} of the actions actually blocked on the C++ side.

- **returns**: table<string, table<string, boolean>> Blocks.

#### `core_input_actionFilter.getGroup(name)`

Returns the list of a group.

- `name` (*string*) : Group name.
- **returns**: string[]|nil Actions of the group.

#### `core_input_actionFilter.isActionBlocked(actionName)`

Indicates whether an action is blocked by at least one filter.

- `actionName` (*string*) : Action name (not a group).
- **returns**: boolean|nil true if blocked, otherwise nil.

#### `core_input_actionFilter.onDeserialized(v)`

Restore hook: reloads the saved data and re-applies the player masks.

- `v` (*table*) : Table returned by onSerialize.

#### `core_input_actionFilter.onSerialize()`

Save hook before reload: returns groups, blocks and masks.

- **returns**: table {actionGroups, blockedActionGroups, actionMapPlayerMasks}.

#### `core_input_actionFilter.setActionMapPlayerBlocked(owner, mapName, player, blocked)`

Blocks or unblocks a player (one bit) in an owner's mask for an ActionMap.

- `owner` (*string*) : Owner.
- `mapName` (*string*) : ActionMap name.
- `player` (*integer*) : Player index (0, 1…).
- `blocked` (*boolean*) : true = removes the player's bit, false = puts it back.
- **returns**: boolean false if invalid arguments.

#### `core_input_actionFilter.setActionMapPlayerMask(owner, mapName, playerMask)`

Sets the allowed player mask of an ActionMap for an owner and applies the AND of all masks to actionMap.playerMask.

- `owner` (*string*) : Name of the mask owner.
- `mapName` (*string*) : ActionMap name ('ActionMap' suffix added if missing).
- `playerMask` (*integer*) : Bit mask (bit n = player n), -1 = all.
- **returns**: boolean false if an argument is invalid.

#### `core_input_actionFilter.setGroup(name, arrayValues)`

Defines a named action group, usable afterwards in addAction.

- `name` (*string*) : Group name.
- `arrayValues` (*string[]*) : Action names of the group.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onActionFilterUpdated` — listened to by 2 module(s)

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/input/actionFilter.lua`.*
