# `ui_liveries_fill`

*File: `lua/ge/extensions/ui/liveries/fill.lua` · VM: Game Engine (GE) · 77 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_liveries_fill`: `extensions.load("ui_liveries_fill")`, then the global `ui_liveries_fill`

Manages the base fill layer ("fill layer") of a livery in the livery editor. It relies on editor_api_dynamicDecals to create or find the bottom layer of the stack, and on ui_liveries_paint to read and change its color. The UI's paint screen uses it to display and change the vehicle's background color.

## Notes

- baseFillLayerUid is module-local state: it is nil until setup or bindLoadedLayer has succeeded, and after teardown.
- The layer created by setup uses the palette EDITABLE_COLOR_PALETTE_MAP_ID (0), so it displays its own color.

**Dependencies (loaded first):** `editor_api_dynamicDecals`, `ui_liveries_paint`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_liveries_fill.bindLoadedLayer()` | After loading an existing livery, looks in the layer stack for the first layer of type fill and stores its uid. Logs a warning and returns false if none exists (the paint screen then stays inactive). | 21 |
| `ui_liveries_fill.getPaint()` | Returns the base layer's paint (via ui_liveries_paint.getLayerPaint) completed with paint.vehicleColor = {r, g, b, a} read from player 0's vehicle color. Returns nil, with a warning, if no base layer is bound. | 45 |
| `ui_liveries_fill.setPaint(paint)` | Applies a paint to the base layer by delegating to ui_liveries_paint.setLayerPaint. Returns false, with a warning, if no base layer is bound. | 67 |
| `ui_liveries_fill.setup(vehicleColor)` | Creates the base fill layer of a new livery: sets the palette id and the default color of fill layers, then adds the layer and stores its uid. Returns false if the decals API is not loaded or vehicleColor is missing. | 10 |
| `ui_liveries_fill.teardown()` | Forgets the base layer's uid. Does not delete the layer itself. | 41 |

### Parameter details

#### `ui_liveries_fill.bindLoadedLayer()`

After loading an existing livery, looks in the layer stack for the first layer of type fill and stores its uid. Logs a warning and returns false if none exists (the paint screen then stays inactive).

- **returns**: boolean true if a fill layer was found.

#### `ui_liveries_fill.getPaint()`

Returns the base layer's paint (via ui_liveries_paint.getLayerPaint) completed with paint.vehicleColor = {r, g, b, a} read from player 0's vehicle color. Returns nil, with a warning, if no base layer is bound.

- **returns**: table|nil Table layerUid, color, metallic, roughness, presets and vehicleColor.

#### `ui_liveries_fill.setPaint(paint)`

Applies a paint to the base layer by delegating to ui_liveries_paint.setLayerPaint. Returns false, with a warning, if no base layer is bound.

- `paint` (*table*) : Table with color {r, g, b, a} normalized between 0 and 1 (metallic and roughness are ignored for a fill layer).
- **returns**: boolean true if the layer was updated.

#### `ui_liveries_fill.setup(vehicleColor)`

Creates the base fill layer of a new livery: sets the palette id and the default color of fill layers, then adds the layer and stores its uid. Returns false if the decals API is not loaded or vehicleColor is missing.

- `vehicleColor` (*Point4F|table*) : Vehicle color passed to setFillLayerColor (type inferred from code).
- **returns**: boolean true if a layer was created and its uid stored.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded before this one: editor_api_dynamicDecals and ui_liveries_paint. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/liveries/fill.lua`.*
