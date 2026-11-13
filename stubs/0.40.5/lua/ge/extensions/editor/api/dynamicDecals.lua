---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/dynamicDecals.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_api_dynamicDecals` : `extensions.load("editor_api_dynamicDecals")`, puis la globale `editor_api_dynamicDecals`
---@class editor_api_dynamicDecals
---@field blendModes table
---@field blendModesMap table
---@field debug boolean
---@field layerBakingStatusCode table
---@field layerTypes table
---@field layerTypesMap table
---@field loadingModes table
---@field pathTypes table
---@field projectDynamicDecals boolean
---@field properties table
---@field propertiesMap table
---@field ready boolean
---@field settingsFlags table
---@field textureResolutions table
---@field types table
---@field typesMap table
---@field widgetTypes table
editor_api_dynamicDecals = {}

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1342
---@param params any
function editor_api_dynamicDecals.addBrushStrokeLayer(params) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1098
---@param params any
function editor_api_dynamicDecals.addDecal(params) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1187
---@param params any
function editor_api_dynamicDecals.addFillLayer(params) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1270
---@param params any
function editor_api_dynamicDecals.addGroup(params) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1305
---@param params any
function editor_api_dynamicDecals.addLinkedSet(params) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1053
---@param layerUid_string any
function editor_api_dynamicDecals.addMaskDecal(layerUid_string) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2427
---@param materialIdx_int any
function editor_api_dynamicDecals.addMaterialIdx(materialIdx_int) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1142
function editor_api_dynamicDecals.addPathDataPoint() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1229
---@param params any
function editor_api_dynamicDecals.addTextureFillLayer(params) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2639
function editor_api_dynamicDecals.areAllMeshesEnabled() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2751
function editor_api_dynamicDecals.bakeBrush() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1584
---@param layers any
function editor_api_dynamicDecals.bakeLayers(layers) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1579
---@param clockwise_bool any
---@param step_radian_number any
function editor_api_dynamicDecals.changeDecalRotation(clockwise_bool, step_radian_number) end

--- Decal projection - public interface
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1573
---@param increase_bool any
---@param step_number any
function editor_api_dynamicDecals.changeDecalSize(increase_bool, step_number) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1638
function editor_api_dynamicDecals.clearLayerStack() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2415
function editor_api_dynamicDecals.clearMaterialIdx() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:483
---@param layer any
function editor_api_dynamicDecals.deserializeLayer(layer) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2635
function editor_api_dynamicDecals.disableAllMeshes() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1524
function editor_api_dynamicDecals.disableDecalHighlighting() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2218
---@param maxImageWidth any
function editor_api_dynamicDecals.drawBakedTextures(maxImageWidth) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2226
---@param maxImageWidth any
function editor_api_dynamicDecals.drawBrushInputTextures(maxImageWidth) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2214
---@param maxImageWidth any
function editor_api_dynamicDecals.drawDynamicTextures(maxImageWidth) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2222
---@param maxImageWidth any
function editor_api_dynamicDecals.drawHighlightTextures(maxImageWidth) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2230
---@param maxImageWidth any
function editor_api_dynamicDecals.drawMaskTextures(maxImageWidth) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2234
---@param textureSet any
---@param name any
---@param maxImageWidth any
function editor_api_dynamicDecals.drawTextureSet(textureSet, name, maxImageWidth) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2008
---@param layerId_number any
---@param parentUid_string any
---@param mirrorChildren any
function editor_api_dynamicDecals.duplicateAndMirrorLayer(layerId_number, parentUid_string, mirrorChildren) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1980
---@param layerId_number any
---@param parentUid_string any
function editor_api_dynamicDecals.duplicateLayer(layerId_number, parentUid_string) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2631
function editor_api_dynamicDecals.enableAllMeshes() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2074
---@param layer any
---@param directory any
---@param filename any
---@param extension any
function editor_api_dynamicDecals.exportLayerMask(layer, directory, filename, extension) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2078
---@param vehicleName any
---@param skinName any
function editor_api_dynamicDecals.exportSkin(vehicleName, skinName) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2070
---@param directoryPath any
---@param exportName any
---@param extension any
function editor_api_dynamicDecals.exportTextures(directoryPath, exportName, extension) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2590
function editor_api_dynamicDecals.finishPathLayer() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2463
function editor_api_dynamicDecals.getAlphaMaskBlendMode() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2455
function editor_api_dynamicDecals.getAlphaMaskChannel() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2311
function editor_api_dynamicDecals.getAlphaMaskIntensity() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2303
function editor_api_dynamicDecals.getAlphaMaskOffset() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2471
function editor_api_dynamicDecals.getAlphaMaskRotation() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2295
function editor_api_dynamicDecals.getAlphaMaskScale() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2062
function editor_api_dynamicDecals.getBlendMode() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2519
function editor_api_dynamicDecals.getBrushStrokeInterpolationSteps() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2623
function editor_api_dynamicDecals.getBrushStrokeLayerData() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2375
function editor_api_dynamicDecals.getColorPaletteMapId() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2287
function editor_api_dynamicDecals.getColorTextureScale() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2759
function editor_api_dynamicDecals.getCursorPosition() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2190
function editor_api_dynamicDecals.getDecalColor() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2671
function editor_api_dynamicDecals.getDecalLayerFontCharacter() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2679
function editor_api_dynamicDecals.getDecalLayerFontPath() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2651
---@param decal any
function editor_api_dynamicDecals.getDecalLocalPos(decal) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2206
function editor_api_dynamicDecals.getDecalRotation() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2198
function editor_api_dynamicDecals.getDecalScale() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2279
function editor_api_dynamicDecals.getDecalSkew() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2174
---@param type_string any
function editor_api_dynamicDecals.getDecalTexturePath(type_string) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2271
function editor_api_dynamicDecals.getDecalUv() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2647
---@param decal any
function editor_api_dynamicDecals.getDecalWorldPos(decal) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2659
---@param decal any
function editor_api_dynamicDecals.getDecalWorldTransform(decal) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2547
function editor_api_dynamicDecals.getDepth() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2582
function editor_api_dynamicDecals.getEnablePathLayer() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2238
function editor_api_dynamicDecals.getEnabled() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2439
function editor_api_dynamicDecals.getFillLayerColor() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2447
function editor_api_dynamicDecals.getFillLayerColorPaletteMapId() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2182
function editor_api_dynamicDecals.getFillTexturePath() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2695
function editor_api_dynamicDecals.getFlipMirroredDecal() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2263
function editor_api_dynamicDecals.getFontTextureAtlasPath() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2359
function editor_api_dynamicDecals.getGradientColorBottomLeft() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2367
function editor_api_dynamicDecals.getGradientColorBottomRight() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2343
function editor_api_dynamicDecals.getGradientColorTopLeft() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2351
function editor_api_dynamicDecals.getGradientColorTopRight() end

--- returns the highlightedDecal, returns nil if no decal is highlighted
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1598
function editor_api_dynamicDecals.getHighlightedLayer() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:3046
function editor_api_dynamicDecals.getHistory() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1708
---@param layerId_number any
---@param parentUid_string any
function editor_api_dynamicDecals.getLayerById(layerId_number, parentUid_string) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1699
---@param layerUid_string any
function editor_api_dynamicDecals.getLayerByUid(layerUid_string) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1567
function editor_api_dynamicDecals.getLayerCount() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1009
function editor_api_dynamicDecals.getLayerNameBuildString() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1563
function editor_api_dynamicDecals.getLayerStack() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2539
function editor_api_dynamicDecals.getLockDepth() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2551
function editor_api_dynamicDecals.getLockSurfaceNormal() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2419
function editor_api_dynamicDecals.getMaterialIndices() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2435
function editor_api_dynamicDecals.getMeshObjectCount() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2327
function editor_api_dynamicDecals.getMetallicIntensity() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2495
function editor_api_dynamicDecals.getMirrorDebug() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2487
function editor_api_dynamicDecals.getMirrorOffset() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2479
function editor_api_dynamicDecals.getMirrored() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2319
function editor_api_dynamicDecals.getNormalIntensity() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2607
function editor_api_dynamicDecals.getOrientPathDecals() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2687
function editor_api_dynamicDecals.getPathLayerFontPath() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2527
function editor_api_dynamicDecals.getPathLayerInterpolationSteps() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2663
function editor_api_dynamicDecals.getPathLayerText() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2615
function editor_api_dynamicDecals.getPathType() end

--- pseudo unique, should be enough though
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:48
function editor_api_dynamicDecals.getRandomUid() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2335
function editor_api_dynamicDecals.getRoughnessIntensity() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2711
function editor_api_dynamicDecals.getSdfEnabled() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2703
function editor_api_dynamicDecals.getSdfOutlineColor() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2743
function editor_api_dynamicDecals.getSdfOutlineSoftness() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2735
function editor_api_dynamicDecals.getSdfOutlineThickness() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2727
function editor_api_dynamicDecals.getSdfSoftness() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2719
function editor_api_dynamicDecals.getSdfThickness() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2026
function editor_api_dynamicDecals.getSettings() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2535
function editor_api_dynamicDecals.getShapeMaterialNames() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2627
function editor_api_dynamicDecals.getShapeMeshes() end

--- decal shape render app : public interface
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2385
function editor_api_dynamicDecals.getShapePath() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2559
function editor_api_dynamicDecals.getSurfaceNormal() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2503
function editor_api_dynamicDecals.getTextureFillLayerScale() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2511
function editor_api_dynamicDecals.getTextureFillOffset() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2394
function editor_api_dynamicDecals.getTextureResolution() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2755
function editor_api_dynamicDecals.getTextureSet() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2563
function editor_api_dynamicDecals.getUseSurfaceNormal() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2406
function editor_api_dynamicDecals.getUvLayer() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2586
function editor_api_dynamicDecals.hasActivePathLayer() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1603
---@param layer_table any
function editor_api_dynamicDecals.highlightLayer(layer_table) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1612
---@param layerUid_string any
function editor_api_dynamicDecals.highlightLayerByUid(layerUid_string) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2034
function editor_api_dynamicDecals.isAlphaMaskInvertEnabled() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2030
function editor_api_dynamicDecals.isDecalGradientColorEnabled() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2054
function editor_api_dynamicDecals.isUseMousePos() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2038
function editor_api_dynamicDecals.isWrapAlphaMaskXEnabled() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2042
function editor_api_dynamicDecals.isWrapAlphaMaskYEnabled() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2046
function editor_api_dynamicDecals.isWrapColorTextureXEnabled() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2050
function editor_api_dynamicDecals.isWrapColorTextureYEnabled() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:3017
---@param path_string any
---@param mode_number any
function editor_api_dynamicDecals.loadLayerStackFromFile(path_string, mode_number) end

--- params
---  number from
---  string fromParentUid
---  number to
---  string toParentUid
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1899
---@param from_number any
---@param fromParentUid_string any
---@param to_number any
---@param toParentUid_string any
function editor_api_dynamicDecals.moveLayer(from_number, fromParentUid_string, to_number, toParentUid_string) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2921
---@param layerUid any
---@param newLocalPosition any
---@param includeChildren any
---@param referenceLayerUid any
function editor_api_dynamicDecals.moveLayerLocalPos(layerUid, newLocalPosition, includeChildren, referenceLayerUid) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:3004
---@param data any
function editor_api_dynamicDecals.onDeserialized(data) end

--- serialization
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2994
function editor_api_dynamicDecals.onSerialize() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:3028
function editor_api_dynamicDecals.onUpdate_() end

--- M.onExtensionLoaded = function()
---   if DecalProjection == nil then
---     log('E', logTag, 'DecalProjection C++ binding not available — dynamic decals editor disabled. Rebuild the engine with decalProjection.cpp included.')
---     return false
---   end
--- end
---
--- M.onExtensionUnloaded = function()
---   decalProjection = nil
---   app = nil
---   M.ready = false
--- end
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:3071
function editor_api_dynamicDecals.onVehicleSwitched() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:3054
function editor_api_dynamicDecals.redo() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2594
function editor_api_dynamicDecals.removeLastPathLayerPoint() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1941
---@param index_number any
---@param parentUid_string any
function editor_api_dynamicDecals.removeLayer(index_number, parentUid_string) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2431
---@param materialIdx_int any
function editor_api_dynamicDecals.removeMaterialIdx(materialIdx_int) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2767
---@param sizeX any
---@param sizeY any
function editor_api_dynamicDecals.renderSdfTextureImgui(sizeX, sizeY) end

--- re-projects an already placed decal from the current camera/projection while keeping its identity
---  and every non-transform property intact. `originalLayer` is the immutable pre-edit snapshot taken
---  before the live preview hid/altered the committed layer; it -- not the temporarily hidden live
---  layer -- is used as both the base for the new layer and the history before-state, so undo/redo
---  swap the exact before/after decal by uid and reproject once each. commits a single "Transform
---  Decal" action and returns true on success.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1827
---@param layerUid_string any
---@param originalLayer any
function editor_api_dynamicDecals.replaceDecalTransformFromCurrentProjection(layerUid_string, originalLayer) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1647
function editor_api_dynamicDecals.reprojectLayers() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2938
---@param layer any
---@param delta_vec3 any
function editor_api_dynamicDecals.rotateLayer(layer, delta_vec3) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:3011
---@param path_string any
function editor_api_dynamicDecals.saveLayerStackToFile(path_string) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2960
---@param layer any
---@param delta_vec3 any
function editor_api_dynamicDecals.scaleLayer(layer, delta_vec3) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:230
---@param layer any
function editor_api_dynamicDecals.serializeLayer(layer) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2467
---@param value_int any
function editor_api_dynamicDecals.setAlphaMaskBlendMode(value_int) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2459
---@param value_int any
function editor_api_dynamicDecals.setAlphaMaskChannel(value_int) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2315
---@param value_float any
function editor_api_dynamicDecals.setAlphaMaskIntensity(value_float) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2307
---@param value_Point2F any
function editor_api_dynamicDecals.setAlphaMaskOffset(value_Point2F) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2475
---@param value_radian_float any
function editor_api_dynamicDecals.setAlphaMaskRotation(value_radian_float) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2299
---@param value_Point2F any
function editor_api_dynamicDecals.setAlphaMaskScale(value_Point2F) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2066
---@param blendMode_int any
function editor_api_dynamicDecals.setBlendMode(blendMode_int) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2523
---@param value_u32 any
function editor_api_dynamicDecals.setBrushStrokeInterpolationSteps(value_u32) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2379
---@param value_int any
function editor_api_dynamicDecals.setColorPaletteMapId(value_int) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2291
---@param value_Point2F any
function editor_api_dynamicDecals.setColorTextureScale(value_Point2F) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2763
---@param value_Point2F any
function editor_api_dynamicDecals.setCursorPosition(value_Point2F) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2194
---@param value_Point4F any
function editor_api_dynamicDecals.setDecalColor(value_Point4F) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2675
---@param value_char any
function editor_api_dynamicDecals.setDecalLayerFontCharacter(value_char) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2683
---@param value_string any
function editor_api_dynamicDecals.setDecalLayerFontPath(value_string) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2655
---@param decal any
---@param worldPos any
function editor_api_dynamicDecals.setDecalLocalPos(decal, worldPos) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2210
---@param value_radian_number any
function editor_api_dynamicDecals.setDecalRotation(value_radian_number) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2202
---@param value_vec3 any
function editor_api_dynamicDecals.setDecalScale(value_vec3) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2283
---@param value_Point2F any
function editor_api_dynamicDecals.setDecalSkew(value_Point2F) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2178
---@param type_string any
---@param path_string any
function editor_api_dynamicDecals.setDecalTexturePath(type_string, path_string) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2275
---@param value_Point2F any
function editor_api_dynamicDecals.setDecalUv(value_Point2F) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2571
---@param value_bool any
function editor_api_dynamicDecals.setEnableBrushStroke(value_bool) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2575
---@param value_bool any
function editor_api_dynamicDecals.setEnablePathLayer(value_bool) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2242
---@param enabled any
function editor_api_dynamicDecals.setEnabled(enabled) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2443
---@param value_Point4F any
function editor_api_dynamicDecals.setFillLayerColor(value_Point4F) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2451
---@param value_int any
function editor_api_dynamicDecals.setFillLayerColorPaletteMapId(value_int) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2186
---@param path_string any
function editor_api_dynamicDecals.setFillTexturePath(path_string) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2699
---@param value_bool any
function editor_api_dynamicDecals.setFlipMirroredDecal(value_bool) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2267
---@param path_string any
function editor_api_dynamicDecals.setFontTextureAtlasPath(path_string) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2363
---@param value_ColorI any
function editor_api_dynamicDecals.setGradientColorBottomLeft(value_ColorI) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2371
---@param value_ColorI any
function editor_api_dynamicDecals.setGradientColorBottomRight(value_ColorI) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2347
---@param value_ColorI any
function editor_api_dynamicDecals.setGradientColorTopLeft(value_ColorI) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2355
---@param value_ColorI any
function editor_api_dynamicDecals.setGradientColorTopRight(value_ColorI) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1754
---@param layerData_table any
---@param doReproject_bool any
function editor_api_dynamicDecals.setLayer(layerData_table, doReproject_bool) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1005
---@param value_string any
function editor_api_dynamicDecals.setLayerNameBuildString(value_string) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1530
---@param layerUid_string any
---@param visibility_bool any
function editor_api_dynamicDecals.setLayerVisibility(layerUid_string, visibility_bool) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2543
---@param value_bool any
function editor_api_dynamicDecals.setLockDepth(value_bool) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2555
---@param value_bool any
function editor_api_dynamicDecals.setLockSurfaceNormal(value_bool) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2423
---@param materialIdx_int any
function editor_api_dynamicDecals.setMaterialIdx(materialIdx_int) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2643
---@param name_string any
---@param value_bool any
function editor_api_dynamicDecals.setMeshEnable(name_string, value_bool) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2331
---@param value_float any
function editor_api_dynamicDecals.setMetallicIntensity(value_float) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2499
---@param value_bool any
function editor_api_dynamicDecals.setMirrorDebug(value_bool) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2491
---@param value_float any
function editor_api_dynamicDecals.setMirrorOffset(value_float) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2483
---@param value_bool any
function editor_api_dynamicDecals.setMirrored(value_bool) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2323
---@param value_float any
function editor_api_dynamicDecals.setNormalIntensity(value_float) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2611
---@param value_bool any
function editor_api_dynamicDecals.setOrientPathDecals(value_bool) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2691
---@param value_string any
function editor_api_dynamicDecals.setPathLayerFontPath(value_string) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2531
---@param value_u32 any
function editor_api_dynamicDecals.setPathLayerInterpolationSteps(value_u32) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2667
---@param value_string any
function editor_api_dynamicDecals.setPathLayerText(value_string) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2619
---@param value_int any
function editor_api_dynamicDecals.setPathType(value_int) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1013
---@param value any
function editor_api_dynamicDecals.setProjectDynamicDecalsState(value) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2339
---@param value_float any
function editor_api_dynamicDecals.setRoughnessIntensity(value_float) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2715
---@param value_bool any
function editor_api_dynamicDecals.setSdfEnabled(value_bool) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2707
---@param value_ColorI any
function editor_api_dynamicDecals.setSdfOutlineColor(value_ColorI) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2747
---@param value_f32 any
function editor_api_dynamicDecals.setSdfOutlineSoftness(value_f32) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2739
---@param value_f32 any
function editor_api_dynamicDecals.setSdfOutlineThickness(value_f32) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2731
---@param value_f32 any
function editor_api_dynamicDecals.setSdfSoftness(value_f32) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2723
---@param value_f32 any
function editor_api_dynamicDecals.setSdfThickness(value_f32) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2389
---@param path any
function editor_api_dynamicDecals.setShapePath(path) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2507
---@param value_Point2F any
function editor_api_dynamicDecals.setTextureFillLayerScale(value_Point2F) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2515
---@param value_Point2F any
function editor_api_dynamicDecals.setTextureFillOffset(value_Point2F) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2398
---@param resolution_point2i any
function editor_api_dynamicDecals.setTextureResolution(resolution_point2i) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2567
---@param value_bool any
function editor_api_dynamicDecals.setUseSurfaceNormal(value_bool) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2410
---@param uvLayerId_int any
function editor_api_dynamicDecals.setUvLayer(uvLayerId_int) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1452
function editor_api_dynamicDecals.setup() end

--- M.onEditorDeactivated = function()
---   decalProjection:flushDynamicTextures()
---   decalProjection:combineTextures(app.textureSet)
--- end
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2255
function editor_api_dynamicDecals.toggleEnabled() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1549
---@param layerUid_string any
function editor_api_dynamicDecals.toggleLayerVisibility(layerUid_string) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2058
---@param value_int any
function editor_api_dynamicDecals.toggleSetting(value_int) end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:3050
function editor_api_dynamicDecals.undo() end

---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1447
function editor_api_dynamicDecals.updateVehicleMaterials() end

