---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/cornerHandles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_cornerHandles` : `extensions.load("editor_toolUtilities_cornerHandles")`, puis la globale `editor_toolUtilities_cornerHandles`
---@class editor_toolUtilities_cornerHandles
editor_toolUtilities_cornerHandles = {}

--- Bend apex on the actual road for interior corner i: the arc-midpoint sample the engineered builder anchors at discMap[i].
---  This stays by the road even when the PI (node) is flung far off it (a near-180 hairpin). Falls back to the node pre-build.
---Source : lua/ge/extensions/editor/toolUtilities/cornerHandles.lua:46
---@param g any
---@param i any
function editor_toolUtilities_cornerHandles.apex(g, i) end

--- Group index owning the live drag (for the tool to know which road to hide), or nil.
---Source : lua/ge/extensions/editor/toolUtilities/cornerHandles.lua:237
function editor_toolUtilities_cornerHandles.draggingGroupIdx() end

--- True while a corner handle drag is live (the tool uses this to engage its drag-hide / deferred-rebuild path).
---Source : lua/ge/extensions/editor/toolUtilities/cornerHandles.lua:234
function editor_toolUtilities_cornerHandles.isDragging() end

--- On-curve move grip for corner i (like Civil3D's midpoint grip): only when the PI runs far off its bend does a normal on-road
---  handle appear ON the apex so the corner is editable by the road instead of chasing a node tens of metres away. nil otherwise --
---  then the node is on the road and dragged directly. ap may be passed in when the caller already has the apex, to skip the lookup.
---Source : lua/ge/extensions/editor/toolUtilities/cornerHandles.lua:83
---@param g any
---@param i any
---@param ap any
function editor_toolUtilities_cornerHandles.moveHandle(g, i, ap) end

--- Draws the interior-corner handles (radius knob + on-curve move grip) and runs their click/drag. Returns (consumed, hovering):
---  consumed = it owns the mouse this frame (a click/drag on a handle), so the caller skips the stock node edit; hovering = a mere
---  hover over a handle (caller should mute add-node but keep running its event pass so the gizmo stays alive).
---  ctx = { selGroupIdx, selNodeIdx, setSelNode(i), minRadius(g)->number, deepCopy(g)->snap, undo, redo, ensureOverride(g,i)->ov }.
---Source : lua/ge/extensions/editor/toolUtilities/cornerHandles.lua:100
---@param g any
---@param ctx any
function editor_toolUtilities_cornerHandles.update(g, ctx) end

