# `gameplay_freeformDelivery_hints`

*File: `lua/ge/extensions/gameplay/freeformDelivery/hints.lua` · VM: Game Engine (GE) · 191 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_freeformDelivery_hints`: `extensions.load("gameplay_freeformDelivery_hints")`, then the global `gameplay_freeformDelivery_hints`

Manages the hints of the freeform delivery mode: each delivery hint (id, targetAreaIds, message, subtext) is displayed as a message in the task list (SetTasklistTask) as long as the player is inside one of its target areas (zone, location or parkingSpot), then disappears (DiscardTasklistItem) when they leave. Called by gameplay_freeformDelivery_freeformDelivery, not by the engine.

## Notes

- A hint without id or without targetAreaIds is ignored (logged warning). The default message is the key missions.freeformDelivery.common.hint.fallback.
- Detection: player in vehicle = gameplay_freeformDelivery_utils.checkVehicleInArea; player on foot = manual test (containsPoint2D for zone, distance <= radius for location, oriented box for parkingSpot).
- Tasklist tasks have the id "hint_<id>" and the type message.
- The profiler parameter of update is optional: it is used to add measurement sections (p:add).

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_freeformDelivery_hints.cleanup()` | Removes all displayed hints from the tasklist and forgets the active delivery. | 179 |
| `gameplay_freeformDelivery_hints.setup(delivery)` | Initializes the hints from delivery.hints and stores the active delivery. Logs the number of hints loaded. | 92 |
| `gameplay_freeformDelivery_hints.update(dtReal, dtSim, dtRaw, profiler)` | To be called every frame: displays the hints whose target area contains the player and hides the others. No effect if no delivery is active or if the player's position is unknown. | 128 |

### Parameter details

#### `gameplay_freeformDelivery_hints.setup(delivery)`

Initializes the hints from delivery.hints and stores the active delivery. Logs the number of hints loaded.

- `delivery` (*table*) : Loaded delivery (hints, targetAreas, sites).

#### `gameplay_freeformDelivery_hints.update(dtReal, dtSim, dtRaw, profiler)`

To be called every frame: displays the hints whose target area contains the player and hides the others. No effect if no delivery is active or if the player's position is unknown.

- `dtReal` (*number*) : Real time delta (unused).
- `dtSim` (*number*) : Simulated time delta (unused).
- `dtRaw` (*number*) : Raw time delta (unused).
- `profiler` (*table|nil*) : Optional LuaProfiler for measuring sections.

**UI events (guihooks.trigger):** `DiscardTasklistItem`, `SetTasklistTask`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/freeformDelivery/hints.lua`.*
