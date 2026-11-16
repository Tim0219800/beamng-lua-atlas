# `gameplay_crashTest_crashTestCountdown`

*File: `lua/ge/extensions/gameplay/crashTest/crashTestCountdown.lua` · VM: Game Engine (GE) · 50 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_crashTest_crashTestCountdown`: `extensions.load("gameplay_crashTest_crashTestCountdown")`, then the global `gameplay_crashTest_crashTestCountdown`

Countdown displayed during the crash test scenario. Each whole second crossed, it sends a message to the UI (ScenarioFlashMessage event) with the remaining digit and a countdown sound, then "Go!" with a start sound when the time is up, and then calls the given callback.

## Example

```lua
gameplay_crashTest_crashTestCountdown.startNewCountdown(3, function() print('go') end)
```

## Notes

- The time decreases with dtSim (simulation time), so it stops when paused.
- The message has the form {{text, 0.95, luaCall, true}}; the third element is a Lua call played by the UI (Engine.Audio.playOnce).
- The name of the internal function updateCoundown contains a typo (no effect).

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_crashTest_crashTestCountdown.onUpdate(dtReal, dtSim)` | Hook called every frame: advances the countdown if one is in progress. *(internal)* *(hook)* | 40 |
| `gameplay_crashTest_crashTestCountdown.startNewCountdown(duration, callback_)` | Starts a countdown of duration seconds. The callback is called when the count reaches 0 (at the time of "Go!"). | 11 |

### Parameter details

#### `gameplay_crashTest_crashTestCountdown.onUpdate(dtReal, dtSim)`

Hook called every frame: advances the countdown if one is in progress.

- `dtReal` (*number*) : Real delta time (s), unused.
- `dtSim` (*number*) : Simulation time delta (s).

#### `gameplay_crashTest_crashTestCountdown.startNewCountdown(duration, callback_)`

Starts a countdown of duration seconds. The callback is called when the count reaches 0 (at the time of "Go!").

- `duration` (*number*) : Duration in seconds.
- `callback_` (*function|nil*) : Function called at the end of the countdown.

**UI events (guihooks.trigger):** `ScenarioFlashMessage`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/crashTest/crashTestCountdown.lua`.*
