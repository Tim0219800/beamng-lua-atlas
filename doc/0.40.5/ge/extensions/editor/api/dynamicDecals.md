# `editor_api_dynamicDecals`

*File: `lua/ge/extensions/editor/api/dynamicDecals.lua` · VM: Game Engine (GE) · 3082 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_api_dynamicDecals`: `extensions.load("editor_api_dynamicDecals")`, then the global `editor_api_dynamicDecals`

API of the dynamic decals system (livery painting on the player vehicle) used by the editor's Dynamic Decals tool. It manages a layer stack (layerStack: decal, fill, textureFill, group, brushStroke, path, linkedSet) with undo/redo history, projects/bakes these layers into the vehicle's dynamic textures via the C++ DecalProjection binding, exposes the current projection settings (color, scale, rotation, alpha mask, mirror, SDF, path, brush) as get/set, serializes the stack to JSON and exports textures and skins (jbeam + materials) to /mods/unpacked. setup() must be called before anything else.

## Example

```lua
local dd = extensions.editor_api_dynamicDecals
dd.setup()
dd.setDecalScale(vec3(0.5, 1, 0.5))
local layer = dd.addDecal({name = "Logo"})
dd.setLayerVisibility(layer.uid, false)
dd.undo()
```

## Notes

- All get/set settings functions read or write a field of the C++ decalProjection (or call its method of the same name); they crash if setup() has not been called (decalProjection = nil).
- Layer additions/deletions/moves/modifications go through history:commitAction: they can be undone with undo()/redo().
- setLayerVisibility modifies the layer directly (without history), unlike toggleLayerVisibility.
- A layer is a table with at least uid (random hexadecimal "XXXX-XXXX" string), name, type (M.layerTypes), enabled, locked, children.
- In createLayerName, the final "uid" block references a nonexistent variable `layer` (instead of layerData): it is dead because startIndex is nil at that point, so the {@uid} tag is only replaced by the final gsub on layerData.uid.
- addLinkedSet_Undo/addBrushStrokeLayer_Undo remove the last layer of the root stack (#layerStack) and ignore parentUid.
- The comments of M.toggleEnabled/onVehicleSwitched in the auto page come from commented-out code blocks (onEditorDeactivated, onExtensionLoaded): these hooks are not active.
- The exported skin file (exportSkin) is written to /mods/unpacked/<skin>/vehicles/<vehicle>/<skin>/, then core_modmanager.checkUpdate() is called.
- Layer types: decal=0, fill=1, textureFill=2, group=3, brushStroke=4, path=5, linkedSet=6.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_api_dynamicDecals.addBrushStrokeLayer(params)` | Adds a brush stroke layer from getBrushStrokeLayerData(), undoable. | 1342 |
| `editor_api_dynamicDecals.addDecal(params)` | Creates a decal layer from the current projection (camera + settings), bakes it and adds it to the stack (undoable). If not all meshes are enabled, limits the decal to the vehicle's enabled meshes. | 1098 |
| `editor_api_dynamicDecals.addFillLayer(params)` | Adds a color fill layer (current fillLayer color and palette), undoable. | 1187 |
| `editor_api_dynamicDecals.addGroup(params)` | Adds a group layer (can contain children), undoable. | 1270 |
| `editor_api_dynamicDecals.addLinkedSet(params)` | Adds a "linked set" layer (type 6, with a properties table), undoable. Undo removes the last root layer. | 1305 |
| `editor_api_dynamicDecals.addMaskDecal(layerUid_string)` | Adds a decal to the mask (layer.mask.layers) of the given layer, from the current projection (undoable). | 1053 |
| `editor_api_dynamicDecals.addMaterialIdx(materialIdx_int)` | Adds a material to the targets. | 2427 |
| `editor_api_dynamicDecals.addPathDataPoint()` | Adds a point to the current path layer (creates it on the first call with the current path settings: orientDecals, pathType, interpolationSteps, text, fontPath), then reprojects. | 1142 |
| `editor_api_dynamicDecals.addTextureFillLayer(params)` | Adds a texture fill layer (current fillTexturePath, scale, offset), undoable. | 1229 |
| `editor_api_dynamicDecals.areAllMeshesEnabled()` | true if all meshes are enabled. | 2639 |
| `editor_api_dynamicDecals.bakeBrush()` | Bakes the current brush stroke. | 2751 |
| `editor_api_dynamicDecals.bakeLayers(layers)` | Bakes a list of layers into the player vehicle's textures (decalProjection:bakeLayers). Returns nil with a message if there is no vehicle. | 1584 |
| `editor_api_dynamicDecals.changeDecalRotation(clockwise_bool, step_radian_number)` | Rotates the current decal by one step (15 degrees by default, in radians). | 1579 |
| `editor_api_dynamicDecals.changeDecalSize(increase_bool, step_number)` | Enlarges/shrinks the current decal (x and z of decalScale) by one step (0.025 by default). | 1573 |
| `editor_api_dynamicDecals.clearLayerStack()` | Clears the layer stack and the baked textures (undoable). | 1638 |
| `editor_api_dynamicDecals.clearMaterialIdx()` | Clears the list of targeted materials. | 2415 |
| `editor_api_dynamicDecals.deserializeLayer(layer)` | Rebuilds a layer from serialized data. | 483 |
| `editor_api_dynamicDecals.disableAllMeshes()` | Disables all meshes. | 2635 |
| `editor_api_dynamicDecals.disableDecalHighlighting()` | Removes the highlight. | 1524 |
| `editor_api_dynamicDecals.drawBakedTextures(maxImageWidth)` | Displays the baked textures in ImGui. | 2218 |
| `editor_api_dynamicDecals.drawBrushInputTextures(maxImageWidth)` | Displays the brush input textures in ImGui. | 2226 |
| `editor_api_dynamicDecals.drawDynamicTextures(maxImageWidth)` | Displays the dynamic textures in ImGui. | 2214 |
| `editor_api_dynamicDecals.drawHighlightTextures(maxImageWidth)` | Displays the highlight textures in ImGui. | 2222 |
| `editor_api_dynamicDecals.drawMaskTextures(maxImageWidth)` | Displays the mask textures in ImGui. | 2230 |
| `editor_api_dynamicDecals.drawTextureSet(textureSet, name, maxImageWidth)` | Displays a given textureSet in ImGui. | 2234 |
| `editor_api_dynamicDecals.duplicateAndMirrorLayer(layerId_number, parentUid_string, mirrorChildren)` | Duplicates a layer by mirroring it (name + " Mirrored Copy") right after the original (undoable). | 2008 |
| `editor_api_dynamicDecals.duplicateLayer(layerId_number, parentUid_string)` | Duplicates a layer (new uids, name + " Copy") right after the original (undoable). | 1980 |
| `editor_api_dynamicDecals.enableAllMeshes()` | Enables all meshes for projection. | 2631 |
| `editor_api_dynamicDecals.exportLayerMask(layer, directory, filename, extension)` | Exports a layer's mask to a file. | 2074 |
| `editor_api_dynamicDecals.exportSkin(vehicleName, skinName)` | Exports a skin usable as a mod: png textures (_d, _m, _r, _cp), <mat>.skin.<skinName> materials copied from the <mat>.skin.dynamicTextures presets and the skin's jbeam file (slotType paint_design) to /mods/unpacked/<skinName>/..., then refreshes the mod manager. | 2078 |
| `editor_api_dynamicDecals.exportTextures(directoryPath, exportName, extension)` | Exports the baked textures to a folder. | 2070 |
| `editor_api_dynamicDecals.finishPathLayer()` | Finishes the current path (the next points will create a new path). | 2590 |
| `editor_api_dynamicDecals.getAlphaMaskBlendMode()` | Alpha mask blend mode (0 or 1 according to the property bounds). | 2463 |
| `editor_api_dynamicDecals.getAlphaMaskChannel()` | Alpha mask channel (0 to 3 according to the property bounds). | 2455 |
| `editor_api_dynamicDecals.getAlphaMaskIntensity()` | Alpha mask intensity. | 2311 |
| `editor_api_dynamicDecals.getAlphaMaskOffset()` | Alpha mask offset. | 2303 |
| `editor_api_dynamicDecals.getAlphaMaskRotation()` | Alpha mask rotation (radians). | 2471 |
| `editor_api_dynamicDecals.getAlphaMaskScale()` | Alpha mask scale. | 2295 |
| `editor_api_dynamicDecals.getBlendMode()` | Current blend mode (M.blendModes). | 2062 |
| `editor_api_dynamicDecals.getBrushStrokeInterpolationSteps()` | Brush interpolation steps. | 2519 |
| `editor_api_dynamicDecals.getBrushStrokeLayerData()` | Data of the current brush layer (C++ side). | 2623 |
| `editor_api_dynamicDecals.getColorPaletteMapId()` | Index of the vehicle color palette used by the decal. | 2375 |
| `editor_api_dynamicDecals.getColorTextureScale()` | Color texture scale. | 2287 |
| `editor_api_dynamicDecals.getCursorPosition()` | Position of the projection cursor (screen, UV). | 2759 |
| `editor_api_dynamicDecals.getDecalColor()` | Current decal color (RGBA). | 2190 |
| `editor_api_dynamicDecals.getDecalLayerFontCharacter()` | Font character used by the decal. | 2671 |
| `editor_api_dynamicDecals.getDecalLayerFontPath()` | Path of the decal's font. | 2679 |
| `editor_api_dynamicDecals.getDecalLocalPos(decal)` | Local (vehicle) position of a decal layer. | 2651 |
| `editor_api_dynamicDecals.getDecalRotation()` | Current decal rotation (radians). | 2206 |
| `editor_api_dynamicDecals.getDecalScale()` | Current decal scale. | 2198 |
| `editor_api_dynamicDecals.getDecalSkew()` | Decal skew. | 2279 |
| `editor_api_dynamicDecals.getDecalTexturePath(type_string)` | Path of the current texture of a decal type. | 2174 |
| `editor_api_dynamicDecals.getDecalUv()` | Decal UV offset. | 2271 |
| `editor_api_dynamicDecals.getDecalWorldPos(decal)` | World position of a decal layer. | 2647 |
| `editor_api_dynamicDecals.getDecalWorldTransform(decal)` | World transform matrix of a layer. | 2659 |
| `editor_api_dynamicDecals.getDepth()` | Projection depth. | 2547 |
| `editor_api_dynamicDecals.getEnablePathLayer()` | Returns whether path mode is active. | 2582 |
| `editor_api_dynamicDecals.getEnabled()` | Is dynamic projection enabled? | 2238 |
| `editor_api_dynamicDecals.getFillLayerColor()` | Color of the fill layers. | 2439 |
| `editor_api_dynamicDecals.getFillLayerColorPaletteMapId()` | Palette index for the fill. | 2447 |
| `editor_api_dynamicDecals.getFillTexturePath()` | Current fill texture. | 2182 |
| `editor_api_dynamicDecals.getFlipMirroredDecal()` | Flip the decal on the mirror side? | 2695 |
| `editor_api_dynamicDecals.getFontTextureAtlasPath()` | Path of the font texture atlas. | 2263 |
| `editor_api_dynamicDecals.getGradientColorBottomLeft()` | Gradient color, bottom-left corner. | 2359 |
| `editor_api_dynamicDecals.getGradientColorBottomRight()` | Gradient color, bottom-right corner. | 2367 |
| `editor_api_dynamicDecals.getGradientColorTopLeft()` | Gradient color, top-left corner. | 2343 |
| `editor_api_dynamicDecals.getGradientColorTopRight()` | Gradient color, top-right corner. | 2351 |
| `editor_api_dynamicDecals.getHighlightedLayer()` | Currently highlighted layer, or nil. | 1598 |
| `editor_api_dynamicDecals.getHistory()` | Undo/redo history specific to this module. | 3046 |
| `editor_api_dynamicDecals.getLayerById(layerId_number, parentUid_string)` | Returns the layer at the given index (1-based) in the root stack or in the parent's children. | 1708 |
| `editor_api_dynamicDecals.getLayerByUid(layerUid_string)` | Looks up a layer (recursively) by uid; logs a message and returns nil if not found. | 1699 |
| `editor_api_dynamicDecals.getLayerCount()` | Total number of layers (children included). | 1567 |
| `editor_api_dynamicDecals.getLayerNameBuildString()` | Returns the layer name template. | 1009 |
| `editor_api_dynamicDecals.getLayerStack()` | Returns the root layer stack (shared table, not a copy). | 1563 |
| `editor_api_dynamicDecals.getLockDepth()` | Is depth locked? | 2539 |
| `editor_api_dynamicDecals.getLockSurfaceNormal()` | Is the surface normal locked? | 2551 |
| `editor_api_dynamicDecals.getMaterialIndices()` | List of targeted material indices. | 2419 |
| `editor_api_dynamicDecals.getMeshObjectCount()` | Number of meshes in the shape. | 2435 |
| `editor_api_dynamicDecals.getMetallicIntensity()` | Metallic intensity. | 2327 |
| `editor_api_dynamicDecals.getMirrorDebug()` | Is mirror debug display active? | 2495 |
| `editor_api_dynamicDecals.getMirrorOffset()` | Mirror plane offset. | 2487 |
| `editor_api_dynamicDecals.getMirrored()` | Is mirror mode active? | 2479 |
| `editor_api_dynamicDecals.getNormalIntensity()` | Normal map intensity. | 2319 |
| `editor_api_dynamicDecals.getOrientPathDecals()` | Whether decals follow the path direction. | 2607 |
| `editor_api_dynamicDecals.getPathLayerFontPath()` | Path of the path's font. | 2687 |
| `editor_api_dynamicDecals.getPathLayerInterpolationSteps()` | Path interpolation steps. | 2527 |
| `editor_api_dynamicDecals.getPathLayerText()` | Text placed along the path. | 2663 |
| `editor_api_dynamicDecals.getPathType()` | Path type (M.pathTypes). | 2615 |
| `editor_api_dynamicDecals.getRandomUid()` | Generates a pseudo-unique "XXXX-XXXX" uid (hexadecimal). | 48 |
| `editor_api_dynamicDecals.getRoughnessIntensity()` | Roughness intensity. | 2335 |
| `editor_api_dynamicDecals.getSdfEnabled()` | Is SDF rendering active? | 2711 |
| `editor_api_dynamicDecals.getSdfOutlineColor()` | SDF outline color. | 2703 |
| `editor_api_dynamicDecals.getSdfOutlineSoftness()` | SDF outline softness. | 2743 |
| `editor_api_dynamicDecals.getSdfOutlineThickness()` | SDF outline thickness. | 2735 |
| `editor_api_dynamicDecals.getSdfSoftness()` | SDF softness. | 2727 |
| `editor_api_dynamicDecals.getSdfThickness()` | SDF thickness. | 2719 |
| `editor_api_dynamicDecals.getSettings()` | Bit mask of the projector settings (M.settingsFlags). | 2026 |
| `editor_api_dynamicDecals.getShapeMaterialNames()` | Shape materials (index -> name). | 2535 |
| `editor_api_dynamicDecals.getShapeMeshes()` | Shape meshes and their activation state. | 2627 |
| `editor_api_dynamicDecals.getShapePath()` | Path of the 3D model (shape) projected onto. | 2385 |
| `editor_api_dynamicDecals.getSurfaceNormal()` | Current surface normal. | 2559 |
| `editor_api_dynamicDecals.getTextureFillLayerScale()` | Scale of the texture fill layers. | 2503 |
| `editor_api_dynamicDecals.getTextureFillOffset()` | Texture fill offset. | 2511 |
| `editor_api_dynamicDecals.getTextureResolution()` | Resolution of the dynamic textures. | 2394 |
| `editor_api_dynamicDecals.getTextureSet()` | TextureSet of the dynamic textures (nil before setup). | 2755 |
| `editor_api_dynamicDecals.getUseSurfaceNormal()` | Orient the decal along the surface normal? | 2563 |
| `editor_api_dynamicDecals.getUvLayer()` | UV channel used. | 2406 |
| `editor_api_dynamicDecals.hasActivePathLayer()` | true if a path layer is currently being edited. | 2586 |
| `editor_api_dynamicDecals.highlightLayer(layer_table)` | Highlights a layer (table). | 1603 |
| `editor_api_dynamicDecals.highlightLayerByUid(layerUid_string)` | Highlights a layer by uid. | 1612 |
| `editor_api_dynamicDecals.isAlphaMaskInvertEnabled()` | Is the AlphaMaskInvert flag active? | 2034 |
| `editor_api_dynamicDecals.isDecalGradientColorEnabled()` | Is the UseGradientColor flag active? | 2030 |
| `editor_api_dynamicDecals.isUseMousePos()` | Is the UseMousePos flag active (projection at the mouse cursor rather than the center)? | 2054 |
| `editor_api_dynamicDecals.isWrapAlphaMaskXEnabled()` | Is the WrapAlphaMaskX flag active? | 2038 |
| `editor_api_dynamicDecals.isWrapAlphaMaskYEnabled()` | Is the WrapAlphaMaskY flag active? | 2042 |
| `editor_api_dynamicDecals.isWrapColorTextureXEnabled()` | Is the WrapColorTextureX flag active? | 2046 |
| `editor_api_dynamicDecals.isWrapColorTextureYEnabled()` | Is the WrapColorTextureY flag active? | 2050 |
| `editor_api_dynamicDecals.loadLayerStackFromFile(path_string, mode_number)` | Loads a stack from a JSON, overwriting (Overwrite, default) or appending (Append), then reprojects. | 3017 |
| `editor_api_dynamicDecals.moveLayer(from_number, fromParentUid_string, to_number, toParentUid_string)` | Moves a layer to another position/parent (undoable). Refuses to make a layer its own child. Emits dynamicDecals_moveLayer. | 1899 |
| `editor_api_dynamicDecals.moveLayerLocalPos(layerUid, newLocalPosition, includeChildren, referenceLayerUid)` | Moves a layer (decal, brushStroke, path or group) to a new vehicle-local position. For a group, referenceLayerUid is required. | 2921 |
| `editor_api_dynamicDecals.onDeserialized(data)` | Hook called with the saved data: recreates the layer stack and remembers materialIdx for setup(). *(internal)* *(hook)* | 3004 |
| `editor_api_dynamicDecals.onSerialize()` | Extension serialization hook: returns {layerStackData, materialIdx} (nil without a projector). *(internal)* *(hook)* | 2994 |
| `editor_api_dynamicDecals.onUpdate_()` | Called every frame by the tool: updates the app, projects the preview decal if projectDynamicDecals is set, then combines the textures into the textureSet. *(internal)* *(hook)* | 3028 |
| `editor_api_dynamicDecals.onVehicleSwitched()` | Hook called on vehicle switch: refreshes the shape and the materials. *(internal)* *(hook)* | 3071 |
| `editor_api_dynamicDecals.redo()` | Redoes the last undone action. | 3054 |
| `editor_api_dynamicDecals.removeLastPathLayerPoint()` | Removes the last point of the current path; if only one remains, deletes the layer. | 2594 |
| `editor_api_dynamicDecals.removeLayer(index_number, parentUid_string)` | Deletes a layer (undoable) and turns off highlighting if it was highlighted. | 1941 |
| `editor_api_dynamicDecals.removeMaterialIdx(materialIdx_int)` | Removes a material from the targets. | 2431 |
| `editor_api_dynamicDecals.renderSdfTextureImgui(sizeX, sizeY)` | Displays the SDF texture in ImGui. | 2767 |
| `editor_api_dynamicDecals.replaceDecalTransformFromCurrentProjection(layerUid_string, originalLayer)` | Repositions an already placed decal according to the current camera/projection, changing only its transform fields (camPosition, decalPos, decalScale, decalRotation, mirror...). Refuses if the captured cursor is not centered (0.5 ± 0.01) or if the layer is not a decal. Commits a "Transform Decal" action. | 1827 |
| `editor_api_dynamicDecals.reprojectLayers()` | Clears the baked textures and rebakes the whole stack; shows a failure if baking returns nil. | 1647 |
| `editor_api_dynamicDecals.rotateLayer(layer, delta_vec3)` | Applies a delta rotation to a layer and its children. | 2938 |
| `editor_api_dynamicDecals.saveLayerStackToFile(path_string)` | Writes the layer stack to a JSON file (without materialIdx). | 3011 |
| `editor_api_dynamicDecals.scaleLayer(layer, delta_vec3)` | Scales a layer and its children by (1,1,1) + delta. | 2960 |
| `editor_api_dynamicDecals.serializeLayer(layer)` | Converts a layer to a JSON-serializable table (engine types converted). | 230 |
| `editor_api_dynamicDecals.setAlphaMaskBlendMode(value_int)` | Sets the alpha mask blend mode. | 2467 |
| `editor_api_dynamicDecals.setAlphaMaskChannel(value_int)` | Sets the alpha mask channel. | 2459 |
| `editor_api_dynamicDecals.setAlphaMaskIntensity(value_float)` | Sets the alpha mask intensity. | 2315 |
| `editor_api_dynamicDecals.setAlphaMaskOffset(value_Point2F)` | Sets the alpha mask offset. | 2307 |
| `editor_api_dynamicDecals.setAlphaMaskRotation(value_radian_float)` | Sets the alpha mask rotation. | 2475 |
| `editor_api_dynamicDecals.setAlphaMaskScale(value_Point2F)` | Sets the alpha mask scale. | 2299 |
| `editor_api_dynamicDecals.setBlendMode(blendMode_int)` | Sets the current blend mode. | 2066 |
| `editor_api_dynamicDecals.setBrushStrokeInterpolationSteps(value_u32)` | Sets the brush interpolation steps. | 2523 |
| `editor_api_dynamicDecals.setColorPaletteMapId(value_int)` | Sets the decal's palette index. | 2379 |
| `editor_api_dynamicDecals.setColorTextureScale(value_Point2F)` | Sets the color texture scale. | 2291 |
| `editor_api_dynamicDecals.setCursorPosition(value_Point2F)` | Sets the position of the projection cursor. | 2763 |
| `editor_api_dynamicDecals.setDecalColor(value_Point4F)` | Sets the decal color. | 2194 |
| `editor_api_dynamicDecals.setDecalLayerFontCharacter(value_char)` | Sets the decal's font character. | 2675 |
| `editor_api_dynamicDecals.setDecalLayerFontPath(value_string)` | Sets the decal's font. | 2683 |
| `editor_api_dynamicDecals.setDecalLocalPos(decal, worldPos)` | Sets a decal's position (parameter name is worldPos in the code). | 2655 |
| `editor_api_dynamicDecals.setDecalRotation(value_radian_number)` | Sets the decal rotation. | 2210 |
| `editor_api_dynamicDecals.setDecalScale(value_vec3)` | Sets the decal scale. | 2202 |
| `editor_api_dynamicDecals.setDecalSkew(value_Point2F)` | Sets the decal skew. | 2283 |
| `editor_api_dynamicDecals.setDecalTexturePath(type_string, path_string)` | Sets the current texture of a decal type. | 2178 |
| `editor_api_dynamicDecals.setDecalUv(value_Point2F)` | Sets the decal UV offset. | 2275 |
| `editor_api_dynamicDecals.setEnableBrushStroke(value_bool)` | Enables/disables the projector's brush mode (with a new random uid). | 2571 |
| `editor_api_dynamicDecals.setEnablePathLayer(value_bool)` | Enables/disables path mode; when set to false, finishes the current path. | 2575 |
| `editor_api_dynamicDecals.setEnabled(enabled)` | Enables/disables the projector; when set to false, clears the dynamic textures and recombines the textureSet. | 2242 |
| `editor_api_dynamicDecals.setFillLayerColor(value_Point4F)` | Sets the color of the fill layers. | 2443 |
| `editor_api_dynamicDecals.setFillLayerColorPaletteMapId(value_int)` | Sets the palette index for the fill. | 2451 |
| `editor_api_dynamicDecals.setFillTexturePath(path_string)` | Sets the fill texture. | 2186 |
| `editor_api_dynamicDecals.setFlipMirroredDecal(value_bool)` | Enables flipping of the decal on the mirror side. | 2699 |
| `editor_api_dynamicDecals.setFontTextureAtlasPath(path_string)` | Sets the font texture atlas. | 2267 |
| `editor_api_dynamicDecals.setGradientColorBottomLeft(value_ColorI)` | Sets the gradient color, bottom-left corner. | 2363 |
| `editor_api_dynamicDecals.setGradientColorBottomRight(value_ColorI)` | Sets the gradient color, bottom-right corner. | 2371 |
| `editor_api_dynamicDecals.setGradientColorTopLeft(value_ColorI)` | Sets the gradient color, top-left corner. | 2347 |
| `editor_api_dynamicDecals.setGradientColorTopRight(value_ColorI)` | Sets the gradient color, top-right corner. | 2355 |
| `editor_api_dynamicDecals.setLayer(layerData_table, doReproject_bool)` | Replaces a layer (by uid) with the given data, undoable, and emits dynamicDecals_setLayer(uid); dynamicDecals_onLayerUpdated(uid) is emitted on apply. | 1754 |
| `editor_api_dynamicDecals.setLayerNameBuildString(value_string)` | Sets the name template for new layers (default "$type Layer"). Tags: @type, @colormap, @normalmap, @metallicmap, @roughnessmap, @alphamap, @uid; a {text@tag text} block only appears if the tag is not empty. | 1005 |
| `editor_api_dynamicDecals.setLayerVisibility(layerUid_string, visibility_bool)` | Shows/hides a layer directly (without history) and reprojects. | 1530 |
| `editor_api_dynamicDecals.setLockDepth(value_bool)` | Locks/unlocks the projection depth. | 2543 |
| `editor_api_dynamicDecals.setLockSurfaceNormal(value_bool)` | Locks/unlocks the surface normal. | 2555 |
| `editor_api_dynamicDecals.setMaterialIdx(materialIdx_int)` | Sets the single material targeted by the projection. | 2423 |
| `editor_api_dynamicDecals.setMeshEnable(name_string, value_bool)` | Enables/disables a mesh by name. | 2643 |
| `editor_api_dynamicDecals.setMetallicIntensity(value_float)` | Sets the metallic intensity. | 2331 |
| `editor_api_dynamicDecals.setMirrorDebug(value_bool)` | Enables mirror debug. | 2499 |
| `editor_api_dynamicDecals.setMirrorOffset(value_float)` | Sets the mirror plane offset. | 2491 |
| `editor_api_dynamicDecals.setMirrored(value_bool)` | Enables/disables the mirror. | 2483 |
| `editor_api_dynamicDecals.setNormalIntensity(value_float)` | Sets the normal map intensity. | 2323 |
| `editor_api_dynamicDecals.setOrientPathDecals(value_bool)` | Sets whether the path's decals are oriented along the path. | 2611 |
| `editor_api_dynamicDecals.setPathLayerFontPath(value_string)` | Sets the path's font. | 2691 |
| `editor_api_dynamicDecals.setPathLayerInterpolationSteps(value_u32)` | Sets the path interpolation steps. | 2531 |
| `editor_api_dynamicDecals.setPathLayerText(value_string)` | Sets the text placed along the path. | 2667 |
| `editor_api_dynamicDecals.setPathType(value_int)` | Sets the path type. | 2619 |
| `editor_api_dynamicDecals.setProjectDynamicDecalsState(value)` | Enables/disables the preview projection (M.projectDynamicDecals). | 1013 |
| `editor_api_dynamicDecals.setRoughnessIntensity(value_float)` | Sets the roughness intensity. | 2339 |
| `editor_api_dynamicDecals.setSdfEnabled(value_bool)` | Enables/disables SDF rendering. | 2715 |
| `editor_api_dynamicDecals.setSdfOutlineColor(value_ColorI)` | Sets the SDF outline color. | 2707 |
| `editor_api_dynamicDecals.setSdfOutlineSoftness(value_f32)` | Sets the SDF outline softness. | 2747 |
| `editor_api_dynamicDecals.setSdfOutlineThickness(value_f32)` | Sets the SDF outline thickness. | 2739 |
| `editor_api_dynamicDecals.setSdfSoftness(value_f32)` | Sets the SDF softness. | 2731 |
| `editor_api_dynamicDecals.setSdfThickness(value_f32)` | Sets the SDF thickness. | 2723 |
| `editor_api_dynamicDecals.setShapePath(path)` | Changes the projection model then reprojects. | 2389 |
| `editor_api_dynamicDecals.setTextureFillLayerScale(value_Point2F)` | Sets the texture fill scale. | 2507 |
| `editor_api_dynamicDecals.setTextureFillOffset(value_Point2F)` | Sets the texture fill offset. | 2515 |
| `editor_api_dynamicDecals.setTextureResolution(resolution_point2i)` | Changes the resolution; if the engine accepts it, reprojects and reassigns the @DynamicTexture textureSet. | 2398 |
| `editor_api_dynamicDecals.setUseSurfaceNormal(value_bool)` | Enables orientation along the surface normal. | 2567 |
| `editor_api_dynamicDecals.setUvLayer(uvLayerId_int)` | Changes the UV channel then reprojects. | 2410 |
| `editor_api_dynamicDecals.setup()` | Initializes the projector: uses the active DecalShapeRenderApp app if it exists, otherwise creates a DecalProjection (4096x2048) bound to the player vehicle; fetches the textureSet, updates the vehicle materials and adds a base fill layer if the stack is empty. No effect if already done. | 1452 |
| `editor_api_dynamicDecals.toggleEnabled()` | Toggles the projector state (same effects as setEnabled). | 2255 |
| `editor_api_dynamicDecals.toggleLayerVisibility(layerUid_string)` | Toggles a layer's visibility (undoable) and reprojects. | 1549 |
| `editor_api_dynamicDecals.toggleSetting(value_int)` | Toggles a settings flag. | 2058 |
| `editor_api_dynamicDecals.undo()` | Undoes the last action of the decals history. | 3050 |
| `editor_api_dynamicDecals.updateVehicleMaterials()` | Starts a job that chooses the default decal material(s) based on the player vehicle (materials of its parts, otherwise the material named after the jbeam, otherwise ending with main then body). | 1447 |

