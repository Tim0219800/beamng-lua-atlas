---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/measuresInspectorHeader.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small editor extension that adds a "Size: X x Y x Z" line to the object inspector header. It shows the size (bounding box, scale included) of the selected object, or of the selection's bounding box if there are several. It only acts once the editor is initialized.
--- Access: extension `editor_measuresInspectorHeader`: `extensions.load("editor_measuresInspectorHeader")`, then the global `editor_measuresInspectorHeader`
---@class editor_measuresInspectorHeader
editor_measuresInspectorHeader = {}

--- Hook called when the editor is initialized; enables the size display.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/measuresInspectorHeader.lua:52
function editor_measuresInspectorHeader.onEditorInitialized() end

--- Hook called by the editor inspector to draw its header. Draws the "Size" text and its tooltip. Uses inspectorInfo.selection if present, otherwise editor.selection. Does nothing until the editor is initialized.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/measuresInspectorHeader.lua:10
---@param inspectorInfo table Inspector information; the optional selection field replaces editor.selection.
function editor_measuresInspectorHeader.onEditorInspectorHeaderGui(inspectorInfo) end

--- Extension load hook; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/measuresInspectorHeader.lua:49
function editor_measuresInspectorHeader.onExtensionLoaded() end

