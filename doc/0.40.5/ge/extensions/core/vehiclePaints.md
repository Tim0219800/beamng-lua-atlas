# `core_vehiclePaints`

*File: `lua/ge/extensions/core/vehiclePaints.lua` · VM: Game Engine (GE) · 1292 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_vehiclePaints`: `extensions.load("core_vehiclePaints")`, then the global `core_vehiclePaints`

GE extension `core_vehiclePaints`: vehicle paint management. Reads the paint library files (paints, multiPaintSetups, paintCollections) through core_vehicles, resolves the paints declared by each model and each config (`setupPaints`, called by core_vehicles.getModel), compares the paints of a .pc with those of the model/library, and draws random paints according to the randomPaintDistribution / randomMultiPaintDistribution distributions. A paint is a table {baseColor = {r,g,b,a}, metallic, roughness, clearcoat, clearcoatRoughness, name, class...}.

## Example

```lua
-- Random paints for a config
local r = core_vehiclePaints.getRandomPaints('etk800', '854_190d_A')
print(r.type, r.paintName1, r.paintName2, r.paintName3)
-- Three paint names for an existing vehicle
local names = core_vehiclePaints.getRandomPaintsByVehicle(be:getPlayerVehicleID(0))
core_vehicle_manager.setVehicleColorsNames(be:getPlayerVehicleID(0), names)
```

## Notes

- Library paints are keyed by id; the special paint '_missing_paint_' (gray 0.5) serves as a fallback value. Entries marked `_official` come from official content files (Author = 'BeamNG' or official path).
- getRandomPaintsByVehicle reads `obj.jbeam` (lowercase) whereas the rest of the code uses `veh.JBeam`; depending on the case the engine accepts for this field, the model may be nil, in which case the function returns {'White','White','White'} with a warning.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_vehiclePaints.convertPcPaintsToInfoPaints(pcData, infoData, configName, modelName)` | Like writePcPaintsAsInfoPaints, but reuses an existing reference (model paint, library paint, or equivalent multiPaintSetup found by signature) when one exists, instead of duplicating the paint. | 1069 |
| `core_vehiclePaints.createRandomMultiPaintSetup(model_key, config_key, avoidDuplicates)` | Generates a random multiPaintSetup by drawing three single paints (the distribution's multiPaintSetups are ignored). | 1215 |
| `core_vehiclePaints.getRandomPaints(model_key, config_key)` | Randomly draws a paint entry according to the config's probabilities (or the model's by default). The helper is built on first request. | 1169 |
| `core_vehiclePaints.getRandomPaintsByVehicle(vehId)` | Draws paints for an existing vehicle, based on its model and config (extracted from partConfig). | 1195 |
| `core_vehiclePaints.multiPaintSetupSignature(multiPaintSetup)` | Signature of a set of 3 paints: {"paint1":..,"paint2":..,"paint3":..} where each element is a paintSignature. | 19 |
| `core_vehiclePaints.paintSignature(paint)` | Canonical JSON string of a paint ({baseColor, clearcoat, clearcoatRoughness, metallic, roughness}, 5 decimals) used to compare two paints. | 17 |
| `core_vehiclePaints.setupPaints(model, configs)` | Prepares the paints of a model and its configs: collects direct paints, libraryPaints, paintCollections, resolves multiPaintSetups and default paints (model first, then configs) and finalizes the classes. Modifies `model` and `configs` in place. Called by core_vehicles.getModel. *(internal)* | 351 |
| `core_vehiclePaints.testRandomPaint(model_key, config_key, amount)` | Test tool: draws `amount` paints and logs (level I) the resulting distribution. *(internal)* | 1266 |
| `core_vehiclePaints.validatePcPaints(pcData, modelName)` | Analyzes the paints of a .pc: for each of the 3, indicates whether it matches a model paint, a library paint or is custom, and whether the set matches a known multiPaintSetup. | 1143 |
| `core_vehiclePaints.writePcPaintsAsInfoPaints(pcData, infoData, configName)` | Writes the paints of a .pc as `defaultMultiPaintSetup` of an info file, with explicit paints (class 'hidden', named '<config> Paint N'). Modifies infoData. | 1055 |

### Parameter details

