# `vehicleeditor_nodes`

*File: `lua/vehicle/extensions/vehicleeditor/nodes.lua` · VM: Vehicle · 20 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `vehicleeditor_nodes`: `extensions.load (vehicle VM)("vehicleeditor_nodes")`, then the global `vehicleeditor_nodes`

Small vehicle editor utility: computes the cumulative node mass of the vehicle from the physical mass actually simulated (obj:getNodeMass).

## Example

```lua
local total, min, max = vehicleeditor_nodes.calculateNodesWeight()
```

## Notes

- obj:getNodeMass is called up to 3 times per node (not cached).
- Masses in kg (inferred: unit of jbeam node masses).
- If the table is empty: returns 0, -math.huge, math.huge.

## Functions

| Function | Description | Line |
|---|---|---|
| `vehicleeditor_nodes.calculateNodesWeight(nodesTbl)` | Sums the masses of the nodes in the table and also returns the smallest and largest node mass. | 7 |

### Parameter details

#### `vehicleeditor_nodes.calculateNodesWeight(nodesTbl)`

Sums the masses of the nodes in the table and also returns the smallest and largest node mass.

- `nodesTbl` (*table|nil*) : Table of nodes (each with a cid field); v.data.nodes if nil.
- **returns**: number Total mass.
- **returns**: number Minimum mass of a node.
- **returns**: number Maximum mass of a node.

## Calls into the engine (C++)

- `obj:` `getNodeMass`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/vehicleeditor/nodes.lua`.*
