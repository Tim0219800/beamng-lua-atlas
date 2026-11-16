---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/dynamicDecals.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- API of the dynamic decals system (livery painting on the player vehicle) used by the editor's Dynamic Decals tool. It manages a layer stack (layerStack: decal, fill, textureFill, group, brushStroke, path, linkedSet) with undo/redo history, projects/bakes these layers into the vehicle's dynamic textures via the C++ DecalProjection binding, exposes the current projection settings (color, scale, rotation, alpha mask, mirror, SDF, path, brush) as get/set, serializes the stack to JSON and exports textures and skins (jbeam + materials) to /mods/unpacked. setup() must be called before anything else.
--- Access: extension `editor_api_dynamicDecals`: `extensions.load("editor_api_dynamicDecals")`, then the global `editor_api_dynamicDecals`
---@class editor_api_dynamicDecals
---@field blendModes table[] Blend modes {name, value}: Clear 0, Normal 1, Screen / Add 2, Subtract 3, Multiply 4, Eraser 5.
---@field blendModesMap table<string, integer> name -> value of blendModes.
---@field debug boolean Enables detailed logs (print) in most functions. false by default.
---@field layerBakingStatusCode table<string, integer> Baking result flags (res.status): Ok 0, Warning 1, Error 2, LayerStackDataTypeIncorrect 4, LayerDataTypeIncorrect 8, TextureFileMissing 16, FontFileMissing 32.
---@field layerTypes table<string, integer> decal 0, fill 1, textureFill 2, group 3, brushStroke 4, path 5, linkedSet 6.
---@field layerTypesMap table<integer, string> Inverse of layerTypes (value -> name).
---@field loadingModes table[] Stack loading modes {key, value}: Overwrite 0, Append 1 (for loadLayerStackFromFile).
---@field pathTypes table<string, integer> Linear 0, Bezier 1.
---@field projectDynamicDecals boolean If true (default), onUpdate_ projects the preview decal under the camera every frame.
---@field properties table<string, table[]> Description of the editable properties per layer type (Decal, etc.): id, name, description, type, default, min/max for the widget, format, getMod/setMod, widgetType.
---@field propertiesMap table Property index (built from properties).
---@field ready boolean true once setup() has finished.
---@field settingsFlags table<string, table> Projector setting flags ({name, value[, description]}): None, UseMousePos (bit 2), UseGradientColor (3), AlphaMaskInvert (4), WrapAlphaMaskX (5), WrapAlphaMaskY (6), WrapColorTextureX (7), WrapColorTextureY (8).
---@field textureResolutions table[] Possible resolutions {name, value}: 512, 1024, 2048, 4096.
---@field types table<string, integer> Property types for M.properties: bool 0, int 1, float 2, Point2F 3, Point3F 4, Point4F 5, string 6, Texture 7, File 8, ColorI 9, MultiColor 10.
---@field typesMap table<integer, string> Inverse of types.
---@field widgetTypes table For each property type, table of possible widgets (Default, Input, Slider, Drag, Combo, Checkbox, Color, File, ImageButton, ColorGradient, InputMultiline depending on the type).
editor_api_dynamicDecals = {}

--- Adds a brush stroke layer from getBrushStrokeLayerData(), undoable.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1342
---@param params table|nil name (inferred from code)
---@return table  Created layer (inferred from code)
function editor_api_dynamicDecals.addBrushStrokeLayer(params) end

--- Creates a decal layer from the current projection (camera + settings), bakes it and adds it to the stack (undoable). If not all meshes are enabled, limits the decal to the vehicle's enabled meshes.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1098
---@param params table|nil name (generated default), parentUid (parent group layer)
---@return table  Data of the created layer
function editor_api_dynamicDecals.addDecal(params) end

--- Adds a color fill layer (current fillLayer color and palette), undoable.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1187
---@param params table|nil name, parentUid
---@return table  Created layer
function editor_api_dynamicDecals.addFillLayer(params) end

--- Adds a group layer (can contain children), undoable.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1270
---@param params table|nil name, parentUid
---@return table  Created layer
function editor_api_dynamicDecals.addGroup(params) end

--- Adds a "linked set" layer (type 6, with a properties table), undoable. Undo removes the last root layer.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1305
---@param params table|nil name, parentUid
---@return table  Created layer
function editor_api_dynamicDecals.addLinkedSet(params) end

--- Adds a decal to the mask (layer.mask.layers) of the given layer, from the current projection (undoable).
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1053
---@param layerUid_string string uid of the layer to mask
function editor_api_dynamicDecals.addMaskDecal(layerUid_string) end

--- Adds a material to the targets.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2427
---@param materialIdx_int integer Index
function editor_api_dynamicDecals.addMaterialIdx(materialIdx_int) end

