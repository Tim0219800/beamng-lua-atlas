# `editor_trafficDebug`

*File: `lua/ge/extensions/editor/trafficDebug.lua` · VM: Game Engine (GE) · 510 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_trafficDebug`: `extensions.load("editor_trafficDebug")`, then the global `editor_trafficDebug`

Editor window "Traffic Debug" (menu Window > Debug) to inspect and tune the gameplay_traffic traffic system. Two tabs: General (number of traffic and parking vehicles, global settings via gameplay_traffic.setTrafficVars: activeAmount, spawnValue, spawnDirBias, baseAggression, speedLimit, aiAware, enableRandomEvents; debugMode checkbox; disperse button) and Vehicles (per-vehicle data: general, road, respawn, pursuit, timers, role, action log, forced teleport). Enables gameplay_traffic.debugMode on open and turns it off when the editor is deactivated.

## Notes

- The window draws nothing if the gameplay_traffic extension is not loaded.
- The action log is fed by the onTrafficAction hook, with at most 100 entries kept per vehicle.
- The settings are clamped before sending: spawnValue 0..3, spawnDirBias -1..1, baseAggression 0.1..2, speedLimit -1..100.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_trafficDebug.onEditorDeactivated()` | Hook called when the editor is closed: turns off gameplay_traffic.debugMode and forgets the traffic data. *(internal)* *(hook)* | 461 |
| `editor_trafficDebug.onEditorGui()` | Hook called every editor interface frame: draws the window, enables gameplay_traffic.debugMode on first display, reads gameplay_traffic.getTrafficData() and draws the current tab. *(internal)* *(hook)* | 471 |
| `editor_trafficDebug.onEditorInitialized()` | Editor hook: registers the 'Traffic Debug' window (400x600) and its menu entry Window > Debug. *(internal)* *(hook)* | 466 |
| `editor_trafficDebug.onTrafficAction(id, action, data)` | Traffic hook: adds a line to the log of vehicle `id`, with the received timestamp, the action and its data, displayed in the Vehicles tab. *(internal)* *(hook)* | 500 |

### Parameter details

#### `editor_trafficDebug.onTrafficAction(id, action, data)`

Traffic hook: adds a line to the log of vehicle `id`, with the received timestamp, the action and its data, displayed in the Vehicles tab.

- `id` (*integer*) : Id of the traffic vehicle.
- `action` (*string*) : Name of the traffic action.
- `data` (*any*) : Associated data, displayed in parentheses if present.

## Calls into the engine (C++)

- `be:` `getObjectPositionXYZ`
- `debugDrawer:` `drawSquarePrism`
- `obj:` `queueLuaCommand`
- `scenetree.` `objectExistsById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/trafficDebug.lua`.*
