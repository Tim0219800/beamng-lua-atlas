# `editor_api_colorTemperatureUI`

*Fichier : `lua/ge/extensions/editor/api/colorTemperatureUI.lua` · VM : Game Engine (GE) · 343 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_colorTemperatureUI` : `extensions.load("editor_api_colorTemperatureUI")`, puis la globale `editor_api_colorTemperatureUI`

Widget ImGui de l'éditeur pour choisir une température de couleur de lumière en Kelvin, avec presets (bougie, sodium, LED, xénon…), type de filament et dégradation. Sert aux inspecteurs de lumières. Le module convertit aussi un Kelvin en RGB linéaire (approximation du lieu de Planck, Rec.709/sRGB D65).

## Exemple

```lua
local r, g, b = editor_api_colorTemperatureUI.kelvinToRGBLinear(3200)
local s = editor_api_colorTemperatureUI.kelvinToColorStringLinear(3200, 1) -- "r g b a"
```

## Remarques

- Kelvin borné à 1667..25000 dans kelvinToRGBLinear ; défaut 6500 si nil.
- Le RGB renvoyé est normalisé (la composante max vaut 1) et les valeurs négatives sont ramenées à 0.
- L'état de l'UI (Kelvin, preset, filament, dégradation) est gardé par id dans des tables locales du module.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_colorTemperatureUI.draw(opts)` | Dessine le widget (slider Kelvin, presets, combo de type de filament, slider de dégradation si le filament en a une). Les valeurs passent par les callbacks de opts : getKelvin(), setKelvin(k, isFinal), getRGBA(), setRGBA(r,g,b,a,isFinal), getFilamentId(), setFilamentId(id, isFinal), getDegradation(), setDegradation(v, isFinal). | 65 |
| `editor_api_colorTemperatureUI.kelvinToColorStringLinear(k, alpha)` | Comme kelvinToRGBLinear mais renvoie la chaîne "r g b a" (6 décimales), format de couleur des champs d'objets. | 333 |
| `editor_api_colorTemperatureUI.kelvinToRGBLinear(k)` | Convertit une température de couleur en RGB linéaire normalisé (max = 1). | 329 |

### Détail des paramètres

#### `editor_api_colorTemperatureUI.draw(opts)`

Dessine le widget (slider Kelvin, presets, combo de type de filament, slider de dégradation si le filament en a une). Les valeurs passent par les callbacks de opts : getKelvin(), setKelvin(k, isFinal), getRGBA(), setRGBA(r,g,b,a,isFinal), getFilamentId(), setFilamentId(id, isFinal), getDegradation(), setDegradation(v, isFinal).

- `opts` (*table*) : id (string, défaut "kelvin"), label (défaut "Color temperature"), minK/maxK (défaut 1000..20000) et les callbacks get/set ci-dessus. isFinal vaut true à la fin d'une édition.

#### `editor_api_colorTemperatureUI.kelvinToColorStringLinear(k, alpha)`

Comme kelvinToRGBLinear mais renvoie la chaîne "r g b a" (6 décimales), format de couleur des champs d'objets.

- `k` (*number|nil*) : Température en Kelvin
- `alpha` (*number|nil*) : Alpha, 1 par défaut
- **renvoie** : string "r g b a"

#### `editor_api_colorTemperatureUI.kelvinToRGBLinear(k)`

Convertit une température de couleur en RGB linéaire normalisé (max = 1).

- `k` (*number|nil*) : Température en Kelvin, bornée à 1667..25000 (6500 si nil)
- **renvoie** : number r
- **renvoie** : number g
- **renvoie** : number b

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/colorTemperatureUI.lua`.*
