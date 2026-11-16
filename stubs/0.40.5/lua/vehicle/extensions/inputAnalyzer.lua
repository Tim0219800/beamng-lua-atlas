---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/inputAnalyzer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gamepad/keyboard 'code' detector: at 30 Hz it watches the inputs (throttle, brake, steering left/right, clutch, parking brake), builds a string of the last 16 presses and calls a callback when the end of the string matches a registered sequence (8 to 16 characters). Used for easter eggs.
--- Access: extension `inputAnalyzer`: `extensions.load (vehicle VM)("inputAnalyzer")`, then the global `inputAnalyzer`
---@class inputAnalyzer
inputAnalyzer = {}

--- Initialization hook; empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/inputAnalyzer.lua:136
function inputAnalyzer.onInit() end

--- Reset hook; empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/inputAnalyzer.lua:133
function inputAnalyzer.onReset() end

--- Registers a sequence to detect and the callback called with the current string when it is entered.
---Source: lua/vehicle/extensions/inputAnalyzer.lua:91
---@param str string Sequence of 8 to 16 letters among u, d, l, r, a, b.
---@param callback function function(inputString).
function inputAnalyzer.registerInputString(str, callback) end

--- Removes a registered sequence (same string and same callback); enables/disables updateGFX depending on whether sequences remain.
---Source: lua/vehicle/extensions/inputAnalyzer.lua:115
---@param string string Registered sequence.
---@param callback function Registered callback.
function inputAnalyzer.unregisterInputString(string, callback) end

--- Called every frame: runs the input analysis at 30 Hz (no-op when no code is registered after a (un)register).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/inputAnalyzer.lua:83
---@param dt number Time step in seconds.
function inputAnalyzer.updateGFX(dt) end