--- Adds a point to the current path layer (creates it on the first call with the current path settings: orientDecals, pathType, interpolationSteps, text, fontPath), then reprojects.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1142
---@return table  Point/layer data
function editor_api_dynamicDecals.addPathDataPoint() end

--- Adds a texture fill layer (current fillTexturePath, scale, offset), undoable.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1229
---@param params table|nil name, parentUid
---@return table  Created layer
function editor_api_dynamicDecals.addTextureFillLayer(params) end

--- true if all meshes are enabled.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2639
---@return boolean  State
function editor_api_dynamicDecals.areAllMeshesEnabled() end

--- Bakes the current brush stroke.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2751
function editor_api_dynamicDecals.bakeBrush() end

--- Bakes a list of layers into the player vehicle's textures (decalProjection:bakeLayers). Returns nil with a message if there is no vehicle.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1584
---@param layers table[] Layers to bake
---@return table|nil  Result (status field: M.layerBakingStatusCode)
function editor_api_dynamicDecals.bakeLayers(layers) end

--- Rotates the current decal by one step (15 degrees by default, in radians).
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1579
---@param clockwise_bool boolean Clockwise
---@param step_radian_number number|nil Step in radians
function editor_api_dynamicDecals.changeDecalRotation(clockwise_bool, step_radian_number) end

--- Enlarges/shrinks the current decal (x and z of decalScale) by one step (0.025 by default).
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1573
---@param increase_bool boolean true to enlarge
---@param step_number number|nil Steps
function editor_api_dynamicDecals.changeDecalSize(increase_bool, step_number) end

--- Clears the layer stack and the baked textures (undoable).
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1638
function editor_api_dynamicDecals.clearLayerStack() end

--- Clears the list of targeted materials.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2415
function editor_api_dynamicDecals.clearMaterialIdx() end

--- Rebuilds a layer from serialized data.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:483
---@param layer table Serialized data
---@return table  Layer
function editor_api_dynamicDecals.deserializeLayer(layer) end

--- Disables all meshes.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2635
function editor_api_dynamicDecals.disableAllMeshes() end

--- Removes the highlight.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1524
function editor_api_dynamicDecals.disableDecalHighlighting() end

--- Displays the baked textures in ImGui.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2218
---@param maxImageWidth number Max width
function editor_api_dynamicDecals.drawBakedTextures(maxImageWidth) end

--- Displays the brush input textures in ImGui.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2226
---@param maxImageWidth number Max width
function editor_api_dynamicDecals.drawBrushInputTextures(maxImageWidth) end

--- Displays the dynamic textures in ImGui.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2214
---@param maxImageWidth number Max width
function editor_api_dynamicDecals.drawDynamicTextures(maxImageWidth) end

--- Displays the highlight textures in ImGui.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2222
---@param maxImageWidth number Max width
function editor_api_dynamicDecals.drawHighlightTextures(maxImageWidth) end

--- Displays the mask textures in ImGui.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2230
---@param maxImageWidth number Max width
function editor_api_dynamicDecals.drawMaskTextures(maxImageWidth) end

--- Displays a given textureSet in ImGui.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2234
---@param textureSet userdata TextureSet
---@param name string Title
---@param maxImageWidth number Max width
function editor_api_dynamicDecals.drawTextureSet(textureSet, name, maxImageWidth) end

--- Duplicates a layer by mirroring it (name + " Mirrored Copy") right after the original (undoable).
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2008
---@param layerId_number integer Index
---@param parentUid_string string|nil Parent
---@param mirrorChildren boolean|nil Also mirror the children
function editor_api_dynamicDecals.duplicateAndMirrorLayer(layerId_number, parentUid_string, mirrorChildren) end

--- Duplicates a layer (new uids, name + " Copy") right after the original (undoable).
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1980
---@param layerId_number integer Index
---@param parentUid_string string|nil Parent
function editor_api_dynamicDecals.duplicateLayer(layerId_number, parentUid_string) end

--- Enables all meshes for projection.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2631
function editor_api_dynamicDecals.enableAllMeshes() end

--- Exports a layer's mask to a file.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2074
---@param layer table Layer
---@param directory string Folder
---@param filename string File name
---@param extension string Extension
function editor_api_dynamicDecals.exportLayerMask(layer, directory, filename, extension) end

--- Exports a skin usable as a mod: png textures (_d, _m, _r, _cp), <mat>.skin.<skinName> materials copied from the <mat>.skin.dynamicTextures presets and the skin's jbeam file (slotType paint_design) to /mods/unpacked/<skinName>/..., then refreshes the mod manager.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2078
---@param vehicleName string Vehicle name
---@param skinName string Skin name
function editor_api_dynamicDecals.exportSkin(vehicleName, skinName) end

--- Exports the baked textures to a folder.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2070
---@param directoryPath string Folder
---@param exportName string Base name
---@param extension string Extension (e.g. png)
---@return any  Engine result
function editor_api_dynamicDecals.exportTextures(directoryPath, exportName, extension) end

