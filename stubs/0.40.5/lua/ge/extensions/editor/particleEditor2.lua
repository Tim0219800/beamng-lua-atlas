---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/particleEditor2.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Second, experimental version of the particle editor: a tool window "Particle Editor 2" (Window > Experimental menu) with, on the left, a 3D preview rendered in a dedicated RenderView (orbital camera, grid drawn with debugDrawer) and, on the right, the controls. It uses two genericInspector (ParticleEmitterData and ParticleData) to edit the fields, and handles creation, saving (original file, level, "as...") and deletion of emitters and particles (4 particles max per emitter).
--- Access: extension `editor_particleEditor2`: `extensions.load("editor_particleEditor2")`, then the global `editor_particleEditor2`
---@class editor_particleEditor2
editor_particleEditor2 = {}

--- Called every frame by the editor. Opens the "Particle Editor 2" window (with menu bar) and draws the preview then the controls.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/particleEditor2.lua:463
function editor_particleEditor2.onEditorGui() end

--- Registers the window (900x600), the Experimental menu entry and creates the two generic inspectors (ParticleEmitterData / ParticleData).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/particleEditor2.lua:517
function editor_particleEditor2.onEditorInitialized() end

--- If the hidden window is particleEditor2, disables the preview and destroys the preview node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/particleEditor2.lua:507
---@param windowName string Name of the hidden tool window.
function editor_particleEditor2.onEditorToolWindowHide(windowName) end

--- If the displayed window is particleEditor2, enables the preview, rereads the datablocks list, creates the preview node and selects the first emitter if none is chosen.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/particleEditor2.lua:497
---@param windowName string Name of the displayed tool window.
function editor_particleEditor2.onEditorToolWindowShow(windowName) end

--- Destroys the preview when the extension unloads.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/particleEditor2.lua:528
function editor_particleEditor2.onExtensionUnloaded() end

--- Called before rendering; draws the preview grid (debugDrawer lines limited to the preview's view mask) when the preview is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/particleEditor2.lua:488
function editor_particleEditor2.onPreRender() end

--- Called every frame; if the editor is active and the preview open, updates the RenderView (size, fov 60, camera matrix).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/particleEditor2.lua:492
function editor_particleEditor2.onUpdate() end

