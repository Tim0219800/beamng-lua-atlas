# `util_lawnMower`

*File: `lua/ge/extensions/util/lawnMower.lua` · VM: Game Engine (GE) · 270 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_lawnMower`: `extensions.load("util_lawnMower")`, then the global `util_lawnMower`

Lawn mower driven by JBeam props (GE side only). It searches each vehicle's parsed JBeam for props with the mowerRadius option and, while the cutting deck is low and flat above terrain, cuts the grass in the shared surface mask (util_surfaceMaskWheels) by drawing a disc then segments, and spawns grass blade particles on terrain materials whose name contains "grass". No vehicle-side Lua is needed. The JBeam part declares "gameEngineExtensions": {"util_lawnMower": true} to load the extension automatically.

## Example

```lua
-- In the mower's JBeam part:
-- "gameEngineExtensions": {"util_lawnMower": true},
-- "props": [["func","mesh","idRef:","idX:","idY:","baseRotation","rotation","translation"],
--   ["mower_deck","deck.dae","deck_ref","deck_x","deck_y",{"x":0,"y":0,"z":0},{"x":0,"y":0,"z":0},{"x":0,"y":0,"z":0},{"mowerRadius":0.9,"mowerGroundDistance":0.4}]]
extensions.util_lawnMower.toggle()
```

## Notes

- Prop options: mowerRadius (m, required, radius of the cut swath); mowerGroundDistance (m, default 0.5: maximum height of the deck center above the terrain for cutting).
- The deck cuts only if it is low AND flat: the plane defined by the idRef/idX/idY nodes must be roughly parallel to the terrain (|cos| >= 0.85, about 31 degrees). For raising or folding the deck to stop the cutting, it must be mounted on real physical nodes; a simple prop animation is not detected.
- The cutting center is the centroid of idRef, idX, idY (falls back to idRef alone if idX/idY are missing).
- Updated every 0.05 s. Only the player vehicle and nearby mowers (clipmap window) cut; the window is centered on the player vehicle (setCenter).
- Grass blades are spawned only on the first cut of a 0.5 m cell (mownCells cache), on a "grass" material (name-based heuristic). The mask is on the GPU and cannot be read back.
- A displacement of more than 10 m between two updates is treated as a teleport (no stroke); below 0.2 m nothing is drawn.

**Dependencies (loaded first):** `util_surfaceMaskWheels`, `core_vehicle_manager`

## Functions

| Function | Description | Line |
|---|---|---|
| `util_lawnMower.onClientStartMission()` | Hook called at level start: clears the caches of mown cells, grass materials and terrain object. *(internal)* *(hook)* | 233 |
| `util_lawnMower.onDeserialized(data)` | Deserialization hook after reload: restores the enabled state. *(internal)* *(hook)* | 264 |
| `util_lawnMower.onExtensionLoaded()` | Called on load: enables the mower and scans the vehicles already present. *(internal)* *(hook)* | 244 |
| `util_lawnMower.onPreRender(dtReal, dtSim)` | Hook called every frame before rendering: if enabled and mowers exist, centers the mask clipmap and makes each mower cut (every 0.05 s). Removes the state of vehicles that have disappeared. *(internal)* *(hook)* | 164 |
| `util_lawnMower.onSerialize()` | Serialization hook before an extension reload: saves the enabled state. *(internal)* *(hook)* | 260 |
| `util_lawnMower.onVehicleDestroyed(vehId)` | Hook called when a vehicle is destroyed: forgets its mowers. *(internal)* *(hook)* | 239 |
| `util_lawnMower.onVehicleSpawned(vehId)` | Hook called when a vehicle spawns (or respawned after a part change): rereads its JBeam props looking for mowerRadius. *(internal)* *(hook)* | 229 |
| `util_lawnMower.setEnabled(enabled)` | Enables or disables cutting and resets the timer. | 251 |
| `util_lawnMower.toggle()` | Toggles the enabled/disabled state. | 256 |

### Parameter details

#### `util_lawnMower.onDeserialized(data)`

Deserialization hook after reload: restores the enabled state.

- `data` (*table|nil*) : Data returned by onSerialize

#### `util_lawnMower.onPreRender(dtReal, dtSim)`

Hook called every frame before rendering: if enabled and mowers exist, centers the mask clipmap and makes each mower cut (every 0.05 s). Removes the state of vehicles that have disappeared.

- `dtReal` (*number*) : Real-time delta in seconds
- `dtSim` (*number*) : Simulation time delta in seconds (takes priority for the timer)

#### `util_lawnMower.onSerialize()`

Serialization hook before an extension reload: saves the enabled state.

- **returns**: table {enabled = boolean}

#### `util_lawnMower.onVehicleDestroyed(vehId)`

Hook called when a vehicle is destroyed: forgets its mowers.

- `vehId` (*integer*) : Vehicle id

#### `util_lawnMower.onVehicleSpawned(vehId)`

Hook called when a vehicle spawns (or respawned after a part change): rereads its JBeam props looking for mowerRadius.

- `vehId` (*integer*) : Vehicle id

#### `util_lawnMower.setEnabled(enabled)`

Enables or disables cutting and resets the timer.

- `enabled` (*boolean*) : true to enable

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Required extensions: util_surfaceMaskWheels (mask service) and core_vehicle_manager (parsed JBeam data) |
| `enabled` | boolean | Enables or disables cutting; true after onExtensionLoaded |

## Calls into the engine (C++)

- `be:` `getPlayerVehicle`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/lawnMower.lua`.*