--- Finishes the current path (the next points will create a new path).
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2590
function editor_api_dynamicDecals.finishPathLayer() end

--- Alpha mask blend mode (0 or 1 according to the property bounds).
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2463
---@return integer  Mode
function editor_api_dynamicDecals.getAlphaMaskBlendMode() end

--- Alpha mask channel (0 to 3 according to the property bounds).
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2455
---@return integer  Channel
function editor_api_dynamicDecals.getAlphaMaskChannel() end

--- Alpha mask intensity.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2311
---@return number  Intensity
function editor_api_dynamicDecals.getAlphaMaskIntensity() end

--- Alpha mask offset.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2303
---@return Point2F  Offset
function editor_api_dynamicDecals.getAlphaMaskOffset() end

--- Alpha mask rotation (radians).
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2471
---@return number  Radians
function editor_api_dynamicDecals.getAlphaMaskRotation() end

--- Alpha mask scale.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2295
---@return Point2F  Scale
function editor_api_dynamicDecals.getAlphaMaskScale() end

--- Current blend mode (M.blendModes).
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2062
---@return integer  Value
function editor_api_dynamicDecals.getBlendMode() end

--- Brush interpolation steps.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2519
---@return integer  Steps
function editor_api_dynamicDecals.getBrushStrokeInterpolationSteps() end

--- Data of the current brush layer (C++ side).
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2623
---@return table  Data
function editor_api_dynamicDecals.getBrushStrokeLayerData() end

--- Index of the vehicle color palette used by the decal.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2375
---@return integer  Index
function editor_api_dynamicDecals.getColorPaletteMapId() end

--- Color texture scale.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2287
---@return Point2F  Scale
function editor_api_dynamicDecals.getColorTextureScale() end

--- Position of the projection cursor (screen, UV).
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2759
---@return Point2F  Position
function editor_api_dynamicDecals.getCursorPosition() end

--- Current decal color (RGBA).
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2190
---@return Point4F  Color
function editor_api_dynamicDecals.getDecalColor() end

--- Font character used by the decal.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2671
---@return string  Character
function editor_api_dynamicDecals.getDecalLayerFontCharacter() end

--- Path of the decal's font.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2679
---@return string  Path
function editor_api_dynamicDecals.getDecalLayerFontPath() end

--- Local (vehicle) position of a decal layer.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2651
---@param decal table Layer
---@return vec3  Position
function editor_api_dynamicDecals.getDecalLocalPos(decal) end

--- Current decal rotation (radians).
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2206
---@return number  Radians
function editor_api_dynamicDecals.getDecalRotation() end

--- Current decal scale.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2198
---@return vec3  Scale
function editor_api_dynamicDecals.getDecalScale() end

--- Decal skew.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2279
---@return Point2F  Skew
function editor_api_dynamicDecals.getDecalSkew() end

--- Path of the current texture of a decal type.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2174
---@param type_string string Texture type (color, normal, metallic, roughness, alpha, inferred from the decal*TexturePath fields)
---@return string  Path
function editor_api_dynamicDecals.getDecalTexturePath(type_string) end

--- Decal UV offset.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2271
---@return Point2F  UV
function editor_api_dynamicDecals.getDecalUv() end

--- World position of a decal layer.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2647
---@param decal table Layer
---@return vec3  Position
function editor_api_dynamicDecals.getDecalWorldPos(decal) end

--- World transform matrix of a layer.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2659
---@param decal table Layer
---@return MatrixF  Transform
function editor_api_dynamicDecals.getDecalWorldTransform(decal) end

--- Projection depth.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2547
---@return number  Depth
function editor_api_dynamicDecals.getDepth() end

--- Returns whether path mode is active.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2582
---@return boolean  State
function editor_api_dynamicDecals.getEnablePathLayer() end

--- Is dynamic projection enabled?
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2238
---@return boolean  State
function editor_api_dynamicDecals.getEnabled() end

--- Color of the fill layers.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2439
---@return Point4F  Color
function editor_api_dynamicDecals.getFillLayerColor() end

--- Palette index for the fill.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2447
---@return integer  Index
function editor_api_dynamicDecals.getFillLayerColorPaletteMapId() end

--- Current fill texture.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2182
---@return string  Path
function editor_api_dynamicDecals.getFillTexturePath() end

--- Flip the decal on the mirror side?
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2695
---@return boolean  State
function editor_api_dynamicDecals.getFlipMirroredDecal() end

--- Path of the font texture atlas.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2263
---@return string  Path
function editor_api_dynamicDecals.getFontTextureAtlasPath() end

--- Gradient color, bottom-left corner.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2359
---@return ColorI  Color
function editor_api_dynamicDecals.getGradientColorBottomLeft() end

