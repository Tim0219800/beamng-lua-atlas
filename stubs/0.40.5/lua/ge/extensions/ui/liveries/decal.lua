---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/liveries/decal.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Lua-side logic of the livery editor's decals screen. It wraps editor_api_dynamicDecals: layer stack (list, selection, highlight, visibility, duplication, deletion, reordering), painting and mirroring of a decal, and the transform mode (scale, skew, rotation, projection, mouse placement) for a new decal or an existing one. It sends its state to the UI through guihooks (events liveries_decal_layersUpdated, liveries_decal_selectionChanged, liveries_decal_transformUpdated). The route hooks of routeLifecycleCallbacks call it.
--- Access: extension `ui_liveries_decal`: `extensions.load("ui_liveries_decal")`, then the global `ui_liveries_decal`
---@class ui_liveries_decal
---@field dependencies string[] Extensions loaded before this one: editor_api_dynamicDecals, ui_liveries, ui_liveries_camera, ui_liveries_paint, ui_liveries_textures.
ui_liveries_decal = {}

--- Opens a re-transform session for an existing decal: stores a copy of the layer, its highlight state and an applied flag. Replaces any previous session. Refuses if the layer is not found, is not a decal or is not centered.
---Source: lua/ge/extensions/ui/liveries/decal.lua:710
---@param layerUid string Decal uid.
---@return boolean  true if the session is open.
function ui_liveries_decal.beginExistingTransform(layerUid) end

--- Validates the current transform. Without a re-transform session, places a new decal (placeSelectedDecal); otherwise calls api.replaceDecalTransformFromCurrentProjection, marks the session as applied and navigates to "liveries.edit.decals".
---Source: lua/ge/extensions/ui/liveries/decal.lua:874
---@return string|boolean|nil  Uid of the new decal, or true/false for a re-transform.
function ui_liveries_decal.commitTransform() end

--- Deletes a layer via api.removeLayer.
---Source: lua/ge/extensions/ui/liveries/decal.lua:371
---@param layerUid string Layer uid.
function ui_liveries_decal.deleteLayer(layerUid) end

--- Duplicates a layer via api.duplicateLayer from its index and its parent.
---Source: lua/ge/extensions/ui/liveries/decal.lua:362
---@param layerUid string Layer uid.
function ui_liveries_decal.duplicateLayer(layerUid) end

--- Hook called by editor_api_dynamicDecals when a layer is moved; same handling as dynamicDecals_onLayerAdded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/liveries/decal.lua:1109
function ui_liveries_decal.dynamicDecals_moveLayer() end

--- Hook called by editor_api_dynamicDecals when a layer is added. Rebuilds the list (marking the new layer as focus) and notifies the UI. Do not call it yourself.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/liveries/decal.lua:1109
function ui_liveries_decal.dynamicDecals_onLayerAdded() end

--- Hook called by editor_api_dynamicDecals when a layer is removed; same handling as dynamicDecals_onLayerAdded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/liveries/decal.lua:1109
function ui_liveries_decal.dynamicDecals_onLayerDeleted() end

--- Hook called by editor_api_dynamicDecals when a layer is modified; same handling as dynamicDecals_onLayerAdded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/liveries/decal.lua:1109
function ui_liveries_decal.dynamicDecals_onLayerUpdated() end

--- Closes the re-transform session: hides the cursor and, if nothing was applied, restores the layer's original visibility and highlight, then refreshes the list.
---Source: lua/ge/extensions/ui/liveries/decal.lua:806
function ui_liveries_decal.endExistingTransform() end

--- Returns the mirror flags of a validated decal; the mirror plane offset (mirrorOffset) is global to the editor, not per layer.
---Source: lua/ge/extensions/ui/liveries/decal.lua:514
---@param layerUid string Layer uid.
---@return table|nil  Table layerUid, mirrored, flipMirroredDecal, mirrorOffset.
function ui_liveries_decal.getLayerMirror(layerUid) end

