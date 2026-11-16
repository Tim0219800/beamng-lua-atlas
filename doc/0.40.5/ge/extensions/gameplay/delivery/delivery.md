# `gameplay_delivery_delivery`

*File: `lua/ge/extensions/gameplay/delivery/delivery.lua` · VM: Game Engine (GE) · 176 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/delivery/delivery")` (file under extensions/ but not a regular extension)

Class of a timed delivery (old delivery system). An instance randomly picks locations from a sites object carrying a tag, computes the round-trip distance over the roads (map.getPath) from a pickup point, derives an allotted time from it (baseTime + timePerKm × km), then tracks progress (states disabled, start, active, return, failed). In the active state, it fails if the vehicle damage exceeds 5000 or if the time drops to 0. The module returns a constructor: require(...)().

## Example

```lua
local d = require('/lua/ge/extensions/gameplay/delivery/delivery')()
d.vehId = be:getPlayerVehicleID(0)
d:setTimeParameters(60, 90)
d:setup(sites, pickupPos, 5, 'delivery', 3)
d:startDelivery()
```

## Notes

- setTimeParameters must be called before setup, otherwise baseTime is nil and setup crashes.
- Probable bug: init sets self.vehId = {} (a table); checkFail uses self.vehId as an id in scenetree.findObjectById and map.objects[self.vehId]: the caller must assign vehId (integer) before update.
- Probable bug: in selectLocations, the distance sort uses the global variable 'position' (nil) so it never runs, and it would sort 'locations' after the selection anyway (the selected result is not sorted).
- selectLocations: if there are fewer tagged locations than count, inserts nils (the selected table stays truncated).
- isPartiallyInsideLocationOneFrame is never set to true in this file: the timer only pauses if the caller sets this field every frame before update.
- update does not call clearEvents (call commented out): events.proceedDelivery stays true until clearEvents.
- Failure parameters: maxDamage 5000, stoppedMaxDuration 10 (stoppedTimer unused in this file), locationRewardFactor 0.5.
- checkFail leaves a dump("No vData?!") in the code if the vehicle is not in map.objects.

## Class `C`

Delivery object returned by the module constructor. Fields: vehId, state ('disabled' initially), timer (s), events, pickup {pos, radius}, locations, roundtripDistance (m), locationIndex, failReason, sites, baseTime, timePerKm.

The module returns a constructor: `local obj = require("gameplay_delivery_delivery")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:calculateRoundtrip()` | Computes the distance in meters of the trip pickup -> locations in order -> pickup, adding up the length of the paths on the road graph and the distances to the nearest road point. | 66 |
| `C:checkFail(dt)` | Tests for failure: damage above maxDamage (failReason 'damage') or time elapsed (failReason 'time'); the timer does not decrease if isPartiallyInsideLocationOneFrame is true. On failure, state = 'failed'. | 137 |
| `C:clearEvents()` | Empties the events table. | 133 |
| `C:getCurrentLocation()` | Returns the current delivery location, only in the 'active' state. | 165 |
| `C:getCurrentRewardFactor()` | Reward factor proportional to progress: ((locationIndex - 1) / number of locations) × locationRewardFactor (0.5). | 26 |
| `C:init()` | Initializes the state (disabled, timer 0, empty lists) and the failure parameters. Called by the constructor. | 7 |
| `C:proceedDelivery()` | Validates the current delivery: raises the proceedDelivery event and moves to the next location; after the last one, switches to the 'return' state. | 114 |
| `C:selectLocations(tag, count)` | Picks count locations from self.sites.locations whose customFields.tags contains the tag; shuffles the list if there are more than count. | 40 |
| `C:setTimeParameters(baseTime, timePerKm)` | Sets the allotted time parameters. | 95 |
| `C:setup(sites, pickupPos, pickupRadius, tag, count)` | Prepares the delivery: stores sites and pickup point, picks the locations, computes the distance and the timer, then switches to the 'start' state. | 100 |
| `C:startDelivery()` | Switches to the 'active' state and selects the first location (locationIndex = 1). | 109 |
| `C:update(dt)` | Per-frame update: in the 'active' state, checks the failure conditions. No effect if the state is 'disabled'. | 124 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/delivery/delivery.lua`.*
