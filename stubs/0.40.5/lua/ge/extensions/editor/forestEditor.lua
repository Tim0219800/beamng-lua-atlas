---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/forestEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Edit Forest" tool of the world editor: painting and editing of forest objects (ForestItem) with brushes (ForestBrush/ForestBrushElement brushes), selection, move, rotate, scale and terrain snapping tools. It also manages the ForestItemData inspector (mesh preview via ShapePreview), saving of the brushes (main.forestbrushes4.json) and of the forest when the level is saved. A modder mostly uses it to select items by script or change the brush size.
--- Access: extension `editor_forestEditor`: `extensions.load("editor_forestEditor")`, then the global `editor_forestEditor`
---@class editor_forestEditor
---@field dependencies string[] Extensions loaded before this module: {"core_forest"}.
editor_forestEditor = {}

--- Enables auto-repeat of the brush resize with the keyboard (keys [ ]): resets the timer to 0 and stores the direction. The per-frame update then calls changeBrush at the interval of the brushSizeChangeIntervalWithKeys preference.
---Source: lua/ge/extensions/editor/forestEditor.lua:3215
---@param direction number Direction of the change (positive enlarges, negative shrinks); passed as is to changeBrush
function editor_forestEditor.beginChangeBrushSizeWithKeys(direction) end

--- Changes the brush size, or its pressure (density) if the Ctrl key is held. The values are clamped then applied to the brush tool.
---Source: lua/ge/extensions/editor/forestEditor.lua:1425
---@param value number Direction/multiplier of the change (inferred from code)
---@param step number Step applied (units of the corresponding preference)
function editor_forestEditor.changeBrush(value, step) end

--- Clears the forest item selection, including the highlight in the viewport: sets each item's "selected" state to false then requests the rebuild of the instance data. Does nothing (no rebuild) if nothing is selected.
---Source: lua/ge/extensions/editor/forestEditor.lua:208
function editor_forestEditor.clearForestItemsSelection() end

--- Debug: prints the size, pressure and hardness of the current brush to the console.
---Source: lua/ge/extensions/editor/forestEditor.lua:144
function editor_forestEditor.dumpBrushProperties() end

--- Debug: prints the list of forest brushes (var.forestBrushes) to the console.
---Source: lua/ge/extensions/editor/forestEditor.lua:132
function editor_forestEditor.dumpForestBrushes() end

--- Debug: prints the forest brush lookup table (var.forestBrushesMap) to the console.
---Source: lua/ge/extensions/editor/forestEditor.lua:138
function editor_forestEditor.dumpForestBrushesMap() end

--- Stops the auto-repeat of the brush resize with the keyboard and resets the timer to 0.
---Source: lua/ge/extensions/editor/forestEditor.lua:3216
function editor_forestEditor.endChangeBrushSizeWithKeys() end

--- Hook called after a Lua reload (receives the data returned by onSerialize). Simply sets deserializeBrushes to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/forestEditor.lua:3192
---@param data any Value returned by onSerialize (true)
function editor_forestEditor.onDeserialize(data) end

--- Hook called after the level is saved. Saves the ForestBrushGroups to <level>/main.forestbrushes4.json if the brushes are modified, saves the forest (saveForest) if editor.forestDirty, and saves the modified ForestItemData datablocks.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/forestEditor.lua:3111
function editor_forestEditor.onEditorAfterSaveLevel() end

--- Hook called when the axis gizmo alignment changes (local/world). Places the gizmo on the item (local alignment, single item) or on the selection centroid. The name contains the typo "Aligment" as in the engine.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/forestEditor.lua:2881
function editor_forestEditor.onEditorAxisGizmoAligmentChanged() end

--- Hook called when the gizmo mode (move/rotate/scale) changes. If the active edit mode is "Edit Forest" and the current tool is not "select", switches to the "select" tool.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/forestEditor.lua:3179
---@param mode integer New gizmo mode (not used)
function editor_forestEditor.onEditorAxisGizmoModeChanged(mode) end

--- Hook called every frame by the editor: draws the tool window (toolbar, brush and ForestItemData palettes, inspector), handles inputs and the rendering of helpers (lines, spheres, bounding boxes).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/forestEditor.lua:2040
function editor_forestEditor.onEditorGui() end

--- Hook called at editor initialization: registers the "forestEditor" window, two modal dialogs, the forestItem type inspector, the custom field editors (shapeFile, ForestItemData) and the "Edit Forest" edit mode; then initializes brush, pressure, hardness and datablock tables.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/forestEditor.lua:3073
function editor_forestEditor.onEditorInitialized() end

--- Hook called when an inspector field is modified. Marks the brushes as modified (ForestBrush/ForestBrushElement) and updates the mesh preview when the shapeFile of a ForestItemData or the forestItemData of a ForestBrushElement changes. Only handles the case of a single selected object.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/forestEditor.lua:3133
---@param selectedIds integer[] Ids of the objects selected in the inspector
---@param fieldName string Name of the modified field
---@param fieldValue any New value
---@param arrayIndex integer|nil Index in the array field (not used)
function editor_forestEditor.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex) end

--- Hook called to declare the editor preferences: forestEditor category, general subcategory (size, pressure/density, hardness, depth offset, forced terrain alignment, snapping of all types, working distance).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/forestEditor.lua:3159
---@param prefsRegistry table Editor preferences registry
function editor_forestEditor.onEditorRegisterPreferences(prefsRegistry) end

--- Hook called before a Lua reload: clears the item selection then returns true so that onDeserialize is triggered afterwards.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/forestEditor.lua:3196
---@return boolean  Always true
function editor_forestEditor.onSerialize() end

--- Rebuilds the var.forestItemData list from all ForestItemData class objects in the scene, excluding parallax window datablocks.
---Source: lua/ge/extensions/editor/forestEditor.lua:1459
function editor_forestEditor.refreshForestItemDataList() end

--- Selects the brush tool of the given index in var.brushes (Lua index, starting at 1).
---Source: lua/ge/extensions/editor/forestEditor.lua:3188
---@param index integer Index in the brush list
function editor_forestEditor.selectBrushByIndex(index) end

--- Sets (or extends) the editor's forest item selection. Filters the parallax items, updates the highlight, the centroid, the axis gizmo and the mesh preview of the last item.
---Source: lua/ge/extensions/editor/forestEditor.lua:219
---@param forestItems table|nil List of forest items; nil to only deselect
---@param addToSelection boolean|nil true to add to the existing selection, otherwise it is replaced
function editor_forestEditor.selectForestItems(forestItems, addToSelection) end

--- Activates a toolbar tool or brush from its label (for example "select"). Does nothing if no label matches.
---Source: lua/ge/extensions/editor/forestEditor.lua:367
---@param toolName string Label of the tool or brush
function editor_forestEditor.selectToolByName(toolName) end

