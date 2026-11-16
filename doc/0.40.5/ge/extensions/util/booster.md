# `util_booster`

*File: `lua/ge/extensions/util/booster.lua` · VM: Game Engine (GE) · 20 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_booster`: `extensions.load("util_booster")`, then the global `util_booster`

Tiny demo extension for a "booster" trigger: trigger(data) prints the received data, then should propel a vehicle upward via core_booster on the vehicle side. In the current state of the code, the propulsion never fires.

## Notes

- Bug: trigger tests the global variable `event` (nil) instead of `data.event`, so the condition `event == 'enter'` is always false and the vehicle is never propelled; only print and dump are executed.
- If the condition were true, it would send the vehicle data.subjectID the command extensions.core_booster.boost(vec3(0,0,1), 0.01).

## Functions

| Function | Description | Line |
|---|---|---|
| `util_booster.trigger(data)` | Prints "Booster triggered" and the contents of data. Intended to react to a trigger event (data.subjectID is the vehicle id), but does nothing else because of the reported bug. | 7 |

### Parameter details

#### `util_booster.trigger(data)`

Prints "Booster triggered" and the contents of data. Intended to react to a trigger event (data.subjectID is the vehicle id), but does nothing else because of the reported bug.

- `data` (*table*) : Trigger event data (subjectID expected).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/booster.lua`.*