--- Returns whether ratio locking is active for scale and skew.
---Source: lua/ge/extensions/ui/liveries/decal.lua:970
---@return boolean  Lock state.
function ui_liveries_decal.getLockRatio() end

--- Returns the API's current mirror settings: mirrored, flipMirroredDecal, mirrorOffset.
---Source: lua/ge/extensions/ui/liveries/decal.lua:947
---@return table|nil  nil if the API is missing.
function ui_liveries_decal.getMirrorSnapshot() end

--- Returns a layer's paint (ui_liveries_paint.getLayerPaint). Active module required.
---Source: lua/ge/extensions/ui/liveries/decal.lua:478
---@param layerUid string Layer uid.
---@return table|nil  Table layerUid, color, metallic, roughness, presets.
function ui_liveries_decal.getPaint(layerUid) end

--- Returns whether "small increments" mode is active (speeds multiplied by 0.1, also for the free camera).
---Source: lua/ge/extensions/ui/liveries/decal.lua:952
---@return boolean  Mode state.
function ui_liveries_decal.getSmallIncrements() end

--- Returns the paint of the decal being transformed: the API's current color, metallic and roughness, the vehicle's presets, and the layerUid of the layer being edited (or "transform-preview" for a new decal).
---Source: lua/ge/extensions/ui/liveries/decal.lua:553
---@return table|nil  Paint table, nil if the API is missing.
function ui_liveries_decal.getTransformPaint() end

--- Returns the transform state sent to the UI: scale {x, y}, skew {x, y}, rotation (degrees), projection (label key), smallIncrements, lockRatio. Numbers are strings.
---Source: lua/ge/extensions/ui/liveries/decal.lua:942
---@return table|nil  nil if the API is missing.
function ui_liveries_decal.getTransformSnapshot() end

--- Ends transform mode: removes the action map, resets the inputs to zero, stops the camera transform, makes the decal transparent (alpha 0), turns off the projection and restores the mouse setting if needed.
---Source: lua/ge/extensions/ui/liveries/decal.lua:661
function ui_liveries_decal.hideSelectedCursor() end

--- Returns whether mouse placement of the decal is active (api.isUseMousePos).
---Source: lua/ge/extensions/ui/liveries/decal.lua:988
---@return boolean  Also false if the API is missing.
function ui_liveries_decal.isUseMousePos() end

--- Sends the layer list and the current selection back to the UI.
---Source: lua/ge/extensions/ui/liveries/decal.lua:286
function ui_liveries_decal.notifyUi() end

--- Hook called every frame with dtReal (real seconds). While the transform action map is active, applies the scale, skew and rotation inputs to the decal and notifies the UI on change.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/liveries/decal.lua:1051
---@param dtReal number Real frame duration in seconds.
function ui_liveries_decal.onUpdate(dtReal) end

--- Validates a new decal with api.addDecal from the selected texture, optionally moves it above the startAddDecal target, clears the texture selection and navigates to "liveries.edit.decals". Returns nil with a warning if no texture is selected.
---Source: lua/ge/extensions/ui/liveries/decal.lua:829
---@return string|nil  Uid of the new layer.
function ui_liveries_decal.placeSelectedDecal() end

--- Applies a new root layer order, provided it corresponds to the move of a single decal. Finds the moved layer, computes the target index taking the fill layer into account and calls api.moveLayer; the refresh comes back through the dynamicDecals_moveLayer hook.
---Source: lua/ge/extensions/ui/liveries/decal.lua:414
---@param orderedUids string[] Uids of the root layers in displayed order (first = top).
---@return boolean  false with a warning if the order is invalid, the layer is not a root decal or no anchor neighbor exists.
function ui_liveries_decal.reorderLayers(orderedUids) end

--- Pushes the transform action map again if it is not active.
---Source: lua/ge/extensions/ui/liveries/decal.lua:697
function ui_liveries_decal.resumeTransformActionMap() end

