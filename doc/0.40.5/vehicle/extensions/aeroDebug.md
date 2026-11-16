# `aeroDebug`

*File: `lua/vehicle/extensions/aeroDebug.lua` · VM: Vehicle · 157 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `aeroDebug`: `extensions.load (vehicle VM)("aeroDebug")`, then the global `aeroDebug`

Aerodynamic debug extension for the workbench: measures the total aerodynamic force and moment of the vehicle around its center of gravity, expresses them in the vehicle frame (right, forward, up) and estimates the distribution of lift (downforce) between front and rear axle from the provided wheel names.

## Example

```lua
extensions.aeroDebug.setWheelNames('wheel_FL', 'wheel_FR', 'wheel_RL', 'wheel_RR')
extensions.aeroDebug.enable()
local d = extensions.aeroDebug.getAeroData()
print(d.frontDownForce, d.rearDownForce, d.percentFront)
```

## Notes

- Fields of aeroData (returned by getAeroData): vehID, totalAeroForce, totalAeroTorque (physical moment, sign inverted relative to calcTotalAeroTorque), totalAeroForceVehicle/afX/afY/afZ (force in the vehicle frame), totalAeroTorqueVehicle/aTX/aTY/aTZ ((pitch, roll, yaw): positive pitch nose up), frontDownForce, rearDownForce (downforce per axle, positive = downforce, in N), percentFront, percentRear, wheelNameStrings (list of wheels after enable), wheelNameFL/FR/RL/RR, test (=100, test value).
- The per-axle downforce computation assumes free rolling (no horizontal tire force): heights vanish, only the longitudinal distance to the CoG matters. The percentages stay at 0 if the sum of the downforces is <= 1 N.
- Anomaly: rearLeftWheelPos is assigned to the wheel named wheelNameRR and rearRightWheelPos to wheelNameRL (swapped); without effect since only the average of the two is used.
- M.directionVector, M.directionVectorUp and M.directionVectorRight are rewritten every frame by updateGFX (forward, up and right vectors).
- The extension does nothing until enable() has been called.

## Functions

| Function | Description | Line |
|---|---|---|
| `aeroDebug.disable()` | Disables the computation and clears wheelNameStrings. | 142 |
| `aeroDebug.enable()` | Enables the computation and fills wheelNameStrings with the names of all wheels if not already done. | 132 |
| `aeroDebug.getAeroData()` | Returns the current aeroData table (see notes for its fields). | 121 |
| `aeroDebug.onInit()` | Initialization hook: disables the computation. *(internal)* *(hook)* | 17 |
| `aeroDebug.setWheelNames(FL, FR, RL, RR)` | Specifies the names of the four wheels for the per-axle distribution. | 125 |
| `aeroDebug.updateGFX(dt)` | Called every frame: if enabled, computes aerodynamic forces and moments and the front/rear downforce distribution. *(internal)* | 21 |

### Parameter details

#### `aeroDebug.getAeroData()`

Returns the current aeroData table (see notes for its fields).

- **returns**: table Aerodynamic data.

#### `aeroDebug.setWheelNames(FL, FR, RL, RR)`

Specifies the names of the four wheels for the per-axle distribution.

- `FL` (*string*) : Name of the front left wheel.
- `FR` (*string*) : Front right wheel.
- `RL` (*string*) : Rear left wheel.
- `RR` (*string*) : Rear right wheel.

#### `aeroDebug.updateGFX(dt)`

Called every frame: if enabled, computes aerodynamic forces and moments and the front/rear downforce distribution.

- `dt` (*number*) : Time step in seconds (unused).

## Calls into the engine (C++)

- `obj:` `calcCenterOfGravityRel`, `calcTotalAeroForces`, `calcTotalAeroTorque`, `getDirectionVector`, `getDirectionVectorUp`, `getID`, `getNodePosition`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/aeroDebug.lua`.*
