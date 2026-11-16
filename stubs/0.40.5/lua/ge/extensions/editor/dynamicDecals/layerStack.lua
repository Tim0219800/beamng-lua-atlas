---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/layerStack.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Decal Stack / Layers" section (order 140) of the Dynamic Decals tool: hierarchical list of all layers of the design, with an icon colored by type, selection (via the selection module), enabling, duplication, deletion, mask editing, mirror and reorganization by drag and drop (order and parent changes, within groups). The display order is configurable (top to bottom or bottom to top).
--- Access: extension `editor_dynamicDecals_layerStack`: `extensions.load("editor_dynamicDecals_layerStack")`, then the global `editor_dynamicDecals_layerStack`
---@class editor_dynamicDecals_layerStack
editor_dynamicDecals_layerStack = {}

--- Hook called when a preference changes. Does nothing here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/layerStack.lua:805
---@param path string Preference path.
---@param value any New value.
function editor_dynamicDecals_layerStack.editorPreferenceValueChanged(path, value) end

--- Registers the subcategory `dynamicDecalsTool.layerStack`: topToBottomLayerStructure and layerTypeIconColor (with a graphical color editor per type).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/layerStack.lua:787
---@param prefsRegistry table Editor preferences registry.
function editor_dynamicDecals_layerStack.registerEditorPreferences(prefsRegistry) end

--- Empty function, no effect (extension point intended for layer UI elements).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/layerStack.lua:840
function editor_dynamicDecals_layerStack.registerLayerElementGui() end

--- Called by the tool: gets the API and the modules (fill, textureFill, gizmo, selection, helper, docs), registers the "Decal Stack / Layers" section (order 140, open by default) and the "Layer Stack" documentation page.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/layerStack.lua:821
---@param tool_in table Reference to the editor_dynamicDecalsTool tool.
function editor_dynamicDecals_layerStack.setup(tool_in) end