--- Selects a layer (and highlights it), or deselects if layerUid is nil. Notifies the UI of the change.
---Source: lua/ge/extensions/ui/liveries/decal.lua:291
---@param layerUid string|nil Layer uid, or nil to deselect.
---@return boolean  false if the API is missing or the layer is not found, otherwise true.
function ui_liveries_decal.select(layerUid) end

--- Flips or not the mirrored decal (api.setFlipMirroredDecal).
---Source: lua/ge/extensions/ui/liveries/decal.lua:1027
---@param value boolean New state.
---@return boolean  false if value is not a boolean.
function ui_liveries_decal.setFlipMirroredDecal(value) end

--- Updates mirrored and flipMirroredDecal of a layer, on a copy passed to setLayer so as not to touch the API history.
---Source: lua/ge/extensions/ui/liveries/decal.lua:532
---@param layerUid string Layer uid.
---@param mirror table Table with mirrored and flipMirroredDecal (booleans; anything that is not true is false).
---@return boolean  true if the update was done.
function ui_liveries_decal.setLayerMirror(layerUid, mirror) end

--- Enables or disables ratio locking and notifies the UI if the value changes.
---Source: lua/ge/extensions/ui/liveries/decal.lua:974
---@param value boolean New state.
---@return boolean  false if value is not a boolean.
function ui_liveries_decal.setLockRatio(value) end

--- Sets the mirror plane offset, clamped between -1 and 1 (api.setMirrorOffset).
---Source: lua/ge/extensions/ui/liveries/decal.lua:1039
---@param value number Offset.
---@return boolean  false if value is not a number.
function ui_liveries_decal.setMirrorOffset(value) end

--- Enables or disables mirroring of the decal being placed (api.setMirrored).
---Source: lua/ge/extensions/ui/liveries/decal.lua:1015
---@param value boolean New state.
---@return boolean  false if value is not a boolean.
function ui_liveries_decal.setMirrored(value) end

--- Applies a paint to a layer (ui_liveries_paint.setLayerPaint). Active module required.
---Source: lua/ge/extensions/ui/liveries/decal.lua:487
---@param layerUid string Layer uid.
---@param paint table color {r, g, b, a}, metallic, roughness, normalized between 0 and 1.
---@return boolean  true if the update was done.
function ui_liveries_decal.setPaint(layerUid, paint) end

--- Sets the left rotation input (trigger); the applied rotation is right minus left.
---Source: lua/ge/extensions/ui/liveries/decal.lua:911
---@param value number|nil Axis value, nil is 0.
function ui_liveries_decal.setRotateLeft(value) end

--- Sets the right rotation input (trigger).
---Source: lua/ge/extensions/ui/liveries/decal.lua:915
---@param value number|nil Axis value, nil is 0.
function ui_liveries_decal.setRotateRight(value) end

--- Sets the horizontal scale axis input (applied in onUpdate).
---Source: lua/ge/extensions/ui/liveries/decal.lua:895
---@param value number|nil Axis value, nil is 0.
function ui_liveries_decal.setScaleHorizontal(value) end

--- Sets the vertical scale axis input (applied in onUpdate).
---Source: lua/ge/extensions/ui/liveries/decal.lua:899
---@param value number|nil Axis value, nil is 0.
function ui_liveries_decal.setScaleVertical(value) end

--- Sets the horizontal skew axis input (applied in onUpdate).
---Source: lua/ge/extensions/ui/liveries/decal.lua:903
---@param value number|nil Axis value, nil is 0.
function ui_liveries_decal.setSkewHorizontal(value) end

--- Sets the vertical skew axis input (applied in onUpdate).
---Source: lua/ge/extensions/ui/liveries/decal.lua:907
---@param value number|nil Axis value, nil is 0.
function ui_liveries_decal.setSkewVertical(value) end