### Parameter details

#### `editor_api_dynamicDecals.addBrushStrokeLayer(params)`

Adds a brush stroke layer from getBrushStrokeLayerData(), undoable.

- `params` (*table|nil*) : name (inferred from code)
- **returns**: table Created layer (inferred from code)

#### `editor_api_dynamicDecals.addDecal(params)`

Creates a decal layer from the current projection (camera + settings), bakes it and adds it to the stack (undoable). If not all meshes are enabled, limits the decal to the vehicle's enabled meshes.

- `params` (*table|nil*) : name (generated default), parentUid (parent group layer)
- **returns**: table Data of the created layer

#### `editor_api_dynamicDecals.addFillLayer(params)`

Adds a color fill layer (current fillLayer color and palette), undoable.

- `params` (*table|nil*) : name, parentUid
- **returns**: table Created layer

#### `editor_api_dynamicDecals.addGroup(params)`

Adds a group layer (can contain children), undoable.

- `params` (*table|nil*) : name, parentUid
- **returns**: table Created layer

#### `editor_api_dynamicDecals.addLinkedSet(params)`

Adds a "linked set" layer (type 6, with a properties table), undoable. Undo removes the last root layer.

- `params` (*table|nil*) : name, parentUid
- **returns**: table Created layer

#### `editor_api_dynamicDecals.addMaskDecal(layerUid_string)`

