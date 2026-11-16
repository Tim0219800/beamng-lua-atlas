# `editor_masterSpline_layerMgr`

*File: `lua/ge/extensions/editor/masterSpline/layerMgr.lua` · VM: Game Engine (GE) · 251 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_masterSpline_layerMgr`: `extensions.load("editor_masterSpline_layerMgr")`, then the global `editor_masterSpline_layerMgr`

Manager of the layers of a Master Spline. A layer links the Master Spline to a child spline of another tool (mesh, assembly, decal, road, tree) and sends it a laterally offset copy of the discretized geometry, simplified by RDP (tolerance 0.25). This module creates, updates, deletes, copies and (de)serializes the layers.

## Notes

- A layer contains: name, id (UUID), isDirty, isLink, linkType, linkedSplineId, linkedSplineName, isFlip, isTrackWidth, position (lateral offset, multiplied by the local half-width).
- If the Master Spline has fewer than 2 nodes, the linked spline receives empty arrays so that its objects are cleaned up.
- If isFlip is true, the simplified geometry is sent in reverse order.
- addNewLayer does not set isTrackWidth (nil, hence false); deserializeLayer forces it to a boolean.
- Slider defaults (getSliderDefaults): defaultPaintMargin 0, defaultLateralPosition 0, defaultDOI 20, defaultTerraMargin 1, defaultTerraFalloff 3, defaultTerraRoughness 0, defaultTerraScale 0, defaultTerraSmooth 2, defaultBankStrength 0.5, defaultAutoBankFalloff 0.6.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_masterSpline_layerMgr.addNewLayer(spline)` | Adds a "New Layer N" layer (generated UUID, isDirty true, unlinked, default link type = mesh, default position). | 189 |
| `editor_masterSpline_layerMgr.deepCopyAllLayers(layers)` | Deep copy of an array of layers. | 72 |
| `editor_masterSpline_layerMgr.deepCopyLayer(layer)` | Deep copy of a layer (via string.buffer encode/decode). | 69 |
| `editor_masterSpline_layerMgr.deserializeLayer(data)` | Rebuilds a layer from serialized data; isDirty is set to true, a UUID is generated if id is missing, defaults otherwise. | 219 |
| `editor_masterSpline_layerMgr.getSliderDefaults()` | Returns the table of the slider default values, for the tool's interface. | 66 |
| `editor_masterSpline_layerMgr.removeAllLayers(masterSpline)` | Deletes all the layers and their linked splines. | 177 |
| `editor_masterSpline_layerMgr.removeLayer(idx, masterSpline)` | Deletes the layer at index idx; if it has a linked spline, that spline is deleted in its tool. | 167 |
| `editor_masterSpline_layerMgr.serializeLayer(layer)` | Converts a layer to a plain table (name, id, isLink, linkType, linkedSplineId, linkedSplineName, isFlip, isTrackWidth, position), without the internal buffers. | 204 |
| `editor_masterSpline_layerMgr.updateAllLayers(masterSpline)` | Sends the Master Spline's geometry to the linked spline of each layer, dirty or not, and sets isDirty back to false. | 148 |
| `editor_masterSpline_layerMgr.updateOnlyDirtyLayers(masterSpline)` | Like updateAllLayers but only for layers with isDirty true. | 155 |

### Parameter details

#### `editor_masterSpline_layerMgr.addNewLayer(spline)`

Adds a "New Layer N" layer (generated UUID, isDirty true, unlinked, default link type = mesh, default position).

- `spline` (*table*) : Master Spline that receives the layer.

#### `editor_masterSpline_layerMgr.deepCopyAllLayers(layers)`

Deep copy of an array of layers.

- `layers` (*table*) : Array of layers.
- **returns**: table Independent copy.

#### `editor_masterSpline_layerMgr.deepCopyLayer(layer)`

Deep copy of a layer (via string.buffer encode/decode).

- `layer` (*table*) : Layer to copy.
- **returns**: table Independent copy.

#### `editor_masterSpline_layerMgr.deserializeLayer(data)`

Rebuilds a layer from serialized data; isDirty is set to true, a UUID is generated if id is missing, defaults otherwise.

- `data` (*table*) : Table produced by serializeLayer.
- **returns**: table Layer.

#### `editor_masterSpline_layerMgr.getSliderDefaults()`

Returns the table of the slider default values, for the tool's interface.

- **returns**: table<string, number> Default values (defaultDOI, defaultTerraMargin, defaultBankStrength...).

#### `editor_masterSpline_layerMgr.removeAllLayers(masterSpline)`

Deletes all the layers and their linked splines.

- `masterSpline` (*table*) : Master Spline.

#### `editor_masterSpline_layerMgr.removeLayer(idx, masterSpline)`

Deletes the layer at index idx; if it has a linked spline, that spline is deleted in its tool.

- `idx` (*integer*) : Layer index (1-based).
- `masterSpline` (*table*) : Owning Master Spline.

#### `editor_masterSpline_layerMgr.serializeLayer(layer)`

Converts a layer to a plain table (name, id, isLink, linkType, linkedSplineId, linkedSplineName, isFlip, isTrackWidth, position), without the internal buffers.

- `layer` (*table*) : Layer.
- **returns**: table Serializable data.

#### `editor_masterSpline_layerMgr.updateAllLayers(masterSpline)`

Sends the Master Spline's geometry to the linked spline of each layer, dirty or not, and sets isDirty back to false.

- `masterSpline` (*table*) : Master Spline (nodes, divPoints, divWidths, binormals, normals, layers, isLoop, isConformToTerrain).

#### `editor_masterSpline_layerMgr.updateOnlyDirtyLayers(masterSpline)`

Like updateAllLayers but only for layers with isDirty true.

- `masterSpline` (*table*) : Master Spline.

## Calls into the engine (C++)

- `Engine.` `generateUUID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/masterSpline/layerMgr.lua`.*
