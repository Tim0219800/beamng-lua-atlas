---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/vehicleSelector/vehicleSpecifications.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Prepares the details panel of a selector vehicle: specification lists (performance, others), general specifications, icons (transmission, drivetrain, induction, fuel), provenance labels, available paints and header. Values are converted to the units chosen by the player (settings uiUnitLength, uiUnitWeight, uiUnitPower, uiUnitTorque). A modder finds here the property keys read from the vehicles' JSON info files and their units.
--- Access: extension `ui_vehicleSelector_vehicleSpecifications`: `extensions.load("ui_vehicleSelector_vehicleSpecifications")`, then the global `ui_vehicleSelector_vehicleSpecifications`
---@class ui_vehicleSelector_vehicleSpecifications
---@field CONVERSIONS table<string, number> Conversion constants: MPS_TO_KMH (3.6), MPS_TO_MPH, BHP_TO_PS, PS_TO_BHP, PS_TO_KW, NM_TO_LBFT, KG_TO_LB, M_TO_FT, KGPS_TO_LBBHP.
---@field dependencies string[] core_locales.
---@field specificationSetup table[] Specification groups {label, aggregatesImperial, aggregatesMetric, aggregates}: "Performance" and "Other".
---@field valueToUnit table<string, function> Value formatters by unit type: value, years, money, seconds, g, kmh, mph, torque, power, speed, weightPower, weight, distanceMinor. Signature (value, modelDetails, configDetails, propName) -> string or list of {text, italic}.
ui_vehicleSelector_vehicleSpecifications = {}

--- Computes the tag icons of a config: drivetrain (AWD, RWD, FWD, 4WD or NxM format), transmission, induction type (NA, Turbo, SC, with N2O) and fuel (battery, gasoline, diesel).
---Source: lua/ge/extensions/ui/vehicleSelector/vehicleSpecifications.lua:307
---@param modelDetails table Model data.
---@param configDetails table Config data.
---@return table[]  List of {icon|iconText, label}.
function ui_vehicleSelector_vehicleSpecifications.addIconTags(modelDetails, configDetails) end

--- Builds all the data of a vehicle's details panel: headerTitle, brand, configDetails, isFavourite, tags, isStandalonePC, specificationsList, generalSpecs, iconTags, paints and preview. With the includeDevInfo option, adds a "Dev Info" group (files, mod, regions, auxiliary).
---Source: lua/ge/extensions/ui/vehicleSelector/vehicleSpecifications.lua:359
---@param itemDetails table Table {model, config}.
---@return table  Details data for the UI.
function ui_vehicleSelector_vehicleSpecifications.getDetails(itemDetails) end

--- Adds a specification {key, value, isFromConfig} to a list: value read from the config or failing that the model, formatted according to its unit. Does nothing if the value is absent.
---Source: lua/ge/extensions/ui/vehicleSelector/vehicleSpecifications.lua:285
---@param modelDetails table Model data.
---@param configDetails table Config data.
---@param key string Property to read.
---@param list table[] List to fill.
function ui_vehicleSelector_vehicleSpecifications.makeSpec(modelDetails, configDetails, key, list) end

--- Returns the translated name of a property (key 'ui.vehicles.propName.<key>'), or the key itself if absent.
---Source: lua/ge/extensions/ui/vehicleSelector/vehicleSpecifications.lua:4
---@param key string Property name (Top Speed, Power...).
---@return string  Label.
function ui_vehicleSelector_vehicleSpecifications.propTitle(key) end

--- Returns the translated value of a property (prefix 'ui.vehicles.propValue.<property>.'), falling back to the raw value.
---Source: lua/ge/extensions/ui/vehicleSelector/vehicleSpecifications.lua:5
---@param propName string Property name.
---@param key string Raw value.
---@return string  Translated value.
function ui_vehicleSelector_vehicleSpecifications.propValue(propName, key) end

