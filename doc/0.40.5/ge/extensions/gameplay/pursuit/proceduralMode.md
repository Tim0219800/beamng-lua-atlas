# `gameplay_pursuit_proceduralMode`

*File: `lua/ge/extensions/gameplay/pursuit/proceduralMode.lua` · VM: Game Engine (GE) · 27 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_pursuit_proceduralMode`: `extensions.load("gameplay_pursuit_proceduralMode")`, then the global `gameplay_pursuit_proceduralMode`

Empty skeleton intended for procedurally generated pursuit scenarios and random events. The code comment says the traffic's random suspect logic should be moved here. No logic is implemented.

## Notes

- The three hooks are empty functions.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_pursuit_proceduralMode.onDeserialized()` | Hook after Lua reload; does nothing. *(internal)* *(hook)* | 20 |
| `gameplay_pursuit_proceduralMode.onSerialize()` | Serialization hook before Lua reload; does nothing. *(internal)* *(hook)* | 17 |
| `gameplay_pursuit_proceduralMode.onUpdate(dt, dtSim)` | Hook called every frame; does nothing. *(internal)* *(hook)* | 14 |

### Parameter details

#### `gameplay_pursuit_proceduralMode.onUpdate(dt, dtSim)`

Hook called every frame; does nothing.

- `dt` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulated time delta (s).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/pursuit/proceduralMode.lua`.*
