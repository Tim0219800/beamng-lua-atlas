# `editor_api_colorTemperatureUI`

*File: `lua/ge/extensions/editor/api/colorTemperatureUI.lua` · VM: Game Engine (GE) · 343 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_api_colorTemperatureUI`: `extensions.load("editor_api_colorTemperatureUI")`, then the global `editor_api_colorTemperatureUI`

Editor ImGui widget to choose a light color temperature in Kelvin, with presets (candle, sodium, LED, xenon...), filament type and degradation. Used by light inspectors. The module also converts a Kelvin value to linear RGB (approximation of the Planckian locus, Rec.709/sRGB D65).

## Example

```lua
local r, g, b = editor_api_colorTemperatureUI.kelvinToRGBLinear(3200)
local s = editor_api_colorTemperatureUI.kelvinToColorStringLinear(3200, 1) -- "r g b a"
```

## Notes

- Kelvin clamped to 1667..25000 in kelvinToRGBLinear; default 6500 if nil.
- The returned RGB is normalized (the max component equals 1) and negative values are brought back to 0.
- The UI state (Kelvin, preset, filament, degradation) is kept by id in local tables of the module.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_api_colorTemperatureUI.draw(opts)` | Draws the widget (Kelvin slider, presets, filament type combo, degradation slider if the filament has one). Values go through the opts callbacks: getKelvin(), setKelvin(k, isFinal), getRGBA(), setRGBA(r,g,b,a,isFinal), getFilamentId(), setFilamentId(id, isFinal), getDegradation(), setDegradation(v, isFinal). | 65 |
| `editor_api_colorTemperatureUI.kelvinToColorStringLinear(k, alpha)` | Like kelvinToRGBLinear but returns the string "r g b a" (6 decimals), the color format of object fields. | 333 |
| `editor_api_colorTemperatureUI.kelvinToRGBLinear(k)` | Converts a color temperature to normalized linear RGB (max = 1). | 329 |

### Parameter details

#### `editor_api_colorTemperatureUI.draw(opts)`

Draws the widget (Kelvin slider, presets, filament type combo, degradation slider if the filament has one). Values go through the opts callbacks: getKelvin(), setKelvin(k, isFinal), getRGBA(), setRGBA(r,g,b,a,isFinal), getFilamentId(), setFilamentId(id, isFinal), getDegradation(), setDegradation(v, isFinal).

- `opts` (*table*) : id (string, default "kelvin"), label (default "Color temperature"), minK/maxK (default 1000..20000) and the get/set callbacks above. isFinal is true at the end of an edit.

#### `editor_api_colorTemperatureUI.kelvinToColorStringLinear(k, alpha)`

Like kelvinToRGBLinear but returns the string "r g b a" (6 decimals), the color format of object fields.

- `k` (*number|nil*) : Temperature in Kelvin
- `alpha` (*number|nil*) : Alpha, 1 by default
- **returns**: string "r g b a"

#### `editor_api_colorTemperatureUI.kelvinToRGBLinear(k)`

Converts a color temperature to normalized linear RGB (max = 1).

- `k` (*number|nil*) : Temperature in Kelvin, clamped to 1667..25000 (6500 if nil)
- **returns**: number r
- **returns**: number g
- **returns**: number b

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/api/colorTemperatureUI.lua`.*
