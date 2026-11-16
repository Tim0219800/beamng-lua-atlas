---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Decal road (DecalRoad) editor of the World Editor: "Edit Road" edit mode (create_road_decal icon) to create roads (Alt + left click), select roads and nodes (Ctrl for multi-selection, Ctrl+Shift+drag for rectangle selection), move nodes, adjust width, duplicate, copy/paste properties, delete, with undo history. It also registers the "roadEditor.general.*" preferences and a material filter for DecalRoad (tag "RoadAndPath"). The file is very long (about 2,400 lines): almost everything is local; only a few hooks and one function are exported.
--- Access: extension `editor_roadEditor`: `extensions.load("editor_roadEditor")`, then the global `editor_roadEditor`
---@class editor_roadEditor
editor_roadEditor = {}

--- Called by the "RoadEditor" action map: cycles the choice among the overlapping hovered roads. 1 moves to the next road, 0 to the previous (looping). No effect if there is no hovered road.
---Source: lua/ge/extensions/editor/roadEditor.lua:2150
---@param value integer 1 = next, 0 = previous.
function editor_roadEditor.cycleHoveredRoadsAM(value) end

--- Hook called when the editor initializes: creates the "Edit Road" edit mode with its shortcuts (LMB+Alt create/add a node, Ctrl+LMB multi-selection, Ctrl+Shift+drag rectangle selection, copy/paste/duplicate), registers the DecalRoad material filter, the error modal window, the road templates window, reloads the templates (editor_roadUtils.reloadTemplates) and applies the updateDecalRoadsOnStaticMeshTransform preference if the C++ API exists.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/roadEditor.lua:2315
function editor_roadEditor.onEditorInitialized() end

--- Hook called when the inspector draws its header. If the "Edit Road" mode is active, adds the position and width fields of the selected nodes (multi-edit when all values are equal) with recording in the history.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/roadEditor.lua:1213
---@param inspectorInfo table Inspector information supplied by the editor (inferred from code).
function editor_roadEditor.onEditorInspectorHeaderGui(inspectorInfo) end

--- Hook called when the editor's object selection changes. If the "Edit Road" mode is active, finishes the road being created (if no selection), rebuilds the list of selected DecalRoads and only keeps the selected nodes of the roads that are still selected.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/roadEditor.lua:2275
function editor_roadEditor.onEditorObjectSelectionChanged() end

--- Hook called when a preference changes. For roadEditor.general.updateDecalRoadsOnStaticMeshTransform, passes the value to worldEditorCppApi.setUpdateDecalRoadsOnStaticMeshTransform (if available).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/roadEditor.lua:2220
---@param path string Preference path.
---@param value any New value.
function editor_roadEditor.onEditorPreferenceValueChanged(path, value) end

--- Hook called to register the preferences: creates the "roadEditor" category and the "general" subcategory with its settings (see notes).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/roadEditor.lua:2226
---@param prefsRegistry table Editor preferences registry.
function editor_roadEditor.onEditorRegisterPreferences(prefsRegistry) end

--- Hook called when the extension is loaded; only writes an "initialized" log (level D).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/roadEditor.lua:2072
function editor_roadEditor.onExtensionLoaded() end

--- Hook called before the rendering of each frame; returns immediately if the "Edit Road" mode is not active and does nothing else (empty body).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/roadEditor.lua:2077
function editor_roadEditor.onPreRender() end