Adds a decal to the mask (layer.mask.layers) of the given layer, from the current projection (undoable).

- `layerUid_string` (*string*) : uid of the layer to mask

#### `editor_api_dynamicDecals.addMaterialIdx(materialIdx_int)`

Adds a material to the targets.

- `materialIdx_int` (*integer*) : Index

#### `editor_api_dynamicDecals.addPathDataPoint()`

Adds a point to the current path layer (creates it on the first call with the current path settings: orientDecals, pathType, interpolationSteps, text, fontPath), then reprojects.

- **returns**: table Point/layer data

#### `editor_api_dynamicDecals.addTextureFillLayer(params)`

Adds a texture fill layer (current fillTexturePath, scale, offset), undoable.

- `params` (*table|nil*) : name, parentUid
- **returns**: table Created layer

#### `editor_api_dynamicDecals.areAllMeshesEnabled()`

true if all meshes are enabled.

- **returns**: boolean State

#### `editor_api_dynamicDecals.bakeLayers(layers)`

Bakes a list of layers into the player vehicle's textures (decalProjection:bakeLayers). Returns nil with a message if there is no vehicle.

- `layers` (*table[]*) : Layers to bake
- **returns**: table|nil Result (status field: M.layerBakingStatusCode)

#### `editor_api_dynamicDecals.changeDecalRotation(clockwise_bool, step_radian_number)`

