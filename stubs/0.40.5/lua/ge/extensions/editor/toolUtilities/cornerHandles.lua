---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/cornerHandles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Viewport handles for the turns of the 'engineered' geometry of the editor's road tools: a radius button (on the outside of the turn, anchored at the apex) and a move handle on the curve when the PI node is far from its turn. Handles hover, click, drag and the recording of an undoable history action via the context provided by the tool.
--- Access: extension `editor_toolUtilities_cornerHandles`: `extensions.load("editor_toolUtilities_cornerHandles")`, then the global `editor_toolUtilities_cornerHandles`
---@class editor_toolUtilities_cornerHandles
editor_toolUtilities_cornerHandles = {}

--- Apex of inner turn i on the actual road: the sample at the middle of the arc anchored at discMap[i]. Stays close to the road even if the PI is very far (~180 degree hairpin). Falls back to the node before construction.
---Source: lua/ge/extensions/editor/toolUtilities/cornerHandles.lua:46
---@param g table Group (discMap, divPoints, nodes).
---@param i integer Index of the inner node.
---@return table  Point {x,y,z} of the apex (or node i).
function editor_toolUtilities_cornerHandles.apex(g, i) end

--- Index of the group that owns the current drag (to know which road to hide), or nil.
---Source: lua/ge/extensions/editor/toolUtilities/cornerHandles.lua:237
---@return integer|nil
function editor_toolUtilities_cornerHandles.draggingGroupIdx() end

--- true while a turn handle drag is in progress (the tool uses it to hide the road and defer the rebuild).
---Source: lua/ge/extensions/editor/toolUtilities/cornerHandles.lua:234
---@return boolean
function editor_toolUtilities_cornerHandles.isDragging() end

--- Move handle on the curve for turn i (like Civil3D's midpoint handle): exists only when the PI is more than 25 m from its turn; otherwise the node is on the road and is moved directly.
---Source: lua/ge/extensions/editor/toolUtilities/cornerHandles.lua:83
---@param g table Group.
---@param i integer Index of the inner node.
---@param ap table|nil Already computed apex (avoids a search).
---@return vec3|nil  Handle position (apex, z+0.15) or nil.
function editor_toolUtilities_cornerHandles.moveHandle(g, i, ap) end

--- Draws the inner turn handles (radius button + move handle) and handles their click/drag. Returns (consumed, hovering): consumed = it owns the mouse this frame; hovering = mere hover (the caller must disable node addition but continue its event pass).
---Source: lua/ge/extensions/editor/toolUtilities/cornerHandles.lua:100
---@param g table Group/road (nodes, corners, discMap, divPoints...).
---@param ctx table { selGroupIdx, selNodeIdx, setSelNode(i), minRadius(g)->number, deepCopy(g)->snapshot, undo, redo, ensureOverride(g,i)->ov }
---@return boolean  consumed
---@return boolean|nil  hovering (absent when nothing is hovered).
function editor_toolUtilities_cornerHandles.update(g, ctx) end

