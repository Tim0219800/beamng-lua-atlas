# `oneshotRace_oneshotRaceCore`

*File: `lua/ge/extensions/oneshotRace/oneshotRaceCore.lua` · VM: Game Engine (GE) · 283 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `oneshotRace_oneshotRaceCore`: `extensions.load("oneshotRace_oneshotRaceCore")`, then the global `oneshotRace_oneshotRaceCore`

Common core of the "one shot" race wizards: from a descriptor, createConfigurator() returns an object that holds the selection (level, track/"middle", settings, vehicle), summarizes it for the interface (getConfiguration), provides the best scores and starts the race. Used by quickraceConfigurator and lightrunnerConfigurator; a modder can use it to create a new selection wizard.

## Example

```lua
local cfg = require("ge/extensions/oneshotRace/oneshotRaceCore").createConfigurator(descripteur)
cfg.selectLevel("glow_city"); cfg.selectMiddle("glow_city", "maPiste"); cfg.selectVehicle("sbr", "powerglow"); cfg.start()
```

## Notes

- Descriptor contract: logTag (string); gridBackendName (ui_gridSelector backend that is the source of levels and tracks); routeDataKey (key in the router's route data); vehicleRestrictionMode (optional, passed to ui_vehicleSelector_general.setVehicleRestrictionMode during the vehicle route); defaultSettings() -> table; onSelectMiddle(settings, middle); onUpdateSetting(settings, key, value, middle) (optional); extraSettingKeys (optional, keys accepted in addition to those of defaultSettings); buildLevelSummary(level); buildMiddleSummary(middle, selection) (must contain a settings field); getHighscoreKey(selection, middle) -> {levelName, scenarioName, configKey} or nil; start(level, middle, settings, vehicleFile, selection); getDefaultSelection(selector) (optional, called once on first entry into the wizard, returns {levelName, middleName, vehicle = {model, config}} or nil).
- In selectVehicle, an unknown config is replaced by the model's default config (default_pc).
- updateSetting rejects a key that exists neither in the current settings nor in extraSettingKeys. A setting whose initial value is nil (like seed) must therefore be listed in extraSettingKeys.
- start() fails (false) if level, track or vehicle model are not selected.
- The first three route-entry hooks remove any vehicle restriction; only onWizardVehicleRouteEnter applies vehicleRestrictionMode.

## Functions

| Function | Description | Line |
|---|---|---|
| `oneshotRace_oneshotRaceCore.createConfigurator(descriptor)` | Creates a configurator bound to a descriptor. The returned object (Cfg) has: getSelection, selectLevel(levelName), selectMiddle(levelName, middleName), selectVehicle(model, config, additionalData), updateSetting(key, value), toggleShowLapRecords(), getHighscores(), getConfiguration(), onWizardRouteEnter / onWizardLevelRouteEnter / onWizardMiddleRouteEnter / onWizardVehicleRouteEnter(context, toRoute, fromRoute, data), start(). | 78 |

### Parameter details

#### `oneshotRace_oneshotRaceCore.createConfigurator(descriptor)`

Creates a configurator bound to a descriptor. The returned object (Cfg) has: getSelection, selectLevel(levelName), selectMiddle(levelName, middleName), selectVehicle(model, config, additionalData), updateSetting(key, value), toggleShowLapRecords(), getHighscores(), getConfiguration(), onWizardRouteEnter / onWizardLevelRouteEnter / onWizardMiddleRouteEnter / onWizardVehicleRouteEnter(context, toRoute, fromRoute, data), start().

- `descriptor` (*table*) : Descriptor following the contract described in the notes.
- **returns**: table Configurator (Cfg). getConfiguration returns {level, middle, vehicle, highscores, showLapRecords, isDisabled, todOptionKeys}; isDisabled is true until level, track and vehicle are all set.

## Fields

| Field | Type | Description |
|---|---|---|
| `todNames` | string[] | Names of the proposed times of day (night, sunrise, morning, earlyNoon, noon, lateNoon, afternoon, evening, sunset), 1-based (tod = 3 corresponds to morning). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/oneshotRace/oneshotRaceCore.lua`.*
