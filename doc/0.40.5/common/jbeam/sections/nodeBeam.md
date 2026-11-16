# `jbeam_sections_nodeBeam`

*File: `lua/common/jbeam/sections/nodeBeam.lua` · VM: Common (GE + vehicle) · 169 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeam/sections/nodeBeam")`

Processes the jbeam sections of the physical structure: nodes (computes the final position pos as a vec3 after the component's rotation/translation, then removes posX/posY/posZ), hydros (adds the hydraulic beam and applies the default values for speed, limits, input source and factor), ropes (physical ropes: split into node segments and anisotropic beams), quads (each quad becomes two triangles). Also checks that the reference nodes exist.

## Notes

- Beam types used (values defined in C): NORMALTYPE 0, BEAM_ANISOTROPIC 1, BEAM_HYDRO 6.
- Hydros: inRate default 2, outRate default inRate, autoCenterRate default inRate, inLimit 0, outLimit 2, inputSource 'steering', inputCenter 0, inputInLimit -1, inputOutLimit 1, inputFactor 1, analogue = false. inExtent/outExtent (in meters) are converted to limits relative to the beam length; factor (or extentFactor in meters) sets inLimit = 1 - |factor|, outLimit = 1 + |factor| and inputFactor = sign of the factor.
- Ropes: segments (min 1, default 1), length (default 1, or distance id1-id2 if id2 is given), nodeWeight default 5, beamLongBound default infinite. Creates rope.nodes and rope.beams; the last segment connects to id2 if it exists.
- Quads: each quad gives two triangles (id1,id2,id3 then id3,id4,id1) added to vehicle.triangles with new cids; the quads section is then removed.
- If refNodes[0] is absent, an error is logged and dummy reference nodes {ref=0, back=1, left=2, up=0} are installed.

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_sections_nodeBeam.process(vehicle)` | Processes nodes, hydros, ropes, quads and ensures refNodes[0] is present. *(internal)* | 149 |

### Parameter details

#### `jbeam_sections_nodeBeam.process(vehicle)`

Processes nodes, hydros, ropes, quads and ensures refNodes[0] is present.

- `vehicle` (*table*) : Vehicle jbeam data (modified in place).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/sections/nodeBeam.lua`.*
