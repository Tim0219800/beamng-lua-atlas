# `career_modules_rentals`

*File: `lua/ge/extensions/career/modules/rentals.lua` · VM: Game Engine (GE) · 106 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_rentals`: `extensions.load("career_modules_rentals")`, then the global `career_modules_rentals`

Unfinished draft of a vehicle rental system in career: most functions contain only comments, and the hooks (onExtensionLoaded, onSaveCurrentProfile, onUpdate) are commented out. Only isRenting is exported.

## Notes

- Inactive code: currRentalVeh is never assigned (beginRenting declares a local variable of the same name and uses an undefined shopId), so isRenting always returns false.
- playAbandonTimer and trackAbandonVeh use currAbandonTime while the declared variable is named currAbandonTimer: bug if the code were enabled.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_rentals.isRenting()` | UI API: indicates whether a rental vehicle is in progress (currRentalVeh not nil). | 42 |

### Parameter details

#### `career_modules_rentals.isRenting()`

UI API: indicates whether a rental vehicle is in progress (currRentalVeh not nil).

- **returns**: boolean Always false as it stands.

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/rentals.lua`.*