--- Gradient color, bottom-right corner.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2367
---@return ColorI  Color
function editor_api_dynamicDecals.getGradientColorBottomRight() end

--- Gradient color, top-left corner.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2343
---@return ColorI  Color
function editor_api_dynamicDecals.getGradientColorTopLeft() end

--- Gradient color, top-right corner.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2351
---@return ColorI  Color
function editor_api_dynamicDecals.getGradientColorTopRight() end

--- Currently highlighted layer, or nil.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1598
---@return table|nil  Layer
function editor_api_dynamicDecals.getHighlightedLayer() end

--- Undo/redo history specific to this module.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:3046
---@return table  History
function editor_api_dynamicDecals.getHistory() end

--- Returns the layer at the given index (1-based) in the root stack or in the parent's children.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1708
---@param layerId_number integer Index
---@param parentUid_string string|nil Parent uid
---@return table|nil  Layer
function editor_api_dynamicDecals.getLayerById(layerId_number, parentUid_string) end

--- Looks up a layer (recursively) by uid; logs a message and returns nil if not found.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1699
---@param layerUid_string string uid
---@return table|nil  Layer
function editor_api_dynamicDecals.getLayerByUid(layerUid_string) end

--- Total number of layers (children included).
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1567
---@return integer  Count
function editor_api_dynamicDecals.getLayerCount() end

--- Returns the layer name template.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1009
---@return string  Template
function editor_api_dynamicDecals.getLayerNameBuildString() end

--- Returns the root layer stack (shared table, not a copy).
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1563
---@return table[]  Layers
function editor_api_dynamicDecals.getLayerStack() end

--- Is depth locked?
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2539
---@return boolean  State
function editor_api_dynamicDecals.getLockDepth() end

--- Is the surface normal locked?
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2551
---@return boolean  State
function editor_api_dynamicDecals.getLockSurfaceNormal() end

--- List of targeted material indices.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2419
---@return integer[]  Index
function editor_api_dynamicDecals.getMaterialIndices() end

--- Number of meshes in the shape.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2435
---@return integer  Count
function editor_api_dynamicDecals.getMeshObjectCount() end

--- Metallic intensity.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2327
---@return number  Intensity
function editor_api_dynamicDecals.getMetallicIntensity() end

--- Is mirror debug display active?
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2495
---@return boolean  State
function editor_api_dynamicDecals.getMirrorDebug() end

--- Mirror plane offset.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2487
---@return number  Offset
function editor_api_dynamicDecals.getMirrorOffset() end

--- Is mirror mode active?
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2479
---@return boolean  State
function editor_api_dynamicDecals.getMirrored() end

--- Normal map intensity.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2319
---@return number  Intensity
function editor_api_dynamicDecals.getNormalIntensity() end

--- Whether decals follow the path direction.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2607
---@return boolean  State
function editor_api_dynamicDecals.getOrientPathDecals() end

--- Path of the path's font.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2687
---@return string  Path
function editor_api_dynamicDecals.getPathLayerFontPath() end

--- Path interpolation steps.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2527
---@return integer  Steps
function editor_api_dynamicDecals.getPathLayerInterpolationSteps() end

--- Text placed along the path.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2663
---@return string  Text
function editor_api_dynamicDecals.getPathLayerText() end

--- Path type (M.pathTypes).
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2615
---@return integer  0 Linear, 1 Bezier
function editor_api_dynamicDecals.getPathType() end

--- Generates a pseudo-unique "XXXX-XXXX" uid (hexadecimal).
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:48
---@return string  uid
function editor_api_dynamicDecals.getRandomUid() end

--- Roughness intensity.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2335
---@return number  Intensity
function editor_api_dynamicDecals.getRoughnessIntensity() end

--- Is SDF rendering active?
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2711
---@return boolean  State
function editor_api_dynamicDecals.getSdfEnabled() end

--- SDF outline color.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2703
---@return ColorI  Color
function editor_api_dynamicDecals.getSdfOutlineColor() end

--- SDF outline softness.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2743
---@return number  Value
function editor_api_dynamicDecals.getSdfOutlineSoftness() end

--- SDF outline thickness.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2735
---@return number  Value
function editor_api_dynamicDecals.getSdfOutlineThickness() end

--- SDF softness.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2727
---@return number  Value
function editor_api_dynamicDecals.getSdfSoftness() end

--- SDF thickness.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2719
---@return number  Value
function editor_api_dynamicDecals.getSdfThickness() end

--- Bit mask of the projector settings (M.settingsFlags).
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2026
---@return integer  Flags
function editor_api_dynamicDecals.getSettings() end

--- Shape materials (index -> name).
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2535
---@return table<integer, string>  Names
function editor_api_dynamicDecals.getShapeMaterialNames() end

--- Shape meshes and their activation state.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2627
---@return table<string, boolean>  name -> enabled
function editor_api_dynamicDecals.getShapeMeshes() end

