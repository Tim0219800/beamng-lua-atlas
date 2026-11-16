# `jbeam_utils`

*File: `lua/common/jbeam/utils.lua` · VM: Common (GE + vehicle) · 359 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeam/utils")`

Shared utility functions of the jbeam loader: adding nodes and beams to the vehicle under construction (maxIDs counters, options copy), adding rotators, and computing the nodeRotate / nodeOffset / nodeMove transformations applied to node and flexbody positions (with cache), plus two string.buffer encoding helpers. Used by the wheel handlers, the loader and the editor; a mod that generates vehicles through code can use it to add nodes/beams.

## Example

```lua
local jbeamUtils = require('jbeam/utils')
local n = jbeamUtils.addNodeWithOptions(vehicle, vec3(0, 0, 1), 0, {nodeWeight = 5})
local b = jbeamUtils.addBeamWithOptions(vehicle, n1, n2, 0, {beamSpring = 1e6})
```

## Notes

- Node and beam ids are 0-based cids; vehicle.maxIDs[name] counts the elements already created (increaseMax returns the value BEFORE incrementing, so the next free cid).
- addNode/addBeamWithOptions copy (deepcopy) the options table received: the options of a wheel or of the vehicle (vehicle.options) become the fields of each node / beam created.
- addBeamWithOptions: id1/id2 are used to look up vehicle.nodes[id] (key = cid, and in the loader also the node name); if id1/id2 are nil they are read from options.id1/options.id2. The id1, id2 fields of the created beam are the cids of the nodes found. If a node is invalid, the function logs a warning and returns nil (without creating a beam): the callers (wheel handlers) do not check this return value.
- With id3 (3rd node), the beam becomes an L-beam (BEAM_LBEAM = 4) regardless of beamType and b.id3 is set.
- Hardcoded C constants: NORMALTYPE = 0, BEAM_LBEAM = 4 (do not change).
- jbeam transformations: the keys 'nodeRotateN', 'nodeOffsetN' and 'nodeMoveN' (N = 0 to 99, 1 or 2 digits) of a jbeamData block are {x, y, z} tables (nodeRotate: angles in degrees around x/y/z, with optional pivot px, py, pz). They apply in increasing order of N, and for each N: rotation, then offset, then move. nodeOffset is ignored if jbeamData.ignoreNodeOffset is true; its x is multiplied by the sign of posX (left/right symmetry).
- The transformation functions share a module-level cache (only one transformation at a time) and temporary vectors/quats: not reentrant.
- The rotation Euler angles are those of MatrixF (intrinsic ZXY), in radians with inverted sign for jbeam angles (rad(-angle)).

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_utils.addBeam(vehicle, id1, id2)` | addBeamWithOptions of type NORMALTYPE (0) with the vehicle's options. | 100 |
| `jbeam_utils.addBeamWithOptions(vehicle, id1, id2, beamType, options, id3)` | Adds a beam between two existing nodes with the options copied, plus cid, id1, id2 (node cids) and beamType. With id3, creates an L-beam (BEAM_LBEAM). Returns nil with a warning if a node cannot be found. | 51 |
| `jbeam_utils.addNode(vehicle, pos, ntype)` | addNodeWithOptions with the vehicle's global options (vehicle.options). | 47 |
| `jbeam_utils.addNodeWithOptions(vehicle, pos, ntype, options)` | Adds a node to the vehicle (table.insert in vehicle.nodes) with the fields of `options` copied, plus cid, pos and ntype. | 29 |
| `jbeam_utils.addRotator(vehicle, wheelKey, wheel)` | Prepares a rotator (wheel without a tire): frictionCoef is 1 by default; collects the nodes of the _group_nodes and _rotatorGroup_nodes groups into wheel.nodes (references to vehicle.nodes). *(internal)* | 104 |
| `jbeam_utils.getFlexbodyPosRotAfterNodeRotateOffsetMove(jbeamData, x, y, z, rx, ry, rz)` | Position and rotation (degrees, rx/ry/rz) of a flexbody after applying the nodeRotate/nodeOffset/nodeMove transformations. Without a transformation (opCount == 0) returns nothing (nil). Without rotation, returns only the offset x, y, z. | 281 |
| `jbeam_utils.getPosAfterNodeRotateOffsetMove(jbeamData, x, y, z)` | Position (x, y, z) after applying the nodeRotate / nodeOffset / nodeMove transformations contained in jbeamData. Without a transformation, returns x, y, z unchanged. | 267 |
| `jbeam_utils.getPosRotBeforeNodeRotateOffsetMove(jbeamData, x, y, z, rx, ry, rz)` | Inverse operation: recovers the original position and rotation (before nodeRotate/nodeOffset/nodeMove) from transformed values. Tests the signs of x (1, 0, then -1) because nodeOffset depends on the sign of posX. | 300 |
| `jbeam_utils.increaseMax(vehicle, name)` | Reserves the next id: returns vehicle.maxIDs[name] (0 if nil) then increments the counter. | 23 |
| `jbeam_utils.stringBufferDecode(buf)` | Decodes the value at the head of a string.buffer WITHOUT consuming it (buf:peekdecode()). | 343 |
| `jbeam_utils.stringBufferEncode(data)` | Encodes data with string.buffer (buf:encode) into a new buffer and returns it (LuaJIT binary format). | 337 |

### Parameter details

#### `jbeam_utils.addBeam(vehicle, id1, id2)`

addBeamWithOptions of type NORMALTYPE (0) with the vehicle's options.

- `vehicle` (*table*) : vehicle under construction
- `id1` (*integer|string*) : first node
- `id2` (*integer|string*) : second node
- **returns**: table|nil beam created

#### `jbeam_utils.addBeamWithOptions(vehicle, id1, id2, beamType, options, id3)`

Adds a beam between two existing nodes with the options copied, plus cid, id1, id2 (node cids) and beamType. With id3, creates an L-beam (BEAM_LBEAM). Returns nil with a warning if a node cannot be found.

- `vehicle` (*table*) : vehicle under construction
- `id1` (*integer|string|nil*) : first node (key in vehicle.nodes; nil = options.id1)
- `id2` (*integer|string|nil*) : second node (nil = options.id2)
- `beamType` (*integer*) : beam type (0 normal, 1 anisotropic, 3 pressurized, 7 support... C engine values)
- `options` (*table|nil*) : beam options (beamSpring, beamDamp, beamStrength...)
- `id3` (*integer|string|nil*) : third node for an L-beam
- **returns**: table|nil beam created (with cid), nil on failure

#### `jbeam_utils.addNode(vehicle, pos, ntype)`

addNodeWithOptions with the vehicle's global options (vehicle.options).

- `vehicle` (*table*) : vehicle under construction
- `pos` (*vec3*) : position
- `ntype` (*integer*) : node type
- **returns**: integer cid of the created node

#### `jbeam_utils.addNodeWithOptions(vehicle, pos, ntype, options)`

Adds a node to the vehicle (table.insert in vehicle.nodes) with the fields of `options` copied, plus cid, pos and ntype.

- `vehicle` (*table*) : vehicle under construction
- `pos` (*vec3*) : node position
- `ntype` (*integer*) : node type (0 = NORMALTYPE, C engine values)
- `options` (*table|nil*) : options to copy into the node (nodeWeight, collision, group...)
- **returns**: integer cid of the created node

#### `jbeam_utils.addRotator(vehicle, wheelKey, wheel)`

Prepares a rotator (wheel without a tire): frictionCoef is 1 by default; collects the nodes of the _group_nodes and _rotatorGroup_nodes groups into wheel.nodes (references to vehicle.nodes).

- `vehicle` (*table*) : vehicle under construction
- `wheelKey` (*integer*) : rotator index (unused)
- `wheel` (*table*) : rotator definition (modified)

#### `jbeam_utils.getFlexbodyPosRotAfterNodeRotateOffsetMove(jbeamData, x, y, z, rx, ry, rz)`

Position and rotation (degrees, rx/ry/rz) of a flexbody after applying the nodeRotate/nodeOffset/nodeMove transformations. Without a transformation (opCount == 0) returns nothing (nil). Without rotation, returns only the offset x, y, z.

- `jbeamData` (*table*) : jbeam block with the operations
- `x` (*number*) : x
- `y` (*number*) : y
- `z` (*number*) : z
- `rx` (*number*) : x rotation (degrees)
- `ry` (*number*) : y rotation (degrees)
- `rz` (*number*) : z rotation (degrees)
- **returns**: number|nil x
- **returns**: number|nil y
- **returns**: number|nil z
- **returns**: number|nil rx (degrees), only if there is a rotation
- **returns**: number|nil ry
- **returns**: number|nil rz

#### `jbeam_utils.getPosAfterNodeRotateOffsetMove(jbeamData, x, y, z)`

Position (x, y, z) after applying the nodeRotate / nodeOffset / nodeMove transformations contained in jbeamData. Without a transformation, returns x, y, z unchanged.

- `jbeamData` (*table*) : jbeam block containing the nodeRotateN / nodeOffsetN / nodeMoveN keys
- `x` (*number*) : original x
- `y` (*number*) : original y
- `z` (*number*) : original z
- **returns**: number transformed x
- **returns**: number transformed y
- **returns**: number transformed z

#### `jbeam_utils.getPosRotBeforeNodeRotateOffsetMove(jbeamData, x, y, z, rx, ry, rz)`

Inverse operation: recovers the original position and rotation (before nodeRotate/nodeOffset/nodeMove) from transformed values. Tests the signs of x (1, 0, then -1) because nodeOffset depends on the sign of posX.

- `jbeamData` (*table*) : jbeam block with the operations
- `x` (*number*) : transformed x
- `y` (*number*) : transformed y
- `z` (*number*) : transformed z
- `rx` (*number*) : x rotation (degrees)
- `ry` (*number*) : y rotation (degrees)
- `rz` (*number*) : z rotation (degrees)
- **returns**: number original x
- **returns**: number original y
- **returns**: number original z
- **returns**: number original rx
- **returns**: number original ry
- **returns**: number original rz

#### `jbeam_utils.increaseMax(vehicle, name)`

Reserves the next id: returns vehicle.maxIDs[name] (0 if nil) then increments the counter.

- `vehicle` (*table*) : vehicle under construction (must have maxIDs)
- `name` (*string*) : counter name ('nodes', 'beams', 'wheels'...)
- **returns**: integer reserved id (cid)

#### `jbeam_utils.stringBufferDecode(buf)`

Decodes the value at the head of a string.buffer WITHOUT consuming it (buf:peekdecode()).

- `buf` (*string.buffer*) : buffer produced by stringBufferEncode
- **returns**: any decoded value

#### `jbeam_utils.stringBufferEncode(data)`

Encodes data with string.buffer (buf:encode) into a new buffer and returns it (LuaJIT binary format).

- `data` (*any*) : encodable value
- **returns**: string.buffer buffer containing the encoded data

## Fields

| Field | Type | Description |
|---|---|---|
| `ignoreSections` | table<string, boolean> | jbeam sections ignored by some processing: {maxIDs = true, options = true}. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/utils.lua`.*
