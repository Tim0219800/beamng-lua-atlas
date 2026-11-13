# `editor_toolUtilities_cornerHandles`

*Fichier : `lua/ge/extensions/editor/toolUtilities/cornerHandles.lua` · VM : Game Engine (GE) · 247 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_cornerHandles` : `extensions.load("editor_toolUtilities_cornerHandles")`, puis la globale `editor_toolUtilities_cornerHandles`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_cornerHandles.apex(g, i)` | Bend apex on the actual road for interior corner i: the arc-midpoint sample the engineered builder anchors at discMap[i].<br> This stays by the road even when the PI (node) is flung far off it (a near-180 hairpin). Falls back to the node pre-build. | 46 |
| `editor_toolUtilities_cornerHandles.draggingGroupIdx()` | Group index owning the live drag (for the tool to know which road to hide), or nil. | 237 |
| `editor_toolUtilities_cornerHandles.isDragging()` | True while a corner handle drag is live (the tool uses this to engage its drag-hide / deferred-rebuild path). | 234 |
| `editor_toolUtilities_cornerHandles.moveHandle(g, i, ap)` | On-curve move grip for corner i (like Civil3D's midpoint grip): only when the PI runs far off its bend does a normal on-road<br> handle appear ON the apex so the corner is editable by the road instead of chasing a node tens of metres away. nil otherwise --<br> then the node is on the road and dragged directly. ap may be passed in when the caller already has the apex, to skip the lookup. | 83 |
| `editor_toolUtilities_cornerHandles.update(g, ctx)` | Draws the interior-corner handles (radius knob + on-curve move grip) and runs their click/drag. Returns (consumed, hovering):<br> consumed = it owns the mouse this frame (a click/drag on a handle), so the caller skips the stock node edit; hovering = a mere<br> hover over a handle (caller should mute add-node but keep running its event pass so the gizmo stays alive).<br> ctx = { selGroupIdx, selNodeIdx, setSelNode(i), minRadius(g)->number, deepCopy(g)->snap, undo, redo, ensureOverride(g,i)->ov }. | 100 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/cornerHandles.lua`.*
