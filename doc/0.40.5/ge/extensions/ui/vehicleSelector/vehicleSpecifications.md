# `ui_vehicleSelector_vehicleSpecifications`

*File: `lua/ge/extensions/ui/vehicleSelector/vehicleSpecifications.lua` · VM: Game Engine (GE) · 553 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_vehicleSelector_vehicleSpecifications`: `extensions.load("ui_vehicleSelector_vehicleSpecifications")`, then the global `ui_vehicleSelector_vehicleSpecifications`

Prepares the details panel of a selector vehicle: specification lists (performance, others), general specifications, icons (transmission, drivetrain, induction, fuel), provenance labels, available paints and header. Values are converted to the units chosen by the player (settings uiUnitLength, uiUnitWeight, uiUnitPower, uiUnitTorque). A modder finds here the property keys read from the vehicles' JSON info files and their units.

## Notes

- Storage units read from the vehicle data: speed in m/s, power in PS, torque in Nm, weight in kg, distance in m, weight/power ratio in kg/PS, monetary value in dollars.
- Performance specifications (imperial system): Power, Torque, Weight, Top Speed, 0-60 mph, 0-100 mph, 0-200 mph, 60-100 mph, 60-0 mph, Braking G, Weight/Power, Performance Class, Off-Road Score. In metric, the times become 0-100 km/h, 0-200 km/h, 0-300 km/h, 100-200 km/h, 100-0 km/h. "Other" group: Type, Config Type, Transmission, Derby Class, Drivetrain, Propulsion, Fuel Type, Induction Type, Commercial Class. General specifications: Years, Country, Power, Weight, Value.
- The choice of metric or imperial specifications is based on the uiUnitLength setting.
- A missing field is simply ignored (makeSpec does not add it). Each specification indicates isFromConfig (the value comes from the config and not the model).
- The returned paint format contains multiPaintSetups (those of the config or forAllConfigs), factoryPaints (sorted by name) and allowPaintSelection.
- Bug: in valueToUnit, the test `not type(value) == 'number'` is always false (precedence of `not`): non-numeric values are not guarded and would crash string.format.
- In getDetails, `local type` shadows the global function type() after its declaration (harmless here, the function is no longer called afterwards).
- For 'settings/default.pc' (legacy config), the panel is replaced by a "Legacy default.pc" title, with no specifications or paints.
- Emits the hook onVehicleSelectorViewDetails(modelKey, configKey) on each getDetails call.

**Dependencies (loaded first):** `core_locales`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_vehicleSelector_vehicleSpecifications.addIconTags(modelDetails, configDetails)` | Computes the tag icons of a config: drivetrain (AWD, RWD, FWD, 4WD or NxM format), transmission, induction type (NA, Turbo, SC, with N2O) and fuel (battery, gasoline, diesel). | 307 |
| `ui_vehicleSelector_vehicleSpecifications.getDetails(itemDetails)` | Builds all the data of a vehicle's details panel: headerTitle, brand, configDetails, isFavourite, tags, isStandalonePC, specificationsList, generalSpecs, iconTags, paints and preview. With the includeDevInfo option, adds a "Dev Info" group (files, mod, regions, auxiliary). | 359 |
| `ui_vehicleSelector_vehicleSpecifications.makeSpec(modelDetails, configDetails, key, list)` | Adds a specification {key, value, isFromConfig} to a list: value read from the config or failing that the model, formatted according to its unit. Does nothing if the value is absent. | 285 |
| `ui_vehicleSelector_vehicleSpecifications.propTitle(key)` | Returns the translated name of a property (key 'ui.vehicles.propName.<key>'), or the key itself if absent. | 4 |
| `ui_vehicleSelector_vehicleSpecifications.propValue(propName, key)` | Returns the translated value of a property (prefix 'ui.vehicles.propValue.<property>.'), falling back to the raw value. | 5 |

### Parameter details

#### `ui_vehicleSelector_vehicleSpecifications.addIconTags(modelDetails, configDetails)`

Computes the tag icons of a config: drivetrain (AWD, RWD, FWD, 4WD or NxM format), transmission, induction type (NA, Turbo, SC, with N2O) and fuel (battery, gasoline, diesel).

- `modelDetails` (*table*) : Model data.
- `configDetails` (*table*) : Config data.
- **returns**: table[] List of {icon|iconText, label}.

#### `ui_vehicleSelector_vehicleSpecifications.getDetails(itemDetails)`

Builds all the data of a vehicle's details panel: headerTitle, brand, configDetails, isFavourite, tags, isStandalonePC, specificationsList, generalSpecs, iconTags, paints and preview. With the includeDevInfo option, adds a "Dev Info" group (files, mod, regions, auxiliary).

- `itemDetails` (*table*) : Table {model, config}.
- **returns**: table Details data for the UI.

#### `ui_vehicleSelector_vehicleSpecifications.makeSpec(modelDetails, configDetails, key, list)`

Adds a specification {key, value, isFromConfig} to a list: value read from the config or failing that the model, formatted according to its unit. Does nothing if the value is absent.

- `modelDetails` (*table*) : Model data.
- `configDetails` (*table*) : Config data.
- `key` (*string*) : Property to read.
- `list` (*table[]*) : List to fill.

#### `ui_vehicleSelector_vehicleSpecifications.propTitle(key)`

Returns the translated name of a property (key 'ui.vehicles.propName.<key>'), or the key itself if absent.

- `key` (*string*) : Property name (Top Speed, Power...).
- **returns**: string Label.

#### `ui_vehicleSelector_vehicleSpecifications.propValue(propName, key)`

Returns the translated value of a property (prefix 'ui.vehicles.propValue.<property>.'), falling back to the raw value.

- `propName` (*string*) : Property name.
- `key` (*string*) : Raw value.
- **returns**: string Translated value.

## Fields

| Field | Type | Description |
|---|---|---|
| `CONVERSIONS` | table<string, number> | Conversion constants: MPS_TO_KMH (3.6), MPS_TO_MPH, BHP_TO_PS, PS_TO_BHP, PS_TO_KW, NM_TO_LBFT, KG_TO_LB, M_TO_FT, KGPS_TO_LBBHP. |
| `dependencies` | string[] | core_locales. |
| `specificationSetup` | table[] | Specification groups {label, aggregatesImperial, aggregatesMetric, aggregates}: "Performance" and "Other". |
| `valueToUnit` | table<string, function> | Value formatters by unit type: value, years, money, seconds, g, kmh, mph, torque, power, speed, weightPower, weight, distanceMinor. Signature (value, modelDetails, configDetails, propName) -> string or list of {text, italic}. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onVehicleSelectorViewDetails`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/vehicleSelector/vehicleSpecifications.lua`.*
