---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/inspector.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- World Editor Inspector window: displays and edits the fields (static, dynamic, arrays) of the selected object or objects, with specialized editors (vehicle metallic paint, GroundCover billboard UVs, light color/intensity/cookie, DecalData labels) and undo/redo via editor.history. Several instances can coexist, including instances locked to a selection. A modder uses it to register handlers per selection type or field modifiers.
--- Access: extension `editor_inspector`: `extensions.load("editor_inspector")`, then the global `editor_inspector`
---@class editor_inspector
editor_inspector = {}

--- Called when the editor is activated: resets the valueInspector tables and the shared context, then refreshes the selection.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/inspector.lua:1590
function editor_inspector.onEditorActivated() end

--- Called after a level is opened: reloads the datablock lists of the dropdown menus.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/inspector.lua:2292
function editor_inspector.onEditorAfterOpenLevel() end

--- Called when the editor is deactivated. Empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/inspector.lua:1596
function editor_inspector.onEditorDeactivated() end

--- Draws each inspector window every frame (closes the instances whose window is no longer visible) and handles the pending night lighting refresh.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/inspector.lua:1484
function editor_inspector.onEditorGui() end

--- Initializes the valueInspector, registers the "object" handler, the Window > Inspector menu entry and the custom field editors/labels (BeamNGVehicle.metallicPaintData, GroundCover.billboardUVs, DecalData.texRows/texCols, PointLight/SpotLight color, intensity, cookie).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/inspector.lua:2234
function editor_inspector.onEditorInitialized() end

--- Restores the inspector instances from the editor's saved state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/inspector.lua:1599
---@param state table Editor state.
function editor_inspector.onEditorLoadGuiInstancerState(state) end

--- Called when the selection changes: ends a possible "pickingLinkTo" or rebuilds the list of fields common to the selected objects (with usage counter).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/inspector.lua:2262
function editor_inspector.onEditorObjectSelectionChanged() end

--- Defines editor.checkEditorDirtyFlag and editor.requestInspectorScrollToTopOnceForSelection(selectionId).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/inspector.lua:2227
function editor_inspector.onEditorRegisterApi() end

--- Writes the inspector instances into the editor state (key "inspectorInstances").
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/inspector.lua:1607
---@param state table State to complete.
function editor_inspector.onEditorSaveGuiInstancerState(state) end

--- Called at load: initializes the collapsible groups and installs the editor.* API (addInspectorInstance, registerInspectorTypeHandler...).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/inspector.lua:1007
function editor_inspector.onExtensionLoaded() end

--- Methods added to the global `editor` table by this module.
---@class editor_inspector_editor
local editor_inspector_editor = {}

--- Creates a new inspector window. With a selection, the instance is locked to it (own context); without, it follows the current selection.
---Source: lua/ge/extensions/editor/inspector.lua:132
---@param selection table|nil Selection to lock to (deep copied).
---@return string  Index (string key) of the instance.
function editor_inspector_editor.addInspectorInstance(selection) end

--- For each selected object, calls inspectUpdate(); if the object is modified (or isEditorDirty), marks the editor as modified (editor.setDirty). Does nothing if already dirty.
---Source: lua/ge/extensions/editor/inspector.lua:100
function editor_inspector_editor.checkEditorDirtyFlag() end

--- Closes an inspector instance and unregisters its window.
---Source: lua/ge/extensions/editor/inspector.lua:157
---@param idx string Index returned by addInspectorInstance.
function editor_inspector_editor.closeInspectorInstance(idx) end

--- Returns the open inspector instances.
---Source: lua/ge/extensions/editor/inspector.lua:163
---@return table  Table index -> instance info.
function editor_inspector_editor.getInspectorInstances() end

--- Returns the handlers registered per selection type.
---Source: lua/ge/extensions/editor/inspector.lua:167
---@return table<string, table>  typeName -> {typeName, guiCallback}.
function editor_inspector_editor.getInspectorTypeHandlers() end

--- Indicates whether the shared inspector currently displays a field of this name.
---Source: lua/ge/extensions/editor/inspector.lua:986
---@param fieldName string Field name.
---@return boolean  true if the field is present.
function editor_inspector_editor.inspectorHasField(fieldName) end

--- Registers a field modification callback, identified by a unique name.
---Source: lua/ge/extensions/editor/inspector.lua:182
---@param uniqueName string Unique identifier.
---@param callback function Modification function _anon(signature not detailed here).
function editor_inspector_editor.registerInspectorFieldModifier(uniqueName, callback) end

--- Registers the inspector rendering of a selection type (key of editor.selection).
---Source: lua/ge/extensions/editor/inspector.lua:171
---@param typeName string Type name, e.g. "object".
---@param guiCallback function ImGui drawing function called with the inspector instance (inferred from the calling code of levelSettings).
function editor_inspector_editor.registerInspectorTypeHandler(typeName, guiCallback) end

--- Removes a field modifier.
---Source: lua/ge/extensions/editor/inspector.lua:188
---@param uniqueName string Identifier used at registration.
function editor_inspector_editor.unregisterInspectorFieldModifier(uniqueName) end

--- Removes a type handler.
---Source: lua/ge/extensions/editor/inspector.lua:178
---@param typeName string Type name.
function editor_inspector_editor.unregisterInspectorTypeHandler(typeName) end

