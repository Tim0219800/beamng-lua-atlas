# `core_skiaTemplate`

*File: `lua/ge/extensions/core/skiaTemplate.lua` · VM: Game Engine (GE) · 273 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_skiaTemplate`: `extensions.load("core_skiaTemplate")`, then the global `core_skiaTemplate`

Lua driver for license plates drawn with Skia. It generates the plate text from the patterns of design.vars (literal text and {token} tokens), builds the variable table ({plate}, {line1}/{line2}, {seg1}..., predefined or generated variables), substitutes each {key} in a copy of the layout tree of the chosen format, then sends the resolved result to the C++ engine (veh:renderLicensePlateSkia), which binds the textures to the @licenseplate-* material tags. The C++ only does the rendering. Useful for plate mods (*.sktemplate.json files).

## Example

```lua
local design = jsonReadFile('vehicles/common/licenseplates/default/licensePlate-default.sktemplate.json')
local text = core_skiaTemplate.generateText(design, veh)
core_skiaTemplate.renderToVehicle(veh, design, 'default', text)
```

## Notes

- A design is a table: type ('licenseplate' by default), format (table name -> {size, background, normal, emboss, finish, maps, segments, limit, limit2, root}), vars (variable definitions: default, formats, charsets, preset), logic (name of an optional Lua module with resolve(text, format, design) that may return {vars, nodes, background, normal}).
- Rendered maps: for type licenseplate, diffuse, normal, specular, metallic; for other types, diffuse only. An explicit maps list in the format or the design takes precedence.
- Predefined (preset) and generated variables are deterministic for a given plate text (djb2 hash of the text) so that all multiplayer clients get the same result.
- Empty values are replaced by a space; an unknown token stays as is ({key}).
- limit and limit2 count UTF-8 code points, not bytes.
- Special tokens of generateText: {vid} (vehicle id), {vname} (jbeam file name), and the character sets of vars.plate.charsets. The chosen plate formats come from the vehicle's dynamic field licenseFormats (default {"30-15"}).

## Functions

| Function | Description | Line |
|---|---|---|
| `core_skiaTemplate.benchmark(design, format, text, iterations)` | Development tool: compares CPU and GPU rendering of the plate maps. Renders synchronously on the calling thread, so run it when no plate is being created. | 247 |
| `core_skiaTemplate.generateText(design, veh)` | Generates a plate text from design.vars.plate (literal text and {token} tokens). Without a usable variable, falls back to an 'AAA-0000' style. | 89 |
| `core_skiaTemplate.renderToVehicle(veh, design, format, text)` | Resolves the format then submits it to the engine's Skia rendering thread (veh:renderLicensePlateSkia with the resolved JSON), which binds the result to the vehicle's @licenseplate-* material tags. | 236 |
| `core_skiaTemplate.resolveFormat(design, format, text, veh)` | Resolves a design format into a flat template understood by the engine: {size, background, normal, emboss, finish, maps, root} with all {key} substituted. finish contains the default PBR values (0 to 1): roughness and metallic for the background, fgRoughness and fgMetallic for the text and logos; a node can override with its own metallic/roughness. Also applies the splitting into segments, into lines (limit/limit2) and the design logic if any. | 162 |
| `core_skiaTemplate.resolveTemplate(design, vars)` | Resolves a generic (non-plate) flat template {size, background?, root}: deep copy and substitution of the {key} of the text from vars. maps is diffuse only unless otherwise specified. | 226 |

### Parameter details

#### `core_skiaTemplate.benchmark(design, format, text, iterations)`

Development tool: compares CPU and GPU rendering of the plate maps. Renders synchronously on the calling thread, so run it when no plate is being created.

- `design` (*table|string|nil*) : Design, or VFS path of a *.sktemplate.json (default: standard plate vehicles/common/licenseplates/default/licensePlate-default.sktemplate.json).
- `format` (*string|nil*) : Format; by default the first of the design.
- `text` (*string|nil*) : Text; default 'ABC-1234'.
- `iterations` (*integer|nil*) : Number of iterations, 20 by default.
- **returns**: string Timing summary returned by the engine, or an error message (skiaBenchmark unavailable outside a dev build with Skia, design not found, format not renderable).

#### `core_skiaTemplate.generateText(design, veh)`

Generates a plate text from design.vars.plate (literal text and {token} tokens). Without a usable variable, falls back to an 'AAA-0000' style.

- `design` (*table|nil*) : Plate design.
- `veh` (*userdata|nil*) : Vehicle object (for {vid}, {vname} and licenseFormats).
- **returns**: string Plate text.

#### `core_skiaTemplate.renderToVehicle(veh, design, format, text)`

Resolves the format then submits it to the engine's Skia rendering thread (veh:renderLicensePlateSkia with the resolved JSON), which binds the result to the vehicle's @licenseplate-* material tags.

- `veh` (*userdata*) : Vehicle with the renderLicensePlateSkia method.
- `design` (*table*) : Plate design.
- `format` (*string*) : Format name.
- `text` (*string*) : Plate text.
- **returns**: boolean false if the vehicle cannot render or the format is not found; otherwise the engine's return (true if accepted).

#### `core_skiaTemplate.resolveFormat(design, format, text, veh)`

Resolves a design format into a flat template understood by the engine: {size, background, normal, emboss, finish, maps, root} with all {key} substituted. finish contains the default PBR values (0 to 1): roughness and metallic for the background, fgRoughness and fgMetallic for the text and logos; a node can override with its own metallic/roughness. Also applies the splitting into segments, into lines (limit/limit2) and the design logic if any.

- `design` (*table*) : Plate design.
- `format` (*string*) : Format name in design.format.
- `text` (*string|nil*) : Plate text (empty replaced by a space).
- `veh` (*userdata|nil*) : Vehicle, used for generated variables.
- **returns**: table|nil Resolved template; nil if the format or its root is missing.

#### `core_skiaTemplate.resolveTemplate(design, vars)`

Resolves a generic (non-plate) flat template {size, background?, root}: deep copy and substitution of the {key} of the text from vars. maps is diffuse only unless otherwise specified.

- `design` (*table*) : Template with a root field.
- `vars` (*table<string, string>|nil*) : Substitution values.
- **returns**: table|nil Resolved template; nil if there is no root.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/skiaTemplate.lua`.*
