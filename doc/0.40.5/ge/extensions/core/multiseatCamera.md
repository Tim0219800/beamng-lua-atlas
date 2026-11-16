# `core_multiseatCamera`

*File: `lua/ge/extensions/core/multiseatCamera.lua` · VM: Game Engine (GE) · 119 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_multiseatCamera`: `extensions.load("core_multiseatCamera")`, then the global `core_multiseatCamera`

GE extension `core_multiseatCamera`: shared camera for local multiplayer (multiseat) mode when all players see the same screen. It computes the average position of the assigned players' vehicles, sets the camera distance so that all are visible (maximum distance to the average, x2 + 10 m, FOV 40) and places it on player 0's vehicle via core_camera. It activates when the 'multiseat' setting is true, there is more than one player, and the screen is not split (or the split mode is 'shared').

## Example

```lua
-- activated automatically by the onSettingsChanged / onSplitScreenChanged hooks; no public API
```

## Notes

- No public function: everything goes through hooks. onUpdate is `nop` at first (empty function) and is only replaced by the real loop when the camera is activated; extensions.hookUpdate('onUpdate') then re-registers the hook.
- Static analysis reports `nop` as undefined in this file: it is a global game function (utils), the file does require('utils').
- onUpdate does nothing if the free camera is active for player 0. The loop uses map.objects (vehicle positions) and core_input_bindings.getAssignedPlayers().
- On deactivation, the camera configuration of all vehicles is reset (core_camera.resetConfiguration, setRef nil, resetCameraByID). onSerialize deactivates the camera before a Lua reload.
- Note: the computation of `meanDirection` (meanLocation - lastLocation - pos) mixes a difference of average positions and the position of player 0; the result serves as a lateral/rear reference for setRef (inferred from code, no explanatory comment).

## Functions

| Function | Description | Line |
|---|---|---|
| `core_multiseatCamera.onSerialize()` | Before a Lua reload: deactivates the shared camera if it was active. *(internal)* *(hook)* | 106 |
| `core_multiseatCamera.onSettingsChanged()` | Hook called when settings change: enables or disables the shared camera depending on whether the multiseat setting is true, render_splitScreen is loaded, there is more than one player and split-screen is inactive or in 'shared' mode. *(internal)* *(hook)* | 98 |
| `core_multiseatCamera.onSplitScreenChanged(splitScreenEnabled, playerCount, layout, mode)` | Hook called when the split-screen configuration changes: the shared camera is active if split-screen is disabled or in 'shared' mode. *(internal)* *(hook)* | 102 |

### Parameter details

#### `core_multiseatCamera.onSplitScreenChanged(splitScreenEnabled, playerCount, layout, mode)`

Hook called when the split-screen configuration changes: the shared camera is active if split-screen is disabled or in 'shared' mode.

- `splitScreenEnabled` (*boolean*) : Split-screen active.
- `playerCount` (*integer*) : Number of players (unused).
- `layout` (*any*) : Layout (unused).
- `mode` (*string*) : Split-screen mode, 'shared' for a common screen.

## Fields

| Field | Type | Description |
|---|---|---|
| `onUpdate` | function | nop until the camera is activated, then the shared camera computation loop. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onUpdate` — listened to by 186 module(s)

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/multiseatCamera.lua`.*
