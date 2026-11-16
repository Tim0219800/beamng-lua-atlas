# `editor_terraform_fetchSources`

*File: `lua/ge/extensions/editor/terraform/fetchSources.lua` · VM: Game Engine (GE) · 310 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_terraform_fetchSources`: `extensions.load("editor_terraform_fetchSources")`, then the global `editor_terraform_fetchSources`

Fetches the 'sources' that the Terraform tool can follow: MeshRoad roads of the scene, RAT (Road Architect) roads, mesh splines, assembly splines and Master Splines. Each source is a list of points {pos = vec3, width = width, binormal = lateral unit vec3}. When a road enters and leaves the polygon, it is cut and only the inner parts are returned as separate sources. Splines are smoothed with Catmull-Rom (centripetal for mesh/assembly splines) with 10 points per segment. Consumed by editor_terraformTool and editor/terraform/terraform.

## Notes

- Mesh and assembly splines get a fixed width of 3.0 m (defaultWidthForMeshSplines); MeshRoads use their real widths.
- getAllSourcesInSelection only handles objects of class MeshRoad in editor.selection.object; RAT roads and splines are not handled in selection.
- Only the parts that have at least 2 points in the polygon are kept (eIdx > sIdx).
- MeshRoads are first filtered by XY (world) bounding box against that of the polygon.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_terraform_fetchSources.getAllSourcesInPolygon(polygon)` | Returns all supported sources in the polygon (MeshRoad, RAT roads, mesh splines, assembly splines, Master Splines). A road that crosses the edge is cut; only its inner parts are kept, as separate sources. | 245 |
| `editor_terraform_fetchSources.getAllSourcesInSelection()` | Returns the sources built from the MeshRoad objects currently selected in the editor (editor.selection.object). | 287 |

### Parameter details

#### `editor_terraform_fetchSources.getAllSourcesInPolygon(polygon)`

Returns all supported sources in the polygon (MeshRoad, RAT roads, mesh splines, assembly splines, Master Splines). A road that crosses the edge is cut; only its inner parts are kept, as separate sources.

- `polygon` (*table*) : List of 2D/3D polygon points (inferred from code: passed to geom.getAABB and geom.getNodeSpansInsidePolygon).
- **returns**: table List of sources; each source is a list of {pos, width, binormal}.

#### `editor_terraform_fetchSources.getAllSourcesInSelection()`

Returns the sources built from the MeshRoad objects currently selected in the editor (editor.selection.object).

- **returns**: table List of sources (one per selected MeshRoad).

## Calls into the engine (C++)

- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/terraform/fetchSources.lua`.*
