---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/visualization.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Visualization" window of the world editor. Three tabs: Debug (checkboxes for the registered visualization types: wireframe, bounding boxes, triggers, terrain, decals, light frustums, navigation graphs, Advanced Lighting views, Material Debug...), Visible (display by object class) and Selectable (selectability by class, with presets). It also adds the "Lights Status" visualization (colored spheres and texts on the scene's lights) and registers the gizmos.visualization.* preferences.
--- Access: extension `editor_visualization`: `extensions.load("editor_visualization")`, then the global `editor_visualization`
---@class editor_visualization
---@field dependencies table<integer, string> {'editor_aiViz'}: extension loaded before this one.
editor_visualization = {}

--- Editor hook called every frame: draws the spheres/texts of the lights visualization, the Visualization window (search filter, three tabs), the lights settings window and the material debug legend.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/visualization.lua:225
function editor_visualization.onEditorGui() end

--- Editor hook called at initialization: initializes selectabilityPresets, registers the windows, clears then registers all visualization types (editor.registerVisualizationType), initializes materialDebugViz and computes the default values of each type. Also exposes editor.updateVisSettings.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/visualization.lua:440
function editor_visualization.onEditorInitialized() end

--- Editor hook called when a preference changes: applies visTypes, visible or selectable to the editor objects, synchronizes the selectability preset, and toggles the non-persistent paths when saveVisualizationSettings changes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/visualization.lua:359
---@param path string preference path, e.g. 'gizmos.visualization.visTypes'
---@param value any new value (table for visTypes/visible/selectable, boolean for saveVisualizationSettings)
function editor_visualization.onEditorPreferenceValueChanged(path, value) end

--- Editor hook called when preferences are registered: remembers the initial visible/selectable state of each object class and registers the gizmos/visualization category.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/visualization.lua:401
---@param prefsRegistry table editor preferences registry
function editor_visualization.onEditorRegisterPreferences(prefsRegistry) end

