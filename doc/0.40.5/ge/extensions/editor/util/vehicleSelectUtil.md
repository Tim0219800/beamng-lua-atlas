# `editor_util_vehicleSelectUtil`

*File: `lua/ge/extensions/editor/util/vehicleSelectUtil.lua` · VM: Game Engine (GE) · 491 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/util/vehicleSelectUtil")` (file under extensions/ but not a regular extension)

Editor imgui utility class: a cascading vehicle selector Type > Model > Config, optionally with up to 3 paints (paintNameKeys paintName/paintName2/paintName3) and a custom config file (.pc). The module returns a constructor: `require('editor/util/vehicleSelectUtil')(name, data)`. Used for example by the imVehicleSelect flowgraph node, multiSpawnManager, trafficManager and the mission editor.

## Example

```lua
local sel = require('editor/util/vehicleSelectUtil')('Mon véhicule')
sel:setOptions({enablePaints = true, paintLayers = 2})
-- in an imgui callback:
local reason = sel:widget() -- 'type' | 'model' | 'config' | 'paintName' | 'customConfig' | nil
if reason then print(sel.model, sel.config, sel.configPath) end
```

## Notes

- widget() returns the reason for the change (updateReason) or nil: 'type', 'model', 'config', 'paintName'/'paintName2'/'paintName3' (field key) or 'customConfig'.
- Result read from the instance fields: model (key), config (key), configPath ('vehicles/<model>/<config>.pc' or custom path), paintName, paintName2, paintName3, vehType, customConfigActive.
- Default allowed types: Car, Truck, Automation, Trailer, Prop, Utility, Traffic, Unknown, Any; if allowedTypes has only one element, the Type combo is disabled. Allowed config subtypes: PropTraffic, PropParked.
- If only one model (or one config) is available, it is selected automatically and the combo is grayed out.
- setModelListByField and setConfigListByField are empty stubs (marked TODO): they do nothing.
- fetchData sets self.modelName = dumps(Name), so the name contains quotes as long as it comes from this path.
- In the model loop, if a model has no Name, `label` is nil and the concatenation raises an error.

## Class `C`

Selector instance. Option fields: allowedTypes, allowedSubtypes, modelBlacklist (table key->true), configBlacklist (model -> {configKey = true}), enableConfigs (true), enablePaints (false), enableCustomConfig (false), paintLayers (3), columnWidth (80 by default, multiplied by im.uiscale).

The module returns a constructor: `local obj = require("editor_util_vehicleSelectUtil")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:fetchData()` | Loads if needed the lists of models (filtered by type and blacklist, sorted by name), configs (filtered by blacklist and subtypes) and paints of the current model. | 155 |
| `C:getPaintPtr(paintTbl)` | Converts a paint (table {r,g,b,a}, or table with baseColor as an array or as x/y/z/w) into a 4-component imgui float array; white by default. | 135 |
| `C:init(name, data)` | Constructor: creates a unique id, resets selections and options, then applies `data` if given. | 19 |
| `C:onActivate()` | Empty edit mode callback. | 479 |
| `C:onDeactivate()` | Empty edit mode callback. | 482 |
| `C:resetConfig()` | Clears the configs, the chosen config and the custom config. | 89 |
| `C:resetModel()` | Clears the model list and the chosen model. | 83 |
| `C:resetOptions()` | Resets the options to default (allowed types, empty blacklists, enableConfigs true, enablePaints false, 3 paint layers). | 115 |
| `C:resetPaint()` | Clears the available and chosen paints. | 99 |
| `C:resetSelections()` | Clears type, model, config and paints. | 107 |
| `C:setConfig(config)` | Directly sets the config by its key (the model must already be set); computes configName and configPath. Sets config back to nil if the config does not exist. | 55 |
| `C:setConfigListByField(model, key, value, disallow)` | Stub (TODO): should filter the configs of a model by field/value; does nothing. | 131 |
| `C:setModel(model)` | Directly sets the model by its key; fills vehType and modelName from core_vehicles.getModel, or sets model back to nil if unknown. | 42 |
| `C:setModelListByField(key, value, disallow)` | Stub (TODO): should filter models by field/value; does nothing. | 127 |
| `C:setOptions(data)` | Copies the options enableConfigs, enablePaints, enableCustomConfig, paintLayers and columnWidth present (truthy) in data to the instance. | 73 |
| `C:widget()` | Draws the interface (combos Type, Model, Config, Paint 1-3, custom config field) and applies the cascading resets. | 206 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/util/vehicleSelectUtil.lua`.*
