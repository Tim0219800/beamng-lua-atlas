---@meta
-- tim19Atlas stub generated from lua/common/jbeam/utils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Shared utility functions of the jbeam loader: adding nodes and beams to the vehicle under construction (maxIDs counters, options copy), adding rotators, and computing the nodeRotate / nodeOffset / nodeMove transformations applied to node and flexbody positions (with cache), plus two string.buffer encoding helpers. Used by the wheel handlers, the loader and the editor; a mod that generates vehicles through code can use it to add nodes/beams.
--- Access: `require("jbeam/utils")`
---@class jbeam_utils
---@field ignoreSections table<string, boolean> jbeam sections ignored by some processing: {maxIDs = true, options = true}.
local jbeam_utils = {}

--- addBeamWithOptions of type NORMALTYPE (0) with the vehicle's options.
---Source: lua/common/jbeam/utils.lua:100
---@param vehicle table vehicle under construction
---@param id1 integer|string first node
---@param id2 integer|string second node
---@return table|nil  beam created
function jbeam_utils.addBeam(vehicle, id1, id2) end

--- Adds a beam between two existing nodes with the options copied, plus cid, id1, id2 (node cids) and beamType. With id3, creates an L-beam (BEAM_LBEAM). Returns nil with a warning if a node cannot be found.
---Source: lua/common/jbeam/utils.lua:51
---@param vehicle table vehicle under construction
---@param id1 integer|string|nil first node (key in vehicle.nodes; nil = options.id1)
---@param id2 integer|string|nil second node (nil = options.id2)
---@param beamType integer beam type (0 normal, 1 anisotropic, 3 pressurized, 7 support... C engine values)
---@param options table|nil beam options (beamSpring, beamDamp, beamStrength...)
---@param id3 integer|string|nil third node for an L-beam
---@return table|nil  beam created (with cid), nil on failure
function jbeam_utils.addBeamWithOptions(vehicle, id1, id2, beamType, options, id3) end

--- addNodeWithOptions with the vehicle's global options (vehicle.options).
---Source: lua/common/jbeam/utils.lua:47
---@param vehicle table vehicle under construction
---@param pos vec3 position
---@param ntype integer node type
---@return integer  cid of the created node
function jbeam_utils.addNode(vehicle, pos, ntype) end

--- Adds a node to the vehicle (table.insert in vehicle.nodes) with the fields of `options` copied, plus cid, pos and ntype.
---Source: lua/common/jbeam/utils.lua:29
---@param vehicle table vehicle under construction
---@param pos vec3 node position
---@param ntype integer node type (0 = NORMALTYPE, C engine values)
---@param options table|nil options to copy into the node (nodeWeight, collision, group...)
---@return integer  cid of the created node
function jbeam_utils.addNodeWithOptions(vehicle, pos, ntype, options) end

--- Prepares a rotator (wheel without a tire): frictionCoef is 1 by default; collects the nodes of the _group_nodes and _rotatorGroup_nodes groups into wheel.nodes (references to vehicle.nodes).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/utils.lua:104
---@param vehicle table vehicle under construction
---@param wheelKey integer rotator index (unused)
---@param wheel table rotator definition (modified)
function jbeam_utils.addRotator(vehicle, wheelKey, wheel) end

--- Position and rotation (degrees, rx/ry/rz) of a flexbody after applying the nodeRotate/nodeOffset/nodeMove transformations. Without a transformation (opCount == 0) returns nothing (nil). Without rotation, returns only the offset x, y, z.
---Source: lua/common/jbeam/utils.lua:281
---@param jbeamData table jbeam block with the operations
---@param x number x
---@param y number y
---@param z number z
---@param rx number x rotation (degrees)
---@param ry number y rotation (degrees)
---@param rz number z rotation (degrees)
---@return number|nil  x
---@return number|nil  y
---@return number|nil  z
---@return number|nil  rx (degrees), only if there is a rotation
---@return number|nil  ry
---@return number|nil  rz
function jbeam_utils.getFlexbodyPosRotAfterNodeRotateOffsetMove(jbeamData, x, y, z, rx, ry, rz) end

--- Position (x, y, z) after applying the nodeRotate / nodeOffset / nodeMove transformations contained in jbeamData. Without a transformation, returns x, y, z unchanged.
---Source: lua/common/jbeam/utils.lua:267
---@param jbeamData table jbeam block containing the nodeRotateN / nodeOffsetN / nodeMoveN keys
---@param x number original x
---@param y number original y
---@param z number original z
---@return number  transformed x
---@return number  transformed y
---@return number  transformed z
function jbeam_utils.getPosAfterNodeRotateOffsetMove(jbeamData, x, y, z) end

--- Inverse operation: recovers the original position and rotation (before nodeRotate/nodeOffset/nodeMove) from transformed values. Tests the signs of x (1, 0, then -1) because nodeOffset depends on the sign of posX.
---Source: lua/common/jbeam/utils.lua:300
---@param jbeamData table jbeam block with the operations
---@param x number transformed x
---@param y number transformed y
---@param z number transformed z
---@param rx number x rotation (degrees)
---@param ry number y rotation (degrees)
---@param rz number z rotation (degrees)
---@return number  original x
---@return number  original y
---@return number  original z
---@return number  original rx
---@return number  original ry
---@return number  original rz
function jbeam_utils.getPosRotBeforeNodeRotateOffsetMove(jbeamData, x, y, z, rx, ry, rz) end

--- Reserves the next id: returns vehicle.maxIDs[name] (0 if nil) then increments the counter.
---Source: lua/common/jbeam/utils.lua:23
---@param vehicle table vehicle under construction (must have maxIDs)
---@param name string counter name ('nodes', 'beams', 'wheels'...)
---@return integer  reserved id (cid)
function jbeam_utils.increaseMax(vehicle, name) end

--- Decodes the value at the head of a string.buffer WITHOUT consuming it (buf:peekdecode()).
---Source: lua/common/jbeam/utils.lua:343
---@param buf string.buffer buffer produced by stringBufferEncode
---@return any  decoded value
function jbeam_utils.stringBufferDecode(buf) end

--- Encodes data with string.buffer (buf:encode) into a new buffer and returns it (LuaJIT binary format).
---Source: lua/common/jbeam/utils.lua:337
---@param data any encodable value
---@return string.buffer  buffer containing the encoded data
function jbeam_utils.stringBufferEncode(data) end

return jbeam_utils
