# `core_interAero`

*File: `lua/ge/extensions/core/interAero.lua` · VM: Game Engine (GE) · 608 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_interAero`: `extensions.load("core_interAero")`, then the global `core_interAero`

GE extension `core_interAero`: simulates aerodynamic interactions BETWEEN vehicles (slipstream / drafting, "bump drafting" and side effect). On every simulation frame, for each pair of moving vehicles, it computes a local wind (vec3, in m/s) to apply to each vehicle via `veh:setWindAero(x, y, z)`. The extension has no public API to call: it runs on its own in onUpdate and its settings are local constants. A modder reads it to understand or reproduce the effect.

## Notes

- Three effects, with constants at the top of the file: slipstream (green): wake behind a vehicle, reach 1.5 s of speed (slipSec) from 0.5 m behind the front bumper, lateral width full at +0.5 m and zero at +3 m on either side of the vehicle width, strength 0.5 x speed of the vehicle ahead weighted by coverage and distance; bump drafting (blue): smoothed air just in front of a vehicle that follows another very closely, reach 0.065 s of speed, lateral +0.4 m, strength 0.17; side drafting (red): vehicles side by side, lateral reach +1.25 m, strength 0.12, per-side contribution 0.85, BRAKING effect (wind = -0.12 x vehicle speed x factor).
- Only vehicles going faster than 2 m/s (velLen >= 2) create effects; the speed is inferred from the change in position of the bounding box center (getSpawnWorldOOBBCenterXYZ) from one frame to the next, and reset to zero in case of teleportation (acceleration above 40 g = 392 m/s²).
- The computed wind is only sent to the vehicle if the change exceeds 0.28 m/s (distance from the last wind sent), to save calls. No computation if dtSim <= 0.0001 (pause).
- The per-vehicle data (vehicles[vehId]) are cached and cleared by onVehicleActiveChanged, onVehicleSpawned and onVehicleDestroyed (the cache must change when a vehicle is replaced by another).
- Internal debug tools (debugDrawEnabled, profilerType, debugSpeed, mouseWidth): disabled by default; the debug drawing shows the effect zones in green, blue and red.
- Inconsistencies noticed: (1) in the LEFT side effect, `coverage / 0.5*sideReach` is evaluated as (coverage / 0.5) * sideReach whereas the RIGHT side uses `coverage / (0.5*sideReach + 1e-30)`: the two sides therefore do not have the same normalization (the left value is about 6.25 times stronger before clamping to 1); (2) dzLongCurve and dzLooongCurve call linearCurve before its local definition (they would resolve a nil global) but are never used; (3) a comment in the code asks to remove the profiling code before release.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_interAero.onUpdate(dtReal, dtSim, dtRaw)` | Per-frame hook: computes the inter-vehicle aerodynamic effects (calculateAero) from dtSim and applies the resulting wind to each active vehicle via setWindAero. *(internal)* *(hook)* | 563 |
| `core_interAero.onVehicleActiveChanged(vehId)` | Hook: a vehicle became active or inactive. Removes its entry from the cache so it is recomputed. *(internal)* *(hook)* | 260 |
| `core_interAero.onVehicleDestroyed(vehId)` | Hook on vehicle destruction: clears its cache entry. *(internal)* *(hook)* | 260 |
| `core_interAero.onVehicleSpawned(vehId)` | Hook on vehicle creation: clears its cache entry (necessary when a vehicle replaces another with the same id). *(internal)* *(hook)* | 260 |

### Parameter details

#### `core_interAero.onUpdate(dtReal, dtSim, dtRaw)`

Per-frame hook: computes the inter-vehicle aerodynamic effects (calculateAero) from dtSim and applies the resulting wind to each active vehicle via setWindAero.

- `dtReal` (*number*) : Real-time delta in seconds (used for the debug blinking).
- `dtSim` (*number*) : Simulation time delta in seconds; used to estimate speeds.
- `dtRaw` (*number*) : Raw time delta (unused).

#### `core_interAero.onVehicleActiveChanged(vehId)`

Hook: a vehicle became active or inactive. Removes its entry from the cache so it is recomputed.

- `vehId` (*integer*) : Vehicle id.

#### `core_interAero.onVehicleDestroyed(vehId)`

Hook on vehicle destruction: clears its cache entry.

- `vehId` (*integer*) : Vehicle id.

#### `core_interAero.onVehicleSpawned(vehId)`

Hook on vehicle creation: clears its cache entry (necessary when a vehicle replaces another with the same id).

- `vehId` (*integer*) : Vehicle id.

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`
- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/interAero.lua`.*
