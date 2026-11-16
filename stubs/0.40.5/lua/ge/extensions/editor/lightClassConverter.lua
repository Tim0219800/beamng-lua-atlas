---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/lightClassConverter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Adds a "Convert To Spot Light / Point Light" button at the top of the inspector when the selection contains only PointLight or only SpotLight objects. The conversion replaces the object in place, keeping the SimObject id, the name, the parent group, the transform and the common fields; it is a single reversible undo step (restored from the original serialization).
--- Access: extension `editor_lightClassConverter`: `extensions.load("editor_lightClassConverter")`, then the global `editor_lightClassConverter`
---@class editor_lightClassConverter
---@field dependencies table<integer, string> {"editor_inspector"}: loaded after the inspector to have the header hook and the APIs available.
editor_lightClassConverter = {}

--- Draws the conversion button at the top of the inspector window (hook emitted by editor_inspector). Uses the instance's locked selection if it exists, otherwise editor.selection.object.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/lightClassConverter.lua:195
---@param inspectorInfo table|nil Inspector instance; its selection.object field is used if it exists.
function editor_lightClassConverter.onEditorInspectorHeaderGui(inspectorInfo) end

