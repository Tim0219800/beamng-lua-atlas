---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/waterObjectHelper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small world editor extension: when a texture field of a water object is modified in the inspector, it reloads the object's textures. It reacts only to the fields rippleTex, foamTex, depthGradientTex and cubemap, and only for objects of class WaterObject.
--- Access: extension `editor_waterObjectHelper`: `extensions.load("editor_waterObjectHelper")`, then the global `editor_waterObjectHelper`
---@class editor_waterObjectHelper
editor_waterObjectHelper = {}

--- Editor hook called when an inspector field changes. For each selected id, if the field is rippleTex, foamTex, depthGradientTex or cubemap and the object is a WaterObject, calls object:reloadTextures().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/waterObjectHelper.lua:7
---@param selectedIds table<integer, integer> ids of the selected objects
---@param fieldName string name of the modified field
---@param fieldValue any new value (unused)
---@param arrayIndex integer|nil array index for an array field (unused)
function editor_waterObjectHelper.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex) end

