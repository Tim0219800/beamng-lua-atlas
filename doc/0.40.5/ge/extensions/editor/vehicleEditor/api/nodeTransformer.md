# `editor_vehicleEditor_api_nodeTransformer`

*File: `lua/ge/extensions/editor/vehicleEditor/api/nodeTransformer.lua` · VM: Game Engine (GE) · 79 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_vehicleEditor_api_nodeTransformer`: `extensions.load("editor_vehicleEditor_api_nodeTransformer")`, then the global `editor_vehicleEditor_api_nodeTransformer`

Vehicle Editor helper to move the selected nodes (vEditor.selectedNodes) with the editor's axis gizmo. The gizmo is centered on the average of the node positions; during the drag, each node receives its original position plus the delta (in local coordinates, sign inverted).

## Notes

- transformNodes() must be called every frame as long as nodes are selected; it divides by #vEditor.selectedNodes without checking that it is non-zero (division by 0 -> inf/NaN if the selection is empty).
- Disables the plane, the hatching and the translation grid of the gizmo (worldEditorCppApi.setAxisGizmoRender*) when not dragging.
- The gizmo is in local alignment (editor.AxisGizmoAlignment_Local), identity orientation.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_vehicleEditor_api_nodeTransformer.transformNodes()` | Places and draws the gizmo at the center of the selected nodes, handles start/end/drag and applies the offset to the nodes (node.pos). | 48 |

### Parameter details

#### `editor_vehicleEditor_api_nodeTransformer.transformNodes()`

Places and draws the gizmo at the center of the selected nodes, handles start/end/drag and applies the offset to the nodes (node.pos).

- **returns**: boolean true if a gizmo drag is in progress during this call.

## Calls into the engine (C++)

- `worldEditorCppApi.` `setAxisGizmoRenderMoveGrid`, `setAxisGizmoRenderPlane`, `setAxisGizmoRenderPlaneHashes`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/vehicleEditor/api/nodeTransformer.lua`.*
