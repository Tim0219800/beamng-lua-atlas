---@meta
-- tim19Atlas stub generated from lua/common/libs/StackTracePlus/StackTracePlus.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- StackTracePlus: third-party library (Ignacio Burgueño, MIT license) that produces detailed Lua stack traces: guessed function names when they are missing, known functions and tables of the standard library, and a dump of the local variables of each level. Usable as an error handler for xpcall or pcall. The module returns the table _M.
--- Access: `require("libs/StackTracePlus/StackTracePlus")`
---@class libs_StackTracePlus_StackTracePlus
local libs_StackTracePlus_StackTracePlus = {}

--- Adds a function to the list of known functions, with a description used in the traces.
---Source: lua/common/libs/StackTracePlus/StackTracePlus.lua:556
---@param fun function Function to name
---@param description string Displayed name
function libs_StackTracePlus_StackTracePlus.add_known_function(fun, description) end

--- Adds a table to the list of known tables, with a description used when displaying local variables.
---Source: lua/common/libs/StackTracePlus/StackTracePlus.lua:547
---@param tab table Table to name
---@param description string Displayed name
function libs_StackTracePlus_StackTracePlus.add_known_table(tab, description) end

--- Collects a detailed stack trace (delimited by "Stack Traceback >> START/END"), with the local variables of each Lua level. Suited as an xpcall error handler.
---Source: lua/common/libs/StackTracePlus/StackTracePlus.lua:439
---@param thread thread|nil Coroutine to inspect (default: the current coroutine)
---@param message string|table|nil Error message or object placed at the head of the trace
---@param level integer|nil Starting stack level (default 1)
---@param level_limit integer|nil Maximum level to display
---@param dump_locals boolean|nil Display local variables (default true)
---@return string  The full trace
---@return string|nil  The original error message
function libs_StackTracePlus_StackTracePlus.stacktrace(thread, message, level, level_limit, dump_locals) end

--- Variant of stacktrace with the same parameters, producing a simpler trace (inferred from code: same skeleton, without the same detailed formatting).
---Source: lua/common/libs/StackTracePlus/StackTracePlus.lua:326
---@param thread thread|nil Coroutine to inspect
---@param message string|table|nil Error message
---@param level integer|nil Starting level (default 1)
---@param level_limit integer|nil Maximum level
---@param dump_locals boolean|nil Display locals (default true)
---@return string  The trace
function libs_StackTracePlus_StackTracePlus.stacktraceSimple(thread, message, level, level_limit, dump_locals) end

--- Internal object that analyzes a stack (created by Dumper.new(thread)) and accumulates the trace lines.
---@class libs_StackTracePlus_StackTracePlus_Dumper
local libs_StackTracePlus_StackTracePlus_Dumper = {}

--- Walks through and adds to the trace the local variables of a stack level.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/StackTracePlus/StackTracePlus.lua:254
---@param level integer Stack level of the function
function libs_StackTracePlus_StackTracePlus_Dumper:DumpLocals(level) end

--- Adds a line of text to the buffer.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/StackTracePlus/StackTracePlus.lua:238
---@param text string Text
function libs_StackTracePlus_StackTracePlus_Dumper:add(text) end

--- Adds formatted text (string.format).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/StackTracePlus/StackTracePlus.lua:241
---@param fmt string Format
---@param ... any Values
function libs_StackTracePlus_StackTracePlus_Dumper:add_f(fmt, ...) end

--- Concatenates the accumulated lines into a string.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/StackTracePlus/StackTracePlus.lua:244
---@return string  Final text
function libs_StackTracePlus_StackTracePlus_Dumper:concat_lines() end

--- Creates a Dumper bound to a coroutine; adapts getinfo/getlocal (one-level offset if it is the current coroutine).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/StackTracePlus/StackTracePlus.lua:207
---@param thread thread Inspected coroutine
function libs_StackTracePlus_StackTracePlus_Dumper.new(thread) end

return libs_StackTracePlus_StackTracePlus