--- Path of the 3D model (shape) projected onto.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2385
---@return string  Path
function editor_api_dynamicDecals.getShapePath() end

--- Current surface normal.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2559
---@return vec3  Normal
function editor_api_dynamicDecals.getSurfaceNormal() end

--- Scale of the texture fill layers.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2503
---@return Point2F  Scale
function editor_api_dynamicDecals.getTextureFillLayerScale() end

--- Texture fill offset.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2511
---@return Point2F  Offset
function editor_api_dynamicDecals.getTextureFillOffset() end

--- Resolution of the dynamic textures.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2394
---@return Point2I  Resolution
function editor_api_dynamicDecals.getTextureResolution() end

--- TextureSet of the dynamic textures (nil before setup).
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2755
---@return userdata|nil  TextureSet
function editor_api_dynamicDecals.getTextureSet() end

--- Orient the decal along the surface normal?
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2563
---@return boolean  State
function editor_api_dynamicDecals.getUseSurfaceNormal() end

--- UV channel used.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2406
---@return integer  UV index
function editor_api_dynamicDecals.getUvLayer() end

--- true if a path layer is currently being edited.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2586
---@return boolean  State
function editor_api_dynamicDecals.hasActivePathLayer() end

--- Highlights a layer (table).
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1603
---@param layer_table table Layer
function editor_api_dynamicDecals.highlightLayer(layer_table) end

--- Highlights a layer by uid.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1612
---@param layerUid_string string uid
function editor_api_dynamicDecals.highlightLayerByUid(layerUid_string) end

--- Is the AlphaMaskInvert flag active?
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2034
---@return boolean  State
function editor_api_dynamicDecals.isAlphaMaskInvertEnabled() end

--- Is the UseGradientColor flag active?
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2030
---@return boolean  State
function editor_api_dynamicDecals.isDecalGradientColorEnabled() end

--- Is the UseMousePos flag active (projection at the mouse cursor rather than the center)?
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2054
---@return boolean  State
function editor_api_dynamicDecals.isUseMousePos() end

--- Is the WrapAlphaMaskX flag active?
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2038
---@return boolean  State
function editor_api_dynamicDecals.isWrapAlphaMaskXEnabled() end

--- Is the WrapAlphaMaskY flag active?
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2042
---@return boolean  State
function editor_api_dynamicDecals.isWrapAlphaMaskYEnabled() end

--- Is the WrapColorTextureX flag active?
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2046
---@return boolean  State
function editor_api_dynamicDecals.isWrapColorTextureXEnabled() end

--- Is the WrapColorTextureY flag active?
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2050
---@return boolean  State
function editor_api_dynamicDecals.isWrapColorTextureYEnabled() end

--- Loads a stack from a JSON, overwriting (Overwrite, default) or appending (Append), then reprojects.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:3017
---@param path_string string File
---@param mode_number integer|nil M.loadingModes: 0 Overwrite, 1 Append
---@return table|nil  Result of reprojectLayers (nil in the current code, the function returns nothing)
function editor_api_dynamicDecals.loadLayerStackFromFile(path_string, mode_number) end

--- Moves a layer to another position/parent (undoable). Refuses to make a layer its own child. Emits dynamicDecals_moveLayer.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1899
---@param from_number integer Source index
---@param fromParentUid_string string|nil Source parent
---@param to_number integer Destination index
---@param toParentUid_string string|nil Destination parent
function editor_api_dynamicDecals.moveLayer(from_number, fromParentUid_string, to_number, toParentUid_string) end

--- Moves a layer (decal, brushStroke, path or group) to a new vehicle-local position. For a group, referenceLayerUid is required.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2921
---@param layerUid string uid of the layer
---@param newLocalPosition vec3 New position
---@param includeChildren boolean|nil Also move the children
---@param referenceLayerUid string|nil Reference layer (groups)
function editor_api_dynamicDecals.moveLayerLocalPos(layerUid, newLocalPosition, includeChildren, referenceLayerUid) end

--- Hook called with the saved data: recreates the layer stack and remembers materialIdx for setup().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:3004
---@param data table Data from onSerialize
function editor_api_dynamicDecals.onDeserialized(data) end

--- Extension serialization hook: returns {layerStackData, materialIdx} (nil without a projector).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2994
---@return table|nil  Data
function editor_api_dynamicDecals.onSerialize() end

--- Called every frame by the tool: updates the app, projects the preview decal if projectDynamicDecals is set, then combines the textures into the textureSet.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:3028
function editor_api_dynamicDecals.onUpdate_() end

--- Hook called on vehicle switch: refreshes the shape and the materials.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:3071
function editor_api_dynamicDecals.onVehicleSwitched() end

--- Redoes the last undone action.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:3054
function editor_api_dynamicDecals.redo() end