--- Enables or disables small increments and notifies the UI if the value changes.
---Source: lua/ge/extensions/ui/liveries/decal.lua:956
---@param value boolean New state.
---@return boolean  false if value is not a boolean.
function ui_liveries_decal.setSmallIncrements(value) end

--- Applies color (normalized RGBA, alpha is used as opacity), metallic and roughness to the decal being transformed, then calls api.onUpdate_.
---Source: lua/ge/extensions/ui/liveries/decal.lua:565
---@param paint table color {r, g, b, a}, metallic, roughness (optional, 0 to 1).
---@return boolean  false if the API is missing or paint is not a table.
function ui_liveries_decal.setTransformPaint(paint) end

--- Enables or disables mouse placement (toggles the API's UseMousePos setting if needed). During a transform, enabling it forces the camera into orbit mode.
---Source: lua/ge/extensions/ui/liveries/decal.lua:993
---@param value boolean New state.
---@return boolean  false if value is not a boolean or the API is missing.
function ui_liveries_decal.setUseMousePos(value) end

--- Chooses projection along the surface normal (true) or along the camera (false) and notifies the UI if the value changes.
---Source: lua/ge/extensions/ui/liveries/decal.lua:919
---@param value boolean Projection mode.
---@return boolean  false if value is not a boolean or the API is missing.
function ui_liveries_decal.setUseSurfaceNormal(value) end

--- Activates the module: clears the selection, the add target and the highlight, then rebuilds the layer list.
---Source: lua/ge/extensions/ui/liveries/decal.lua:259
function ui_liveries_decal.setup() end

--- Displays the existing decal's cursor: hides the original layer, copies its texture, color, scale, skew, rotation, projection and mirror into the API, projects the decal, pushes the action map and starts ui_liveries_camera.startTransformAtLayer. Warns if there is no session.
---Source: lua/ge/extensions/ui/liveries/decal.lua:751
function ui_liveries_decal.showExistingCursor() end

--- Prepares the placement of a new decal: uses the selected texture as color texture, projects the decal, resets transform and mirror to defaults, pushes the transform action map and starts ui_liveries_camera.startTransform. If a gamepad is used, disables mouse placement. Warns if no texture is selected.
---Source: lua/ge/extensions/ui/liveries/decal.lua:617
function ui_liveries_decal.showSelectedCursor() end

--- Prepares adding a decal above an existing decal (or at the top of the stack if the uid is not a decal) then navigates to the route "liveries.edit.decals.camera".
---Source: lua/ge/extensions/ui/liveries/decal.lua:823
---@param targetLayerUid string|nil Uid of the decal above which to insert.
function ui_liveries_decal.startAddDecal(targetLayerUid) end

--- Removes the transform action map and resets the inputs to zero (used when the settings are opened).
---Source: lua/ge/extensions/ui/liveries/decal.lua:684
function ui_liveries_decal.suspendTransformActionMap() end

--- Deactivates the module: ends the existing decal transform, hides the cursor, clears the selection, the selected texture (ui_liveries_textures.clearSelectedItem) and the layer list, and turns off the highlight.
---Source: lua/ge/extensions/ui/liveries/decal.lua:271
function ui_liveries_decal.teardown() end

--- Highlights the layer if it is not already (only if it is enabled), otherwise turns off the highlight. Refreshes the list.
---Source: lua/ge/extensions/ui/liveries/decal.lua:348
---@param layerUid string Layer uid.
function ui_liveries_decal.toggleLayerHighlight(layerUid) end

--- Enables or disables the display of a layer (enabled field), on a copy of the layer passed to setLayer, then refreshes the list.
---Source: lua/ge/extensions/ui/liveries/decal.lua:333
---@param layerUid string Layer uid.
function ui_liveries_decal.toggleLayerVisibility(layerUid) end

--- Toggles the projection mode (surface or camera). No effect outside a transform.
---Source: lua/ge/extensions/ui/liveries/decal.lua:935
function ui_liveries_decal.toggleProjectionMode() end

