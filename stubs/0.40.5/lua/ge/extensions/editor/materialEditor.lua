---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/materialEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- World material editor ("materialEditor" window of the level editor). It lists the materials of the level and of art/, lets you edit their properties per layer (textures, colors, floats, checkboxes, animation, alpha blending, cubemap...), with undo/redo, 3D preview (cube from art/shapes/material_preview), texture problem detection, GPU size estimation, material usage in the scene, focus/isolation in the view and saving of modified materials. The exported functions are mostly used by other editor tools: select a material, change a property, reuse the widgets.
--- Access: extension `editor_materialEditor`: `extensions.load("editor_materialEditor")`, then the global `editor_materialEditor`
---@class editor_materialEditor
---@field customMaterialsArray string[] Material classes offered: 'Standard', 'MetalicCarPaint'.
---@field customMaterialsArrayPtr any imgui string array (ArrayCharPtrByTbl) built from customMaterialsArray.
---@field dbg boolean Debug flag (copy of the initial local value, false).
---@field o table imgui pointers of the editor options, notably o.layer (IntPtr, current layer) and o.reflectionMode.
---@field v table Interface state: materialNameList, currentMaterialIndex, dirtyMaterials, materialUsage, inputWidgetHeight, style...
editor_materialEditor = {}

--- imgui widget: RGBA color editor bound to a property of the current material; applies the value live and creates an undo entry at the end of the edit.
---Source: lua/ge/extensions/editor/materialEditor.lua:1749
---@param label string Label (displayed if non-empty).
---@param property string Color property ("r g b a" string).
---@param id string|nil imgui id; property by default.
---@param layer integer|nil Layer; o.layer[0] if nil.
---@param labelSameLine boolean|nil If true, the widget is placed on the same line as the label.
function editor_materialEditor.colorEdit4(label, property, id, layer, labelSameLine) end

--- Draws an icon button that clears the property's texture (value "") with undo.
---Source: lua/ge/extensions/editor/materialEditor.lua:1552
---@param label string Label used in the "Remove ..." tooltip.
---@param property string Texture property to clear.
---@param layer integer|nil Layer; o.layer[0] if nil.
function editor_materialEditor.deleteMapButton(label, property, layer) end

--- imgui widget: thumbnail of a property's texture, with preview, drag-and-drop and file selection; modifies the property with undo.
---Source: lua/ge/extensions/editor/materialEditor.lua:1598
---@param label string Widget label.
---@param property string Texture property.
---@param layer integer|nil Layer; o.layer[0] if nil.
---@param additionalGuiFn function|nil Additional draw function _anon(inferred from code).
function editor_materialEditor.imageButton(label, property, layer, additionalGuiFn) end

--- imgui widget: numeric field bound to a float property of the current material; applies live and adds an undo entry at the end of the edit.
---Source: lua/ge/extensions/editor/materialEditor.lua:1869
---@param label string Label.
---@param property string Float property.
---@param float_step number|nil Step (0.01 by default).
---@param float_step_fast number|nil Fast step (0.1 by default).
---@param string_format string|nil Display format ("%.2f" by default).
---@param layer integer|nil Layer; o.layer[0] if nil.
---@param tooltip string|nil Help text displayed next to the label.
function editor_materialEditor.inputFloat(label, property, float_step, float_step_fast, string_format, layer, tooltip) end

--- Hook called when the editor is activated: loads materials, ground models and preview meshes, prepares the 3D previews (cube_1m.dae) and the level path.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/materialEditor.lua:3786
function editor_materialEditor.onEditorActivated() end

--- Hook called when the editor is deactivated: removes the scene focus, frees the material lists, size caches and preview meshes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/materialEditor.lua:3816
function editor_materialEditor.onEditorDeactivated() end

--- Selection deletion hook; empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/materialEditor.lua:3846
function editor_materialEditor.onEditorDeleteSelection() end

--- Hook called every editor frame: draws the main window and the auxiliary windows (preview, material usage, creation, copy, materials by tag), handles focus and background jobs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/materialEditor.lua:3552
function editor_materialEditor.onEditorGui() end

--- Editor initialization hook: adds the "Material Editor" menu, registers the six windows (five auxiliary ones hidden) and starts the tag mapping job.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/materialEditor.lua:3827
function editor_materialEditor.onEditorInitialized() end

--- Object selection change hook; empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/materialEditor.lua:3843
function editor_materialEditor.onEditorObjectSelectionChanged() end

--- Hook called when a preference changes; reacts to thumbnailSize, maxMaterialPreviewSize, textFilterResultsWithSameFirstCharAtTop (reloads the list) and showEstimatedSizeInList.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/materialEditor.lua:3753
---@param path string Preference path, e.g. materialEditor.general.thumbnailSize.
---@param value any New value.
function editor_materialEditor.onEditorPreferenceValueChanged(path, value) end

--- Preferences registration hook: creates the materialEditor category and the general subcategory.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/materialEditor.lua:3771
---@param prefsRegistry table Editor preferences registry.
function editor_materialEditor.onEditorRegisterPreferences(prefsRegistry) end

--- Hook called when files change on disk; reloads the materials if a main.materials.json under /levels/ or /art/ is concerned.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/materialEditor.lua:3738
---@param files table[] List of entries with a filename field.
function editor_materialEditor.onFilesChanged(files) end

--- Hook called when the player vehicle changes; if the window is visible and the editor active, restarts the tags job and reloads the materials.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/materialEditor.lua:3729
---@param oid integer Id of the old vehicle.
---@param nid integer Id of the new vehicle.
---@param player integer Player index (unused).
function editor_materialEditor.onVehicleSwitched(oid, nid, player) end

--- Selects in the list the material with this name, updates its displayed properties and remembers the choice for the current level in the levelMaterialNames preference. If the name is not found, the current index becomes 0. Does nothing while the list is not loaded (editor not activated).
---Source: lua/ge/extensions/editor/materialEditor.lua:948
---@param matName string Material name.
---@param clearFilter boolean|nil If true, first clears the text filter (otherwise the selection may fail).
function editor_materialEditor.selectMaterialByName(matName, clearFilter) end

--- Marks the material as modified (v.dirtyMaterials[name] = true) so that it gets saved.
---Source: lua/ge/extensions/editor/materialEditor.lua:1247
---@param materialObj userdata|nil Material object; current material if nil.
function editor_materialEditor.setMaterialDirty(materialObj) end

--- Sets a property of a material layer via editor.setMaterialProperty; on success, marks dirty, invalidates the size estimate and redraws the preview. Remembers the previous value for undo.
---Source: lua/ge/extensions/editor/materialEditor.lua:1254
---@param materialObj userdata|nil Material to modify; current if nil.
---@param property string Field name (e.g. diffuseMap, diffuseColor).
---@param layer integer Material layer index.
---@param value any New value.
function editor_materialEditor.setProperty(materialObj, property, layer, value) end

--- Shows the material editor window, or gives it focus if it is already visible.
---Source: lua/ge/extensions/editor/materialEditor.lua:3005
function editor_materialEditor.showMaterialEditor() end