Rotates the current decal by one step (15 degrees by default, in radians).

- `clockwise_bool` (*boolean*) : Clockwise
- `step_radian_number` (*number|nil*) : Step in radians

#### `editor_api_dynamicDecals.changeDecalSize(increase_bool, step_number)`

Enlarges/shrinks the current decal (x and z of decalScale) by one step (0.025 by default).

- `increase_bool` (*boolean*) : true to enlarge
- `step_number` (*number|nil*) : Steps

#### `editor_api_dynamicDecals.deserializeLayer(layer)`

Rebuilds a layer from serialized data.

- `layer` (*table*) : Serialized data
- **returns**: table Layer

#### `editor_api_dynamicDecals.drawBakedTextures(maxImageWidth)`

Displays the baked textures in ImGui.

- `maxImageWidth` (*number*) : Max width

#### `editor_api_dynamicDecals.drawBrushInputTextures(maxImageWidth)`

Displays the brush input textures in ImGui.

- `maxImageWidth` (*number*) : Max width

#### `editor_api_dynamicDecals.drawDynamicTextures(maxImageWidth)`

Displays the dynamic textures in ImGui.

- `maxImageWidth` (*number*) : Max width

#### `editor_api_dynamicDecals.drawHighlightTextures(maxImageWidth)`

