# `ui_liveries_decal`

*File: `lua/ge/extensions/ui/liveries/decal.lua` · VM: Game Engine (GE) · 1121 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_liveries_decal`: `extensions.load("ui_liveries_decal")`, then the global `ui_liveries_decal`

Lua-side logic of the livery editor's decals screen. It wraps editor_api_dynamicDecals: layer stack (list, selection, highlight, visibility, duplication, deletion, reordering), painting and mirroring of a decal, and the transform mode (scale, skew, rotation, projection, mouse placement) for a new decal or an existing one. It sends its state to the UI through guihooks (events liveries_decal_layersUpdated, liveries_decal_selectionChanged, liveries_decal_transformUpdated). The route hooks of routeLifecycleCallbacks call it.

## Example

```lua
ui_liveries_decal.setup()
ui_liveries_decal.select(layerUid)
ui_liveries_decal.setPaint(layerUid, {color = {1, 0, 0, 1}, metallic = 0.5, roughness = 0.3})
```

## Notes

- The module is only active between setup and teardown (isActive); getPaint, setPaint, getLayerMirror and setLayerMirror refuse (warning + nil or false) if it is not active.
- The displayed stack contains only layers of type decal, linkedSet and group; the most recent layer is placed first in the tree sent to the UI.
- The first root element of the stack is the fill layer: a decal cannot be moved under it (FIRST_MOVABLE_ROOT_INDEX = 2). Only root decals can be reordered.
- Transform speeds per second at full deflection: scale 0.5; skew 2 (clamped to ±2); rotation π rad (value wrapped to [0, 2π[). The minimum scale is 0.01. The "small increments" option multiplies these speeds by 0.1; "lock ratio" applies the sum of the horizontal and vertical deltas to both axes.
- In the snapshots sent to the UI, scale x corresponds to the API's scale.x and y to scale.z; rotation is in degrees (1 decimal), numbers are formatted strings.
- An existing decal can only be re-transformed if its UV cursor (cursorPosScreenUv) is centered within 0.01 around (0.5, 0.5), otherwise beginExistingTransform refuses and returns false.
- The decal color's alpha also serves as opacity; the transform cursor is displayed with alpha 1 and hidden with alpha 0.
- The "LiveriesDecalTransform" action map is pushed during the transform, and removed on exit or when the settings are opened (suspendTransformActionMap).
- The dynamicDecals_* functions are hooks called by editor_api_dynamicDecals; do not call them yourself.
- api is captured only once when the file loads (local api = extensions.editor_api_dynamicDecals); if the extension was not yet loaded at that time, api stays nil and most functions do nothing.

**Dependencies (loaded first):** `editor_api_dynamicDecals`, `ui_liveries`, `ui_liveries_camera`, `ui_liveries_paint`, `ui_liveries_textures`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_liveries_decal.beginExistingTransform(layerUid)` | Opens a re-transform session for an existing decal: stores a copy of the layer, its highlight state and an applied flag. Replaces any previous session. Refuses if the layer is not found, is not a decal or is not centered. | 710 |
| `ui_liveries_decal.commitTransform()` | Validates the current transform. Without a re-transform session, places a new decal (placeSelectedDecal); otherwise calls api.replaceDecalTransformFromCurrentProjection, marks the session as applied and navigates to "liveries.edit.decals". | 874 |
| `ui_liveries_decal.deleteLayer(layerUid)` | Deletes a layer via api.removeLayer. | 371 |
| `ui_liveries_decal.duplicateLayer(layerUid)` | Duplicates a layer via api.duplicateLayer from its index and its parent. | 362 |
| `ui_liveries_decal.dynamicDecals_moveLayer()` | Hook called by editor_api_dynamicDecals when a layer is moved; same handling as dynamicDecals_onLayerAdded. *(internal)* | 1109 |
| `ui_liveries_decal.dynamicDecals_onLayerAdded()` | Hook called by editor_api_dynamicDecals when a layer is added. Rebuilds the list (marking the new layer as focus) and notifies the UI. Do not call it yourself. *(internal)* | 1109 |
| `ui_liveries_decal.dynamicDecals_onLayerDeleted()` | Hook called by editor_api_dynamicDecals when a layer is removed; same handling as dynamicDecals_onLayerAdded. *(internal)* | 1109 |
| `ui_liveries_decal.dynamicDecals_onLayerUpdated()` | Hook called by editor_api_dynamicDecals when a layer is modified; same handling as dynamicDecals_onLayerAdded. *(internal)* | 1109 |
| `ui_liveries_decal.endExistingTransform()` | Closes the re-transform session: hides the cursor and, if nothing was applied, restores the layer's original visibility and highlight, then refreshes the list. | 806 |
| `ui_liveries_decal.getLayerMirror(layerUid)` | Returns the mirror flags of a validated decal; the mirror plane offset (mirrorOffset) is global to the editor, not per layer. | 514 |
| `ui_liveries_decal.getLockRatio()` | Returns whether ratio locking is active for scale and skew. | 970 |
| `ui_liveries_decal.getMirrorSnapshot()` | Returns the API's current mirror settings: mirrored, flipMirroredDecal, mirrorOffset. | 947 |
| `ui_liveries_decal.getPaint(layerUid)` | Returns a layer's paint (ui_liveries_paint.getLayerPaint). Active module required. | 478 |
| `ui_liveries_decal.getSmallIncrements()` | Returns whether "small increments" mode is active (speeds multiplied by 0.1, also for the free camera). | 952 |
| `ui_liveries_decal.getTransformPaint()` | Returns the paint of the decal being transformed: the API's current color, metallic and roughness, the vehicle's presets, and the layerUid of the layer being edited (or "transform-preview" for a new decal). | 553 |
| `ui_liveries_decal.getTransformSnapshot()` | Returns the transform state sent to the UI: scale {x, y}, skew {x, y}, rotation (degrees), projection (label key), smallIncrements, lockRatio. Numbers are strings. | 942 |
| `ui_liveries_decal.hideSelectedCursor()` | Ends transform mode: removes the action map, resets the inputs to zero, stops the camera transform, makes the decal transparent (alpha 0), turns off the projection and restores the mouse setting if needed. | 661 |
| `ui_liveries_decal.isUseMousePos()` | Returns whether mouse placement of the decal is active (api.isUseMousePos). | 988 |
| `ui_liveries_decal.notifyUi()` | Sends the layer list and the current selection back to the UI. | 286 |
| `ui_liveries_decal.onUpdate(dtReal)` | Hook called every frame with dtReal (real seconds). While the transform action map is active, applies the scale, skew and rotation inputs to the decal and notifies the UI on change. *(internal)* *(hook)* | 1051 |
| `ui_liveries_decal.placeSelectedDecal()` | Validates a new decal with api.addDecal from the selected texture, optionally moves it above the startAddDecal target, clears the texture selection and navigates to "liveries.edit.decals". Returns nil with a warning if no texture is selected. | 829 |
| `ui_liveries_decal.reorderLayers(orderedUids)` | Applies a new root layer order, provided it corresponds to the move of a single decal. Finds the moved layer, computes the target index taking the fill layer into account and calls api.moveLayer; the refresh comes back through the dynamicDecals_moveLayer hook. | 414 |
| `ui_liveries_decal.resumeTransformActionMap()` | Pushes the transform action map again if it is not active. | 697 |
| `ui_liveries_decal.select(layerUid)` | Selects a layer (and highlights it), or deselects if layerUid is nil. Notifies the UI of the change. | 291 |
| `ui_liveries_decal.setFlipMirroredDecal(value)` | Flips or not the mirrored decal (api.setFlipMirroredDecal). | 1027 |
| `ui_liveries_decal.setLayerMirror(layerUid, mirror)` | Updates mirrored and flipMirroredDecal of a layer, on a copy passed to setLayer so as not to touch the API history. | 532 |
| `ui_liveries_decal.setLockRatio(value)` | Enables or disables ratio locking and notifies the UI if the value changes. | 974 |
| `ui_liveries_decal.setMirrorOffset(value)` | Sets the mirror plane offset, clamped between -1 and 1 (api.setMirrorOffset). | 1039 |
| `ui_liveries_decal.setMirrored(value)` | Enables or disables mirroring of the decal being placed (api.setMirrored). | 1015 |
| `ui_liveries_decal.setPaint(layerUid, paint)` | Applies a paint to a layer (ui_liveries_paint.setLayerPaint). Active module required. | 487 |
| `ui_liveries_decal.setRotateLeft(value)` | Sets the left rotation input (trigger); the applied rotation is right minus left. | 911 |
| `ui_liveries_decal.setRotateRight(value)` | Sets the right rotation input (trigger). | 915 |
| `ui_liveries_decal.setScaleHorizontal(value)` | Sets the horizontal scale axis input (applied in onUpdate). | 895 |
| `ui_liveries_decal.setScaleVertical(value)` | Sets the vertical scale axis input (applied in onUpdate). | 899 |
| `ui_liveries_decal.setSkewHorizontal(value)` | Sets the horizontal skew axis input (applied in onUpdate). | 903 |
| `ui_liveries_decal.setSkewVertical(value)` | Sets the vertical skew axis input (applied in onUpdate). | 907 |
| `ui_liveries_decal.setSmallIncrements(value)` | Enables or disables small increments and notifies the UI if the value changes. | 956 |
| `ui_liveries_decal.setTransformPaint(paint)` | Applies color (normalized RGBA, alpha is used as opacity), metallic and roughness to the decal being transformed, then calls api.onUpdate_. | 565 |
| `ui_liveries_decal.setUseMousePos(value)` | Enables or disables mouse placement (toggles the API's UseMousePos setting if needed). During a transform, enabling it forces the camera into orbit mode. | 993 |
| `ui_liveries_decal.setUseSurfaceNormal(value)` | Chooses projection along the surface normal (true) or along the camera (false) and notifies the UI if the value changes. | 919 |
| `ui_liveries_decal.setup()` | Activates the module: clears the selection, the add target and the highlight, then rebuilds the layer list. | 259 |
| `ui_liveries_decal.showExistingCursor()` | Displays the existing decal's cursor: hides the original layer, copies its texture, color, scale, skew, rotation, projection and mirror into the API, projects the decal, pushes the action map and starts ui_liveries_camera.startTransformAtLayer. Warns if there is no session. | 751 |
| `ui_liveries_decal.showSelectedCursor()` | Prepares the placement of a new decal: uses the selected texture as color texture, projects the decal, resets transform and mirror to defaults, pushes the transform action map and starts ui_liveries_camera.startTransform. If a gamepad is used, disables mouse placement. Warns if no texture is selected. | 617 |
| `ui_liveries_decal.startAddDecal(targetLayerUid)` | Prepares adding a decal above an existing decal (or at the top of the stack if the uid is not a decal) then navigates to the route "liveries.edit.decals.camera". | 823 |
| `ui_liveries_decal.suspendTransformActionMap()` | Removes the transform action map and resets the inputs to zero (used when the settings are opened). | 684 |
| `ui_liveries_decal.teardown()` | Deactivates the module: ends the existing decal transform, hides the cursor, clears the selection, the selected texture (ui_liveries_textures.clearSelectedItem) and the layer list, and turns off the highlight. | 271 |
| `ui_liveries_decal.toggleLayerHighlight(layerUid)` | Highlights the layer if it is not already (only if it is enabled), otherwise turns off the highlight. Refreshes the list. | 348 |
| `ui_liveries_decal.toggleLayerVisibility(layerUid)` | Enables or disables the display of a layer (enabled field), on a copy of the layer passed to setLayer, then refreshes the list. | 333 |
| `ui_liveries_decal.toggleProjectionMode()` | Toggles the projection mode (surface or camera). No effect outside a transform. | 935 |

### Parameter details

#### `ui_liveries_decal.beginExistingTransform(layerUid)`

Opens a re-transform session for an existing decal: stores a copy of the layer, its highlight state and an applied flag. Replaces any previous session. Refuses if the layer is not found, is not a decal or is not centered.

- `layerUid` (*string*) : Decal uid.
- **returns**: boolean true if the session is open.

#### `ui_liveries_decal.commitTransform()`

Validates the current transform. Without a re-transform session, places a new decal (placeSelectedDecal); otherwise calls api.replaceDecalTransformFromCurrentProjection, marks the session as applied and navigates to "liveries.edit.decals".

- **returns**: string|boolean|nil Uid of the new decal, or true/false for a re-transform.

#### `ui_liveries_decal.deleteLayer(layerUid)`

Deletes a layer via api.removeLayer.

- `layerUid` (*string*) : Layer uid.

#### `ui_liveries_decal.duplicateLayer(layerUid)`

Duplicates a layer via api.duplicateLayer from its index and its parent.

- `layerUid` (*string*) : Layer uid.

#### `ui_liveries_decal.getLayerMirror(layerUid)`

Returns the mirror flags of a validated decal; the mirror plane offset (mirrorOffset) is global to the editor, not per layer.

- `layerUid` (*string*) : Layer uid.
- **returns**: table|nil Table layerUid, mirrored, flipMirroredDecal, mirrorOffset.

#### `ui_liveries_decal.getLockRatio()`

Returns whether ratio locking is active for scale and skew.

- **returns**: boolean Lock state.

#### `ui_liveries_decal.getMirrorSnapshot()`

Returns the API's current mirror settings: mirrored, flipMirroredDecal, mirrorOffset.

- **returns**: table|nil nil if the API is missing.

#### `ui_liveries_decal.getPaint(layerUid)`

Returns a layer's paint (ui_liveries_paint.getLayerPaint). Active module required.

- `layerUid` (*string*) : Layer uid.
- **returns**: table|nil Table layerUid, color, metallic, roughness, presets.

#### `ui_liveries_decal.getSmallIncrements()`

Returns whether "small increments" mode is active (speeds multiplied by 0.1, also for the free camera).

- **returns**: boolean Mode state.

#### `ui_liveries_decal.getTransformPaint()`

Returns the paint of the decal being transformed: the API's current color, metallic and roughness, the vehicle's presets, and the layerUid of the layer being edited (or "transform-preview" for a new decal).

- **returns**: table|nil Paint table, nil if the API is missing.

#### `ui_liveries_decal.getTransformSnapshot()`

Returns the transform state sent to the UI: scale {x, y}, skew {x, y}, rotation (degrees), projection (label key), smallIncrements, lockRatio. Numbers are strings.

- **returns**: table|nil nil if the API is missing.

#### `ui_liveries_decal.isUseMousePos()`

Returns whether mouse placement of the decal is active (api.isUseMousePos).

- **returns**: boolean Also false if the API is missing.

#### `ui_liveries_decal.onUpdate(dtReal)`

Hook called every frame with dtReal (real seconds). While the transform action map is active, applies the scale, skew and rotation inputs to the decal and notifies the UI on change.

- `dtReal` (*number*) : Real frame duration in seconds.

#### `ui_liveries_decal.placeSelectedDecal()`

Validates a new decal with api.addDecal from the selected texture, optionally moves it above the startAddDecal target, clears the texture selection and navigates to "liveries.edit.decals". Returns nil with a warning if no texture is selected.

- **returns**: string|nil Uid of the new layer.

#### `ui_liveries_decal.reorderLayers(orderedUids)`

Applies a new root layer order, provided it corresponds to the move of a single decal. Finds the moved layer, computes the target index taking the fill layer into account and calls api.moveLayer; the refresh comes back through the dynamicDecals_moveLayer hook.

- `orderedUids` (*string[]*) : Uids of the root layers in displayed order (first = top).
- **returns**: boolean false with a warning if the order is invalid, the layer is not a root decal or no anchor neighbor exists.

#### `ui_liveries_decal.select(layerUid)`

Selects a layer (and highlights it), or deselects if layerUid is nil. Notifies the UI of the change.

- `layerUid` (*string|nil*) : Layer uid, or nil to deselect.
- **returns**: boolean false if the API is missing or the layer is not found, otherwise true.

#### `ui_liveries_decal.setFlipMirroredDecal(value)`

Flips or not the mirrored decal (api.setFlipMirroredDecal).

- `value` (*boolean*) : New state.
- **returns**: boolean false if value is not a boolean.

#### `ui_liveries_decal.setLayerMirror(layerUid, mirror)`

Updates mirrored and flipMirroredDecal of a layer, on a copy passed to setLayer so as not to touch the API history.

- `layerUid` (*string*) : Layer uid.
- `mirror` (*table*) : Table with mirrored and flipMirroredDecal (booleans; anything that is not true is false).
- **returns**: boolean true if the update was done.

#### `ui_liveries_decal.setLockRatio(value)`

Enables or disables ratio locking and notifies the UI if the value changes.

- `value` (*boolean*) : New state.
- **returns**: boolean false if value is not a boolean.

#### `ui_liveries_decal.setMirrorOffset(value)`

Sets the mirror plane offset, clamped between -1 and 1 (api.setMirrorOffset).

- `value` (*number*) : Offset.
- **returns**: boolean false if value is not a number.

#### `ui_liveries_decal.setMirrored(value)`

Enables or disables mirroring of the decal being placed (api.setMirrored).

- `value` (*boolean*) : New state.
- **returns**: boolean false if value is not a boolean.

#### `ui_liveries_decal.setPaint(layerUid, paint)`

Applies a paint to a layer (ui_liveries_paint.setLayerPaint). Active module required.

- `layerUid` (*string*) : Layer uid.
- `paint` (*table*) : color {r, g, b, a}, metallic, roughness, normalized between 0 and 1.
- **returns**: boolean true if the update was done.

#### `ui_liveries_decal.setRotateLeft(value)`

Sets the left rotation input (trigger); the applied rotation is right minus left.

- `value` (*number|nil*) : Axis value, nil is 0.

#### `ui_liveries_decal.setRotateRight(value)`

Sets the right rotation input (trigger).

- `value` (*number|nil*) : Axis value, nil is 0.

#### `ui_liveries_decal.setScaleHorizontal(value)`

Sets the horizontal scale axis input (applied in onUpdate).

- `value` (*number|nil*) : Axis value, nil is 0.

#### `ui_liveries_decal.setScaleVertical(value)`

Sets the vertical scale axis input (applied in onUpdate).

- `value` (*number|nil*) : Axis value, nil is 0.

#### `ui_liveries_decal.setSkewHorizontal(value)`

Sets the horizontal skew axis input (applied in onUpdate).

- `value` (*number|nil*) : Axis value, nil is 0.

#### `ui_liveries_decal.setSkewVertical(value)`

Sets the vertical skew axis input (applied in onUpdate).

- `value` (*number|nil*) : Axis value, nil is 0.

#### `ui_liveries_decal.setSmallIncrements(value)`

Enables or disables small increments and notifies the UI if the value changes.

- `value` (*boolean*) : New state.
- **returns**: boolean false if value is not a boolean.

#### `ui_liveries_decal.setTransformPaint(paint)`

Applies color (normalized RGBA, alpha is used as opacity), metallic and roughness to the decal being transformed, then calls api.onUpdate_.

- `paint` (*table*) : color {r, g, b, a}, metallic, roughness (optional, 0 to 1).
- **returns**: boolean false if the API is missing or paint is not a table.

#### `ui_liveries_decal.setUseMousePos(value)`

Enables or disables mouse placement (toggles the API's UseMousePos setting if needed). During a transform, enabling it forces the camera into orbit mode.

- `value` (*boolean*) : New state.
- **returns**: boolean false if value is not a boolean or the API is missing.

#### `ui_liveries_decal.setUseSurfaceNormal(value)`

Chooses projection along the surface normal (true) or along the camera (false) and notifies the UI if the value changes.

- `value` (*boolean*) : Projection mode.
- **returns**: boolean false if value is not a boolean or the API is missing.

#### `ui_liveries_decal.startAddDecal(targetLayerUid)`

Prepares adding a decal above an existing decal (or at the top of the stack if the uid is not a decal) then navigates to the route "liveries.edit.decals.camera".

- `targetLayerUid` (*string|nil*) : Uid of the decal above which to insert.

#### `ui_liveries_decal.toggleLayerHighlight(layerUid)`

Highlights the layer if it is not already (only if it is enabled), otherwise turns off the highlight. Refreshes the list.

- `layerUid` (*string*) : Layer uid.

#### `ui_liveries_decal.toggleLayerVisibility(layerUid)`

Enables or disables the display of a layer (enabled field), on a copy of the layer passed to setLayer, then refreshes the list.

- `layerUid` (*string*) : Layer uid.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded before this one: editor_api_dynamicDecals, ui_liveries, ui_liveries_camera, ui_liveries_paint, ui_liveries_textures. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/liveries/decal.lua`.*
