# `freeroam_facilities_fuelPrice`

*File: `lua/ge/extensions/freeroam/facilities/fuelPrice.lua` · VM: Game Engine (GE) · 177 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `freeroam_facilities_fuelPrice`: `extensions.load("freeroam_facilities_fuelPrice")`, then the global `freeroam_facilities_fuelPrice`

Generates the fuel prices of the level's gas stations and displays them on the scene's 7-segment display signs. When the level starts, for each station that has `prices`, computes a price (base + randomness) and replaces the display objects with TSStatic copies of the digits (`art/shapes/quarter_mile_display/display_<c>.dae`). Unloads itself if there is no price data. Global: freeroam_facilities_fuelPrice.

## Notes

- Price = priceBaseline + priceRandomnessGain * (random() - priceRandomnessBias) when gain and bias are provided. A `disabled` fuel shows "-" on the displays.
- getFuelPrice always returns the metric price (per liter); for display, if the level's local unit (localUnits) is gallonUS, the price is multiplied by 3.78541. The price is formatted "%.3f" without the dot; us_9_10_tax forces the 4th digit to 9.
- The original display objects are hidden; the copies are in the `fuelPrice_localCopies` SimGroup (not saved).
- restoreSign(hide) deletes the copies and puts the original shapes back (display_8.dae); calls pairs(cachedPriceData) without a nil test, so errors if the prices were never generated.
- In _set7CharDisplay, the digit is composed with the character from the price string; if an object is not found, the error is logged (tag setPrices).

## Functions

| Function | Description | Line |
|---|---|---|
| `freeroam_facilities_fuelPrice.getFuelPrice(stationId, fuelType)` | Current price (metric unit) of a fuel at a station. | 99 |
| `freeroam_facilities_fuelPrice.onClientStartMission(levelPath)` | Hook at level start: calls setDisplayPrices; if there is no price data, unloads the extension. *(internal)* *(hook)* | 108 |
| `freeroam_facilities_fuelPrice.onDeserialized(data)` | Called after a Lua reload: restores the prices if in the same level, otherwise regenerates the prices (onClientStartMission). *(internal)* *(hook)* | 130 |
| `freeroam_facilities_fuelPrice.onSerialize()` | Called before a Lua reload: saves cachedPriceData, the current level and the local unit. *(internal)* *(hook)* | 122 |
| `freeroam_facilities_fuelPrice.restoreSign(hide)` | Deletes the digit copies and restores the original signs (display 8), optionally hidden. Useful before moving a sign in the editor. | 141 |
| `freeroam_facilities_fuelPrice.setDisplayPrices()` | Computes the prices of all the stations of the current level and updates the displays. | 29 |

### Parameter details

#### `freeroam_facilities_fuelPrice.getFuelPrice(stationId, fuelType)`

Current price (metric unit) of a fuel at a station.

- `stationId` (*string*) : Station id.
- `fuelType` (*string*) : Energy type (e.g. gasoline, diesel).
- **returns**: number|nil Price or nil.

#### `freeroam_facilities_fuelPrice.onClientStartMission(levelPath)`

Hook at level start: calls setDisplayPrices; if there is no price data, unloads the extension.

- `levelPath` (*string*) : Level path (unused).

#### `freeroam_facilities_fuelPrice.onDeserialized(data)`

Called after a Lua reload: restores the prices if in the same level, otherwise regenerates the prices (onClientStartMission).

- `data` (*table*) : Table returned by onSerialize.

#### `freeroam_facilities_fuelPrice.onSerialize()`

Called before a Lua reload: saves cachedPriceData, the current level and the local unit.

- **returns**: table {cachedPriceData, currentLevel, levelUnit}

#### `freeroam_facilities_fuelPrice.restoreSign(hide)`

Deletes the digit copies and restores the original signs (display 8), optionally hidden. Useful before moving a sign in the editor.

- `hide` (*boolean|nil*) : true = hide the original signs.

#### `freeroam_facilities_fuelPrice.setDisplayPrices()`

Computes the prices of all the stations of the current level and updates the displays.

- **returns**: boolean true if at least one price was generated.

## Calls into the engine (C++)

- `obj:` `getScale`, `getTransform`, `postApply`, `preApply`, `setField`, `setHidden`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/freeroam/facilities/fuelPrice.lua`.*
