# `core_multiseatPlayerLimits`

*File: `lua/ge/extensions/core/multiseatPlayerLimits.lua` · VM: Game Engine (GE) · 56 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_multiseatPlayerLimits`: `extensions.load("core_multiseatPlayerLimits")`, then the global `core_multiseatPlayerLimits`

GE extension `core_multiseatPlayerLimits`: computes the player count limits in local multiplayer (multiseat). Two sources: the 'soft' limit (hardware or level recommendation, multiseat.maxPlayers field of the level's info.json, 4 by default via core_levels) and the 'hard' limit of the current multiseat game mode (gameplay_multiseat_gamemodeManager). It returns a UI-ready state: limit, reached, exceeded, warning.

## Example

```lua
local s = core_multiseatPlayerLimits.getCurrentLevelState(3)
if s.atLimit then log('I','','no room left: limit ' .. tostring(s.limit)) end
```

## Notes

- normalizeLimit: a limit must be a number >= 1, rounded down to the integer; otherwise it is ignored (nil).
- The mode limit (modeLimit) is always applied. The soft limit is only applied in the simple menu (Engine.UI.isSimpleMenu()) or if softIsHard is true; otherwise, exceeding the soft limit only produces a warning { txt = 'ui.multiseat.playerLimitWarning', context = { count = softLimit } }.
- The module is a simple module of functions (no hooks); it is defined with `function M.xxx`.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_multiseatPlayerLimits.getCurrentLevelLimit()` | Returns the maximum number of players recommended by the current level (level.multiseat.maxPlayers). | 17 |
| `core_multiseatPlayerLimits.getCurrentLevelState(playerCount, softIsHard)` | Shortcut: getState with the current level's limit and the current mode's limit. | 51 |
| `core_multiseatPlayerLimits.getCurrentModeLimit()` | Returns the maximum number of players of the active multiseat game mode (gameplay_multiseat_gamemodeManager.getMaxPlayers): hard limit on all platforms. | 24 |
| `core_multiseatPlayerLimits.getState(softLimit, playerCount, modeLimit, softIsHard)` | Computes the player limits state. The effective limit is the mode's, lowered by the soft limit if softIsHard (or simple menu), otherwise the soft limit alone if there is no mode limit. | 31 |
| `core_multiseatPlayerLimits.isSimpleMenu()` | Indicates whether the UI is in simplified menu mode (console/Steam Deck platforms, according to Engine.UI.isSimpleMenu). | 13 |

### Parameter details

#### `core_multiseatPlayerLimits.getCurrentLevelLimit()`

Returns the maximum number of players recommended by the current level (level.multiseat.maxPlayers).

- **returns**: integer|nil Limit, or nil if no level or invalid value.

#### `core_multiseatPlayerLimits.getCurrentLevelState(playerCount, softIsHard)`

Shortcut: getState with the current level's limit and the current mode's limit.

- `playerCount` (*number*) : Current number of players.
- `softIsHard` (*boolean|nil*) : See getState.
- **returns**: table Same structure as getState.

#### `core_multiseatPlayerLimits.getCurrentModeLimit()`

Returns the maximum number of players of the active multiseat game mode (gameplay_multiseat_gamemodeManager.getMaxPlayers): hard limit on all platforms.

- **returns**: integer|nil Limit, or nil.

#### `core_multiseatPlayerLimits.getState(softLimit, playerCount, modeLimit, softIsHard)`

Computes the player limits state. The effective limit is the mode's, lowered by the soft limit if softIsHard (or simple menu), otherwise the soft limit alone if there is no mode limit.

- `softLimit` (*number|nil*) : Recommended limit (hardware or level).
- `playerCount` (*number*) : Current number of players (negative or invalid becomes 0).
- `modeLimit` (*number|nil*) : Game mode limit.
- `softIsHard` (*boolean|nil*) : If true, the soft limit is also enforced.
- **returns**: table { limit = integer|nil, hard = boolean, atLimit = boolean, exceeded = boolean, warning = table|nil }

#### `core_multiseatPlayerLimits.isSimpleMenu()`

Indicates whether the UI is in simplified menu mode (console/Steam Deck platforms, according to Engine.UI.isSimpleMenu).

- **returns**: boolean true if simple menu.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/multiseatPlayerLimits.lua`.*
