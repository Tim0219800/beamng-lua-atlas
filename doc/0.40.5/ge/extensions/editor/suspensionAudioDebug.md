# `editor_suspensionAudioDebug`

*File: `lua/ge/extensions/editor/suspensionAudioDebug.lua` · VM: Game Engine (GE) · 155 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_suspensionAudioDebug`: `extensions.load("editor_suspensionAudioDebug")`, then the global `editor_suspensionAudioDebug`

Small editor debug window (Audio menu) that plots the player vehicle's suspension sounds. Every frame it asks the vehicle (queueLuaCommand) to send sounds.getBeamSounds() back to the GE in editor_suspensionAudioDebug.beamSounds, then displays, for each wheel (front/rear, left/right), curves over 200 samples of the impulse, pitch and volume. The wheel position is inferred from the position of the beam's node id1.

## Notes

- The position is inferred from the sign of pos.y (<0 = Front, otherwise Rear) and pos.x (<0 = Right, otherwise Left), based on the vehicle's jbeam coordinates.
- The code comment states that the displayed impulse is not really stress: the naming is approximate in sounds.lua.
- Nothing is displayed without a player vehicle or vdata.
- The file is presented in the code as a small example app to copy before modifying.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_suspensionAudioDebug.onEditorGui()` | Draw hook called every frame: fetches the vehicle's beam sounds, updates the histories and draws the curves per wheel. *(internal)* *(hook)* | 19 |
| `editor_suspensionAudioDebug.onEditorInitialized()` | Editor initialization hook: registers the window (500x200) and the menu entry in the Audio group. *(internal)* *(hook)* | 134 |
| `editor_suspensionAudioDebug.onExtensionLoaded()` | Extension load hook; empty. *(internal)* *(hook)* | 127 |
| `editor_suspensionAudioDebug.onExtensionUnloaded()` | Extension unload hook; empty. *(internal)* *(hook)* | 131 |
| `editor_suspensionAudioDebug.onVehicleSwitched(oldVehicle, newVehicle, player)` | Hook called when the vehicle changes: clears the histories and resets the counter to 1. *(internal)* *(hook)* | 139 |
| `editor_suspensionAudioDebug.open()` | Shows the 'Suspension Audio Debug' window. | 122 |

### Parameter details

#### `editor_suspensionAudioDebug.onVehicleSwitched(oldVehicle, newVehicle, player)`

Hook called when the vehicle changes: clears the histories and resets the counter to 1.

- `oldVehicle` (*any*) : Old vehicle.
- `newVehicle` (*any*) : New vehicle.
- `player` (*any*) : Player concerned.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/suspensionAudioDebug.lua`.*
