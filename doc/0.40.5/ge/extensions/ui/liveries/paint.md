# `ui_liveries_paint`

*File: `lua/ge/extensions/ui/liveries/paint.lua` · VM: Game Engine (GE) · 106 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_liveries_paint`: `extensions.load("ui_liveries_paint")`, then the global `ui_liveries_paint`

Reads and modifies the paint (RGBA color, metallic, roughness) of a livery editor layer, found by its uid in editor_api_dynamicDecals. It also provides the current vehicle model's preset paints. It is used by the UI's paint screen and by the decals editor.

## Notes

- All values coming from the UI are normalized between 0 and 1: an out-of-range value is clamped, a non-numeric value is replaced by the layer's value.
- setLayerPaint works on a deep copy of the layer and calls setLayer(updatedLayer, true), so as not to pollute the API history.
- A layer linked to a vehicle color palette (colorPaletteMapId not nil) goes back to palette 0 as soon as its paint is modified here.
- Fill layers have neither metallicIntensity nor roughnessIntensity: these fields stay nil in getLayerPaint and are ignored by setLayerPaint.

**Dependencies (loaded first):** `editor_api_dynamicDecals`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_liveries_paint.getLayerPaint(layerUid)` | Returns the paint of the layer with the given uid: layerUid, color {r, g, b, a} (white by default), metallic, roughness and presets. Returns nil, with a warning, if the uid is not a string or the layer does not exist. | 59 |
| `ui_liveries_paint.getVehiclePaintPresets()` | Returns the model.paints list of player 0's vehicle model (via core_vehicles.getModel), or an empty table if there is no vehicle. Shared with the decals editor. | 12 |
| `ui_liveries_paint.readNormalized(value, fallback)` | Converts value to a number and clamps it between 0 and 1; returns fallback if the conversion fails. | 21 |
| `ui_liveries_paint.setLayerPaint(layerUid, paint)` | Applies color, metallic and roughness to the layer with the given uid, via a copy of the layer passed to editor_api_dynamicDecals.setLayer. Returns false if the layer is not found or paint is not a table. | 67 |

### Parameter details

#### `ui_liveries_paint.getLayerPaint(layerUid)`

Returns the paint of the layer with the given uid: layerUid, color {r, g, b, a} (white by default), metallic, roughness and presets. Returns nil, with a warning, if the uid is not a string or the layer does not exist.

- `layerUid` (*string*) : Layer uid.
- **returns**: table|nil Paint table.

#### `ui_liveries_paint.getVehiclePaintPresets()`

Returns the model.paints list of player 0's vehicle model (via core_vehicles.getModel), or an empty table if there is no vehicle. Shared with the decals editor.

- **returns**: table Model preset paints.

#### `ui_liveries_paint.readNormalized(value, fallback)`

Converts value to a number and clamps it between 0 and 1; returns fallback if the conversion fails.

- `value` (*any*) : Value received from the UI.
- `fallback` (*number*) : Value returned if value is not numeric.
- **returns**: number Value in [0, 1] or fallback.

#### `ui_liveries_paint.setLayerPaint(layerUid, paint)`

Applies color, metallic and roughness to the layer with the given uid, via a copy of the layer passed to editor_api_dynamicDecals.setLayer. Returns false if the layer is not found or paint is not a table.

- `layerUid` (*string*) : Layer uid.
- `paint` (*table*) : Optional fields color {r, g, b, a}, metallic, roughness, all normalized between 0 and 1.
- **returns**: boolean true if the update was done.

## Fields

| Field | Type | Description |
|---|---|---|
| `EDITABLE_COLOR_PALETTE_MAP_ID` | integer | Equals 0. This is the only mode where a layer displays its own color; any other id takes the color from a vehicle palette slot and ignores the layer's. |
| `dependencies` | string[] | Extensions loaded before this one: editor_api_dynamicDecals. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/liveries/paint.lua`.*
