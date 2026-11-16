---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/performanceMetrics.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small utility module (loaded by require) of performance telemetry: safe reading of VariableRegistry variables, the program's focus state and the cause of an FPS cap chosen by the player.
--- Access: extension `telemetry_performanceMetrics`: `extensions.load("telemetry_performanceMetrics")`, then the global `telemetry_performanceMetrics`
---@class telemetry_performanceMetrics
telemetry_performanceMetrics = {}

--- Says which player-chosen FPS cap applies: 'background' (limit in the background without focus), 'vr' (OpenXR session), 'limiter' (fpsLimitEnabled), 'vsync', otherwise nil. Used to avoid mistaking an FPS locked at 60 for a machine unable to do better.
---Source: lua/ge/extensions/telemetry/performanceMetrics.lua:23
---@return string|nil  'background', 'vr', 'limiter', 'vsync' or nil.
function telemetry_performanceMetrics.getLimitedBy() end

--- Indicates whether the game window has focus (true if Engine.isProgramFocused does not exist).
---Source: lua/ge/extensions/telemetry/performanceMetrics.lua:17
---@return boolean  true if the program has focus.
function telemetry_performanceMetrics.isFocused() end

--- Like readNumber but returns nil instead of -1 (value unavailable).
---Source: lua/ge/extensions/telemetry/performanceMetrics.lua:12
---@param name string Variable name.
---@return number|nil  Value >= 0, or nil.
function telemetry_performanceMetrics.readAvailable(name) end

--- Reads a VariableRegistry variable as a number; returns -1 if it is absent, non-numeric, NaN or infinite.
---Source: lua/ge/extensions/telemetry/performanceMetrics.lua:7
---@param name string Variable name (e.g. '$fps::avg').
---@return number  Value, or -1.
function telemetry_performanceMetrics.readNumber(name) end

