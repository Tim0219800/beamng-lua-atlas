# `flowgraph_nodes_gameplay_removeOtherVehicles`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/removeOtherVehicles.lua` · VM: Game Engine (GE) · 141 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/removeOtherVehicles")` (file under extensions/ but not a regular extension)

Flowgraph node "Remove Other Vehicles" (category once_instant). Deletes all vehicles except those whose id is given on the idToIgnore_1..N pins (the number N is set in the properties). Options: onlyDrivableVehs (only uses getAllVehiclesByType) and onlyFlowgraphVehs (limits to vehicles created by the flowgraph vehicle module). Calls editor.onRemoveSceneTreeObjects if the editor is present, then obj:delete().

## Notes

- The three settings (count, onlyDrivableVehs, onlyFlowgraphVehs) are saved with the graph.
- When the number of pins decreases, the links to the removed pins are deleted.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(data)` | Restores the node's own settings from the saved data. | 133 |
| `C:_onSerialize(res)` | Adds the node's own settings to the `res` table when saving the graph. | 127 |
| `C:drawCustomProperties()` | Draws the node's custom properties in the flowgraph editor panel (ImGui). | 27 |
| `C:init()` | Initializes the node's internal state at creation (called by the flowgraph engine). | 21 |
| `C:updatePins(old, new)` | Adds or removes idToIgnore_i input pins to go from old to new; deletes the links of removed pins. | 62 |
| `C:workOnce()` | Executed only once (once_* category) when the node is triggered: reads the input pins and applies the effect. | 81 |

## Calls into the engine (C++)

- `obj:` `delete`, `getId`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/removeOtherVehicles.lua`.*
