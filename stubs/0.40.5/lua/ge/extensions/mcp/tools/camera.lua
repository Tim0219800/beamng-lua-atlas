---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools/camera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- MCP tools for the player camera: change mode, orbit around a vehicle (with continuous rotation), read the camera state and place the free camera. Relies on core_camera. Module loaded by mcp_tools; each M.xxx is a tool that returns (text, isError).
--- Access: extension `mcp_tools_camera`: `extensions.load("mcp_tools_camera")`, then the global `mcp_tools_camera`
---@class mcp_tools_camera
---@field schemas table<string, table> Schemas of the tools set_camera, orbit_camera, get_camera_state, set_free_camera.
mcp_tools_camera = {}

--- Camera state as JSON: mode, pos, rot (quaternion), fov (degrees).
---Source: lua/ge/extensions/mcp/tools/camera.lua:46
---@return string  JSON.
---@return boolean  true if core_camera is unavailable.
function mcp_tools_camera.get_camera_state() end

--- Called every frame (via the mcp_tools fan-out): if a continuous orbit is active, increments the yaw by speed*dtReal (modulo 360) and applies core_camera.setRotation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/mcp/tools/camera.lua:12
---@param dtReal number Real frame time (s).
function mcp_tools_camera.onUpdate(dtReal) end

--- Switches to the orbit camera and sets distance, rotation or continuous rotation around a vehicle.
---Source: lua/ge/extensions/mcp/tools/camera.lua:29
---@param args table|nil {yaw?: number°, pitch?: number° (default 20), distance?: number m, spin?: number °/s (0 stops), id?: integer}
---@return string  Summary.
---@return boolean  true on error.
function mcp_tools_camera.orbit_camera(args) end

--- Changes player 0's camera mode by name (core_camera.setByName).
---Source: lua/ge/extensions/mcp/tools/camera.lua:19
---@param args table {name: string} orbit, driver, chase, external, hood, top, dash… (required).
---@return string  Confirmation or error.
---@return boolean  true on error.
function mcp_tools_camera.set_camera(args) end

--- Switches to the free camera and places it (position, quaternion rotation, fov) via core_camera.globalCameraFunction. The pose then persists, the free camera moves with inputs.
---Source: lua/ge/extensions/mcp/tools/camera.lua:59
---@param args table|nil {pos?: {x,y,z}, rot?: {x,y,z,w}, fov?: number°}
---@return string  "free camera set".
---@return boolean  true on error.
function mcp_tools_camera.set_free_camera(args) end

