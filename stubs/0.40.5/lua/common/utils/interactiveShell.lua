---@meta
-- tim19Atlas stub generated from lua/common/utils/interactiveShell.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Interactive Lua console (REPL) for the console executable (console.x64.exe): require('utils/interactiveShell').start() reads lines from standard input and executes them. Used for development and testing outside the UI; a modder does not normally use it in the normal game. Also defines helper globals.
--- Access: `require("utils/interactiveShell")`
---@class utils_interactiveShell
local utils_interactiveShell = {}

--- Blocking loop: shows the '> ' prompt, reads a line, handles the shortcuts then executes the line with loadstring/xpcall and prints the result or the error with trace. Exits on end of input, 'exit', 'quit' or Ctrl-D. Calls updateLuaCore() each iteration if it exists (cleanup and GC).
---Source: lua/common/utils/interactiveShell.lua:66
function utils_interactiveShell.start() end

--- Helper GLOBAL (alias sp): deletes all objects then spawns n vehicles.
---Source: lua/common/utils/interactiveShell.lua:12
---@param n integer|nil Number of vehicles, 1 by default
---@param v string|nil Name of the vehicle folder under 'vehicles/', 'pickup' by default
function spawnObjects(n, v) end

--- Helper GLOBAL (alias ul): n+1 updates of the simulation engine at 1/2000 s.
---Source: lua/common/utils/interactiveShell.lua:31
---@param n integer|nil Number of iterations, 10 by default
function updateLoop(n) end

--- Helper GLOBAL: one update of the simulation engine (BeamEngine:update(1/2000, 1/2000)).
---Source: lua/common/utils/interactiveShell.lua:27
---@param n any Ignored
function updateOnce(n) end

---@type any
sp = nil
---@type any
ul = nil
return utils_interactiveShell
