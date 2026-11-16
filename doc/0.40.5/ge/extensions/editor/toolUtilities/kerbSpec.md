# `editor_toolUtilities_kerbSpec`

*File: `lua/ge/extensions/editor/toolUtilities/kerbSpec.lua` · VM: Game Engine (GE) · 46 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_kerbSpec`: `extensions.load("editor_toolUtilities_kerbSpec")`, then the global `editor_toolUtilities_kerbSpec`

Single kerb and footway section that all the editor tools build to, and the stone they are cut from. The dimensions live here so that a car feels the same step on a street, a car park, a bridge or a plaza. Also gives the texture rows of a kerb variant.

## Notes

- Spec: slabW 1.65 m (one slab wide), slabThick 0.12, kerbW 0.15, kerbH 0.12 (12 cm above the road), buryM 0.30 (depth from which an edge is said to be buried), materials slabs_large and m_sidewalk_curb_trim_01.
- The kerb texture sheet stacks 5 variants in V (a fifth each); the sharp edge must stay on the central row because the normal map carries a rounding there.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_kerbSpec.kerbRows(variant)` | Returns the three V rows of the texture occupied by a kerb variant: the back of the step, the edge and the foot of the face. The variant is truncated to an integer and clamped to 0..4; a non-numeric value gives 0. | 35 |

### Parameter details

#### `editor_toolUtilities_kerbSpec.kerbRows(variant)`

Returns the three V rows of the texture occupied by a kerb variant: the back of the step, the edge and the foot of the face. The variant is truncated to an integer and clamped to 0..4; a non-numeric value gives 0.

- `variant` (*integer|nil*) : Variant index, 0 to 4.
- **returns**: number Row of the back of the step (variant * 0.2).
- **returns**: number Row of the edge (+0.1).
- **returns**: number Row of the foot of the face (+0.2 minus a small gap of 0.00332).

## Fields

| Field | Type | Description |
|---|---|---|
| `spec` | table | Dimensions and materials: slabW, slabThick, kerbW, kerbH, buryM, slabMaterial, kerbMaterial. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/kerbSpec.lua`.*
