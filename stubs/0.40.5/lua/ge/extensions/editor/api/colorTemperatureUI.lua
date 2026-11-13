---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/colorTemperatureUI.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Widget ImGui de l'éditeur pour choisir une température de couleur de lumière en Kelvin, avec presets (bougie, sodium, LED, xénon…), type de filament et dégradation. Sert aux inspecteurs de lumières. Le module convertit aussi un Kelvin en RGB linéaire (approximation du lieu de Planck, Rec.709/sRGB D65).
--- Accès : extension `editor_api_colorTemperatureUI` : `extensions.load("editor_api_colorTemperatureUI")`, puis la globale `editor_api_colorTemperatureUI`
---@class editor_api_colorTemperatureUI
editor_api_colorTemperatureUI = {}

--- Dessine le widget (slider Kelvin, presets, combo de type de filament, slider de dégradation si le filament en a une). Les valeurs passent par les callbacks de opts : getKelvin(), setKelvin(k, isFinal), getRGBA(), setRGBA(r,g,b,a,isFinal), getFilamentId(), setFilamentId(id, isFinal), getDegradation(), setDegradation(v, isFinal).
---Source : lua/ge/extensions/editor/api/colorTemperatureUI.lua:65
---@param opts table id (string, défaut "kelvin"), label (défaut "Color temperature"), minK/maxK (défaut 1000..20000) et les callbacks get/set ci-dessus. isFinal vaut true à la fin d'une édition.
function editor_api_colorTemperatureUI.draw(opts) end

--- Comme kelvinToRGBLinear mais renvoie la chaîne "r g b a" (6 décimales), format de couleur des champs d'objets.
---Source : lua/ge/extensions/editor/api/colorTemperatureUI.lua:333
---@param k number|nil Température en Kelvin
---@param alpha number|nil Alpha, 1 par défaut
---@return string  "r g b a"
function editor_api_colorTemperatureUI.kelvinToColorStringLinear(k, alpha) end

--- Convertit une température de couleur en RGB linéaire normalisé (max = 1).
---Source : lua/ge/extensions/editor/api/colorTemperatureUI.lua:329
---@param k number|nil Température en Kelvin, bornée à 1667..25000 (6500 si nil)
---@return number  r
---@return number  g
---@return number  b
function editor_api_colorTemperatureUI.kelvinToRGBLinear(k) end

