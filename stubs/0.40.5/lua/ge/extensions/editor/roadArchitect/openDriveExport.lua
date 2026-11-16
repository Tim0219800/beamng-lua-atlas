---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/openDriveExport.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Export of the Road Architect network in OpenDRIVE 1.8 format (.xodr). Each road (excluding overlays) is converted to OpenDRIVE geometry: reference line approximated by 2D parametric cubics (paramPoly3, Chordal Catmull-Rom tangents), elevation profile in explicit cubics, lane widths and heights per section. The file is written via the editor file selector (editor_fileDialog.saveFile). If no Road Architect road exists, the export falls back to tech_openDriveExporter to export the road network of the loaded map.
--- Access: extension `editor_roadArchitect_openDriveExport`: `extensions.load("editor_roadArchitect_openDriveExport")`, then the global `editor_roadArchitect_openDriveExport`
---@class editor_roadArchitect_openDriveExport
editor_roadArchitect_openDriveExport = {}

--- Exports the current Road Architect network to .xodr. Filters out empty roads, converts non-overlay roads to OpenDRIVE geometry, then opens a save dialog (.xodr extension, overwrite confirmation) and writes the file. With no roads, exports the map's road network instead via tech_openDriveExporter.
---Source: lua/ge/extensions/editor/roadArchitect/openDriveExport.lua:336
function editor_roadArchitect_openDriveExport.export() end