Displays the highlight textures in ImGui.

- `maxImageWidth` (*number*) : Max width

#### `editor_api_dynamicDecals.drawMaskTextures(maxImageWidth)`

Displays the mask textures in ImGui.

- `maxImageWidth` (*number*) : Max width

#### `editor_api_dynamicDecals.drawTextureSet(textureSet, name, maxImageWidth)`

Displays a given textureSet in ImGui.

- `textureSet` (*userdata*) : TextureSet
- `name` (*string*) : Title
- `maxImageWidth` (*number*) : Max width

#### `editor_api_dynamicDecals.duplicateAndMirrorLayer(layerId_number, parentUid_string, mirrorChildren)`

Duplicates a layer by mirroring it (name + " Mirrored Copy") right after the original (undoable).

- `layerId_number` (*integer*) : Index
- `parentUid_string` (*string|nil*) : Parent
- `mirrorChildren` (*boolean|nil*) : Also mirror the children

#### `editor_api_dynamicDecals.duplicateLayer(layerId_number, parentUid_string)`

Duplicates a layer (new uids, name + " Copy") right after the original (undoable).

- `layerId_number` (*integer*) : Index
- `parentUid_string` (*string|nil*) : Parent

#### `editor_api_dynamicDecals.exportLayerMask(layer, directory, filename, extension)`

Exports a layer's mask to a file.

- `layer` (*table*) : Layer
- `directory` (*string*) : Folder
- `filename` (*string*) : File name
- `extension` (*string*) : Extension

#### `editor_api_dynamicDecals.exportSkin(vehicleName, skinName)`

Exports a skin usable as a mod: png textures (_d, _m, _r, _cp), <mat>.skin.<skinName> materials copied from the <mat>.skin.dynamicTextures presets and the skin's jbeam file (slotType paint_design) to /mods/unpacked/<skinName>/..., then refreshes the mod manager.

- `vehicleName` (*string*) : Vehicle name
- `skinName` (*string*) : Skin name

#### `editor_api_dynamicDecals.exportTextures(directoryPath, exportName, extension)`

Exports the baked textures to a folder.

- `directoryPath` (*string*) : Folder
- `exportName` (*string*) : Base name
- `extension` (*string*) : Extension (e.g. png)
- **returns**: any Engine result

#### `editor_api_dynamicDecals.getAlphaMaskBlendMode()`

Alpha mask blend mode (0 or 1 according to the property bounds).

- **returns**: integer Mode

#### `editor_api_dynamicDecals.getAlphaMaskChannel()`

Alpha mask channel (0 to 3 according to the property bounds).

- **returns**: integer Channel

#### `editor_api_dynamicDecals.getAlphaMaskIntensity()`

Alpha mask intensity.

- **returns**: number Intensity

#### `editor_api_dynamicDecals.getAlphaMaskOffset()`

Alpha mask offset.

- **returns**: Point2F Offset

#### `editor_api_dynamicDecals.getAlphaMaskRotation()`

Alpha mask rotation (radians).

- **returns**: number Radians

#### `editor_api_dynamicDecals.getAlphaMaskScale()`

Alpha mask scale.

- **returns**: Point2F Scale

#### `editor_api_dynamicDecals.getBlendMode()`

Current blend mode (M.blendModes).

- **returns**: integer Value

#### `editor_api_dynamicDecals.getBrushStrokeInterpolationSteps()`

Brush interpolation steps.

- **returns**: integer Steps

#### `editor_api_dynamicDecals.getBrushStrokeLayerData()`

Data of the current brush layer (C++ side).

- **returns**: table Data

#### `editor_api_dynamicDecals.getColorPaletteMapId()`

Index of the vehicle color palette used by the decal.

- **returns**: integer Index

#### `editor_api_dynamicDecals.getColorTextureScale()`

Color texture scale.

- **returns**: Point2F Scale

#### `editor_api_dynamicDecals.getCursorPosition()`

Position of the projection cursor (screen, UV).

- **returns**: Point2F Position

#### `editor_api_dynamicDecals.getDecalColor()`

Current decal color (RGBA).

- **returns**: Point4F Color

#### `editor_api_dynamicDecals.getDecalLayerFontCharacter()`

Font character used by the decal.

- **returns**: string Character

#### `editor_api_dynamicDecals.getDecalLayerFontPath()`

Path of the decal's font.

- **returns**: string Path

#### `editor_api_dynamicDecals.getDecalLocalPos(decal)`

Local (vehicle) position of a decal layer.

- `decal` (*table*) : Layer
- **returns**: vec3 Position

#### `editor_api_dynamicDecals.getDecalRotation()`

Current decal rotation (radians).

- **returns**: number Radians

#### `editor_api_dynamicDecals.getDecalScale()`

Current decal scale.

- **returns**: vec3 Scale

#### `editor_api_dynamicDecals.getDecalSkew()`

Decal skew.

- **returns**: Point2F Skew

#### `editor_api_dynamicDecals.getDecalTexturePath(type_string)`

Path of the current texture of a decal type.

- `type_string` (*string*) : Texture type (color, normal, metallic, roughness, alpha, inferred from the decal*TexturePath fields)
- **returns**: string Path

#### `editor_api_dynamicDecals.getDecalUv()`

Decal UV offset.

- **returns**: Point2F UV

#### `editor_api_dynamicDecals.getDecalWorldPos(decal)`

World position of a decal layer.

- `decal` (*table*) : Layer
- **returns**: vec3 Position

#### `editor_api_dynamicDecals.getDecalWorldTransform(decal)`

World transform matrix of a layer.

- `decal` (*table*) : Layer
- **returns**: MatrixF Transform

#### `editor_api_dynamicDecals.getDepth()`

Projection depth.

- **returns**: number Depth

#### `editor_api_dynamicDecals.getEnablePathLayer()`

Returns whether path mode is active.

- **returns**: boolean State

#### `editor_api_dynamicDecals.getEnabled()`

Is dynamic projection enabled?

- **returns**: boolean State

#### `editor_api_dynamicDecals.getFillLayerColor()`

Color of the fill layers.

- **returns**: Point4F Color

#### `editor_api_dynamicDecals.getFillLayerColorPaletteMapId()`

Palette index for the fill.

- **returns**: integer Index

#### `editor_api_dynamicDecals.getFillTexturePath()`

Current fill texture.

- **returns**: string Path

#### `editor_api_dynamicDecals.getFlipMirroredDecal()`

Flip the decal on the mirror side?

- **returns**: boolean State

#### `editor_api_dynamicDecals.getFontTextureAtlasPath()`

Path of the font texture atlas.

- **returns**: string Path

#### `editor_api_dynamicDecals.getGradientColorBottomLeft()`

Gradient color, bottom-left corner.

- **returns**: ColorI Color

#### `editor_api_dynamicDecals.getGradientColorBottomRight()`

Gradient color, bottom-right corner.

- **returns**: ColorI Color

#### `editor_api_dynamicDecals.getGradientColorTopLeft()`

Gradient color, top-left corner.

- **returns**: ColorI Color

#### `editor_api_dynamicDecals.getGradientColorTopRight()`

