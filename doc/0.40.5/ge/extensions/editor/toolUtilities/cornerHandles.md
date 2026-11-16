# `editor_toolUtilities_cornerHandles`

*File: `lua/ge/extensions/editor/toolUtilities/cornerHandles.lua` · VM: Game Engine (GE) · 247 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_cornerHandles`: `extensions.load("editor_toolUtilities_cornerHandles")`, then the global `editor_toolUtilities_cornerHandles`

Viewport handles for the turns of the 'engineered' geometry of the editor's road tools: a radius button (on the outside of the turn, anchored at the apex) and a move handle on the curve when the PI node is far from its turn. Handles hover, click, drag and the recording of an undoable history action via the context provided by the tool.

## Notes

- The group g must have g.nodes (>= 3 points {x,y,z}), g.corners, and optionally g.discMap, g.divPoints, g.cornerR, g.engRadiusM.
- Default radius 40 m, cap 300 m; SHIFT divides the sensitivity by 10.
- The move handle only appears if the PI is more than 25 m from the apex.
- Nodes take priority: if the cursor is on a node, the handles do not take the mouse.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_cornerHandles.apex(g, i)` | Apex of inner turn i on the actual road: the sample at the middle of the arc anchored at discMap[i]. Stays close to the road even if the PI is very far (~180 degree hairpin). Falls back to the node before construction. | 46 |
| `editor_toolUtilities_cornerHandles.draggingGroupIdx()` | Index of the group that owns the current drag (to know which road to hide), or nil. | 237 |
| `editor_toolUtilities_cornerHandles.isDragging()` | true while a turn handle drag is in progress (the tool uses it to hide the road and defer the rebuild). | 234 |
| `editor_toolUtilities_cornerHandles.moveHandle(g, i, ap)` | Move handle on the curve for turn i (like Civil3D's midpoint handle): exists only when the PI is more than 25 m from its turn; otherwise the node is on the road and is moved directly. | 83 |
| `editor_toolUtilities_cornerHandles.update(g, ctx)` | Draws the inner turn handles (radius button + move handle) and handles their click/drag. Returns (consumed, hovering): consumed = it owns the mouse this frame; hovering = mere hover (the caller must disable node addition but continue its event pass). | 100 |

### Parameter details

#### `editor_toolUtilities_cornerHandles.apex(g, i)`

Apex of inner turn i on the actual road: the sample at the middle of the arc anchored at discMap[i]. Stays close to the road even if the PI is very far (~180 degree hairpin). Falls back to the node before construction.

- `g` (*table*) : Group (discMap, divPoints, nodes).
- `i` (*integer*) : Index of the inner node.
- **returns**: table Point {x,y,z} of the apex (or node i).

#### `editor_toolUtilities_cornerHandles.draggingGroupIdx()`

Index of the group that owns the current drag (to know which road to hide), or nil.

- **returns**: integer|nil 

#### `editor_toolUtilities_cornerHandles.isDragging()`

true while a turn handle drag is in progress (the tool uses it to hide the road and defer the rebuild).

- **returns**: boolean 

#### `editor_toolUtilities_cornerHandles.moveHandle(g, i, ap)`

Move handle on the curve for turn i (like Civil3D's midpoint handle): exists only when the PI is more than 25 m from its turn; otherwise the node is on the road and is moved directly.

- `g` (*table*) : Group.
- `i` (*integer*) : Index of the inner node.
- `ap` (*table|nil*) : Already computed apex (avoids a search).
- **returns**: vec3|nil Handle position (apex, z+0.15) or nil.

#### `editor_toolUtilities_cornerHandles.update(g, ctx)`

Draws the inner turn handles (radius button + move handle) and handles their click/drag. Returns (consumed, hovering): consumed = it owns the mouse this frame; hovering = mere hover (the caller must disable node addition but continue its event pass).

- `g` (*table*) : Group/road (nodes, corners, discMap, divPoints...).
- `ctx` (*table*) : { selGroupIdx, selNodeIdx, setSelNode(i), minRadius(g)->number, deepCopy(g)->snapshot, undo, redo, ensureOverride(g,i)->ov }
- **returns**: boolean consumed
- **returns**: boolean|nil hovering (absent when nothing is hovered).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/cornerHandles.lua`.*
