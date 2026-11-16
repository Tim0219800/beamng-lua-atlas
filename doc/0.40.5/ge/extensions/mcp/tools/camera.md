# `mcp_tools_camera`

*File: `lua/ge/extensions/mcp/tools/camera.lua` · VM: Game Engine (GE) · 98 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `mcp_tools_camera`: `extensions.load("mcp_tools_camera")`, then the global `mcp_tools_camera`

MCP tools for the player camera: change mode, orbit around a vehicle (with continuous rotation), read the camera state and place the free camera. Relies on core_camera. Module loaded by mcp_tools; each M.xxx is a tool that returns (text, isError).

## Notes

- The continuous orbit rotation (spin) is applied in onUpdate; changing camera mode with set_camera (other than orbit), set_free_camera or spin=0 stops it.
- Angles are in degrees, distance in meters. get_camera_state returns the rotation as a quaternion {x,y,z,w}.

## Functions

| Function | Description | Line |
|---|---|---|
| `mcp_tools_camera.get_camera_state()` | Camera state as JSON: mode, pos, rot (quaternion), fov (degrees). | 46 |
| `mcp_tools_camera.onUpdate(dtReal)` | Called every frame (via the mcp_tools fan-out): if a continuous orbit is active, increments the yaw by speed*dtReal (modulo 360) and applies core_camera.setRotation. *(internal)* *(hook)* | 12 |
| `mcp_tools_camera.orbit_camera(args)` | Switches to the orbit camera and sets distance, rotation or continuous rotation around a vehicle. | 29 |
| `mcp_tools_camera.set_camera(args)` | Changes player 0's camera mode by name (core_camera.setByName). | 19 |
| `mcp_tools_camera.set_free_camera(args)` | Switches to the free camera and places it (position, quaternion rotation, fov) via core_camera.globalCameraFunction. The pose then persists, the free camera moves with inputs. | 59 |

### Parameter details

#### `mcp_tools_camera.get_camera_state()`

Camera state as JSON: mode, pos, rot (quaternion), fov (degrees).

- **returns**: string JSON.
- **returns**: boolean true if core_camera is unavailable.

#### `mcp_tools_camera.onUpdate(dtReal)`

Called every frame (via the mcp_tools fan-out): if a continuous orbit is active, increments the yaw by speed*dtReal (modulo 360) and applies core_camera.setRotation.

- `dtReal` (*number*) : Real frame time (s).

#### `mcp_tools_camera.orbit_camera(args)`

Switches to the orbit camera and sets distance, rotation or continuous rotation around a vehicle.

- `args` (*table|nil*) : {yaw?: number°, pitch?: number° (default 20), distance?: number m, spin?: number °/s (0 stops), id?: integer}
- **returns**: string Summary.
- **returns**: boolean true on error.

#### `mcp_tools_camera.set_camera(args)`

Changes player 0's camera mode by name (core_camera.setByName).

- `args` (*table*) : {name: string} orbit, driver, chase, external, hood, top, dash… (required).
- **returns**: string Confirmation or error.
- **returns**: boolean true on error.

#### `mcp_tools_camera.set_free_camera(args)`

Switches to the free camera and places it (position, quaternion rotation, fov) via core_camera.globalCameraFunction. The pose then persists, the free camera moves with inputs.

- `args` (*table|nil*) : {pos?: {x,y,z}, rot?: {x,y,z,w}, fov?: number°}
- **returns**: string "free camera set".
- **returns**: boolean true on error.

## Fields

| Field | Type | Description |
|---|---|---|
| `schemas` | table<string, table> | Schemas of the tools set_camera, orbit_camera, get_camera_state, set_free_camera. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/mcp/tools/camera.lua`.*
