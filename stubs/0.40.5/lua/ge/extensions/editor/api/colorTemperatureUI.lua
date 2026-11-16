---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/colorTemperatureUI.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor ImGui widget to choose a light color temperature in Kelvin, with presets (candle, sodium, LED, xenon...), filament type and degradation. Used by light inspectors. The module also converts a Kelvin value to linear RGB (approximation of the Planckian locus, Rec.709/sRGB D65).
--- Access: extension `editor_api_colorTemperatureUI`: `extensions.load("editor_api_colorTemperatureUI")`, then the global `editor_api_colorTemperatureUI`
---@class editor_api_colorTemperatureUI
editor_api_colorTemperatureUI = {}

--- Draws the widget (Kelvin slider, presets, filament type combo, degradation slider if the filament has one). Values go through the opts callbacks: getKelvin(), setKelvin(k, isFinal), getRGBA(), setRGBA(r,g,b,a,isFinal), getFilamentId(), setFilamentId(id, isFinal), getDegradation(), setDegradation(v, isFinal).
---Source: lua/ge/extensions/editor/api/colorTemperatureUI.lua:65
---@param opts table id (string, default "kelvin"), label (default "Color temperature"), minK/maxK (default 1000..20000) and the get/set callbacks above. isFinal is true at the end of an edit.
function editor_api_colorTemperatureUI.draw(opts) end

--- Like kelvinToRGBLinear but returns the string "r g b a" (6 decimals), the color format of object fields.
---Source: lua/ge/extensions/editor/api/colorTemperatureUI.lua:333
---@param k number|nil Temperature in Kelvin
---@param alpha number|nil Alpha, 1 by default
---@return string  "r g b a"
function editor_api_colorTemperatureUI.kelvinToColorStringLinear(k, alpha) end

--- Converts a color temperature to normalized linear RGB (max = 1).
---Source: lua/ge/extensions/editor/api/colorTemperatureUI.lua:329
---@param k number|nil Temperature in Kelvin, clamped to 1667..25000 (6500 if nil)
---@return number  r
---@return number  g
---@return number  b
function editor_api_colorTemperatureUI.kelvinToRGBLinear(k) end

