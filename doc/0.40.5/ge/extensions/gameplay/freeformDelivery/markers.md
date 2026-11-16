# `gameplay_freeformDelivery_markers`

*File: `lua/ge/extensions/gameplay/freeformDelivery/markers.lua` · VM: Game Engine (GE) · 444 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_freeformDelivery_markers`: `extensions.load("gameplay_freeformDelivery_markers")`, then the global `gameplay_freeformDelivery_markers`

Submodule of the freeform delivery mode (freeformDelivery) that displays the visual markers of target areas: ground decals for parking spots (color depending on parking state), debug spheres/rectangles for locations, zones and spots, and the 3D attention markers of the active route. It is driven by freeformDelivery (setup, update every frame, cleanup).

## Notes

- Parking states of a spot: none (white), partial (yellow, 1 to 3 corners in the spot), full (green, 4 corners) and blocked (red, a vehicle not associated with the spot fully occupies it).
- Spot decals are only drawn if a goal linked to the spot is active and the player is within 300 m; opacity goes from 1.0 (250 m) down to 0.2 (300 m).
- Debug drawings (sphere, rectangle, text) are only active if gameplay_freeformDelivery_freeformDelivery.debug.enabled and the corresponding targetAreas sub-setting are true.
- Depends on the globals gameplay_freeformDelivery_utils, gameplay_freeformDelivery_goals and gameplay_freeformDelivery_freeformDelivery, without declaring them in M.dependencies.
- The route marker is offset by 2 m in height (ATTENTION_MARKER_HEIGHT_OFFSET) and its radius is 1.5.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_freeformDelivery_markers.cleanup()` | Clears the markers, decals and caches, forgets the active delivery and destroys the route markers. *(internal)* | 435 |
| `gameplay_freeformDelivery_markers.hideRouteMarker()` | Hides the route markers (main, zone, parking) without destroying them. | 230 |
| `gameplay_freeformDelivery_markers.setRouteMarker(pos, zone, parkingSpot)` | Creates (replacing the previous ones) the route attention marker at the given position, plus optionally a zone marker and a parking spot marker, then displays them. | 176 |
| `gameplay_freeformDelivery_markers.setup(delivery)` | Stores the active delivery, creates one marker per target area (targetAreas) found in delivery.sites, prepares the parking spot decal data and precomputes which vehicles are associated with which spot via the placement-type goals. *(internal)* | 242 |
| `gameplay_freeformDelivery_markers.update(dtReal, dtSim, dtRaw, profiler)` | Called every frame: updates the parking state of the spots, draws the debug markers, adds the ground decals via Engine.Render.DynamicDecalMgr.addDecals and updates the route markers. *(internal)* | 292 |

### Parameter details

#### `gameplay_freeformDelivery_markers.setRouteMarker(pos, zone, parkingSpot)`

Creates (replacing the previous ones) the route attention marker at the given position, plus optionally a zone marker and a parking spot marker, then displays them.

- `pos` (*vec3*) : Position of the main marker (raised by 2 m).
- `zone` (*table|nil*) : Zone checkpoint data passed to the zone marker's setToCheckpoint.
- `parkingSpot` (*table|nil*) : Parking spot data passed to the parking marker.
- **returns**: boolean false if pos is nil or if the marker could not be created, otherwise true.

#### `gameplay_freeformDelivery_markers.setup(delivery)`

Stores the active delivery, creates one marker per target area (targetAreas) found in delivery.sites, prepares the parking spot decal data and precomputes which vehicles are associated with which spot via the placement-type goals.

- `delivery` (*table*) : Delivery data (goals, targetAreas, sites, vehicles).

#### `gameplay_freeformDelivery_markers.update(dtReal, dtSim, dtRaw, profiler)`

Called every frame: updates the parking state of the spots, draws the debug markers, adds the ground decals via Engine.Render.DynamicDecalMgr.addDecals and updates the route markers.

- `dtReal` (*number*) : Real-time delta in seconds.
- `dtSim` (*number*) : Simulation time delta in seconds.
- `dtRaw` (*number*) : Raw delta time (not used directly).
- `profiler` (*table|nil*) : Optional profiler (add method) to measure sections.

## Calls into the engine (C++)

- `debugDrawer:` `drawLine`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/freeformDelivery/markers.lua`.*
