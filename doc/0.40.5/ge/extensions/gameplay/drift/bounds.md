# `gameplay_drift_bounds`

*File: `lua/ge/extensions/gameplay/drift/bounds.lua` · VM: Game Engine (GE) · 132 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_drift_bounds`: `extensions.load("gameplay_drift_bounds")`, then the global `gameplay_drift_bounds`

Zone boundaries of drift mode. Loads a sites file (zones) with setBounds, then, every frame, checks for each vehicle tracked by gameplay_drift_drift whether it is in at least one zone; otherwise it is "out of bounds". A drift mission modder reads getIsOutOfBounds(vehId) to penalize the player. Also contains an ImGui debug window and a profiler.

## Notes

- setBounds: the drawBounds_ parameter is poorly handled: only the nil case sets drawBounds to true; a provided true/false value is never copied. Also drawZones() (drawing the zones, flashing red when out of bounds) is commented out in onUpdate, so nothing is drawn.
- Depends on gameplay_drift_drift (getTrackedVehicles, getVehPos) and gameplay_drift_general (debug); untracked vehicles are removed from the state.
- getIsOutOfBounds without argument returns true if any tracked vehicle is out of bounds (compatibility).
- A position outside all the zones of the sites file (sites:getZonesForPosition returns 0 zones) is considered out of bounds.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_drift_bounds.getDriftDebugInfo()` | Debug configuration table of the extension: {default = false, canBeChanged = true}. | 115 |
| `gameplay_drift_bounds.getGC()` | Lua garbage produced by the last frame measured by the profiler (0 if general debug is off). | 119 |
| `gameplay_drift_bounds.getIsOutOfBounds(vehId)` | Indicates whether a vehicle is outside the boundary zones. | 103 |
| `gameplay_drift_bounds.onUpdate()` | Per-frame hook: updates the out-of-bounds state of each tracked vehicle, the debug window and the profiler. *(internal)* *(hook)* | 88 |
| `gameplay_drift_bounds.setBounds(filePath, drawBounds_)` | Loads the sites file that defines the allowed zones (gameplay_sites_sitesManager.loadSites then finalizeSites) and empties the vehicle state. | 24 |

### Parameter details

#### `gameplay_drift_bounds.getDriftDebugInfo()`

Debug configuration table of the extension: {default = false, canBeChanged = true}.

- **returns**: table Debug info.

#### `gameplay_drift_bounds.getGC()`

Lua garbage produced by the last frame measured by the profiler (0 if general debug is off).

- **returns**: number Measured garbage amount.

#### `gameplay_drift_bounds.getIsOutOfBounds(vehId)`

Indicates whether a vehicle is outside the boundary zones.

- `vehId` (*integer|nil*) : Vehicle ID; nil = true if any tracked vehicle is out of bounds.
- **returns**: boolean true if out of bounds.

#### `gameplay_drift_bounds.setBounds(filePath, drawBounds_)`

Loads the sites file that defines the allowed zones (gameplay_sites_sitesManager.loadSites then finalizeSites) and empties the vehicle state.

- `filePath` (*string*) : Path of the sites file containing the zones.
- `drawBounds_` (*boolean|nil*) : Drawing of the zones (nil = active); see notes, the provided value is ignored.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drift/bounds.lua`.*
