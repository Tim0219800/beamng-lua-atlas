# `mcp_tools_sim`

*File: `lua/ge/extensions/mcp/tools/sim.lua` · VM: Game Engine (GE) · 59 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `mcp_tools_sim`: `extensions.load("mcp_tools_sim")`, then the global `mcp_tools_sim`

MCP simulation control tools: read the state, change the time scale, pause the physics, resume it, or advance it step by step. Relies on the engine object `be`.

## Notes

- Pause only freezes the physics: rendering and the camera continue.
- step_physics always leaves the physics paused after the requested ticks.

## Functions

| Function | Description | Line |
|---|---|---|
| `mcp_tools_sim.get_simulation_state()` | Simulation state as JSON: physicsRunning, timeScale, speedFactor, deterministic, enabled (be:getPhysicsRunning, getSimulationTimeScale, getPhysicsSpeedFactor, getPhysicsDeterministic, getEnabled). | 9 |
| `mcp_tools_sim.pause_physics()` | Pauses the physics (be:setPhysicsRunning(false)). | 26 |
| `mcp_tools_sim.resume_physics()` | Resumes the physics (be:setPhysicsRunning(true)). | 31 |
| `mcp_tools_sim.set_simulation_speed(args)` | Sets the simulation time scale (be:setSimulationTimeScale). | 19 |
| `mcp_tools_sim.step_physics(args)` | Pauses the physics then advances N ticks (be:physicsStep); it stays paused. | 37 |

### Parameter details

#### `mcp_tools_sim.get_simulation_state()`

Simulation state as JSON: physicsRunning, timeScale, speedFactor, deterministic, enabled (be:getPhysicsRunning, getSimulationTimeScale, getPhysicsSpeedFactor, getPhysicsDeterministic, getEnabled).

- **returns**: string JSON.
- **returns**: boolean false.

#### `mcp_tools_sim.pause_physics()`

Pauses the physics (be:setPhysicsRunning(false)).

- **returns**: string Message.
- **returns**: boolean false.

#### `mcp_tools_sim.resume_physics()`

Resumes the physics (be:setPhysicsRunning(true)).

- **returns**: string Message.
- **returns**: boolean false.

#### `mcp_tools_sim.set_simulation_speed(args)`

Sets the simulation time scale (be:setSimulationTimeScale).

- `args` (*table*) : {scale: number} 1 = normal, <1 slow motion, >1 sped up.
- **returns**: string Confirmation.
- **returns**: boolean true if scale is missing.

#### `mcp_tools_sim.step_physics(args)`

Pauses the physics then advances N ticks (be:physicsStep); it stays paused.

- `args` (*table|nil*) : {steps?: integer} number of physics ticks (default 1, minimum 1).
- **returns**: string Message.
- **returns**: boolean false.

## Fields

| Field | Type | Description |
|---|---|---|
| `schemas` | table<string, table> | Schemas of the simulation tools. |

## Calls into the engine (C++)

- `be:` `getEnabled`, `getPhysicsDeterministic`, `getPhysicsRunning`, `getPhysicsSpeedFactor`, `getSimulationTimeScale`, `physicsStep`, `setPhysicsRunning`, `setSimulationTimeScale`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/mcp/tools/sim.lua`.*
