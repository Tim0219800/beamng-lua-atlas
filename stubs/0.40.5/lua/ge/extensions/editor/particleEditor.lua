---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/particleEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Particle editor ("Particle Editor" edit mode) of the world editor. It adds a header to the inspector with an Emitter tab (choose, create, save, delete a ParticleEmitterData) and a tab for the attached ParticleData. It also registers two custom field editors: "particles" (up to 4 ParticleData, separated by tabs) for ParticleEmitterData and "textureName" (file picker) for ParticleData. The datablocks are saved in art/shapes/particles/managedParticleEmitterData.json and managedParticleData.json, either in their original file or in the current level's folder.
--- Access: extension `editor_particleEditor`: `extensions.load("editor_particleEditor")`, then the global `editor_particleEditor`
---@class editor_particleEditor
editor_particleEditor = {}

--- Called once the editor is initialized. Declares the edit mode editor.editModes.particleEditMode (name "Particle Editor") and registers the custom field editors for ParticleEmitterData.particles and ParticleData.textureName.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/particleEditor.lua:544
function editor_particleEditor.onEditorInitialized() end

--- Called when an inspector field is modified. If the modified object (selectedIds[1]) is the current emitter or particle, the datablock is marked dirty, reloaded (reload) and the datablocks list is rebuilt.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/particleEditor.lua:457
---@param selectedIds table<integer, integer> Ids of the selected objects; only the first is used.
---@param fieldName string Name of the modified field (unused).
---@param fieldValue any New value (unused).
---@param arrayIndex integer Index in an array field (unused).
function editor_particleEditor.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex) end

--- Called every frame at the start of the Inspector window. Draws the Emitter / Particle tabs, the new, save, save in level, delete buttons, and the confirmation box for a selection change with unsaved modifications. Does nothing outside Particle Editor mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/particleEditor.lua:291
function editor_particleEditor.onEditorInspectorHeaderGui() end

--- Called when the extension loads; only writes "initialized" to the log (level D).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/particleEditor.lua:561
function editor_particleEditor.onExtensionLoaded() end

--- Called on unload; deletes the preview emitter node (editableEmitterNode) if it exists.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/particleEditor.lua:565
function editor_particleEditor.onExtensionUnloaded() end

