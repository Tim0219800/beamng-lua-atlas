# `editor_api_dynamicDecals`

*Fichier : `lua/ge/extensions/editor/api/dynamicDecals.lua` · VM : Game Engine (GE) · 3082 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_dynamicDecals` : `extensions.load("editor_api_dynamicDecals")`, puis la globale `editor_api_dynamicDecals`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_dynamicDecals.addBrushStrokeLayer(params)` |  | 1342 |
| `editor_api_dynamicDecals.addDecal(params)` |  | 1098 |
| `editor_api_dynamicDecals.addFillLayer(params)` |  | 1187 |
| `editor_api_dynamicDecals.addGroup(params)` |  | 1270 |
| `editor_api_dynamicDecals.addLinkedSet(params)` |  | 1305 |
| `editor_api_dynamicDecals.addMaskDecal(layerUid_string)` |  | 1053 |
| `editor_api_dynamicDecals.addMaterialIdx(materialIdx_int)` |  | 2427 |
| `editor_api_dynamicDecals.addPathDataPoint()` |  | 1142 |
| `editor_api_dynamicDecals.addTextureFillLayer(params)` |  | 1229 |
| `editor_api_dynamicDecals.areAllMeshesEnabled()` |  | 2639 |
| `editor_api_dynamicDecals.bakeBrush()` |  | 2751 |
| `editor_api_dynamicDecals.bakeLayers(layers)` |  | 1584 |
| `editor_api_dynamicDecals.changeDecalRotation(clockwise_bool, step_radian_number)` |  | 1579 |
| `editor_api_dynamicDecals.changeDecalSize(increase_bool, step_number)` | Decal projection - public interface | 1573 |
| `editor_api_dynamicDecals.clearLayerStack()` |  | 1638 |
| `editor_api_dynamicDecals.clearMaterialIdx()` |  | 2415 |
| `editor_api_dynamicDecals.deserializeLayer(layer)` |  | 483 |
| `editor_api_dynamicDecals.disableAllMeshes()` |  | 2635 |
| `editor_api_dynamicDecals.disableDecalHighlighting()` |  | 1524 |
| `editor_api_dynamicDecals.drawBakedTextures(maxImageWidth)` |  | 2218 |
| `editor_api_dynamicDecals.drawBrushInputTextures(maxImageWidth)` |  | 2226 |
| `editor_api_dynamicDecals.drawDynamicTextures(maxImageWidth)` |  | 2214 |
| `editor_api_dynamicDecals.drawHighlightTextures(maxImageWidth)` |  | 2222 |
| `editor_api_dynamicDecals.drawMaskTextures(maxImageWidth)` |  | 2230 |
| `editor_api_dynamicDecals.drawTextureSet(textureSet, name, maxImageWidth)` |  | 2234 |
| `editor_api_dynamicDecals.duplicateAndMirrorLayer(layerId_number, parentUid_string, mirrorChildren)` |  | 2008 |
| `editor_api_dynamicDecals.duplicateLayer(layerId_number, parentUid_string)` |  | 1980 |
| `editor_api_dynamicDecals.enableAllMeshes()` |  | 2631 |
| `editor_api_dynamicDecals.exportLayerMask(layer, directory, filename, extension)` |  | 2074 |
| `editor_api_dynamicDecals.exportSkin(vehicleName, skinName)` |  | 2078 |
| `editor_api_dynamicDecals.exportTextures(directoryPath, exportName, extension)` |  | 2070 |
| `editor_api_dynamicDecals.finishPathLayer()` |  | 2590 |
| `editor_api_dynamicDecals.getAlphaMaskBlendMode()` |  | 2463 |
| `editor_api_dynamicDecals.getAlphaMaskChannel()` |  | 2455 |
| `editor_api_dynamicDecals.getAlphaMaskIntensity()` |  | 2311 |
| `editor_api_dynamicDecals.getAlphaMaskOffset()` |  | 2303 |
| `editor_api_dynamicDecals.getAlphaMaskRotation()` |  | 2471 |
| `editor_api_dynamicDecals.getAlphaMaskScale()` |  | 2295 |
| `editor_api_dynamicDecals.getBlendMode()` |  | 2062 |
| `editor_api_dynamicDecals.getBrushStrokeInterpolationSteps()` |  | 2519 |
| `editor_api_dynamicDecals.getBrushStrokeLayerData()` |  | 2623 |
| `editor_api_dynamicDecals.getColorPaletteMapId()` |  | 2375 |
| `editor_api_dynamicDecals.getColorTextureScale()` |  | 2287 |
| `editor_api_dynamicDecals.getCursorPosition()` |  | 2759 |
| `editor_api_dynamicDecals.getDecalColor()` |  | 2190 |
| `editor_api_dynamicDecals.getDecalLayerFontCharacter()` |  | 2671 |
| `editor_api_dynamicDecals.getDecalLayerFontPath()` |  | 2679 |
| `editor_api_dynamicDecals.getDecalLocalPos(decal)` |  | 2651 |
| `editor_api_dynamicDecals.getDecalRotation()` |  | 2206 |
| `editor_api_dynamicDecals.getDecalScale()` |  | 2198 |
| `editor_api_dynamicDecals.getDecalSkew()` |  | 2279 |
| `editor_api_dynamicDecals.getDecalTexturePath(type_string)` |  | 2174 |
| `editor_api_dynamicDecals.getDecalUv()` |  | 2271 |
| `editor_api_dynamicDecals.getDecalWorldPos(decal)` |  | 2647 |
| `editor_api_dynamicDecals.getDecalWorldTransform(decal)` |  | 2659 |
| `editor_api_dynamicDecals.getDepth()` |  | 2547 |
| `editor_api_dynamicDecals.getEnablePathLayer()` |  | 2582 |
| `editor_api_dynamicDecals.getEnabled()` |  | 2238 |
| `editor_api_dynamicDecals.getFillLayerColor()` |  | 2439 |
| `editor_api_dynamicDecals.getFillLayerColorPaletteMapId()` |  | 2447 |
| `editor_api_dynamicDecals.getFillTexturePath()` |  | 2182 |
| `editor_api_dynamicDecals.getFlipMirroredDecal()` |  | 2695 |
| `editor_api_dynamicDecals.getFontTextureAtlasPath()` |  | 2263 |
| `editor_api_dynamicDecals.getGradientColorBottomLeft()` |  | 2359 |
| `editor_api_dynamicDecals.getGradientColorBottomRight()` |  | 2367 |
| `editor_api_dynamicDecals.getGradientColorTopLeft()` |  | 2343 |
| `editor_api_dynamicDecals.getGradientColorTopRight()` |  | 2351 |
| `editor_api_dynamicDecals.getHighlightedLayer()` | returns the highlightedDecal, returns nil if no decal is highlighted | 1598 |
| `editor_api_dynamicDecals.getHistory()` |  | 3046 |
| `editor_api_dynamicDecals.getLayerById(layerId_number, parentUid_string)` |  | 1708 |
| `editor_api_dynamicDecals.getLayerByUid(layerUid_string)` |  | 1699 |
| `editor_api_dynamicDecals.getLayerCount()` |  | 1567 |
| `editor_api_dynamicDecals.getLayerNameBuildString()` |  | 1009 |
| `editor_api_dynamicDecals.getLayerStack()` |  | 1563 |
| `editor_api_dynamicDecals.getLockDepth()` |  | 2539 |
| `editor_api_dynamicDecals.getLockSurfaceNormal()` |  | 2551 |
| `editor_api_dynamicDecals.getMaterialIndices()` |  | 2419 |
| `editor_api_dynamicDecals.getMeshObjectCount()` |  | 2435 |
| `editor_api_dynamicDecals.getMetallicIntensity()` |  | 2327 |
| `editor_api_dynamicDecals.getMirrorDebug()` |  | 2495 |
| `editor_api_dynamicDecals.getMirrorOffset()` |  | 2487 |
| `editor_api_dynamicDecals.getMirrored()` |  | 2479 |
| `editor_api_dynamicDecals.getNormalIntensity()` |  | 2319 |
| `editor_api_dynamicDecals.getOrientPathDecals()` |  | 2607 |
| `editor_api_dynamicDecals.getPathLayerFontPath()` |  | 2687 |
| `editor_api_dynamicDecals.getPathLayerInterpolationSteps()` |  | 2527 |
| `editor_api_dynamicDecals.getPathLayerText()` |  | 2663 |
| `editor_api_dynamicDecals.getPathType()` |  | 2615 |
| `editor_api_dynamicDecals.getRandomUid()` | pseudo unique, should be enough though | 48 |
| `editor_api_dynamicDecals.getRoughnessIntensity()` |  | 2335 |
| `editor_api_dynamicDecals.getSdfEnabled()` |  | 2711 |
| `editor_api_dynamicDecals.getSdfOutlineColor()` |  | 2703 |
| `editor_api_dynamicDecals.getSdfOutlineSoftness()` |  | 2743 |
| `editor_api_dynamicDecals.getSdfOutlineThickness()` |  | 2735 |
| `editor_api_dynamicDecals.getSdfSoftness()` |  | 2727 |
| `editor_api_dynamicDecals.getSdfThickness()` |  | 2719 |
| `editor_api_dynamicDecals.getSettings()` |  | 2026 |
| `editor_api_dynamicDecals.getShapeMaterialNames()` |  | 2535 |
| `editor_api_dynamicDecals.getShapeMeshes()` |  | 2627 |
| `editor_api_dynamicDecals.getShapePath()` | decal shape render app : public interface | 2385 |
| `editor_api_dynamicDecals.getSurfaceNormal()` |  | 2559 |
| `editor_api_dynamicDecals.getTextureFillLayerScale()` |  | 2503 |
| `editor_api_dynamicDecals.getTextureFillOffset()` |  | 2511 |
| `editor_api_dynamicDecals.getTextureResolution()` |  | 2394 |
| `editor_api_dynamicDecals.getTextureSet()` |  | 2755 |
| `editor_api_dynamicDecals.getUseSurfaceNormal()` |  | 2563 |
| `editor_api_dynamicDecals.getUvLayer()` |  | 2406 |
| `editor_api_dynamicDecals.hasActivePathLayer()` |  | 2586 |
| `editor_api_dynamicDecals.highlightLayer(layer_table)` |  | 1603 |
| `editor_api_dynamicDecals.highlightLayerByUid(layerUid_string)` |  | 1612 |
| `editor_api_dynamicDecals.isAlphaMaskInvertEnabled()` |  | 2034 |
| `editor_api_dynamicDecals.isDecalGradientColorEnabled()` |  | 2030 |
| `editor_api_dynamicDecals.isUseMousePos()` |  | 2054 |
| `editor_api_dynamicDecals.isWrapAlphaMaskXEnabled()` |  | 2038 |
| `editor_api_dynamicDecals.isWrapAlphaMaskYEnabled()` |  | 2042 |
| `editor_api_dynamicDecals.isWrapColorTextureXEnabled()` |  | 2046 |
| `editor_api_dynamicDecals.isWrapColorTextureYEnabled()` |  | 2050 |
| `editor_api_dynamicDecals.loadLayerStackFromFile(path_string, mode_number)` |  | 3017 |
| `editor_api_dynamicDecals.moveLayer(from_number, fromParentUid_string, to_number, toParentUid_string)` | params<br> number from<br> string fromParentUid<br> number to<br> string toParentUid | 1899 |
| `editor_api_dynamicDecals.moveLayerLocalPos(layerUid, newLocalPosition, includeChildren, referenceLayerUid)` |  | 2921 |
| `editor_api_dynamicDecals.onDeserialized(data)` | *(hook)* | 3004 |
| `editor_api_dynamicDecals.onSerialize()` | serialization *(hook)* | 2994 |
| `editor_api_dynamicDecals.onUpdate_()` | *(hook)* | 3028 |
| `editor_api_dynamicDecals.onVehicleSwitched()` | M.onExtensionLoaded = function()<br>  if DecalProjection == nil then<br>    log('E', logTag, 'DecalProjection C++ binding not available — dynamic decals editor disabled. Rebuild the engine with decalProjection.cpp included.')<br>    return false<br>  end<br>end<br><br>M.onExtensionUnloaded = function()<br>  decalProjection = nil<br>  app = nil<br>  M.ready = false<br>end *(hook)* | 3071 |
| `editor_api_dynamicDecals.redo()` |  | 3054 |
| `editor_api_dynamicDecals.removeLastPathLayerPoint()` |  | 2594 |
| `editor_api_dynamicDecals.removeLayer(index_number, parentUid_string)` |  | 1941 |
| `editor_api_dynamicDecals.removeMaterialIdx(materialIdx_int)` |  | 2431 |
| `editor_api_dynamicDecals.renderSdfTextureImgui(sizeX, sizeY)` |  | 2767 |
| `editor_api_dynamicDecals.replaceDecalTransformFromCurrentProjection(layerUid_string, originalLayer)` | re-projects an already placed decal from the current camera/projection while keeping its identity<br> and every non-transform property intact. `originalLayer` is the immutable pre-edit snapshot taken<br> before the live preview hid/altered the committed layer; it -- not the temporarily hidden live<br> layer -- is used as both the base for the new layer and the history before-state, so undo/redo<br> swap the exact before/after decal by uid and reproject once each. commits a single "Transform<br> Decal" action and returns true on success. | 1827 |
| `editor_api_dynamicDecals.reprojectLayers()` |  | 1647 |
| `editor_api_dynamicDecals.rotateLayer(layer, delta_vec3)` |  | 2938 |
| `editor_api_dynamicDecals.saveLayerStackToFile(path_string)` |  | 3011 |
| `editor_api_dynamicDecals.scaleLayer(layer, delta_vec3)` |  | 2960 |
| `editor_api_dynamicDecals.serializeLayer(layer)` |  | 230 |
| `editor_api_dynamicDecals.setAlphaMaskBlendMode(value_int)` |  | 2467 |
| `editor_api_dynamicDecals.setAlphaMaskChannel(value_int)` |  | 2459 |
| `editor_api_dynamicDecals.setAlphaMaskIntensity(value_float)` |  | 2315 |
| `editor_api_dynamicDecals.setAlphaMaskOffset(value_Point2F)` |  | 2307 |
| `editor_api_dynamicDecals.setAlphaMaskRotation(value_radian_float)` |  | 2475 |
| `editor_api_dynamicDecals.setAlphaMaskScale(value_Point2F)` |  | 2299 |
| `editor_api_dynamicDecals.setBlendMode(blendMode_int)` |  | 2066 |
| `editor_api_dynamicDecals.setBrushStrokeInterpolationSteps(value_u32)` |  | 2523 |
| `editor_api_dynamicDecals.setColorPaletteMapId(value_int)` |  | 2379 |
| `editor_api_dynamicDecals.setColorTextureScale(value_Point2F)` |  | 2291 |
| `editor_api_dynamicDecals.setCursorPosition(value_Point2F)` |  | 2763 |
| `editor_api_dynamicDecals.setDecalColor(value_Point4F)` |  | 2194 |
| `editor_api_dynamicDecals.setDecalLayerFontCharacter(value_char)` |  | 2675 |
| `editor_api_dynamicDecals.setDecalLayerFontPath(value_string)` |  | 2683 |
| `editor_api_dynamicDecals.setDecalLocalPos(decal, worldPos)` |  | 2655 |
| `editor_api_dynamicDecals.setDecalRotation(value_radian_number)` |  | 2210 |
| `editor_api_dynamicDecals.setDecalScale(value_vec3)` |  | 2202 |
| `editor_api_dynamicDecals.setDecalSkew(value_Point2F)` |  | 2283 |
| `editor_api_dynamicDecals.setDecalTexturePath(type_string, path_string)` |  | 2178 |
| `editor_api_dynamicDecals.setDecalUv(value_Point2F)` |  | 2275 |
| `editor_api_dynamicDecals.setEnableBrushStroke(value_bool)` |  | 2571 |
| `editor_api_dynamicDecals.setEnablePathLayer(value_bool)` |  | 2575 |
| `editor_api_dynamicDecals.setEnabled(enabled)` |  | 2242 |
| `editor_api_dynamicDecals.setFillLayerColor(value_Point4F)` |  | 2443 |
| `editor_api_dynamicDecals.setFillLayerColorPaletteMapId(value_int)` |  | 2451 |
| `editor_api_dynamicDecals.setFillTexturePath(path_string)` |  | 2186 |
| `editor_api_dynamicDecals.setFlipMirroredDecal(value_bool)` |  | 2699 |
| `editor_api_dynamicDecals.setFontTextureAtlasPath(path_string)` |  | 2267 |
| `editor_api_dynamicDecals.setGradientColorBottomLeft(value_ColorI)` |  | 2363 |
| `editor_api_dynamicDecals.setGradientColorBottomRight(value_ColorI)` |  | 2371 |
| `editor_api_dynamicDecals.setGradientColorTopLeft(value_ColorI)` |  | 2347 |
| `editor_api_dynamicDecals.setGradientColorTopRight(value_ColorI)` |  | 2355 |
| `editor_api_dynamicDecals.setLayer(layerData_table, doReproject_bool)` |  | 1754 |
| `editor_api_dynamicDecals.setLayerNameBuildString(value_string)` |  | 1005 |
| `editor_api_dynamicDecals.setLayerVisibility(layerUid_string, visibility_bool)` |  | 1530 |
| `editor_api_dynamicDecals.setLockDepth(value_bool)` |  | 2543 |
| `editor_api_dynamicDecals.setLockSurfaceNormal(value_bool)` |  | 2555 |
| `editor_api_dynamicDecals.setMaterialIdx(materialIdx_int)` |  | 2423 |
| `editor_api_dynamicDecals.setMeshEnable(name_string, value_bool)` |  | 2643 |
| `editor_api_dynamicDecals.setMetallicIntensity(value_float)` |  | 2331 |
| `editor_api_dynamicDecals.setMirrorDebug(value_bool)` |  | 2499 |
| `editor_api_dynamicDecals.setMirrorOffset(value_float)` |  | 2491 |
| `editor_api_dynamicDecals.setMirrored(value_bool)` |  | 2483 |
| `editor_api_dynamicDecals.setNormalIntensity(value_float)` |  | 2323 |
| `editor_api_dynamicDecals.setOrientPathDecals(value_bool)` |  | 2611 |
| `editor_api_dynamicDecals.setPathLayerFontPath(value_string)` |  | 2691 |
| `editor_api_dynamicDecals.setPathLayerInterpolationSteps(value_u32)` |  | 2531 |
| `editor_api_dynamicDecals.setPathLayerText(value_string)` |  | 2667 |
| `editor_api_dynamicDecals.setPathType(value_int)` |  | 2619 |
| `editor_api_dynamicDecals.setProjectDynamicDecalsState(value)` |  | 1013 |
| `editor_api_dynamicDecals.setRoughnessIntensity(value_float)` |  | 2339 |
| `editor_api_dynamicDecals.setSdfEnabled(value_bool)` |  | 2715 |
| `editor_api_dynamicDecals.setSdfOutlineColor(value_ColorI)` |  | 2707 |
| `editor_api_dynamicDecals.setSdfOutlineSoftness(value_f32)` |  | 2747 |
| `editor_api_dynamicDecals.setSdfOutlineThickness(value_f32)` |  | 2739 |
| `editor_api_dynamicDecals.setSdfSoftness(value_f32)` |  | 2731 |
| `editor_api_dynamicDecals.setSdfThickness(value_f32)` |  | 2723 |
| `editor_api_dynamicDecals.setShapePath(path)` |  | 2389 |
| `editor_api_dynamicDecals.setTextureFillLayerScale(value_Point2F)` |  | 2507 |
| `editor_api_dynamicDecals.setTextureFillOffset(value_Point2F)` |  | 2515 |
| `editor_api_dynamicDecals.setTextureResolution(resolution_point2i)` |  | 2398 |
| `editor_api_dynamicDecals.setUseSurfaceNormal(value_bool)` |  | 2567 |
| `editor_api_dynamicDecals.setUvLayer(uvLayerId_int)` |  | 2410 |
| `editor_api_dynamicDecals.setup()` |  | 1452 |
| `editor_api_dynamicDecals.toggleEnabled()` | M.onEditorDeactivated = function()<br>  decalProjection:flushDynamicTextures()<br>  decalProjection:combineTextures(app.textureSet)<br>end | 2255 |
| `editor_api_dynamicDecals.toggleLayerVisibility(layerUid_string)` |  | 1549 |
| `editor_api_dynamicDecals.toggleSetting(value_int)` |  | 2058 |
| `editor_api_dynamicDecals.undo()` |  | 3050 |
| `editor_api_dynamicDecals.updateVehicleMaterials()` |  | 1447 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `blendModes` | table |  |
| `blendModesMap` | table |  |
| `debug` | boolean | decal projection : public interface |
| `layerBakingStatusCode` | table |  |
| `layerTypes` | table |  |
| `layerTypesMap` | table |  |
| `loadingModes` | table |  |
| `pathTypes` | table |  |
| `projectDynamicDecals` | boolean |  |
| `properties` | table | id, name, description, type, default, min (for widget), max(for widget) [, format (for widget)] [,getMod (fn)] [, setMod (fn)] [, widget type] |
| `propertiesMap` | table |  |
| `ready` | boolean |  |
| `settingsFlags` | table |  |
| `textureResolutions` | table |  |
| `types` | table |  |
| `typesMap` | table |  |
| `widgetTypes` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `dynamicDecals_moveLayer`
- `dynamicDecals_onLayerAdded`
- `dynamicDecals_onLayerDeleted`
- `dynamicDecals_onLayerUpdated`
- `dynamicDecals_setLayer`

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/dynamicDecals.lua`.*
