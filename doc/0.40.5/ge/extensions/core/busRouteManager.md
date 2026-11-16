# `core_busRouteManager`

*File: `lua/ge/extensions/core/busRouteManager.lua` · VM: Game Engine (GE) · 142 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_busRouteManager`: `extensions.load("core_busRouteManager")`, then the global `core_busRouteManager`

GE extension (core_busRouteManager) that manages the bus lines of a level. When the extension loads and when a level starts (init), it reads the *.buslines.json files from the level folder (/buslines/), checks that the referenced stops exist as BeamNGTrigger triggers of type 'busstop' in the 'busstops' group, and replaces stop names with their position data. It then relays trigger events to the bus controller (vehicle side) and to the scenario_busdriver scenario.

## Example

```lua
local route = core_busRouteManager.setLine(vehId, 42, 'a') -- sends line 42 variant 'a' to the bus
```

## Notes

- Only version 1 files are loaded (data.version == 1). Routes are appended to busLines.routes.
- Each route task (route.tasklist) is replaced by {name, stopName, position{x,y,z}, rotation{x,y,z,w}, scale{x,y,z}}; stops that are not found are logged as errors and removed from the list.
- Commands to the bus go through veh:queueLuaCommand("controller.onGameplayEvent('<cmd>', <serialized data>)"): commands bus_setLineInfo, bus_onAtStop, bus_onDepartedStop, bus_onTriggerTick.
- init is exposed both as onClientStartMission and onExtensionLoaded: the list of lines is therefore reloaded at both times.
- Inconsistency: init calls path.split(missionFile, '(.-)([^/]-([^%.]*))$') with a 2nd argument (pattern) that is actually the compositeExtension parameter: it is truthy, which forces the 'composite' extension (everything after the first dot). No consequence here since only levelDir is used (inferred from code).
- Inconsistency: the comment of setLine says 'GE core_busLine.getLine' while the exported function is named setLine; setLine's error logs use the tag 'getLine'.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_busRouteManager.onAtStop(data)` | Called when a bus enters a stop: sends bus_onAtStop to vehicle data.subjectID. *(hook)* | 96 |
| `core_busRouteManager.onBeamNGTrigger(data)` | Hook called by the engine for each trigger event. Only handles type == 'busstop': 'enter' -> onAtStop, 'exit' -> bus_onDepartedStop, 'tick' -> bus_onTriggerTick sent to the vehicle. *(internal)* *(hook)* | 107 |
| `core_busRouteManager.onBusUpdate(state)` | Bus update hook: forwards the state to scenario_busdriver.onBusUpdate if that scenario is loaded. *(internal)* *(hook)* | 119 |
| `core_busRouteManager.onClientStartMission()` | Hook called when a level starts: (re)initializes busLines and reloads the level's line files. *(internal)* *(hook)* | 73 |
| `core_busRouteManager.onExtensionLoaded()` | Hook called when the extension loads: same init function as onClientStartMission. *(internal)* *(hook)* | 73 |
| `core_busRouteManager.setLine(vehId, routeID, variance)` | Looks for the route whose routeID and variance match. If vehId is given, sends the line info to the vehicle (command bus_setLineInfo). Returns the route found or nil (with an error log). | 83 |

### Parameter details

#### `core_busRouteManager.onAtStop(data)`

Called when a bus enters a stop: sends bus_onAtStop to vehicle data.subjectID.

- `data` (*table*) : Trigger data (subjectID, type, event...)

#### `core_busRouteManager.onBeamNGTrigger(data)`

Hook called by the engine for each trigger event. Only handles type == 'busstop': 'enter' -> onAtStop, 'exit' -> bus_onDepartedStop, 'tick' -> bus_onTriggerTick sent to the vehicle.

- `data` (*table*) : {type, event ('enter'|'exit'|'tick'), subjectID, ...}

#### `core_busRouteManager.onBusUpdate(state)`

Bus update hook: forwards the state to scenario_busdriver.onBusUpdate if that scenario is loaded.

- `state` (*table*) : Bus state (inferred from code: notably contains pos)

#### `core_busRouteManager.setLine(vehId, routeID, variance)`

Looks for the route whose routeID and variance match. If vehId is given, sends the line info to the vehicle (command bus_setLineInfo). Returns the route found or nil (with an error log).

- `vehId` (*integer|nil*) : ID of the bus vehicle to configure (getObjectByID), nil to only search
- `routeID` (*any*) : Line identifier (compared with ==)
- `variance` (*any*) : Line variant (e.g. 'a')
- **returns**: table|nil Route table (with transformed tasklist), nil if not found

## Calls into the engine (C++)

- `FS:` `findFiles`
- `Sim.` `upcast`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/busRouteManager.lua`.*
