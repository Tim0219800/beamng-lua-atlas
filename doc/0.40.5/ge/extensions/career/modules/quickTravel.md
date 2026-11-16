# `career_modules_quickTravel`

*File: `lua/ge/extensions/career/modules/quickTravel.lua` · VM: Game Engine (GE) · 64 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_quickTravel`: `extensions.load("career_modules_quickTravel")`, then the global `career_modules_quickTravel`

Paid quick travel in career: computes a price based on the road distance between the player and a destination, then teleports the player (in walking mode) and debits them. Used to reach a garage.

## Notes

- Rate: free under 300 m; otherwise 5 + distance(m) * 0.004 (rounded to the cent).
- The distance comes from a route planner (gameplay/route/route) from the player vehicle's position.
- Traveling with the vehicle is not implemented (TODO in the code): without useWalkingMode, only the payment is made, without teleportation.
- getPriceForQuickTravel returns two values: price and distance.

**Dependencies (loaded first):** `career_career`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_quickTravel.getPriceForQuickTravel(pos)` | Computes the price and road distance to pos. | 19 |
| `career_modules_quickTravel.getPriceForQuickTravelToGarage(garage)` | Travel price to the garage position given by freeroam_facilities.getGaragePosRot. | 54 |
| `career_modules_quickTravel.quickTravelToGarage(garagePoi)` | Quick travel to the garage's first parking spot (in walking mode, label quickTravelGarageTaxi). | 45 |
| `career_modules_quickTravel.quickTravelToPos(pos, useWalkingMode, reasonString)` | If the player can pay, enables walking mode, safely teleports the vehicle to pos and orients the player toward pos, then debits the price (tags quickTravel, buying). | 33 |

### Parameter details

#### `career_modules_quickTravel.getPriceForQuickTravel(pos)`

Computes the price and road distance to pos.

- `pos` (*vec3*) : Destination.
- **returns**: number Price in money.
- **returns**: number Road distance in meters.

#### `career_modules_quickTravel.getPriceForQuickTravelToGarage(garage)`

Travel price to the garage position given by freeroam_facilities.getGaragePosRot.

- `garage` (*table*) : Garage.
- **returns**: number Price.
- **returns**: number Distance in meters.

#### `career_modules_quickTravel.quickTravelToGarage(garagePoi)`

Quick travel to the garage's first parking spot (in walking mode, label quickTravelGarageTaxi).

- `garagePoi` (*table*) : Garage POI (id field).

#### `career_modules_quickTravel.quickTravelToPos(pos, useWalkingMode, reasonString)`

If the player can pay, enables walking mode, safely teleports the vehicle to pos and orients the player toward pos, then debits the price (tags quickTravel, buying).

- `pos` (*vec3*) : Destination.
- `useWalkingMode` (*boolean|nil*) : If true, performs the teleport in walking mode.
- `reasonString` (*string|nil*) : Translation key of the label, ui.career.attributeLog.quickTravelPaid by default.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: career_career. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/quickTravel.lua`.*