--- Removes the last point of the current path; if only one remains, deletes the layer.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2594
function editor_api_dynamicDecals.removeLastPathLayerPoint() end

--- Deletes a layer (undoable) and turns off highlighting if it was highlighted.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1941
---@param index_number integer Index
---@param parentUid_string string|nil Parent
function editor_api_dynamicDecals.removeLayer(index_number, parentUid_string) end

--- Removes a material from the targets.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2431
---@param materialIdx_int integer Index
function editor_api_dynamicDecals.removeMaterialIdx(materialIdx_int) end

--- Displays the SDF texture in ImGui.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2767
---@param sizeX number Width
---@param sizeY number Height
function editor_api_dynamicDecals.renderSdfTextureImgui(sizeX, sizeY) end

--- Repositions an already placed decal according to the current camera/projection, changing only its transform fields (camPosition, decalPos, decalScale, decalRotation, mirror...). Refuses if the captured cursor is not centered (0.5 ± 0.01) or if the layer is not a decal. Commits a "Transform Decal" action.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1827
---@param layerUid_string string uid of the decal
---@param originalLayer table Snapshot of the layer before the edit
---@return boolean  true if successful
function editor_api_dynamicDecals.replaceDecalTransformFromCurrentProjection(layerUid_string, originalLayer) end

--- Clears the baked textures and rebakes the whole stack; shows a failure if baking returns nil.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1647
function editor_api_dynamicDecals.reprojectLayers() end

--- Applies a delta rotation to a layer and its children.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2938
---@param layer table Layer (uid used)
---@param delta_vec3 vec3 Rotation delta (inferred from code)
function editor_api_dynamicDecals.rotateLayer(layer, delta_vec3) end

--- Writes the layer stack to a JSON file (without materialIdx).
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:3011
---@param path_string string File
function editor_api_dynamicDecals.saveLayerStackToFile(path_string) end

--- Scales a layer and its children by (1,1,1) + delta.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2960
---@param layer table Layer (uid used)
---@param delta_vec3 vec3 Scale delta
function editor_api_dynamicDecals.scaleLayer(layer, delta_vec3) end

--- Converts a layer to a JSON-serializable table (engine types converted).
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:230
---@param layer table Layer
---@return table  Serialized data
function editor_api_dynamicDecals.serializeLayer(layer) end

--- Sets the alpha mask blend mode.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2467
---@param value_int integer Mode
function editor_api_dynamicDecals.setAlphaMaskBlendMode(value_int) end

--- Sets the alpha mask channel.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2459
---@param value_int integer Channel
function editor_api_dynamicDecals.setAlphaMaskChannel(value_int) end

--- Sets the alpha mask intensity.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2315
---@param value_float number Intensity
function editor_api_dynamicDecals.setAlphaMaskIntensity(value_float) end

--- Sets the alpha mask offset.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2307
---@param value_Point2F Point2F Offset
function editor_api_dynamicDecals.setAlphaMaskOffset(value_Point2F) end

--- Sets the alpha mask rotation.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2475
---@param value_radian_float number Radians
function editor_api_dynamicDecals.setAlphaMaskRotation(value_radian_float) end

--- Sets the alpha mask scale.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2299
---@param value_Point2F Point2F Scale
function editor_api_dynamicDecals.setAlphaMaskScale(value_Point2F) end

--- Sets the current blend mode.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2066
---@param blendMode_int integer Value of M.blendModes
function editor_api_dynamicDecals.setBlendMode(blendMode_int) end

--- Sets the brush interpolation steps.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2523
---@param value_u32 integer Steps
function editor_api_dynamicDecals.setBrushStrokeInterpolationSteps(value_u32) end

--- Sets the decal's palette index.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2379
---@param value_int integer Index
function editor_api_dynamicDecals.setColorPaletteMapId(value_int) end

--- Sets the color texture scale.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2291
---@param value_Point2F Point2F Scale
function editor_api_dynamicDecals.setColorTextureScale(value_Point2F) end

--- Sets the position of the projection cursor.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2763
---@param value_Point2F Point2F Position
function editor_api_dynamicDecals.setCursorPosition(value_Point2F) end

--- Sets the decal color.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2194
---@param value_Point4F Point4F RGBA color
function editor_api_dynamicDecals.setDecalColor(value_Point4F) end

--- Sets the decal's font character.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2675
---@param value_char string Character
function editor_api_dynamicDecals.setDecalLayerFontCharacter(value_char) end

--- Sets the decal's font.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2683
---@param value_string string Path
function editor_api_dynamicDecals.setDecalLayerFontPath(value_string) end

--- Sets a decal's position (parameter name is worldPos in the code).
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2655
---@param decal table Layer
---@param worldPos vec3 Position (inferred from code)
function editor_api_dynamicDecals.setDecalLocalPos(decal, worldPos) end

