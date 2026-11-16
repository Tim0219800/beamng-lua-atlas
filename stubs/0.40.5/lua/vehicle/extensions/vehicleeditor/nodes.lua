---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/vehicleeditor/nodes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small vehicle editor utility: computes the cumulative node mass of the vehicle from the physical mass actually simulated (obj:getNodeMass).
--- Access: extension `vehicleeditor_nodes`: `extensions.load (vehicle VM)("vehicleeditor_nodes")`, then the global `vehicleeditor_nodes`
---@class vehicleeditor_nodes
vehicleeditor_nodes = {}

--- Sums the masses of the nodes in the table and also returns the smallest and largest node mass.
---Source: lua/vehicle/extensions/vehicleeditor/nodes.lua:7
---@param nodesTbl table|nil Table of nodes (each with a cid field); v.data.nodes if nil.
---@return number  Total mass.
---@return number  Minimum mass of a node.
---@return number  Maximum mass of a node.
function vehicleeditor_nodes.calculateNodesWeight(nodesTbl) end

