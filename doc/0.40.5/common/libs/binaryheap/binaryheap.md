# `libs_binaryheap_binaryheap`

*File: `lua/common/libs/binaryheap/binaryheap.lua` · VM: Common (GE + vehicle) · 404 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/binaryheap/binaryheap")`

binaryheap: third-party library (Lua binary heap, used notably by copas for its timers) implementing a binary heap (priority queue). Two families: "plain heap" (minHeap/maxHeap, managed by position, values in heap.values) and "unique heap" (minUnique/maxUnique, each element has a unique `payload` found in O(1) via heap.reverse). The module returns the table M.

## Example

```lua
local bh = require("libs/binaryheap/binaryheap")
local h = bh.minUnique()
h:insert(5, "b")
h:insert(2, "a")
print(h:pop()) --> "a", 2
```

## Notes

- In a unique heap, the payload must be unique and non-nil (insert raises "duplicate payload" otherwise); update/remove take the payload, not the position.
- pop returns the payload first then the value (unique heap); on a plain heap, pop returns the value.
- The default comparison function is a < b (min) or a > b (max).

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_binaryheap_binaryheap.binaryHeap(swap, erase, lt)` | Core of all the queues: builds a heap from swap, erase and comparison functions. Returns a table with the methods bubbleUp(pos) and sinkDown(pos) and the lists values and payloads. | 58 |
| `libs_binaryheap_binaryheap.maxHeap(gt)` | Creates a plain heap with the largest value at the top. | 227 |
| `libs_binaryheap_binaryheap.maxUnique(gt)` | Creates a heap with unique payloads, largest value at the top. | 396 |
| `libs_binaryheap_binaryheap.minHeap(lt)` | Creates a plain heap with the smallest value at the top. | 217 |
| `libs_binaryheap_binaryheap.minUnique(lt)` | Creates a heap with unique payloads, smallest value at the top. | 382 |

### Parameter details

#### `libs_binaryheap_binaryheap.binaryHeap(swap, erase, lt)`

Core of all the queues: builds a heap from swap, erase and comparison functions. Returns a table with the methods bubbleUp(pos) and sinkDown(pos) and the lists values and payloads.

- `swap` (*function*) : swap(heap, idx1, idx2) swaps two elements
- `erase` (*function*) : erase(heap, position) raw removal
- `lt` (*function*) : lt(a, b) true when a must be above b
- **returns**: table Base heap

#### `libs_binaryheap_binaryheap.maxHeap(gt)`

Creates a plain heap with the largest value at the top.

- `gt` (*function|nil*) : "Greater than" comparison (default a > b)
- **returns**: table The heap

#### `libs_binaryheap_binaryheap.maxUnique(gt)`

Creates a heap with unique payloads, largest value at the top.

- `gt` (*function|nil*) : Comparison (default a > b)
- **returns**: table The heap

#### `libs_binaryheap_binaryheap.minHeap(lt)`

Creates a plain heap with the smallest value at the top.

- `lt` (*function|nil*) : "Less than" comparison (default a < b)
- **returns**: table The heap

#### `libs_binaryheap_binaryheap.minUnique(lt)`

Creates a heap with unique payloads, smallest value at the top.

- `lt` (*function|nil*) : Comparison (default a < b)
- **returns**: table The heap

## Class `h`

Methods of the heaps created by minHeap/maxHeap (by position) and minUnique/maxUnique (by payload). For a unique heap, the parameters named payload replace positions.

Object `h` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `h:insert(value, payload)` | Inserts an element. On a unique heap, raises an error if the payload already exists. | 267 |
| `h:peek()` | Returns the top without removing it. | 307 |
| `h:peekValue()` | Returns the top value without removing it (unique heap). | 321 |
| `h:pop()` | Removes and returns the top of the heap. | 295 |
| `h:remove(payload)` | Removes an element from the heap. | 280 |
| `h:size()` | Number of elements in the heap. | 338 |
| `h:update(payload, newValue)` | Changes an element's value and puts it back in place in the heap. | 257 |
| `h:valueByPayload(payload)` | Returns the value associated with a payload (unique heap). | 330 |

## Class `heap`

Low-level methods of the base heap (inferred from code: swap and erase passed to binaryHeap).

Object `heap` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `heap:erase(pos)` | Brutally erases the element at position pos. | 195 |
| `heap:swap(a, b)` | Swaps the elements at positions a and b. | 191 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/binaryheap/binaryheap.lua`.*