--- Sets the decal rotation.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2210
---@param value_radian_number number Radians
function editor_api_dynamicDecals.setDecalRotation(value_radian_number) end

--- Sets the decal scale.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2202
---@param value_vec3 vec3 Scale
function editor_api_dynamicDecals.setDecalScale(value_vec3) end

--- Sets the decal skew.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2283
---@param value_Point2F Point2F Skew
function editor_api_dynamicDecals.setDecalSkew(value_Point2F) end

--- Sets the current texture of a decal type.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2178
---@param type_string string Texture type
---@param path_string string Path
function editor_api_dynamicDecals.setDecalTexturePath(type_string, path_string) end

--- Sets the decal UV offset.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2275
---@param value_Point2F Point2F UV
function editor_api_dynamicDecals.setDecalUv(value_Point2F) end

--- Enables/disables the projector's brush mode (with a new random uid).
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2571
---@param value_bool boolean State
function editor_api_dynamicDecals.setEnableBrushStroke(value_bool) end

--- Enables/disables path mode; when set to false, finishes the current path.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2575
---@param value_bool boolean State
function editor_api_dynamicDecals.setEnablePathLayer(value_bool) end

--- Enables/disables the projector; when set to false, clears the dynamic textures and recombines the textureSet.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2242
---@param enabled boolean State
function editor_api_dynamicDecals.setEnabled(enabled) end

--- Sets the color of the fill layers.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2443
---@param value_Point4F Point4F RGBA color
function editor_api_dynamicDecals.setFillLayerColor(value_Point4F) end

--- Sets the palette index for the fill.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2451
---@param value_int integer Index
function editor_api_dynamicDecals.setFillLayerColorPaletteMapId(value_int) end

--- Sets the fill texture.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2186
---@param path_string string Path
function editor_api_dynamicDecals.setFillTexturePath(path_string) end

--- Enables flipping of the decal on the mirror side.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2699
---@param value_bool boolean State
function editor_api_dynamicDecals.setFlipMirroredDecal(value_bool) end

--- Sets the font texture atlas.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2267
---@param path_string string Path
function editor_api_dynamicDecals.setFontTextureAtlasPath(path_string) end

--- Sets the gradient color, bottom-left corner.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2363
---@param value_ColorI ColorI Color
function editor_api_dynamicDecals.setGradientColorBottomLeft(value_ColorI) end

--- Sets the gradient color, bottom-right corner.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2371
---@param value_ColorI ColorI Color
function editor_api_dynamicDecals.setGradientColorBottomRight(value_ColorI) end

--- Sets the gradient color, top-left corner.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2347
---@param value_ColorI ColorI Color
function editor_api_dynamicDecals.setGradientColorTopLeft(value_ColorI) end

--- Sets the gradient color, top-right corner.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2355
---@param value_ColorI ColorI Color
function editor_api_dynamicDecals.setGradientColorTopRight(value_ColorI) end

--- Replaces a layer (by uid) with the given data, undoable, and emits dynamicDecals_setLayer(uid); dynamicDecals_onLayerUpdated(uid) is emitted on apply.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1754
---@param layerData_table table New data (existing uid)
---@param doReproject_bool boolean|nil Rebake the stack after modification
function editor_api_dynamicDecals.setLayer(layerData_table, doReproject_bool) end

--- Sets the name template for new layers (default "$type Layer"). Tags: @type, @colormap, @normalmap, @metallicmap, @roughnessmap, @alphamap, @uid; a {text@tag text} block only appears if the tag is not empty.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1005
---@param value_string string Template
function editor_api_dynamicDecals.setLayerNameBuildString(value_string) end

--- Shows/hides a layer directly (without history) and reprojects.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1530
---@param layerUid_string string uid
---@param visibility_bool boolean true visible
function editor_api_dynamicDecals.setLayerVisibility(layerUid_string, visibility_bool) end

--- Locks/unlocks the projection depth.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2543
---@param value_bool boolean State
function editor_api_dynamicDecals.setLockDepth(value_bool) end

--- Locks/unlocks the surface normal.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2555
---@param value_bool boolean State
function editor_api_dynamicDecals.setLockSurfaceNormal(value_bool) end

--- Sets the single material targeted by the projection.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2423
---@param materialIdx_int integer Material index
function editor_api_dynamicDecals.setMaterialIdx(materialIdx_int) end

--- Enables/disables a mesh by name.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2643
---@param name_string string Mesh name
---@param value_bool boolean State
function editor_api_dynamicDecals.setMeshEnable(name_string, value_bool) end

--- Sets the metallic intensity.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2331
---@param value_float number Intensity
function editor_api_dynamicDecals.setMetallicIntensity(value_float) end

--- Enables mirror debug.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2499
---@param value_bool boolean State
function editor_api_dynamicDecals.setMirrorDebug(value_bool) end

