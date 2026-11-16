# `editor_util_searchUtil`

*File: `lua/ge/extensions/editor/util/searchUtil.lua` · VM: Game Engine (GE) · 193 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/util/searchUtil")` (file under extensions/ but not a regular extension)

Editor helper for fuzzy search with "frecency" ranking (frequency/recency of use). The module returns a constructor: require('/lua/ge/extensions/editor/util/searchUtil')(). You call startSearch, queryElement for each candidate, then finishSearch which returns the results sorted by final score. Also provides an imgui combo with built-in search (beginSearchableSimpleCombo).

## Example

```lua
local s = require('/lua/ge/extensions/editor/util/searchUtil')()
s:startSearch('veh')
for _, e in ipairs(liste) do s:queryElement({name = e, frecencyId = e}) end
local res = s:finishSearch()
```

## Notes

- matchStringScore(name, match, ignoreEarly) is exposed as C.matchStringScore: score = matched characters / label length (up to 7 occurrences), blended 50% with an early-position bonus.
- Final score = score*(1-frecencyWeight) + frecency*frecencyWeight, frecencyWeight = 0.5.
- Frecency: 1/1.25^(elapsed days); the stored value is the os.time() of the last use. updateFrecencyEntry cancels the previous update if it is less than 10 s old.
- beginSearchableSimpleCombo uses ffi.string without declaring ffi locally (depends on the global ffi); imgui is received as a parameter.

## Class `C`

Search instance.

The module returns a constructor: `local obj = require("editor_util_searchUtil")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:beginSearchableSimpleCombo(im, string_label, string_preview_value, elementsAsList, ImGuiComboFlags_flags)` | Draws an imgui combo with a search field, X button and filtered list (140 px high, UI-scaled). Returns the clicked element. | 131 |
| `C:finishSearch()` | Computes frecency and finalScore of each result, sorts (finalScore descending) and returns the list. | 77 |
| `C:getFrecencyData()` | Returns the frecency table. | 98 |
| `C:getFrecencyScore(fId)` | Recency score between 0 and 1 (0 if unknown). | 122 |
| `C:init()` | Installs the default scoring and tie-breaking function (by name) and frecencyWeight = 0.5. | 48 |
| `C:queryElement(elem, scoringFunction)` | Evaluates an element: writes elem.score and adds it to the results if the score is > 0. | 69 |
| `C:setFrecencyData(frecencyData)` | Sets the frecencyId -> timestamp table. | 94 |
| `C:setSameScoreResolvingFunction(fun)` | Replaces the tie-breaking function (a, b) -> boolean used when the final score is equal. | 59 |
| `C:setScoringFunction(fun)` | Replaces the scoring function (element, match) -> number. | 55 |
| `C:startSearch(matchString)` | Starts a search: clears the results, remembers the searched string and forgets the frecency undo. | 63 |
| `C:updateFrecencyEntry(fId)` | Marks an identifier as used now (os.time()). If the previous update is 10 s old or less, it is canceled first. | 103 |

## Class `self`

Function fields set on the instance by init.

Object `self` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `self.sameScoreResolvingFunction(a, b)` | Default tie-break: a.name < b.name. | 43 |
| `self.scoringFunction(element, match)` | Default score: matchStringScore(element.name, match). | 38 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/util/searchUtil.lua`.*
