# `libs_binaryheap_binaryheap`

*Fichier : `lua/common/libs/binaryheap/binaryheap.lua` · VM : Commun (GE + véhicule) · 404 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/binaryheap/binaryheap")`

Binary heap implementation
 A binary heap (or binary tree) is a [sorting algorithm](http://en.wikipedia.org/wiki/Binary_heap).
 The 'plain binary heap' is managed by positions. Which are hard to get once
 an element is inserted. It can be anywhere in the list because it is re-sorted
 upon insertion/deletion of items. The array with values is stored in field
 `values`:
     `peek = heap.values[1]`
 A 'unique binary heap' is where the payload is unique and the payload itself
 also stored (as key) in the heap with the position as value, as in;
     `heap.reverse[payload] = [pos]`
 Due to this setup the reverse search, based on payload, is now a
 much faster operation because instead of traversing the list/heap,
 you can do;
     `pos = heap.reverse[payload]`
 This means that deleting elements from a 'unique binary heap' is
 faster than from a plain heap.
 All management functions in the 'unique binary heap' take `payload`
 instead of `pos` as argument.
 Note that the value of the payload must be unique!
 Fields of heap object:
  * values - array of values
  * payloads - array of payloads (unique binary heap only)
  * reverse - map from payloads to indices (unique binary heap only)

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_binaryheap_binaryheap.binaryHeap(swap, erase, lt)` | Creates a new binary heap.<br> This is the core of all heaps, the others<br> are built upon these sorting functions.<br> @param swap (function) `swap(heap, idx1, idx2)` swaps values at<br> `idx1` and `idx2` in the heaps `heap.values` and `heap.payloads` lists (see<br> return value below).<br> @param erase (function) `swap(heap, position)` raw removal<br> @param lt (function) in `lt(a, b)` returns `true` when `a < b` (for a min-heap)<br> @return table with two methods; `heap:bubbleUp(pos)` and `heap:sinkDown(pos)`<br> that implement the sorting algorithm and two fields; `heap.values` and<br> `heap.payloads` being lists, holding the values and payloads respectively. | 58 |
| `libs_binaryheap_binaryheap.maxHeap(gt)` | Creates a new max-heap, where the largest value is at the top.<br> @param gt (optional) comparison function (greater-than), see `binaryHeap`.<br> @return the new heap | 227 |
| `libs_binaryheap_binaryheap.maxUnique(gt)` | Creates a new max-heap with unique payloads.<br> A max-heap is where the largest value is at the top.<br> *NOTE*: All management functions in the 'unique binary heap'<br> take `payload` instead of `pos` as argument.<br> @param gt (optional) comparison function (greater-than), see `binaryHeap`.<br> @return the new heap | 396 |
| `libs_binaryheap_binaryheap.minHeap(lt)` | Creates a new min-heap, where the smallest value is at the top.<br> @param lt (optional) comparison function (less-than), see `binaryHeap`.<br> @return the new heap | 217 |
| `libs_binaryheap_binaryheap.minUnique(lt)` | Creates a new min-heap with unique payloads.<br> A min-heap is where the smallest value is at the top.<br> *NOTE*: All management functions in the 'unique binary heap'<br> take `payload` instead of `pos` as argument.<br> @param lt (optional) comparison function (less-than), see `binaryHeap`.<br> @return the new heap | 382 |

## Classe `h`

Objet `h` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `h:insert(value, payload)` | Inserts an element in the heap.<br> @function unique:insert<br> @param value the value used for sorting this element<br> @param payload the payload attached to this element<br> @return nothing, or throws an error on bad input | 267 |
| `h:peek()` | Returns the element at the top of the heap, without removing it.<br> @function unique:peek<br> @return payload, value, or `nil` if there is none | 307 |
| `h:peekValue()` | Returns the element at the top of the heap, without removing it.<br> @function unique:peekValue<br> @return value at the top, or `nil` if there is none<br> @usage -- simple timer based heap example<br> while true do<br>   sleep(heap:peekValue() - gettime())  -- assume LuaSocket gettime function<br>   coroutine.resume((heap:pop()))       -- assumes payload to be a coroutine,<br>                                        -- double parens to drop extra return value<br> end | 321 |
| `h:pop()` | Removes the top of the heap and returns it.<br> When used with timers, `pop` will return the payload that is due.<br> Note: this function returns `payload` as the first result to prevent<br> extra locals when retrieving the `payload`.<br> @function unique:pop<br> @return payload, value, or `nil` if there is none | 295 |
| `h:remove(payload)` | Removes an element from the heap.<br> @function unique:remove<br> @param payload the payload to remove<br> @return value, payload or nil if not found | 280 |
| `h:size()` | Returns the number of elements in the heap.<br> @function heap:size<br> @return number of elements | 338 |
| `h:update(payload, newValue)` | Updates the value of an element in the heap.<br> @function unique:update<br> @param payload the payoad whose value to update<br> @param newValue the new value to use for this payload<br> @return nothing, or throws an error on bad input | 257 |
| `h:valueByPayload(payload)` | Returns the value associated with the payload<br> @function unique:valueByPayload<br> @param payload the payload to lookup<br> @return value or nil if no such payload exists | 330 |

## Classe `heap`

Objet `heap` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `heap:erase(pos)` |  | 195 |
| `heap:swap(a, b)` |  | 191 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/binaryheap/binaryheap.lua`.*
