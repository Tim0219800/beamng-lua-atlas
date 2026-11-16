---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadNetworkExporter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Road Network Import/Exporter" editor window (Window > Tech menu), visible only with a tech license (ResearchVerifier.isTechLicenseVerified()). It allows importing and exporting the Road Architect road network in OpenDRIVE (.xodr), OpenStreetMap (.osm) and SUMO (.nod.xml / .edg.xml) formats, with import options (placement, vertical offset, terraforming, domain of influence and margin) taken from Road Architect.
--- Access: extension `editor_roadNetworkExporter`: `extensions.load("editor_roadNetworkExporter")`, then the global `editor_roadNetworkExporter`
---@class editor_roadNetworkExporter
editor_roadNetworkExporter = {}

--- Hook called when the editor is activated. Stores the current TerrainBlock (extensions.editor_terrainEditor.getTerrainBlock()). No effect without a tech license.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/roadNetworkExporter.lua:43
function editor_roadNetworkExporter.onEditorActivated() end

--- Hook called every editor UI frame. Draws the window: import options, Import/Export table for OpenDRIVE, OpenStreetMap and SUMO, then the import result (imported/skipped roads, warnings).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/roadNetworkExporter.lua:241
function editor_roadNetworkExporter.onEditorGui() end

--- Editor hook, called on initialization. Checks the tech license and, if valid, registers the window (600x600) and the "Road Network Import/Exporter" menu entry in the Tech group.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/roadNetworkExporter.lua:36
function editor_roadNetworkExporter.onEditorInitialized() end