--- Sets the mirror plane offset.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2491
---@param value_float number Offset
function editor_api_dynamicDecals.setMirrorOffset(value_float) end

--- Enables/disables the mirror.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2483
---@param value_bool boolean State
function editor_api_dynamicDecals.setMirrored(value_bool) end

--- Sets the normal map intensity.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2323
---@param value_float number Intensity
function editor_api_dynamicDecals.setNormalIntensity(value_float) end

--- Sets whether the path's decals are oriented along the path.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2611
---@param value_bool boolean State
function editor_api_dynamicDecals.setOrientPathDecals(value_bool) end

--- Sets the path's font.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2691
---@param value_string string Path
function editor_api_dynamicDecals.setPathLayerFontPath(value_string) end

--- Sets the path interpolation steps.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2531
---@param value_u32 integer Steps
function editor_api_dynamicDecals.setPathLayerInterpolationSteps(value_u32) end

--- Sets the text placed along the path.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2667
---@param value_string string Text
function editor_api_dynamicDecals.setPathLayerText(value_string) end

--- Sets the path type.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2619
---@param value_int integer 0 Linear, 1 Bezier
function editor_api_dynamicDecals.setPathType(value_int) end

--- Enables/disables the preview projection (M.projectDynamicDecals).
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1013
---@param value boolean State
function editor_api_dynamicDecals.setProjectDynamicDecalsState(value) end

--- Sets the roughness intensity.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2339
---@param value_float number Intensity
function editor_api_dynamicDecals.setRoughnessIntensity(value_float) end

--- Enables/disables SDF rendering.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2715
---@param value_bool boolean State
function editor_api_dynamicDecals.setSdfEnabled(value_bool) end

--- Sets the SDF outline color.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2707
---@param value_ColorI ColorI Color
function editor_api_dynamicDecals.setSdfOutlineColor(value_ColorI) end

--- Sets the SDF outline softness.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2747
---@param value_f32 number Value
function editor_api_dynamicDecals.setSdfOutlineSoftness(value_f32) end

--- Sets the SDF outline thickness.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2739
---@param value_f32 number Value
function editor_api_dynamicDecals.setSdfOutlineThickness(value_f32) end

--- Sets the SDF softness.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2731
---@param value_f32 number Value
function editor_api_dynamicDecals.setSdfSoftness(value_f32) end

--- Sets the SDF thickness.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2723
---@param value_f32 number Value
function editor_api_dynamicDecals.setSdfThickness(value_f32) end

--- Changes the projection model then reprojects.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2389
---@param path string Shape path
function editor_api_dynamicDecals.setShapePath(path) end

--- Sets the texture fill scale.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2507
---@param value_Point2F Point2F Scale
function editor_api_dynamicDecals.setTextureFillLayerScale(value_Point2F) end

--- Sets the texture fill offset.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2515
---@param value_Point2F Point2F Offset
function editor_api_dynamicDecals.setTextureFillOffset(value_Point2F) end

--- Changes the resolution; if the engine accepts it, reprojects and reassigns the @DynamicTexture textureSet.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2398
---@param resolution_point2i Point2I Resolution
function editor_api_dynamicDecals.setTextureResolution(resolution_point2i) end

--- Enables orientation along the surface normal.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2567
---@param value_bool boolean State
function editor_api_dynamicDecals.setUseSurfaceNormal(value_bool) end

--- Changes the UV channel then reprojects.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2410
---@param uvLayerId_int integer UV index
function editor_api_dynamicDecals.setUvLayer(uvLayerId_int) end

--- Initializes the projector: uses the active DecalShapeRenderApp app if it exists, otherwise creates a DecalProjection (4096x2048) bound to the player vehicle; fetches the textureSet, updates the vehicle materials and adds a base fill layer if the stack is empty. No effect if already done.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1452
function editor_api_dynamicDecals.setup() end

--- Toggles the projector state (same effects as setEnabled).
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2255
function editor_api_dynamicDecals.toggleEnabled() end

--- Toggles a layer's visibility (undoable) and reprojects.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1549
---@param layerUid_string string uid
---@return boolean  New value of enabled
function editor_api_dynamicDecals.toggleLayerVisibility(layerUid_string) end

--- Toggles a settings flag.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:2058
---@param value_int integer Value of M.settingsFlags.X.value
---@return any  Engine result
function editor_api_dynamicDecals.toggleSetting(value_int) end

--- Undoes the last action of the decals history.
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:3050
function editor_api_dynamicDecals.undo() end

--- Starts a job that chooses the default decal material(s) based on the player vehicle (materials of its parts, otherwise the material named after the jbeam, otherwise ending with main then body).
---Source: lua/ge/extensions/editor/api/dynamicDecals.lua:1447
function editor_api_dynamicDecals.updateVehicleMaterials() end