#### `core_vehiclePaints.convertPcPaintsToInfoPaints(pcData, infoData, configName, modelName)`

Like writePcPaintsAsInfoPaints, but reuses an existing reference (model paint, library paint, or equivalent multiPaintSetup found by signature) when one exists, instead of duplicating the paint.

- `pcData` (*table*) : content of the .pc
- `infoData` (*table*) : info content to complete (defaultMultiPaintSetup)
- `configName` (*string*) : config name
- `modelName` (*string*) : model, to look up its paints

#### `core_vehiclePaints.createRandomMultiPaintSetup(model_key, config_key, avoidDuplicates)`

Generates a random multiPaintSetup by drawing three single paints (the distribution's multiPaintSetups are ignored).

- `model_key` (*string*) : model
- `config_key` (*string*) : config
- `avoidDuplicates` (*boolean|nil*) : if true, a paint already drawn cannot be drawn again
- **returns**: table {paintName1, paintName2, paintName3} ('White' as a fallback)

#### `core_vehiclePaints.getRandomPaints(model_key, config_key)`

Randomly draws a paint entry according to the config's probabilities (or the model's by default). The helper is built on first request.

- `model_key` (*string*) : model name
- `config_key` (*string*) : config key (may have no config of its own: then the model is used)
- **returns**: table|nil {type ('paint' or multiPaintSetup), paintName1, paintName2, paintName3, probability}

#### `core_vehiclePaints.getRandomPaintsByVehicle(vehId)`

Draws paints for an existing vehicle, based on its model and config (extracted from partConfig).

- `vehId` (*integer|nil*) : vehicle identifier
- **returns**: string[] {name1, name2, name3} usable by core_vehicle_manager.setVehicleColorsNames; {'White','White','White'} if the vehicle or config is not found

#### `core_vehiclePaints.multiPaintSetupSignature(multiPaintSetup)`

Signature of a set of 3 paints: {"paint1":..,"paint2":..,"paint3":..} where each element is a paintSignature.

- `multiPaintSetup` (*table*) : table with paint1, paint2, paint3 (full paints)
- **returns**: string signature

#### `core_vehiclePaints.paintSignature(paint)`

Canonical JSON string of a paint ({baseColor, clearcoat, clearcoatRoughness, metallic, roughness}, 5 decimals) used to compare two paints.

- `paint` (*table*) : full paint
- **returns**: string signature

#### `core_vehiclePaints.setupPaints(model, configs)`

Prepares the paints of a model and its configs: collects direct paints, libraryPaints, paintCollections, resolves multiPaintSetups and default paints (model first, then configs) and finalizes the classes. Modifies `model` and `configs` in place. Called by core_vehicles.getModel.

- `model` (*table*) : model table (model.key, model.paints...)
- `configs` (*table<string, table>*) : configs of the model

#### `core_vehiclePaints.testRandomPaint(model_key, config_key, amount)`

Test tool: draws `amount` paints and logs (level I) the resulting distribution.

- `model_key` (*string*) : model
- `config_key` (*string*) : config
- `amount` (*integer*) : number of draws

#### `core_vehiclePaints.validatePcPaints(pcData, modelName)`

Analyzes the paints of a .pc: for each of the 3, indicates whether it matches a model paint, a library paint or is custom, and whether the set matches a known multiPaintSetup.

- `pcData` (*table*) : content of the .pc
- `modelName` (*string*) : model name
- **returns**: table {paints = {{index, source ('model'|'library'|'custom'), modelPaintName, libraryPaintId, libraryPaintName, resolvedReference}}, multiPaintSetup = {found, source, name, id}, defaultStorageMode ('individualPaints'|'multiPaintSetup'), canOverridePaints, modelDefaultColors, modelDefaultMultiPaintSetup}

#### `core_vehiclePaints.writePcPaintsAsInfoPaints(pcData, infoData, configName)`

Writes the paints of a .pc as `defaultMultiPaintSetup` of an info file, with explicit paints (class 'hidden', named '<config> Paint N'). Modifies infoData.

- `pcData` (*table*) : content of the .pc (paints field)
- `infoData` (*table*) : info content to complete
- `configName` (*string*) : config name

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/vehiclePaints.lua`.*
