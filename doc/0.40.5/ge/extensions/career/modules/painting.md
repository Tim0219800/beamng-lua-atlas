# `career_modules_painting`

*File: `lua/ge/extensions/career/modules/painting.lua` · VM: Game Engine (GE) · 337 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_painting`: `extensions.load("career_modules_painting")`, then the global `career_modules_painting`

Career paint shop, accessible from the garage computer. It prepares the scene (enters the vehicle, freezes it, orbital camera, blocks the walkingMode and bigMap actions), sends the original colors, prices and paint classes to the UI, applies the chosen paints live (setPaints), then charges and saves (apply) or cancels (close/cleanup). Data stays in the vehicle's inventory entry (config.paints and partConditions).

## Notes

- Base price per paint class: factory 600, semiGloss 1000, gloss 1500, semiMetallic 1500, metallic 2500, matte 1800, chrome 3400, custom 4000. Clearcoat: 500 base + clearCoatPolish * 1000. All with canBeNegative = false.
- Physical parameters per class (metallic, roughness): semiGloss 0/0.13, gloss 0/0, semiMetallic 0.5/0.5, metallic 1/0.5, matte 0/0.7, chrome 1/0.
- setPaints fills paints up to 3 entries by repeating the previous one; it applies the paints to the vehicle (core_vehicle_colors.setVehiclePaint) and through partCondition.setPartPaints / setAllPartPaints on the vehicle side.
- apply resets the paint odometer to 0 for all painted parts (code TODO: this resets all 3 paints to 0) and removes the primered flag from the parts.
- start first repairs the vehicle via insurance if the number of broken parts is between 1 and the threshold (getBrokenPartsThreshold), then starts.
- Permissions: the computer function is disabled if the vehicle needs repair, if the starter vehicle is not bought, or if career_modules_permissions denies the painting/vehicleModification tags.

**Dependencies (loaded first):** `career_career`, `gameplay_achievement`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_painting.apply()` | Confirms the selection: checks and pays the total price (tags vehiclePainting, buying), plays the purchase sound, saves the paints into the inventory vehicle, unlocks VEHICLE_MODIFIED, closes the mode and starts the vehicle save. Does nothing if the player cannot pay. | 186 |
| `career_modules_painting.cleanup()` | Restores the state of the vehicle (respawn from the inventory), camera, walking mode and inputs. Does not navigate (the UI router handles it); no effect if painting is not active. | 128 |
| `career_modules_painting.close(_closeMenuAfterSaving)` | Leaves paint mode (cleanup) then reopens the computer menu or closes the menus; if autosave is active and _closeMenuAfterSaving is true, closing the menu waits for onVehicleSaveFinished. | 153 |
| `career_modules_painting.getFactoryPaint()` | Returns the factory paints of the model of the vehicle being painted. | 282 |
| `career_modules_painting.getPaintData()` | Returns the data sent to the UI: colors (original paints of the "body" part or of the first painted part), prices and colorClassData. | 75 |
| `career_modules_painting.getPrimerColor()` | Returns the gray primer paint (baseColor {0.58, 0.58, 0.585}, roughness 0.475, clearcoat 0). | 45 |
| `career_modules_painting.onComputerAddFunctions(menuData, computerFunctions)` | Computer hook: adds the "painting" function (order 15) for each vehicle present in the garage, with any disabling reasons. *(internal)* *(hook)* | 215 |
| `career_modules_painting.onRouteMount(context, toRoute, fromRoute, data)` | UI router lifecycle: sends the paint data once the view is mounted. *(internal)* *(hook)* | 296 |
| `career_modules_painting.onUIOpened()` | Hook called when the UI opens: enters the vehicle (with a one-frame delay), freezes it, sets the orbital camera (rotation 145, -15) and offsets the framing; emits onVehiclePaintingUiOpened. *(internal)* *(hook)* | 300 |
| `career_modules_painting.onVehicleSaveFinished()` | Hook called when the vehicle save is finished: closes the menu if close() requested it. *(internal)* *(hook)* | 165 |
| `career_modules_painting.sendPaintingDataToUI()` | Sends the paint data and the factory paint to the UI (guihooks paintingData) if painting is active. | 288 |
| `career_modules_painting.setPaints(paints, paintOptions, partName)` | Records the player's choice, sends the cart price to the UI (sendPaintingShoppingCartData) and applies the paints to the vehicle (all parts, or only partName). | 258 |
| `career_modules_painting.start(_inventoryId, _originComputerId)` | Opens paint mode for an inventory vehicle (the nearest garage one if inventoryId is nil). Does nothing if the vehicle has not spawned in the world. Goes through an insurance repair first if needed. | 105 |

### Parameter details

#### `career_modules_painting.close(_closeMenuAfterSaving)`

Leaves paint mode (cleanup) then reopens the computer menu or closes the menus; if autosave is active and _closeMenuAfterSaving is true, closing the menu waits for onVehicleSaveFinished.

- `_closeMenuAfterSaving` (*boolean|nil*) : Wait for the save to finish before closing the menu.

#### `career_modules_painting.getFactoryPaint()`

Returns the factory paints of the model of the vehicle being painted.

- **returns**: table Model paints ({} if none).

#### `career_modules_painting.getPaintData()`

Returns the data sent to the UI: colors (original paints of the "body" part or of the first painted part), prices and colorClassData.

- **returns**: {colors: table|nil, prices: table, colorClassData: table} Paint data.

#### `career_modules_painting.getPrimerColor()`

Returns the gray primer paint (baseColor {0.58, 0.58, 0.585}, roughness 0.475, clearcoat 0).

- **returns**: table Paint table.

#### `career_modules_painting.onComputerAddFunctions(menuData, computerFunctions)`

Computer hook: adds the "painting" function (order 15) for each vehicle present in the garage, with any disabling reasons.

- `menuData` (*table*) : Menu data (computerFacility, vehiclesInGarage, hasBoughtStarterVehicle).
- `computerFunctions` (*table*) : Computer functions to fill (vehicleSpecific[inventoryId]).

#### `career_modules_painting.onRouteMount(context, toRoute, fromRoute, data)`

UI router lifecycle: sends the paint data once the view is mounted.

- `context` (*any*) : Router context.
- `toRoute` (*any*) : Target route.
- `fromRoute` (*any*) : Previous route.
- `data` (*table*) : routeData.

#### `career_modules_painting.setPaints(paints, paintOptions, partName)`

Records the player's choice, sends the cart price to the UI (sendPaintingShoppingCartData) and applies the paints to the vehicle (all parts, or only partName).

- `paints` (*table[]*) : Up to 3 paints.
- `paintOptions` (*table[]*) : Per-paint options (paintClass, clearCoat, clearCoatPolish) used for the price calculation.
- `partName` (*string|nil*) : Target part; all parts if nil.

#### `career_modules_painting.start(_inventoryId, _originComputerId)`

Opens paint mode for an inventory vehicle (the nearest garage one if inventoryId is nil). Does nothing if the vehicle has not spawned in the world. Goes through an insurance repair first if needed.

- `_inventoryId` (*integer|nil*) : Inventory id of the vehicle.
- `_originComputerId` (*string|nil*) : Id of the originating computer; if provided, navigates to career.computer.painting.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: career_career, gameplay_achievement. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onVehiclePaintingUiOpened`

**UI events (guihooks.trigger):** `onCareerPaintingStarted`, `paintingData`, `sendPaintingShoppingCartData`

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/painting.lua`.*
