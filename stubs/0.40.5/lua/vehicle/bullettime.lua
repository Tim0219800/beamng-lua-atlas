---@meta
-- tim19Atlas stub generated from lua/vehicle/bullettime.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Old slow-motion (bullet time) API on the vehicle side, kept for mod compatibility. It only relays to `simTimeAuthority` in the game engine (GE Lua). Deprecated functions show an error toast in the UI and log a trace; use `get`, `set` or `selectPreset`.
--- Access: global `bullettime`
---@class bullettime
bullettime = {}

--- Returns the current simulation time scale (`obj:getSimulationTimeScale()`).
---Source: lua/vehicle/bullettime.lua:13
---@return number  Time scale (1 = real time).
function bullettime.get() end

--- Deprecated: shows the warning then calls `simTimeAuthority.requestValue()` on the GE side.
---Source: lua/vehicle/bullettime.lua:25
function bullettime.requestValue() end

--- Deprecated (same function as update): error toast and trace.
---Source: lua/vehicle/bullettime.lua:8
function bullettime.reset() end

--- Asks `simTimeAuthority.selectPreset` (GE side) to choose a speed preset.
---Source: lua/vehicle/bullettime.lua:21
---@param v any Preset, serialized by dumps (inferred from code).
function bullettime.selectPreset(v) end

--- Asks the game engine to change the simulation speed, by running `simTimeAuthority.set(1/v)` on the GE side.
---Source: lua/vehicle/bullettime.lua:17
---@param v number Desired speed factor (inferred from code: the value sent is 1/v).
function bullettime.set(v) end

--- Deprecated (same function as update): error toast and trace.
---Source: lua/vehicle/bullettime.lua:8
function bullettime.slowMotion() end

--- Deprecated: shows an error toast "Deprecated API: bullettime" and logs a trace.
---Source: lua/vehicle/bullettime.lua:8
function bullettime.update() end

