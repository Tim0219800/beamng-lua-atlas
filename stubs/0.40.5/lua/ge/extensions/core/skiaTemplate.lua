---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/skiaTemplate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Lua driver for license plates drawn with Skia. It generates the plate text from the patterns of design.vars (literal text and {token} tokens), builds the variable table ({plate}, {line1}/{line2}, {seg1}..., predefined or generated variables), substitutes each {key} in a copy of the layout tree of the chosen format, then sends the resolved result to the C++ engine (veh:renderLicensePlateSkia), which binds the textures to the @licenseplate-* material tags. The C++ only does the rendering. Useful for plate mods (*.sktemplate.json files).
--- Access: extension `core_skiaTemplate`: `extensions.load("core_skiaTemplate")`, then the global `core_skiaTemplate`
---@class core_skiaTemplate
core_skiaTemplate = {}

--- Development tool: compares CPU and GPU rendering of the plate maps. Renders synchronously on the calling thread, so run it when no plate is being created.
---Source: lua/ge/extensions/core/skiaTemplate.lua:247
---@param design table|string|nil Design, or VFS path of a *.sktemplate.json (default: standard plate vehicles/common/licenseplates/default/licensePlate-default.sktemplate.json).
---@param format string|nil Format; by default the first of the design.
---@param text string|nil Text; default 'ABC-1234'.
---@param iterations integer|nil Number of iterations, 20 by default.
---@return string  Timing summary returned by the engine, or an error message (skiaBenchmark unavailable outside a dev build with Skia, design not found, format not renderable).
function core_skiaTemplate.benchmark(design, format, text, iterations) end

--- Generates a plate text from design.vars.plate (literal text and {token} tokens). Without a usable variable, falls back to an 'AAA-0000' style.
---Source: lua/ge/extensions/core/skiaTemplate.lua:89
---@param design table|nil Plate design.
---@param veh userdata|nil Vehicle object (for {vid}, {vname} and licenseFormats).
---@return string  Plate text.
function core_skiaTemplate.generateText(design, veh) end

--- Resolves the format then submits it to the engine's Skia rendering thread (veh:renderLicensePlateSkia with the resolved JSON), which binds the result to the vehicle's @licenseplate-* material tags.
---Source: lua/ge/extensions/core/skiaTemplate.lua:236
---@param veh userdata Vehicle with the renderLicensePlateSkia method.
---@param design table Plate design.
---@param format string Format name.
---@param text string Plate text.
---@return boolean  false if the vehicle cannot render or the format is not found; otherwise the engine's return (true if accepted).
function core_skiaTemplate.renderToVehicle(veh, design, format, text) end

--- Resolves a design format into a flat template understood by the engine: {size, background, normal, emboss, finish, maps, root} with all {key} substituted. finish contains the default PBR values (0 to 1): roughness and metallic for the background, fgRoughness and fgMetallic for the text and logos; a node can override with its own metallic/roughness. Also applies the splitting into segments, into lines (limit/limit2) and the design logic if any.
---Source: lua/ge/extensions/core/skiaTemplate.lua:162
---@param design table Plate design.
---@param format string Format name in design.format.
---@param text string|nil Plate text (empty replaced by a space).
---@param veh userdata|nil Vehicle, used for generated variables.
---@return table|nil  Resolved template; nil if the format or its root is missing.
function core_skiaTemplate.resolveFormat(design, format, text, veh) end

--- Resolves a generic (non-plate) flat template {size, background?, root}: deep copy and substitution of the {key} of the text from vars. maps is diffuse only unless otherwise specified.
---Source: lua/ge/extensions/core/skiaTemplate.lua:226
---@param design table Template with a root field.
---@param vars table<string, string>|nil Substitution values.
---@return table|nil  Resolved template; nil if there is no root.
function core_skiaTemplate.resolveTemplate(design, vars) end