Gradient color, top-right corner.

- **returns**: ColorI Color

#### `editor_api_dynamicDecals.getHighlightedLayer()`

Currently highlighted layer, or nil.

- **returns**: table|nil Layer

#### `editor_api_dynamicDecals.getHistory()`

Undo/redo history specific to this module.

- **returns**: table History

#### `editor_api_dynamicDecals.getLayerById(layerId_number, parentUid_string)`

Returns the layer at the given index (1-based) in the root stack or in the parent's children.

- `layerId_number` (*integer*) : Index
- `parentUid_string` (*string|nil*) : Parent uid
- **returns**: table|nil Layer

#### `editor_api_dynamicDecals.getLayerByUid(layerUid_string)`

Looks up a layer (recursively) by uid; logs a message and returns nil if not found.

- `layerUid_string` (*string*) : uid
- **returns**: table|nil Layer

#### `editor_api_dynamicDecals.getLayerCount()`

Total number of layers (children included).

- **returns**: integer Count

#### `editor_api_dynamicDecals.getLayerNameBuildString()`

Returns the layer name template.

- **returns**: string Template

#### `editor_api_dynamicDecals.getLayerStack()`

Returns the root layer stack (shared table, not a copy).

- **returns**: table[] Layers

#### `editor_api_dynamicDecals.getLockDepth()`

Is depth locked?

- **returns**: boolean State

#### `editor_api_dynamicDecals.getLockSurfaceNormal()`

Is the surface normal locked?

- **returns**: boolean State

#### `editor_api_dynamicDecals.getMaterialIndices()`

List of targeted material indices.

- **returns**: integer[] Index

#### `editor_api_dynamicDecals.getMeshObjectCount()`

Number of meshes in the shape.

- **returns**: integer Count

#### `editor_api_dynamicDecals.getMetallicIntensity()`

Metallic intensity.

- **returns**: number Intensity

#### `editor_api_dynamicDecals.getMirrorDebug()`

Is mirror debug display active?

- **returns**: boolean State

#### `editor_api_dynamicDecals.getMirrorOffset()`

Mirror plane offset.

- **returns**: number Offset

#### `editor_api_dynamicDecals.getMirrored()`

Is mirror mode active?

- **returns**: boolean State

#### `editor_api_dynamicDecals.getNormalIntensity()`

Normal map intensity.

- **returns**: number Intensity

#### `editor_api_dynamicDecals.getOrientPathDecals()`

Whether decals follow the path direction.

- **returns**: boolean State

#### `editor_api_dynamicDecals.getPathLayerFontPath()`

Path of the path's font.

- **returns**: string Path

#### `editor_api_dynamicDecals.getPathLayerInterpolationSteps()`

Path interpolation steps.

- **returns**: integer Steps

#### `editor_api_dynamicDecals.getPathLayerText()`

Text placed along the path.

- **returns**: string Text

#### `editor_api_dynamicDecals.getPathType()`

Path type (M.pathTypes).

- **returns**: integer 0 Linear, 1 Bezier

#### `editor_api_dynamicDecals.getRandomUid()`

Generates a pseudo-unique "XXXX-XXXX" uid (hexadecimal).

- **returns**: string uid

#### `editor_api_dynamicDecals.getRoughnessIntensity()`

Roughness intensity.

- **returns**: number Intensity

#### `editor_api_dynamicDecals.getSdfEnabled()`

Is SDF rendering active?

- **returns**: boolean State

#### `editor_api_dynamicDecals.getSdfOutlineColor()`

SDF outline color.

- **returns**: ColorI Color

#### `editor_api_dynamicDecals.getSdfOutlineSoftness()`

SDF outline softness.

- **returns**: number Value

#### `editor_api_dynamicDecals.getSdfOutlineThickness()`

SDF outline thickness.

- **returns**: number Value

#### `editor_api_dynamicDecals.getSdfSoftness()`

SDF softness.

- **returns**: number Value

#### `editor_api_dynamicDecals.getSdfThickness()`

SDF thickness.

- **returns**: number Value

#### `editor_api_dynamicDecals.getSettings()`

Bit mask of the projector settings (M.settingsFlags).

- **returns**: integer Flags

#### `editor_api_dynamicDecals.getShapeMaterialNames()`

Shape materials (index -> name).

- **returns**: table<integer, string> Names

#### `editor_api_dynamicDecals.getShapeMeshes()`

Shape meshes and their activation state.

- **returns**: table<string, boolean> name -> enabled

#### `editor_api_dynamicDecals.getShapePath()`

Path of the 3D model (shape) projected onto.

- **returns**: string Path

#### `editor_api_dynamicDecals.getSurfaceNormal()`

Current surface normal.

- **returns**: vec3 Normal

#### `editor_api_dynamicDecals.getTextureFillLayerScale()`

Scale of the texture fill layers.

- **returns**: Point2F Scale

#### `editor_api_dynamicDecals.getTextureFillOffset()`

Texture fill offset.

- **returns**: Point2F Offset

#### `editor_api_dynamicDecals.getTextureResolution()`

Resolution of the dynamic textures.

- **returns**: Point2I Resolution

#### `editor_api_dynamicDecals.getTextureSet()`

TextureSet of the dynamic textures (nil before setup).

- **returns**: userdata|nil TextureSet

#### `editor_api_dynamicDecals.getUseSurfaceNormal()`

Orient the decal along the surface normal?

- **returns**: boolean State

#### `editor_api_dynamicDecals.getUvLayer()`

UV channel used.

- **returns**: integer UV index

#### `editor_api_dynamicDecals.hasActivePathLayer()`

true if a path layer is currently being edited.

- **returns**: boolean State

#### `editor_api_dynamicDecals.highlightLayer(layer_table)`

Highlights a layer (table).

- `layer_table` (*table*) : Layer

#### `editor_api_dynamicDecals.highlightLayerByUid(layerUid_string)`

Highlights a layer by uid.

- `layerUid_string` (*string*) : uid

#### `editor_api_dynamicDecals.isAlphaMaskInvertEnabled()`

Is the AlphaMaskInvert flag active?

- **returns**: boolean State

#### `editor_api_dynamicDecals.isDecalGradientColorEnabled()`

Is the UseGradientColor flag active?

- **returns**: boolean State

#### `editor_api_dynamicDecals.isUseMousePos()`

Is the UseMousePos flag active (projection at the mouse cursor rather than the center)?

- **returns**: boolean State

#### `editor_api_dynamicDecals.isWrapAlphaMaskXEnabled()`

Is the WrapAlphaMaskX flag active?

- **returns**: boolean State

#### `editor_api_dynamicDecals.isWrapAlphaMaskYEnabled()`

Is the WrapAlphaMaskY flag active?

- **returns**: boolean State

#### `editor_api_dynamicDecals.isWrapColorTextureXEnabled()`

Is the WrapColorTextureX flag active?

- **returns**: boolean State

#### `editor_api_dynamicDecals.isWrapColorTextureYEnabled()`

Is the WrapColorTextureY flag active?

- **returns**: boolean State

#### `editor_api_dynamicDecals.loadLayerStackFromFile(path_string, mode_number)`

Loads a stack from a JSON, overwriting (Overwrite, default) or appending (Append), then reprojects.

- `path_string` (*string*) : File
- `mode_number` (*integer|nil*) : M.loadingModes: 0 Overwrite, 1 Append
- **returns**: table|nil Result of reprojectLayers (nil in the current code, the function returns nothing)

#### `editor_api_dynamicDecals.moveLayer(from_number, fromParentUid_string, to_number, toParentUid_string)`

Moves a layer to another position/parent (undoable). Refuses to make a layer its own child. Emits dynamicDecals_moveLayer.

- `from_number` (*integer*) : Source index
- `fromParentUid_string` (*string|nil*) : Source parent
- `to_number` (*integer*) : Destination index
- `toParentUid_string` (*string|nil*) : Destination parent

#### `editor_api_dynamicDecals.moveLayerLocalPos(layerUid, newLocalPosition, includeChildren, referenceLayerUid)`

Moves a layer (decal, brushStroke, path or group) to a new vehicle-local position. For a group, referenceLayerUid is required.

- `layerUid` (*string*) : uid of the layer
- `newLocalPosition` (*vec3*) : New position
- `includeChildren` (*boolean|nil*) : Also move the children
- `referenceLayerUid` (*string|nil*) : Reference layer (groups)

