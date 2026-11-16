# `dequeue`

*File: `lua/common/dequeue.lua` · VM: Common (GE + vehicle) · 224 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("dequeue")`

Double-ended queue (deque): items can be added and removed at the front as well as the back. Library by Pierre Chapuis (MIT license in the header). Useful for histories or sliding buffers. The object is a table indexed by integers between head+1 and tail.

## Example

```lua
local dq = require('dequeue').new()
dq:push_right(1); dq:push_right(2); dq:push_left(0)
print(dq:pop_left(), dq:length())  -- 0  2
```

## Notes

- nil elements are forbidden by push (assert).
- new(data) reuses the provided table as the queue (head/tail initialized to 0 if absent) and sets _serialize = true.
- rotate_* on an empty queue returns nil; remove_left/right only remove the first occurrence found and shift the elements.
- push_left/pop_left use indices <= 0: the table is no longer a pure Lua array (# is unreliable, use length()).

## Functions

| Function | Description | Line |
|---|---|---|
| `dequeue.new(data)` | Creates an empty deque, or turns the provided table into a deque. | 157 |

### Parameter details

#### `dequeue.new(data)`

Creates an empty deque, or turns the provided table into a deque.

- `data` (*table|nil*) : Existing table to reuse (may contain head/tail).
- **returns**: table Deque object.

## Class `deque`

Object returned by new. Fields: head, tail, _serialize.

| Method | Description | Line |
|---|---|---|
| `deque:contents()` | Copies the content into an ordered array from 1 to length(). | dyn |
| `deque:is_empty()` | Tells whether the queue is empty. | dyn |
| `deque:iter_left()` | Iterator from the front to the end. | dyn |
| `deque:iter_right()` | Iterator from the end to the front. | dyn |
| `deque:length()` | Number of elements. | dyn |
| `deque:peek_left()` | Returns the first element without removing it. | dyn |
| `deque:peek_right()` | Returns the last element without removing it. | dyn |
| `deque:pop_left()` | Removes and returns the first element. | dyn |
| `deque:pop_right()` | Removes and returns the last element. | dyn |
| `deque:push_left(x)` | Adds x at the front. | dyn |
| `deque:push_right(x)` | Adds x at the end. | dyn |
| `deque:remove_left(x)` | Removes the first occurrence of x, searching from the front. | dyn |
| `deque:remove_right(x)` | Removes the first occurrence of x, searching from the end. | dyn |
| `deque:reset()` | Resets head and tail to 0 (the old elements are not erased from the table). | dyn |
| `deque:rotate_left(n)` | Moves n elements from the front to the end. | dyn |
| `deque:rotate_right(n)` | Moves n elements from the end to the front. | dyn |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/dequeue.lua`.*
