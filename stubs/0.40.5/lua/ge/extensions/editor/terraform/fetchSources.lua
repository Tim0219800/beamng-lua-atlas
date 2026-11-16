---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/terraform/fetchSources.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fetches the 'sources' that the Terraform tool can follow: MeshRoad roads of the scene, RAT (Road Architect) roads, mesh splines, assembly splines and Master Splines. Each source is a list of points {pos = vec3, width = width, binormal = lateral unit vec3}. When a road enters and leaves the polygon, it is cut and only the inner parts are returned as separate sources. Splines are smoothed with Catmull-Rom (centripetal for mesh/assembly splines) with 10 points per segment. Consumed by editor_terraformTool and editor/terraform/terraform.
--- Access: extension `editor_terraform_fetchSources`: `extensions.load("editor_terraform_fetchSources")`, then the global `editor_terraform_fetchSources`
---@class editor_terraform_fetchSources
editor_terraform_fetchSources = {}

--- Returns all supported sources in the polygon (MeshRoad, RAT roads, mesh splines, assembly splines, Master Splines). A road that crosses the edge is cut; only its inner parts are kept, as separate sources.
---Source: lua/ge/extensions/editor/terraform/fetchSources.lua:245
---@param polygon table List of 2D/3D polygon points (inferred from code: passed to geom.getAABB and geom.getNodeSpansInsidePolygon).
---@return table  List of sources; each source is a list of {pos, width, binormal}.
function editor_terraform_fetchSources.getAllSourcesInPolygon(polygon) end

--- Returns the sources built from the MeshRoad objects currently selected in the editor (editor.selection.object).
---Source: lua/ge/extensions/editor/terraform/fetchSources.lua:287
---@return table  List of sources (one per selected MeshRoad).
function editor_terraform_fetchSources.getAllSourcesInSelection() end

