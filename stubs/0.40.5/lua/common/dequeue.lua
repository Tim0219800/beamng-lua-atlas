---@meta
-- tim19Atlas stub generated from lua/common/dequeue.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Double-ended queue (deque): items can be added and removed at the front as well as the back. Library by Pierre Chapuis (MIT license in the header). Useful for histories or sliding buffers. The object is a table indexed by integers between head+1 and tail.
--- Access: `require("dequeue")`
---@class dequeue
local dequeue = {}

--- Creates an empty deque, or turns the provided table into a deque.
---Source: lua/common/dequeue.lua:157
---@param data table|nil Existing table to reuse (may contain head/tail).
---@return table  Deque object.
function dequeue.new(data) end

--- Object returned by new. Fields: head, tail, _serialize.
---@class dequeue_deque
local dequeue_deque = {}

--- Copies the content into an ordered array from 1 to length().
---Source: lua/common/dequeue.lua:dyn
---@return table  Array of elements.
function dequeue_deque:contents() end

--- Tells whether the queue is empty.
---Source: lua/common/dequeue.lua:dyn
---@return boolean  true if empty.
function dequeue_deque:is_empty() end

--- Iterator from the front to the end.
---Source: lua/common/dequeue.lua:dyn
---@return function  Iterator (for x in q:iter_left()).
function dequeue_deque:iter_left() end

--- Iterator from the end to the front.
---Source: lua/common/dequeue.lua:dyn
---@return function  Iterator (for x in q:iter_right()).
function dequeue_deque:iter_right() end

--- Number of elements.
---Source: lua/common/dequeue.lua:dyn
---@return integer  tail - head.
function dequeue_deque:length() end

--- Returns the first element without removing it.
---Source: lua/common/dequeue.lua:dyn
---@return any  First element or nil.
function dequeue_deque:peek_left() end

--- Returns the last element without removing it.
---Source: lua/common/dequeue.lua:dyn
---@return any  Last element or nil.
function dequeue_deque:peek_right() end

--- Removes and returns the first element.
---Source: lua/common/dequeue.lua:dyn
---@return any  Element or nil if empty.
function dequeue_deque:pop_left() end

--- Removes and returns the last element.
---Source: lua/common/dequeue.lua:dyn
---@return any  Element or nil if empty.
function dequeue_deque:pop_right() end

--- Adds x at the front.
---Source: lua/common/dequeue.lua:dyn
---@param x any Element (non-nil).
function dequeue_deque:push_left(x) end

--- Adds x at the end.
---Source: lua/common/dequeue.lua:dyn
---@param x any Element (non-nil).
function dequeue_deque:push_right(x) end

--- Removes the first occurrence of x, searching from the front.
---Source: lua/common/dequeue.lua:dyn
---@param x any Value to remove.
---@return boolean  true if an element was removed.
function dequeue_deque:remove_left(x) end

--- Removes the first occurrence of x, searching from the end.
---Source: lua/common/dequeue.lua:dyn
---@param x any Value to remove.
---@return boolean  true if an element was removed.
function dequeue_deque:remove_right(x) end

--- Resets head and tail to 0 (the old elements are not erased from the table).
---Source: lua/common/dequeue.lua:dyn
function dequeue_deque:reset() end

--- Moves n elements from the front to the end.
---Source: lua/common/dequeue.lua:dyn
---@param n integer|nil Number of rotations (default 1).
function dequeue_deque:rotate_left(n) end

--- Moves n elements from the end to the front.
---Source: lua/common/dequeue.lua:dyn
---@param n integer|nil Number of rotations (default 1).
function dequeue_deque:rotate_right(n) end

return dequeue