#### `editor_api_dynamicDecals.onDeserialized(data)`

Hook called with the saved data: recreates the layer stack and remembers materialIdx for setup().

- `data` (*table*) : Data from onSerialize

#### `editor_api_dynamicDecals.onSerialize()`

Extension serialization hook: returns {layerStackData, materialIdx} (nil without a projector).

- **returns**: table|nil Data

#### `editor_api_dynamicDecals.removeLayer(index_number, parentUid_string)`

Deletes a layer (undoable) and turns off highlighting if it was highlighted.

- `index_number` (*integer*) : Index
- `parentUid_string` (*string|nil*) : Parent

#### `editor_api_dynamicDecals.removeMaterialIdx(materialIdx_int)`

Removes a material from the targets.

- `materialIdx_int` (*integer*) : Index

#### `editor_api_dynamicDecals.renderSdfTextureImgui(sizeX, sizeY)`

Displays the SDF texture in ImGui.

- `sizeX` (*number*) : Width
- `sizeY` (*number*) : Height

#### `editor_api_dynamicDecals.replaceDecalTransformFromCurrentProjection(layerUid_string, originalLayer)`

Repositions an already placed decal according to the current camera/projection, changing only its transform fields (camPosition, decalPos, decalScale, decalRotation, mirror...). Refuses if the captured cursor is not centered (0.5 ± 0.01) or if the layer is not a decal. Commits a "Transform Decal" action.

- `layerUid_string` (*string*) : uid of the decal
- `originalLayer` (*table*) : Snapshot of the layer before the edit
- **returns**: boolean true if successful

#### `editor_api_dynamicDecals.rotateLayer(layer, delta_vec3)`

Applies a delta rotation to a layer and its children.

- `layer` (*table*) : Layer (uid used)
- `delta_vec3` (*vec3*) : Rotation delta (inferred from code)

#### `editor_api_dynamicDecals.saveLayerStackToFile(path_string)`

Writes the layer stack to a JSON file (without materialIdx).

- `path_string` (*string*) : File

#### `editor_api_dynamicDecals.scaleLayer(layer, delta_vec3)`

Scales a layer and its children by (1,1,1) + delta.

- `layer` (*table*) : Layer (uid used)
- `delta_vec3` (*vec3*) : Scale delta

#### `editor_api_dynamicDecals.serializeLayer(layer)`

Converts a layer to a JSON-serializable table (engine types converted).

- `layer` (*table*) : Layer
- **returns**: table Serialized data

#### `editor_api_dynamicDecals.setAlphaMaskBlendMode(value_int)`

Sets the alpha mask blend mode.

- `value_int` (*integer*) : Mode

#### `editor_api_dynamicDecals.setAlphaMaskChannel(value_int)`

Sets the alpha mask channel.

- `value_int` (*integer*) : Channel

#### `editor_api_dynamicDecals.setAlphaMaskIntensity(value_float)`

Sets the alpha mask intensity.

- `value_float` (*number*) : Intensity

#### `editor_api_dynamicDecals.setAlphaMaskOffset(value_Point2F)`

Sets the alpha mask offset.

- `value_Point2F` (*Point2F*) : Offset

#### `editor_api_dynamicDecals.setAlphaMaskRotation(value_radian_float)`

Sets the alpha mask rotation.

- `value_radian_float` (*number*) : Radians

#### `editor_api_dynamicDecals.setAlphaMaskScale(value_Point2F)`

Sets the alpha mask scale.

- `value_Point2F` (*Point2F*) : Scale

#### `editor_api_dynamicDecals.setBlendMode(blendMode_int)`

Sets the current blend mode.

- `blendMode_int` (*integer*) : Value of M.blendModes

#### `editor_api_dynamicDecals.setBrushStrokeInterpolationSteps(value_u32)`

Sets the brush interpolation steps.

- `value_u32` (*integer*) : Steps

#### `editor_api_dynamicDecals.setColorPaletteMapId(value_int)`

Sets the decal's palette index.

- `value_int` (*integer*) : Index

#### `editor_api_dynamicDecals.setColorTextureScale(value_Point2F)`

Sets the color texture scale.

- `value_Point2F` (*Point2F*) : Scale

#### `editor_api_dynamicDecals.setCursorPosition(value_Point2F)`

Sets the position of the projection cursor.

- `value_Point2F` (*Point2F*) : Position

#### `editor_api_dynamicDecals.setDecalColor(value_Point4F)`

Sets the decal color.

- `value_Point4F` (*Point4F*) : RGBA color

#### `editor_api_dynamicDecals.setDecalLayerFontCharacter(value_char)`

Sets the decal's font character.

- `value_char` (*string*) : Character

#### `editor_api_dynamicDecals.setDecalLayerFontPath(value_string)`

Sets the decal's font.

- `value_string` (*string*) : Path

#### `editor_api_dynamicDecals.setDecalLocalPos(decal, worldPos)`

Sets a decal's position (parameter name is worldPos in the code).

- `decal` (*table*) : Layer
- `worldPos` (*vec3*) : Position (inferred from code)

#### `editor_api_dynamicDecals.setDecalRotation(value_radian_number)`

Sets the decal rotation.

- `value_radian_number` (*number*) : Radians

#### `editor_api_dynamicDecals.setDecalScale(value_vec3)`

Sets the decal scale.

- `value_vec3` (*vec3*) : Scale

#### `editor_api_dynamicDecals.setDecalSkew(value_Point2F)`

Sets the decal skew.

- `value_Point2F` (*Point2F*) : Skew

#### `editor_api_dynamicDecals.setDecalTexturePath(type_string, path_string)`

Sets the current texture of a decal type.

- `type_string` (*string*) : Texture type
- `path_string` (*string*) : Path

#### `editor_api_dynamicDecals.setDecalUv(value_Point2F)`

Sets the decal UV offset.

- `value_Point2F` (*Point2F*) : UV

#### `editor_api_dynamicDecals.setEnableBrushStroke(value_bool)`

Enables/disables the projector's brush mode (with a new random uid).

- `value_bool` (*boolean*) : State

#### `editor_api_dynamicDecals.setEnablePathLayer(value_bool)`

Enables/disables path mode; when set to false, finishes the current path.

- `value_bool` (*boolean*) : State

#### `editor_api_dynamicDecals.setEnabled(enabled)`

Enables/disables the projector; when set to false, clears the dynamic textures and recombines the textureSet.

- `enabled` (*boolean*) : State

#### `editor_api_dynamicDecals.setFillLayerColor(value_Point4F)`

Sets the color of the fill layers.

- `value_Point4F` (*Point4F*) : RGBA color

#### `editor_api_dynamicDecals.setFillLayerColorPaletteMapId(value_int)`

Sets the palette index for the fill.

- `value_int` (*integer*) : Index

#### `editor_api_dynamicDecals.setFillTexturePath(path_string)`

Sets the fill texture.

- `path_string` (*string*) : Path

#### `editor_api_dynamicDecals.setFlipMirroredDecal(value_bool)`

Enables flipping of the decal on the mirror side.

- `value_bool` (*boolean*) : State

#### `editor_api_dynamicDecals.setFontTextureAtlasPath(path_string)`

Sets the font texture atlas.

- `path_string` (*string*) : Path

#### `editor_api_dynamicDecals.setGradientColorBottomLeft(value_ColorI)`

Sets the gradient color, bottom-left corner.

- `value_ColorI` (*ColorI*) : Color

#### `editor_api_dynamicDecals.setGradientColorBottomRight(value_ColorI)`

Sets the gradient color, bottom-right corner.

- `value_ColorI` (*ColorI*) : Color

#### `editor_api_dynamicDecals.setGradientColorTopLeft(value_ColorI)`

Sets the gradient color, top-left corner.

- `value_ColorI` (*ColorI*) : Color

#### `editor_api_dynamicDecals.setGradientColorTopRight(value_ColorI)`

Sets the gradient color, top-right corner.

- `value_ColorI` (*ColorI*) : Color

#### `editor_api_dynamicDecals.setLayer(layerData_table, doReproject_bool)`

Replaces a layer (by uid) with the given data, undoable, and emits dynamicDecals_setLayer(uid); dynamicDecals_onLayerUpdated(uid) is emitted on apply.

- `layerData_table` (*table*) : New data (existing uid)
- `doReproject_bool` (*boolean|nil*) : Rebake the stack after modification

