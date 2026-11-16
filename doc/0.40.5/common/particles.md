# `_`

*File: `lua/common/particles.lua` · VM: Common (GE + vehicle) · 135 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `_`, `particles`

Loads lua/common/particles.json at startup (physical materials and particle rules between two materials) and prepares lookup tables: a list of materials and a table keyed by material pair with, for each rule, a compiled comparison function (on perpendicularVel and slipVel). Used to choose the impact/slip particles according to the two materials in contact.

## Example

```lua
local particles = require('particles')
local mats, pairsMap = particles.getMaterialsParticlesTable()
local id1 = particles.getMaterialIDByName(mats, 'ASPHALT')
local mat = particles.getMaterialByID(mats, id1)
```

## Notes

- Loading happens when the module runs (preloadParticlesTable() is called at file level) via readDictJSONTable('lua/common/particles.json').
- Key of the pair table: materialID1 * 10000 + materialID2, always with materialID1 >= materialID2 (swapped if needed). Each entry is a list of rules having compareFunc(arg) where arg = {perpendicularVel=, slipVel=}; in the JSON strings, the letter X is replaced by arg.<field>.
- An unknown material passed to getOrAddMaterialIDByName is added dynamically ({colorB/G/R = 255, dynamic = true, name}); getMaterialIDByName instead returns min(3, #mats) (fallback value, id 3 if there are enough materials).
- PROBABLE BUG: if perpendicularVel and slipVel are both empty in a rule, compareFuncStr is '' (table.concat of an empty list) and not nil; the 'always true' condition ("true") is therefore never applied and the compiled function ('return ') returns nil. Also, in the parsing error message, `compareFuncStr` is an undefined variable (should be v.compareFuncStr).

## Functions

| Function | Description | Line |
|---|---|---|
| `_.getMaterialByID(mats, i)` | Returns the material at index i in mats, or nil if i is nil. | 11 |
| `_.getMaterialIDByName(mats, s)` | Looks up the identifier of the material named s; returns min(3, #mats) if it is unknown (no addition). | 30 |
| `_.getMaterialsParticlesTable()` | Returns the list of materials and the table of particle rules per material pair (key id1*10000+id2). | 122 |
| `_.getOrAddMaterialIDByName(mats, s)` | Looks up the identifier of the material named s; if it does not exist, creates a temporary definition (white, dynamic = true) added to mats and returns its new identifier. | 16 |

### Parameter details

#### `_.getMaterialByID(mats, i)`

Returns the material at index i in mats, or nil if i is nil.

- `mats` (*table*) : list of materials (first return value of getMaterialsParticlesTable)
- `i` (*integer|nil*) : material identifier
- **returns**: table|nil material {name, colorR, colorG, colorB, ...}

#### `_.getMaterialIDByName(mats, s)`

Looks up the identifier of the material named s; returns min(3, #mats) if it is unknown (no addition).

- `mats` (*table*) : list of materials
- `s` (*string*) : material name
- **returns**: integer material identifier

#### `_.getMaterialsParticlesTable()`

Returns the list of materials and the table of particle rules per material pair (key id1*10000+id2).

- **returns**: table materials
- **returns**: table<integer, table[]> rules per material pair

#### `_.getOrAddMaterialIDByName(mats, s)`

Looks up the identifier of the material named s; if it does not exist, creates a temporary definition (white, dynamic = true) added to mats and returns its new identifier.

- `mats` (*table*) : list of materials (modified)
- `s` (*string*) : material name
- **returns**: integer material identifier

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/particles.lua`.*
