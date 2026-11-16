---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/debug/comment.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class (editor only).
---@class flowgraph_nodes_debug_comment_C
local flowgraph_nodes_debug_comment_C = {}

--- Restores the fields from the loaded data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/comment.lua:167
---@param nodeData table saved data
function flowgraph_nodes_debug_comment_C:_onDeserialized(nodeData) end

--- Adds the comment-specific fields to the result.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/comment.lua:155
---@param res table node serialization table
function flowgraph_nodes_debug_comment_C:_onSerialize(res) end

--- Draws the frame, the title, the resizable group and the group hint in the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/comment.lua:208
function flowgraph_nodes_debug_comment_C:draw() end

--- Draws the properties panel (title, alpha, colors, simple, move mode, text) and returns the change reason for the undo history.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/comment.lua:70
---@return string|nil  change description
function flowgraph_nodes_debug_comment_C:drawCustomProperties() end

--- Called when the properties panel closes; no effect (commented-out code).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/comment.lua:65
function flowgraph_nodes_debug_comment_C:hideProperties() end

--- Initializes size 200x200, title "Comment", colors (background gray 0.5, border 0.8, text white), alpha 0.75, moveMode 'withoutNodes', simple false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/comment.lua:23
function flowgraph_nodes_debug_comment_C:init() end

--- Recomputes the background, border and text ImVec4 from the float arrays.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/comment.lua:149
function flowgraph_nodes_debug_comment_C:refreshColors() end

--- Called when the properties panel opens; no effect (commented-out code).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/comment.lua:60
function flowgraph_nodes_debug_comment_C:showProperties() end

--- Repositions the node in the editor when the manager opens (if the position is within valid bounds) and forces the size.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/debug/comment.lua:198
function flowgraph_nodes_debug_comment_C:updateEditorPosition() end

