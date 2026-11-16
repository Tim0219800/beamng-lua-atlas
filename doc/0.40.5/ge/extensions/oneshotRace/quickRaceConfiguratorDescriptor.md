# `oneshotRace_quickRaceConfiguratorDescriptor`

*File: `lua/ge/extensions/oneshotRace/quickRaceConfiguratorDescriptor.lua` · VM: Game Engine (GE) · 118 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `oneshotRace_quickRaceConfiguratorDescriptor`: `extensions.load("oneshotRace_quickRaceConfiguratorDescriptor")`, then the global `oneshotRace_quickRaceConfiguratorDescriptor`

Builds the descriptor common to the quick race configurators (quickrace, Light Runner). The descriptor is consumed by oneshotRaceCore.createConfigurator: it defines the default settings (reverse, rollingStart, lapCount, tod, seed), how to summarize level and track for the interface, the best scores key and the start via scenario_quickRaceLoader.startQuickrace.

## Example

```lua
local descriptor = require("ge/extensions/oneshotRace/quickRaceConfiguratorDescriptor").build({logTag = "monConfigurateur", gridBackendName = "quickraceSelector", routeDataKey = "quickraceWizard"})
```

## Notes

- Default settings: reverse false, rollingStart false, lapCount 1, tod 3, seed nil; seed is the only additional key accepted (extraSettingKeys).
- If lapCount drops to 0 and the track allows a rolling start (allowRollingStart), rollingStart is forced to true.
- When a track is selected: reverse and rollingStart are false (`track.reversible and false` gives nil if the track is not reversible, or false), lapCount, tod and seed (procedural tracks) come from the track.
- Best scores key: "standing" or "rolling" (rolling start, lapCount > 0 and no lap records display), suffixed "Reverse" if reversed, then the lap count (0 for lap records).
- On start, the level and track are copied (deepcopy), tracks is removed from the level, and reverse/rollingStart/lapCount/tod/seed are written into the track copy; opts.raceType is passed as the race type.

## Functions

| Function | Description | Line |
|---|---|---|
| `oneshotRace_quickRaceConfiguratorDescriptor.build(opts)` | Builds the quick race configurator descriptor. | 13 |

### Parameter details

#### `oneshotRace_quickRaceConfiguratorDescriptor.build(opts)`

Builds the quick race configurator descriptor.

- `opts` (*table*) : {logTag, gridBackendName, routeDataKey, vehicleRestrictionMode (optional), getDefaultSelection (optional), raceType (optional)}
- **returns**: table Descriptor for oneshotRaceCore.createConfigurator.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/oneshotRace/quickRaceConfiguratorDescriptor.lua`.*
