---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehiclePaints.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_vehiclePaints`: vehicle paint management. Reads the paint library files (paints, multiPaintSetups, paintCollections) through core_vehicles, resolves the paints declared by each model and each config (`setupPaints`, called by core_vehicles.getModel), compares the paints of a .pc with those of the model/library, and draws random paints according to the randomPaintDistribution / randomMultiPaintDistribution distributions. A paint is a table {baseColor = {r,g,b,a}, metallic, roughness, clearcoat, clearcoatRoughness, name, class...}.
--- Access: extension `core_vehiclePaints`: `extensions.load("core_vehiclePaints")`, then the global `core_vehiclePaints`
---@class core_vehiclePaints
core_vehiclePaints = {}

--- Like writePcPaintsAsInfoPaints, but reuses an existing reference (model paint, library paint, or equivalent multiPaintSetup found by signature) when one exists, instead of duplicating the paint.
---Source: lua/ge/extensions/core/vehiclePaints.lua:1069
---@param pcData table content of the .pc
---@param infoData table info content to complete (defaultMultiPaintSetup)
---@param configName string config name
---@param modelName string model, to look up its paints
function core_vehiclePaints.convertPcPaintsToInfoPaints(pcData, infoData, configName, modelName) end

--- Generates a random multiPaintSetup by drawing three single paints (the distribution's multiPaintSetups are ignored).
---Source: lua/ge/extensions/core/vehiclePaints.lua:1215
---@param model_key string model
---@param config_key string config
---@param avoidDuplicates boolean|nil if true, a paint already drawn cannot be drawn again
---@return table  {paintName1, paintName2, paintName3} ('White' as a fallback)
function core_vehiclePaints.createRandomMultiPaintSetup(model_key, config_key, avoidDuplicates) end

--- Randomly draws a paint entry according to the config's probabilities (or the model's by default). The helper is built on first request.
---Source: lua/ge/extensions/core/vehiclePaints.lua:1169
---@param model_key string model name
---@param config_key string config key (may have no config of its own: then the model is used)
---@return table|nil  {type ('paint' or multiPaintSetup), paintName1, paintName2, paintName3, probability}
function core_vehiclePaints.getRandomPaints(model_key, config_key) end

--- Draws paints for an existing vehicle, based on its model and config (extracted from partConfig).
---Source: lua/ge/extensions/core/vehiclePaints.lua:1195
---@param vehId integer|nil vehicle identifier
---@return string[]  {name1, name2, name3} usable by core_vehicle_manager.setVehicleColorsNames; {'White','White','White'} if the vehicle or config is not found
function core_vehiclePaints.getRandomPaintsByVehicle(vehId) end

--- Signature of a set of 3 paints: {"paint1":..,"paint2":..,"paint3":..} where each element is a paintSignature.
---Source: lua/ge/extensions/core/vehiclePaints.lua:19
---@param multiPaintSetup table table with paint1, paint2, paint3 (full paints)
---@return string  signature
function core_vehiclePaints.multiPaintSetupSignature(multiPaintSetup) end

--- Canonical JSON string of a paint ({baseColor, clearcoat, clearcoatRoughness, metallic, roughness}, 5 decimals) used to compare two paints.
---Source: lua/ge/extensions/core/vehiclePaints.lua:17
---@param paint table full paint
---@return string  signature
function core_vehiclePaints.paintSignature(paint) end

--- Prepares the paints of a model and its configs: collects direct paints, libraryPaints, paintCollections, resolves multiPaintSetups and default paints (model first, then configs) and finalizes the classes. Modifies `model` and `configs` in place. Called by core_vehicles.getModel.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehiclePaints.lua:351
---@param model table model table (model.key, model.paints...)
---@param configs table<string, table> configs of the model
function core_vehiclePaints.setupPaints(model, configs) end

--- Test tool: draws `amount` paints and logs (level I) the resulting distribution.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehiclePaints.lua:1266
---@param model_key string model
---@param config_key string config
---@param amount integer number of draws
function core_vehiclePaints.testRandomPaint(model_key, config_key, amount) end

--- Analyzes the paints of a .pc: for each of the 3, indicates whether it matches a model paint, a library paint or is custom, and whether the set matches a known multiPaintSetup.
---Source: lua/ge/extensions/core/vehiclePaints.lua:1143
---@param pcData table content of the .pc
---@param modelName string model name
---@return table  {paints = {{index, source ('model'|'library'|'custom'), modelPaintName, libraryPaintId, libraryPaintName, resolvedReference}}, multiPaintSetup = {found, source, name, id}, defaultStorageMode ('individualPaints'|'multiPaintSetup'), canOverridePaints, modelDefaultColors, modelDefaultMultiPaintSetup}
function core_vehiclePaints.validatePcPaints(pcData, modelName) end

--- Writes the paints of a .pc as `defaultMultiPaintSetup` of an info file, with explicit paints (class 'hidden', named '<config> Paint N'). Modifies infoData.
---Source: lua/ge/extensions/core/vehiclePaints.lua:1055
---@param pcData table content of the .pc (paints field)
---@param infoData table info content to complete
---@param configName string config name
function core_vehiclePaints.writePcPaintsAsInfoPaints(pcData, infoData, configName) end

