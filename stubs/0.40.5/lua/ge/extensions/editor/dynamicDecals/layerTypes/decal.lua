---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/layerTypes/decal.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Decal" layer type of the Dynamic Decals tool, the most important one: a single decal with color, textures (color, alpha, metallic, normal, roughness), scale, rotation, skew, UV, alpha mask, mirror, gradient and SDF (Signed Distance Fields: outlines, softening) properties. Provides the "Decal Properties" section (settings of the current decal, order 60), the inspector GUI of the decal type, the SDF introduction window, the font character picker window and the documentation pages (Decal Layers, Properties, SDF).
--- Access: extension `editor_dynamicDecals_layerTypes_decal`: `extensions.load("editor_dynamicDecals_layerTypes_decal")`, then the global `editor_dynamicDecals_layerTypes_decal`
---@class editor_dynamicDecals_layerTypes_decal
editor_dynamicDecals_layerTypes_decal = {}

--- If the current color texture is SDF-compatible, displays the SDF introduction window (unless it was closed or the doNotShowSdfIntroAgain preference is true).
---Source: lua/ge/extensions/editor/dynamicDecals/layerTypes/decal.lua:77
function editor_dynamicDecals_layerTypes_decal.checkColorDecalTexturesSdfCompatible() end

--- Called every frame by the edit mode (via tool.registerEditorOnUpdateFn): counts down the timer of the SDF property highlight.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/layerTypes/decal.lua:1154
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation time delta (s).
---@param dtRaw number Raw time delta (s).
function editor_dynamicDecals_layerTypes_decal.editModeUpdate(dtReal, dtSim, dtRaw) end

--- Hook called when a preference changes. Does nothing here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/layerTypes/decal.lua:1146
---@param path string Preference path.
---@param value any New value.
function editor_dynamicDecals_layerTypes_decal.editorPreferenceValueChanged(path, value) end

--- Closes the SDF introduction window.
---Source: lua/ge/extensions/editor/dynamicDecals/layerTypes/decal.lua:1247
function editor_dynamicDecals_layerTypes_decal.hideSdfIntroWindow() end

--- Indicates whether the given texture is SDF-compatible, based on its metadata file.
---Source: lua/ge/extensions/editor/dynamicDecals/layerTypes/decal.lua:67
---@param texturePath string|nil Texture path; defaults to the decal's current color texture (api.getDecalTexturePath("color")).
---@return boolean  true if the isSdfCompatible metadata is true.
function editor_dynamicDecals_layerTypes_decal.isTexturesSdfCompatible(texturePath) end

--- Registers `dynamicDecalsTool.decalProperties`: scaleStep (float 0.025, from 0.001 to 0.25), rotationStep (float 15 degrees, from 1 to 360), texturePreviewSize (float 128, from 32 to 512), doNotShowSdfIntroAgain (bool false); and `dynamicDecalsTool.inspector.applyMirroredPropertyToChildren` (bool true).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/layerTypes/decal.lua:1134
---@param prefsRegistry table Editor preferences registry.
function editor_dynamicDecals_layerTypes_decal.registerEditorPreferences(prefsRegistry) end

--- Called by the tool: gets the related modules, registers the windows (SDF 400x400, font character 550x550), the "Decal Properties" section, the update and GUI callbacks, the inspector GUI of the decal type, the documentation pages and the list of blend modes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/layerTypes/decal.lua:1211
---@param tool_in table Reference to the editor_dynamicDecalsTool tool.
function editor_dynamicDecals_layerTypes_decal.setup(tool_in) end

--- Opens the "Dynamic Decals - SDF Introduction" window.
---Source: lua/ge/extensions/editor/dynamicDecals/layerTypes/decal.lua:1246
function editor_dynamicDecals_layerTypes_decal.showSdfIntroWindow() end

