---@meta
-- tim19Atlas stub generated from lua/common/libs/binaryheap/binaryheap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- binaryheap: third-party library (Lua binary heap, used notably by copas for its timers) implementing a binary heap (priority queue). Two families: "plain heap" (minHeap/maxHeap, managed by position, values in heap.values) and "unique heap" (minUnique/maxUnique, each element has a unique `payload` found in O(1) via heap.reverse). The module returns the table M.
--- Access: `require("libs/binaryheap/binaryheap")`
---@class libs_binaryheap_binaryheap
local libs_binaryheap_binaryheap = {}

--- Core of all the queues: builds a heap from swap, erase and comparison functions. Returns a table with the methods bubbleUp(pos) and sinkDown(pos) and the lists values and payloads.
---Source: lua/common/libs/binaryheap/binaryheap.lua:58
---@param swap function swap(heap, idx1, idx2) swaps two elements
---@param erase function erase(heap, position) raw removal
---@param lt function lt(a, b) true when a must be above b
---@return table  Base heap
function libs_binaryheap_binaryheap.binaryHeap(swap, erase, lt) end

--- Creates a plain heap with the largest value at the top.
---Source: lua/common/libs/binaryheap/binaryheap.lua:227
---@param gt function|nil "Greater than" comparison (default a > b)
---@return table  The heap
function libs_binaryheap_binaryheap.maxHeap(gt) end

--- Creates a heap with unique payloads, largest value at the top.
---Source: lua/common/libs/binaryheap/binaryheap.lua:396
---@param gt function|nil Comparison (default a > b)
---@return table  The heap
function libs_binaryheap_binaryheap.maxUnique(gt) end

--- Creates a plain heap with the smallest value at the top.
---Source: lua/common/libs/binaryheap/binaryheap.lua:217
---@param lt function|nil "Less than" comparison (default a < b)
---@return table  The heap
function libs_binaryheap_binaryheap.minHeap(lt) end

--- Creates a heap with unique payloads, smallest value at the top.
---Source: lua/common/libs/binaryheap/binaryheap.lua:382
---@param lt function|nil Comparison (default a < b)
---@return table  The heap
function libs_binaryheap_binaryheap.minUnique(lt) end

--- Methods of the heaps created by minHeap/maxHeap (by position) and minUnique/maxUnique (by payload). For a unique heap, the parameters named payload replace positions.
---@class libs_binaryheap_binaryheap_h
local libs_binaryheap_binaryheap_h = {}

--- Inserts an element. On a unique heap, raises an error if the payload already exists.
---Source: lua/common/libs/binaryheap/binaryheap.lua:267
---@param value any Sort value
---@param payload any Associated payload (unique heap)
function libs_binaryheap_binaryheap_h:insert(value, payload) end

--- Returns the top without removing it.
---Source: lua/common/libs/binaryheap/binaryheap.lua:307
---@return any  Payload (unique heap), then value; nil if empty
function libs_binaryheap_binaryheap_h:peek() end

--- Returns the top value without removing it (unique heap).
---Source: lua/common/libs/binaryheap/binaryheap.lua:321
---@return any  Top value or nil
function libs_binaryheap_binaryheap_h:peekValue() end

--- Removes and returns the top of the heap.
---Source: lua/common/libs/binaryheap/binaryheap.lua:295
---@return any  Payload (unique heap), then value; nil if empty
function libs_binaryheap_binaryheap_h:pop() end

--- Removes an element from the heap.
---Source: lua/common/libs/binaryheap/binaryheap.lua:280
---@param payload any Payload (unique heap) or position (plain heap)
---@return any  Removed value, then payload (unique); nil if not found
function libs_binaryheap_binaryheap_h:remove(payload) end

--- Number of elements in the heap.
---Source: lua/common/libs/binaryheap/binaryheap.lua:338
---@return integer  Size
function libs_binaryheap_binaryheap_h:size() end

--- Changes an element's value and puts it back in place in the heap.
---Source: lua/common/libs/binaryheap/binaryheap.lua:257
---@param payload any Payload (unique heap) or position (plain heap)
---@param newValue any New value
function libs_binaryheap_binaryheap_h:update(payload, newValue) end

--- Returns the value associated with a payload (unique heap).
---Source: lua/common/libs/binaryheap/binaryheap.lua:330
---@param payload any Payload sought
---@return any  Value or nil
function libs_binaryheap_binaryheap_h:valueByPayload(payload) end

--- Low-level methods of the base heap (inferred from code: swap and erase passed to binaryHeap).
---@class libs_binaryheap_binaryheap_heap
local libs_binaryheap_binaryheap_heap = {}

--- Brutally erases the element at position pos.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/binaryheap/binaryheap.lua:195
---@param pos integer Position
function libs_binaryheap_binaryheap_heap:erase(pos) end

--- Swaps the elements at positions a and b.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/binaryheap/binaryheap.lua:191
---@param a integer Position
---@param b integer Position
function libs_binaryheap_binaryheap_heap:swap(a, b) end

return libs_binaryheap_binaryheap
