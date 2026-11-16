---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/audioRibbonEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Audio Ribbon Editor" edit mode of the level editor: creates and edits sound "ribbons" (rivers, etc.) stored in the runtime module core/audioRibbon. A ribbon is a polyline of nodes with depth and speed; it carries either a single emitter ("Single Emitter Only") or four emitters (front, back, left, right) on the top surface, the bottom surface or the whole volume. The default events are 'event:>Ambient>Water>River'. The tool handles adding ribbons, moving nodes with the gizmo, snapping to the underlying surface (terrain, river, water plane), undo/redo through editor.history and a pan camera.
--- Access: extension `editor_audioRibbonEditor`: `extensions.load("editor_audioRibbonEditor")`, then the global `editor_audioRibbonEditor`
---@class editor_audioRibbonEditor
editor_audioRibbonEditor = {}

--- Called every editor frame: if the mode is active, draws the tool window, displays the ribbons, handles editing (selection, node dragging, gizmo) and drives the pan camera.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/audioRibbonEditor.lua:900
function editor_audioRibbonEditor.onEditorGui() end

--- Registers the audioRibbonEditMode edit mode (simobject_sfxspace icon) and the "audioRibbonEditor" window (500x500).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/audioRibbonEditor.lua:948
function editor_audioRibbonEditor.onEditorInitialized() end

--- Initialization: if core/audioRibbon does not yet have a ribbon list, creates it empty and clears the ribbon names and the near/far lists.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/audioRibbonEditor.lua:325
function editor_audioRibbonEditor.onInit() end

