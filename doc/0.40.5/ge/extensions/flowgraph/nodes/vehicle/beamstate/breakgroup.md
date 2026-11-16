# `flowgraph_nodes_vehicle_beamstate_breakgroup`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/breakgroup.lua` · VM: Game Engine (GE) · 61 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/beamstate/breakgroup")` (file under extensions/ but not a regular extension)

Node "Breakgroup" (category `repeat_p_duration`, tags destroy/damage). Breaks one or several breakgroups of the vehicle. Input pins: `vehId` (number), `group` (string, default `*`). `*` calls `beamstate.breakAllBreakgroups()`. If `vehId` is not connected, the node takes the player vehicle (`getPlayerVehicle(0)`).

## Notes

- Bug: `type(self.pinIn.group.value == 'string')` compares first then takes the `type` of a boolean: the result is always 'boolean' (hence true), the "table" branch is never used despite the pin description ("table or string").
- `beamstate.breakBreakGroup('name')`: the name is inserted as is between apostrophes in the Lua command.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:work()` | If `group` is `*`, breaks all breakgroups; otherwise calls `beamstate.breakBreakGroup('<group>')` on the vehicle. Exits if `group` is nil or if the vehicle is not found (E log). | 27 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/breakgroup.lua`.*
