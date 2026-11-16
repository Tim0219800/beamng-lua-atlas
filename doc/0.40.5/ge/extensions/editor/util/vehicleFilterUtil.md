# `editor_util_vehicleFilterUtil`

*File: `lua/ge/extensions/editor/util/vehicleFilterUtil.lua` · VM: Game Engine (GE) · 1653 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/util/vehicleFilterUtil")` (file under extensions/ but not a regular extension)

Mission editor UI element (via editorElementHelper) to define a vehicle filter: a base filter (whiteList/blackList) inherited by "probability settings", a maxVehicles limit, a population attribute, and the options Allow Auxiliary Vehicles / Allow Loaded Trailers. From the filters it generates a list of vehicle options (model, config) using `extensions/util/configListGenerator`. The module returns a constructor: `require('editor/util/vehicleFilterUtil')(element)`.

## Notes

- The `element` stores the state: baseFilter {whiteList, blackList}, probabilitySettings, manualAdditions, manualRemovals, maxVehicles, popAttribute ('Population' by default), allowAuxiliaryVehicles, allowLoadedTrailers, filterByProp, filterUiData, cachedVehicleOptions.
- initialize() scans all models and configs of core_vehicles.getModelsData() to build the available filters. Recognized filters: Drivetrain, Config Type, Body Style, Transmission, Weight, Top Speed, 0-100 km/h, 0-60 mph, Power, Torque, Weight/Power, Years, Value, Brand, Country, Region, Source, Type, Derby Class, Performance Class, Off-Road Score, Propulsion, Fuel Type, Induction Type, Commercial Class.
- Filters of type 'range' (Value, Weight, Top Speed, 0-100 km/h, 0-60 mph, Power, Torque, Weight/Power, Off-Road Score, Years) with min/max; the others are of type 'set' with an additional 'Other...' option. Source only offers Mod/Official.
- The value 'Powerglow' is ignored when collecting property values.
- Old save format (array of configs with model/config): detected in setContainer() and ignored, the settings start empty again.
- init() raises an error (error) if `extensions/util/configListGenerator` cannot be loaded.
- The code comments indicate that the filter configuration is saved in additionalAttributes rather than in ctd.

## Class `C`

Instance bound to an editor `element`.

The module returns a constructor: `local obj = require("editor_util_vehicleFilterUtil")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:draw(ctd, container, labelFn)` | Draws the full filter editor (eligibility options, base filter, probability settings, manual additions/removals, preview of the resulting vehicles). | 785 |
| `C:init(element)` | Constructor: remembers the element and loads (once) the configListGenerator module. | 565 |
| `C:initialize()` | Prepares the filter data only once (filterByProp, filterUiData), initializes baseFilter/probabilitySettings and generates the initial list of vehicle options. | 581 |
| `C:setContainer(ctd, container)` | Restores the filter from ctd[element.fieldName] (deep copy) or the default values, then clears all caches for regeneration. | 727 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/util/vehicleFilterUtil.lua`.*
