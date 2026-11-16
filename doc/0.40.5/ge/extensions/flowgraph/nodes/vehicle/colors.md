# `flowgraph_nodes_vehicle_colors`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/colors.lua` · VM: Game Engine (GE) · 72 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/colors")` (file under extensions/ but not a regular extension)

Node "Set Vehicle Colors" (category `repeat_instant`, tags colors). Changes the three paints of the vehicle: `color1` (main, `obj.color`), `color2` (`colorPalette0`), `color3` (`colorPalette1`). Each `color` pin is a table of 8 numbers: the first 4 = base color (r,g,b,a), the next 4 = metallic data passed to `createVehiclePaint`. Ends with `obj:setMetallicPaintData`. Pin `vehId`: if absent, player vehicle (`be:getPlayerVehicleID(0)`).

## Notes

- Called every frame while the flow is active.
- No test on `obj` nil.
- The color is converted to linear (`asLinear4F`) before being applied.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:postInit()` | Marks the three color pins with `colorSetup = {vehicleColor = true}` (vehicle paint picker in the editor). | 29 |
| `C:work()` | Creates a paint per non-nil color pin, applies it to the vehicle object and sends the list of paints with `setMetallicPaintData`. | 43 |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`
- `obj:` `setMetallicPaintData`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/colors.lua`.*
