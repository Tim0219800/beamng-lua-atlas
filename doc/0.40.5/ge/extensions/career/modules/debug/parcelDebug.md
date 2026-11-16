# `career_modules_debug_parcelDebug`

*File: `lua/ge/extensions/career/modules/debug/parcelDebug.lua` · VM: Game Engine (GE) · 341 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_debug_parcelDebug`: `extensions.load("career_modules_debug_parcelDebug")`, then the global `career_modules_debug_parcelDebug`

"Delivery > Parcels" career debug tab. 'Parcel Debug' ImGui window showing, for each delivery facility (all, the nearest within a 50 m radius, or a chosen one), the header, the outgoing (outCargo) and incoming (inCargo) parcels. The entry '> Available parcel per facility' prints to the console the number of available parcels per tier (L1 to L5) and per facility.

## Notes

- Development tool; the delivery modules are referenced in onCareerActivated.
- The helpers drawFacilityHeader/OutCargo/InCargo are reused by cargoFluidDebug and vehOfferDebug.
- The 'auto' mode compares squared distances with the threshold 2500 (i.e. 50 m).

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_debug_parcelDebug.drawDebugFunctions()` | Entry '> Available parcel per facility': counts the non-expired/non-delivered parcels per minimum tier (according to career_modules_delivery_parcelMods.lockedBecauseOfMods) and prints the sorted table. *(internal)* | 33 |
| `career_modules_debug_parcelDebug.drawDebugMenu()` | Draws the 'Parcel Debug' window: delivery time, facility choice (all, auto, or id) then the tables of the selected facilities. *(internal)* | 85 |
| `career_modules_debug_parcelDebug.drawFacilityHeader(facility, outCargo, inCargo, ignoreGenerators)` | Draws the header (table) of a delivery facility: name, storages and generation information. | 136 |
| `career_modules_debug_parcelDebug.drawFacilityInCargo(facility, inCargo)` | Draws the table of a facility's incoming parcels (Id, Name, Slots…). | 272 |
| `career_modules_debug_parcelDebug.drawFacilityOutCargo(facility, outCargo)` | Draws the table of a facility's outgoing parcels (Id, Name…). | 200 |
| `career_modules_debug_parcelDebug.onCareerActivated()` | Hook: stores the delivery modules (parcelManager, cargoScreen, general, generator, progress, vehicleOfferManager). *(internal)* *(hook)* | 12 |

### Parameter details

#### `career_modules_debug_parcelDebug.drawFacilityHeader(facility, outCargo, inCargo, ignoreGenerators)`

Draws the header (table) of a delivery facility: name, storages and generation information.

- `facility` (*table*) : Delivery facility.
- `outCargo` (*table*) : Outgoing parcels of the facility.
- `inCargo` (*table*) : Incoming parcels of the facility.
- `ignoreGenerators` (*boolean|nil*) : Hides generator information if true.

#### `career_modules_debug_parcelDebug.drawFacilityInCargo(facility, inCargo)`

Draws the table of a facility's incoming parcels (Id, Name, Slots…).

- `facility` (*table*) : Delivery facility.
- `inCargo` (*table*) : Incoming parcels.

#### `career_modules_debug_parcelDebug.drawFacilityOutCargo(facility, outCargo)`

Draws the table of a facility's outgoing parcels (Id, Name…).

- `facility` (*table*) : Delivery facility.
- `outCargo` (*table*) : Outgoing parcels.

## Fields

| Field | Type | Description |
|---|---|---|
| `debugName` | string | 'Delivery > Parcels'. |
| `debugOrder` | number | Sort order (10). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/debug/parcelDebug.lua`.*