#### `editor_api_dynamicDecals.setLayerNameBuildString(value_string)`

Sets the name template for new layers (default "$type Layer"). Tags: @type, @colormap, @normalmap, @metallicmap, @roughnessmap, @alphamap, @uid; a {text@tag text} block only appears if the tag is not empty.

- `value_string` (*string*) : Template

#### `editor_api_dynamicDecals.setLayerVisibility(layerUid_string, visibility_bool)`

Shows/hides a layer directly (without history) and reprojects.

- `layerUid_string` (*string*) : uid
- `visibility_bool` (*boolean*) : true visible

#### `editor_api_dynamicDecals.setLockDepth(value_bool)`

Locks/unlocks the projection depth.

- `value_bool` (*boolean*) : State

#### `editor_api_dynamicDecals.setLockSurfaceNormal(value_bool)`

Locks/unlocks the surface normal.

- `value_bool` (*boolean*) : State

#### `editor_api_dynamicDecals.setMaterialIdx(materialIdx_int)`

Sets the single material targeted by the projection.

- `materialIdx_int` (*integer*) : Material index

#### `editor_api_dynamicDecals.setMeshEnable(name_string, value_bool)`

Enables/disables a mesh by name.

- `name_string` (*string*) : Mesh name
- `value_bool` (*boolean*) : State

#### `editor_api_dynamicDecals.setMetallicIntensity(value_float)`

Sets the metallic intensity.

- `value_float` (*number*) : Intensity

#### `editor_api_dynamicDecals.setMirrorDebug(value_bool)`

Enables mirror debug.

- `value_bool` (*boolean*) : State

#### `editor_api_dynamicDecals.setMirrorOffset(value_float)`

Sets the mirror plane offset.

- `value_float` (*number*) : Offset

#### `editor_api_dynamicDecals.setMirrored(value_bool)`

Enables/disables the mirror.

- `value_bool` (*boolean*) : State

#### `editor_api_dynamicDecals.setNormalIntensity(value_float)`

Sets the normal map intensity.

- `value_float` (*number*) : Intensity

#### `editor_api_dynamicDecals.setOrientPathDecals(value_bool)`

Sets whether the path's decals are oriented along the path.

- `value_bool` (*boolean*) : State

#### `editor_api_dynamicDecals.setPathLayerFontPath(value_string)`

Sets the path's font.

- `value_string` (*string*) : Path

#### `editor_api_dynamicDecals.setPathLayerInterpolationSteps(value_u32)`

Sets the path interpolation steps.

- `value_u32` (*integer*) : Steps

#### `editor_api_dynamicDecals.setPathLayerText(value_string)`

Sets the text placed along the path.

- `value_string` (*string*) : Text

#### `editor_api_dynamicDecals.setPathType(value_int)`

Sets the path type.

- `value_int` (*integer*) : 0 Linear, 1 Bezier

#### `editor_api_dynamicDecals.setProjectDynamicDecalsState(value)`

Enables/disables the preview projection (M.projectDynamicDecals).

- `value` (*boolean*) : State

#### `editor_api_dynamicDecals.setRoughnessIntensity(value_float)`

Sets the roughness intensity.

- `value_float` (*number*) : Intensity

#### `editor_api_dynamicDecals.setSdfEnabled(value_bool)`

Enables/disables SDF rendering.

- `value_bool` (*boolean*) : State

#### `editor_api_dynamicDecals.setSdfOutlineColor(value_ColorI)`

Sets the SDF outline color.

- `value_ColorI` (*ColorI*) : Color

#### `editor_api_dynamicDecals.setSdfOutlineSoftness(value_f32)`

Sets the SDF outline softness.

- `value_f32` (*number*) : Value

#### `editor_api_dynamicDecals.setSdfOutlineThickness(value_f32)`

Sets the SDF outline thickness.

- `value_f32` (*number*) : Value

#### `editor_api_dynamicDecals.setSdfSoftness(value_f32)`

Sets the SDF softness.

- `value_f32` (*number*) : Value

#### `editor_api_dynamicDecals.setSdfThickness(value_f32)`

Sets the SDF thickness.

- `value_f32` (*number*) : Value

#### `editor_api_dynamicDecals.setShapePath(path)`

Changes the projection model then reprojects.

- `path` (*string*) : Shape path

#### `editor_api_dynamicDecals.setTextureFillLayerScale(value_Point2F)`

Sets the texture fill scale.

- `value_Point2F` (*Point2F*) : Scale

#### `editor_api_dynamicDecals.setTextureFillOffset(value_Point2F)`

Sets the texture fill offset.

- `value_Point2F` (*Point2F*) : Offset

#### `editor_api_dynamicDecals.setTextureResolution(resolution_point2i)`

Changes the resolution; if the engine accepts it, reprojects and reassigns the @DynamicTexture textureSet.

- `resolution_point2i` (*Point2I*) : Resolution

#### `editor_api_dynamicDecals.setUseSurfaceNormal(value_bool)`

Enables orientation along the surface normal.

- `value_bool` (*boolean*) : State

#### `editor_api_dynamicDecals.setUvLayer(uvLayerId_int)`

Changes the UV channel then reprojects.

- `uvLayerId_int` (*integer*) : UV index

#### `editor_api_dynamicDecals.toggleLayerVisibility(layerUid_string)`

Toggles a layer's visibility (undoable) and reprojects.

- `layerUid_string` (*string*) : uid
- **returns**: boolean New value of enabled

#### `editor_api_dynamicDecals.toggleSetting(value_int)`

Toggles a settings flag.

- `value_int` (*integer*) : Value of M.settingsFlags.X.value
- **returns**: any Engine result

## Fields

| Field | Type | Description |
|---|---|---|
| `blendModes` | table[] | Blend modes {name, value}: Clear 0, Normal 1, Screen / Add 2, Subtract 3, Multiply 4, Eraser 5. |
| `blendModesMap` | table<string, integer> | name -> value of blendModes. |
| `debug` | boolean | Enables detailed logs (print) in most functions. false by default. |
| `layerBakingStatusCode` | table<string, integer> | Baking result flags (res.status): Ok 0, Warning 1, Error 2, LayerStackDataTypeIncorrect 4, LayerDataTypeIncorrect 8, TextureFileMissing 16, FontFileMissing 32. |
| `layerTypes` | table<string, integer> | decal 0, fill 1, textureFill 2, group 3, brushStroke 4, path 5, linkedSet 6. |
| `layerTypesMap` | table<integer, string> | Inverse of layerTypes (value -> name). |
| `loadingModes` | table[] | Stack loading modes {key, value}: Overwrite 0, Append 1 (for loadLayerStackFromFile). |
| `pathTypes` | table<string, integer> | Linear 0, Bezier 1. |
| `projectDynamicDecals` | boolean | If true (default), onUpdate_ projects the preview decal under the camera every frame. |
| `properties` | table<string, table[]> | Description of the editable properties per layer type (Decal, etc.): id, name, description, type, default, min/max for the widget, format, getMod/setMod, widgetType. |
| `propertiesMap` | table | Property index (built from properties). |
| `ready` | boolean | true once setup() has finished. |
| `settingsFlags` | table<string, table> | Projector setting flags ({name, value[, description]}): None, UseMousePos (bit 2), UseGradientColor (3), AlphaMaskInvert (4), WrapAlphaMaskX (5), WrapAlphaMaskY (6), WrapColorTextureX (7), WrapColorTextureY (8). |
| `textureResolutions` | table[] | Possible resolutions {name, value}: 512, 1024, 2048, 4096. |
| `types` | table<string, integer> | Property types for M.properties: bool 0, int 1, float 2, Point2F 3, Point3F 4, Point4F 5, string 6, Texture 7, File 8, ColorI 9, MultiColor 10. |
| `typesMap` | table<integer, string> | Inverse of types. |
| `widgetTypes` | table | For each property type, table of possible widgets (Default, Input, Slider, Drag, Combo, Checkbox, Color, File, ImageButton, ColorGradient, InputMultiline depending on the type). |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `dynamicDecals_moveLayer`
- `dynamicDecals_onLayerAdded`
- `dynamicDecals_onLayerDeleted`
- `dynamicDecals_onLayerUpdated`
- `dynamicDecals_setLayer`

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/api/dynamicDecals.lua`.*
