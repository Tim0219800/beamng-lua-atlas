# `wheels`

*File: `lua/common/jbeam/sections/wheels.lua` · VM: Common (GE + vehicle) · 140 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `wheels`

Dispatcher for wheel construction when loading a jbeam vehicle. It goes through the vehicle's wheel sections (wheels, monoHubWheels, hubWheelsTSV, hubWheelsTSI, hubWheels, pressureWheels) in that order, calls for each wheel the type handler (file jbeam/sections/wheelTypes/<section>.lua) that creates nodes, beams and triangles, then stores all wheels in vehicle.wheels with a wheelID. processRotators then adds the rotators (wheels without a tire) and renumbers the wheels. Called by the jbeam loader, not by a typical mod.

## Example

```lua
-- internal use by the jbeam loader (jbeam/loader), in this order:
local wheels = require('jbeam/sections/wheels')
wheels.processWheels(vehicle)
wheels.processRotators(vehicle)
```

## Notes

- The section order (wheels, monoHubWheels, hubWheelsTSV, hubWheelsTSI, hubWheels, pressureWheels) fixes the wheelIDs and the node cids; the code says 'do not reorder'. The handler file name must be identical to the jbeam section name (this is how the dispatcher finds it via require).
- A wheel whose numRays is 0 (or negative) is ignored: it stays in its original section (no wheelID). Each processed wheel is copied into vehicle.wheels[wheelID] with wheelSection = section name, and removed from its original section.
- processRotators also removes wheels without nodes (wheel.nodes nil or empty) with a warning, then renumbers cid from 0 to N-1: to be called AFTER processWheels. It uses wheel.name in the warning message (Lua error if name is nil).
- addWheelAttachments (local function) does nothing by default: addStrapsToEverything is false (inactive test code that would add a tire_02c_22x10_39strap strap flexbody around the tires).
- The vehicle.wheels, vehicle.nodes, etc. tables are 0-based (iterated with tableSizeC).

## Functions

| Function | Description | Line |
|---|---|---|
| `wheels.processRotators(vehicle)` | Adds the rotators (vehicle.rotators) as extra wheels (wheelID, jbeamUtils.addRotator), removes wheels without nodes and renumbers vehicle.wheels / cid. *(internal)* | 105 |
| `wheels.processWheels(vehicle)` | Builds all the vehicle's wheels: resets vehicle.wheels, processes each non-empty wheel section via the wheel type handler (require loaded on demand then cached), assigns wheelID and stores the result in vehicle.wheels. *(internal)* | 81 |

### Parameter details

#### `wheels.processRotators(vehicle)`

Adds the rotators (vehicle.rotators) as extra wheels (wheelID, jbeamUtils.addRotator), removes wheels without nodes and renumbers vehicle.wheels / cid.

- `vehicle` (*table*) : vehicle data

#### `wheels.processWheels(vehicle)`

Builds all the vehicle's wheels: resets vehicle.wheels, processes each non-empty wheel section via the wheel type handler (require loaded on demand then cached), assigns wheelID and stores the result in vehicle.wheels.

- `vehicle` (*table*) : data of the vehicle being built (nodes, beams, maxIDs, wheel sections, flexbodies...)
- **returns**: boolean always true

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/sections/wheels.lua`.*
