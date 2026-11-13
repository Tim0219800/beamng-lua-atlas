---@meta
-- tim19Atlas stub generated from lua/common/libs/binaryheap/binaryheap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Binary heap implementation
---  A binary heap (or binary tree) is a [sorting algorithm](http://en.wikipedia.org/wiki/Binary_heap).
---  The 'plain binary heap' is managed by positions. Which are hard to get once
---  an element is inserted. It can be anywhere in the list because it is re-sorted
---  upon insertion/deletion of items. The array with values is stored in field
---  `values`:
---      `peek = heap.values[1]`
---  A 'unique binary heap' is where the payload is unique and the payload itself
---  also stored (as key) in the heap with the position as value, as in;
---      `heap.reverse[payload] = [pos]`
---  Due to this setup the reverse search, based on payload, is now a
---  much faster operation because instead of traversing the list/heap,
---  you can do;
---      `pos = heap.reverse[payload]`
---  This means that deleting elements from a 'unique binary heap' is
---  faster than from a plain heap.
---  All management functions in the 'unique binary heap' take `payload`
---  instead of `pos` as argument.
---  Note that the value of the payload must be unique!
---  Fields of heap object:
---   * values - array of values
---   * payloads - array of payloads (unique binary heap only)
---   * reverse - map from payloads to indices (unique binary heap only)
--- Accès : `require("libs/binaryheap/binaryheap")`
---@class libs_binaryheap_binaryheap
local libs_binaryheap_binaryheap = {}

--- Creates a new binary heap.
---  This is the core of all heaps, the others
---  are built upon these sorting functions.
---  @param swap (function) `swap(heap, idx1, idx2)` swaps values at
---  `idx1` and `idx2` in the heaps `heap.values` and `heap.payloads` lists (see
---  return value below).
---  @param erase (function) `swap(heap, position)` raw removal
---  @param lt (function) in `lt(a, b)` returns `true` when `a < b` (for a min-heap)
---  @return table with two methods; `heap:bubbleUp(pos)` and `heap:sinkDown(pos)`
---  that implement the sorting algorithm and two fields; `heap.values` and
---  `heap.payloads` being lists, holding the values and payloads respectively.
---Source : lua/common/libs/binaryheap/binaryheap.lua:58
---@param swap any
---@param erase any
---@param lt any
function libs_binaryheap_binaryheap.binaryHeap(swap, erase, lt) end

--- Creates a new max-heap, where the largest value is at the top.
---  @param gt (optional) comparison function _anon(greater-than), see `binaryHeap`.
---  @return the new heap
---Source : lua/common/libs/binaryheap/binaryheap.lua:227
---@param gt any
function libs_binaryheap_binaryheap.maxHeap(gt) end

--- Creates a new max-heap with unique payloads.
---  A max-heap is where the largest value is at the top.
---  *NOTE*: All management functions in the 'unique binary heap'
---  take `payload` instead of `pos` as argument.
---  @param gt (optional) comparison function _anon(greater-than), see `binaryHeap`.
---  @return the new heap
---Source : lua/common/libs/binaryheap/binaryheap.lua:396
---@param gt any
function libs_binaryheap_binaryheap.maxUnique(gt) end

--- Creates a new min-heap, where the smallest value is at the top.
---  @param lt (optional) comparison function _anon(less-than), see `binaryHeap`.
---  @return the new heap
---Source : lua/common/libs/binaryheap/binaryheap.lua:217
---@param lt any
function libs_binaryheap_binaryheap.minHeap(lt) end

--- Creates a new min-heap with unique payloads.
---  A min-heap is where the smallest value is at the top.
---  *NOTE*: All management functions in the 'unique binary heap'
---  take `payload` instead of `pos` as argument.
---  @param lt (optional) comparison function _anon(less-than), see `binaryHeap`.
---  @return the new heap
---Source : lua/common/libs/binaryheap/binaryheap.lua:382
---@param lt any
function libs_binaryheap_binaryheap.minUnique(lt) end

--- Classe locale `h` de lua/common/libs/binaryheap/binaryheap.lua
---@class libs_binaryheap_binaryheap_h
local libs_binaryheap_binaryheap_h = {}

--- Inserts an element in the heap.
---  @function unique:insert
---  @param value the value used for sorting this element
---  @param payload the payload attached to this element
---  @return nothing, or throws an error on bad input
---Source : lua/common/libs/binaryheap/binaryheap.lua:267
---@param value any
---@param payload any
function libs_binaryheap_binaryheap_h:insert(value, payload) end

--- Returns the element at the top of the heap, without removing it.
---  @function unique:peek
---  @return payload, value, or `nil` if there is none
---Source : lua/common/libs/binaryheap/binaryheap.lua:307
function libs_binaryheap_binaryheap_h:peek() end

--- Returns the element at the top of the heap, without removing it.
---  @function unique:peekValue
---  @return value at the top, or `nil` if there is none
---  @usage -- simple timer based heap example
---  while true do
---    sleep(heap:peekValue() - gettime())  -- assume LuaSocket gettime function
---    coroutine.resume((heap:pop()))       -- assumes payload to be a coroutine,
---                                         -- double parens to drop extra return value
---  end
---Source : lua/common/libs/binaryheap/binaryheap.lua:321
function libs_binaryheap_binaryheap_h:peekValue() end

--- Removes the top of the heap and returns it.
---  When used with timers, `pop` will return the payload that is due.
---  Note: this function returns `payload` as the first result to prevent
---  extra locals when retrieving the `payload`.
---  @function unique:pop
---  @return payload, value, or `nil` if there is none
---Source : lua/common/libs/binaryheap/binaryheap.lua:295
function libs_binaryheap_binaryheap_h:pop() end

--- Removes an element from the heap.
---  @function unique:remove
---  @param payload the payload to remove
---  @return value, payload or nil if not found
---Source : lua/common/libs/binaryheap/binaryheap.lua:280
---@param payload any
function libs_binaryheap_binaryheap_h:remove(payload) end

--- Returns the number of elements in the heap.
---  @function heap:size
---  @return number of elements
---Source : lua/common/libs/binaryheap/binaryheap.lua:338
function libs_binaryheap_binaryheap_h:size() end

--- Updates the value of an element in the heap.
---  @function unique:update
---  @param payload the payoad whose value to update
---  @param newValue the new value to use for this payload
---  @return nothing, or throws an error on bad input
---Source : lua/common/libs/binaryheap/binaryheap.lua:257
---@param payload any
---@param newValue any
function libs_binaryheap_binaryheap_h:update(payload, newValue) end

--- Returns the value associated with the payload
---  @function unique:valueByPayload
---  @param payload the payload to lookup
---  @return value or nil if no such payload exists
---Source : lua/common/libs/binaryheap/binaryheap.lua:330
---@param payload any
function libs_binaryheap_binaryheap_h:valueByPayload(payload) end

--- Classe locale `heap` de lua/common/libs/binaryheap/binaryheap.lua
---@class libs_binaryheap_binaryheap_heap
local libs_binaryheap_binaryheap_heap = {}

---Source : lua/common/libs/binaryheap/binaryheap.lua:195
---@param pos any
function libs_binaryheap_binaryheap_heap:erase(pos) end

---Source : lua/common/libs/binaryheap/binaryheap.lua:191
---@param a any
---@param b any
function libs_binaryheap_binaryheap_heap:swap(a, b) end

return libs_binaryheap_binaryheap
