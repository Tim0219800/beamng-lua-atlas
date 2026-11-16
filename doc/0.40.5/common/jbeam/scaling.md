# `jbeam_scaling`

*File: `lua/common/jbeam/scaling.lua` · VM: Common (GE + vehicle) · 52 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeam/scaling")`

Jbeam post-processing step that applies the "scaleXxx" keys: for any numeric key named scale followed by a name (e.g. scaleNodeWeight), multiplies the value of the neighboring key Xxx (e.g. NodeWeight) by this factor, then removes the scale key. Recursively walks all dictionary-type sections, except those ignored by jbeam/utils (ignoreSections).

## Notes

- The key test is strict: it must start with 'scale' (lowercase) and have at least one character after; 'scale' alone is not handled.
- If the target key does not exist or is not a number, the scale key is still removed with no effect.

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_scaling.process(vehicle)` | Applies the scaleXxx keys across the whole vehicle (in place). *(internal)* | 12 |

### Parameter details

#### `jbeam_scaling.process(vehicle)`

Applies the scaleXxx keys across the whole vehicle (in place).

- `vehicle` (*table*) : Vehicle jbeam data.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/scaling.lua`.*
