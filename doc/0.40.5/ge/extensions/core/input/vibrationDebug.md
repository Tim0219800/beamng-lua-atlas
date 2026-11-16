# `core_input_vibrationDebug`

*File: `lua/ge/extensions/core/input/vibrationDebug.lua` · VM: Game Engine (GE) · 48 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_input_vibrationDebug`: `extensions.load("core_input_vibrationDebug")`, then the global `core_input_vibrationDebug`

GE extension `core_input_vibrationDebug`: "Vibration Debug" ImGui debug window to tune in real time the controller vibration (haptics) parameters of the player's vehicle. Each modified field sends a command to the haptics extension on the vehicle side. Useful to test force feedback, not a lasting API.

## Notes

- The window is drawn on every onUpdate as long as the extension is loaded; the fields are only displayed if a player vehicle exists.
- Commands sent to the vehicle: haptics.setWheelSlipForceMultiplier(x), haptics.setJerkForceMultiplier(x), haptics.setWheelSlipMin(x), haptics.setJerkMin(x).
- Inconsistency: initial value of wheelSlipMin = 2.0, but onVehicleSwitched resets it to 4 (jerkMin 30 and multipliers 1 are identical); the displayed values are not sent back to the new vehicle, only the display is reset.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_input_vibrationDebug.onUpdate()` | Per-frame hook: draws the ImGui window and sends to player vehicle 0 the new force multiplier values (wheel slip, jerks) and minimum thresholds. *(internal)* *(hook)* | 14 |
| `core_input_vibrationDebug.onVehicleSwitched()` | Hook on vehicle change: resets the window fields to their default values (multipliers 1, wheelSlipMin 4, jerkMin 30) without sending them back to the vehicle. *(internal)* *(hook)* | 34 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/input/vibrationDebug.lua`.*
