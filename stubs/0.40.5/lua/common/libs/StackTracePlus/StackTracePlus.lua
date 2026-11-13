---@meta
-- tim19Atlas stub generated from lua/common/libs/StackTracePlus/StackTracePlus.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- The MIT License
---
--- Copyright (c) 2010 Ignacio Burgueño
---
--- Permission is hereby granted, free of charge, to any person obtaining a copy
--- of this software and associated documentation files (the "Software"), to deal
--- in the Software without restriction, including without limitation the rights
--- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
--- copies of the Software, and to permit persons to whom the Software is
--- furnished to do so, subject to the following conditions:
---
--- The above copyright notice and this permission notice shall be included in
--- all copies or substantial portions of the Software.
---
--- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
--- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
--- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
--- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
--- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
--- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
--- THE SOFTWARE.
---  tables
--- Accès : `require("libs/StackTracePlus/StackTracePlus")`
---@class libs_StackTracePlus_StackTracePlus
local libs_StackTracePlus_StackTracePlus = {}

--- Adds a function to the list of known functions
---Source : lua/common/libs/StackTracePlus/StackTracePlus.lua:556
---@param fun any
---@param description any
function libs_StackTracePlus_StackTracePlus.add_known_function(fun, description) end

--- Adds a table to the list of known tables
---Source : lua/common/libs/StackTracePlus/StackTracePlus.lua:547
---@param tab any
---@param description any
function libs_StackTracePlus_StackTracePlus.add_known_table(tab, description) end

--- Public:
---  Collects a detailed stack trace, dumping locals, resolving function names when they're not available, etc.
---  This function is suitable to be used as an error handler with pcall or xpcall
---  @param thread An optional thread whose stack is to be inspected (defaul is the current thread)
---  @param message An optional error string or object.
---  @param level An optional number telling at which level to start the traceback (default is 1)
---  Returns a string with the stack trace and a string with the original error.
---Source : lua/common/libs/StackTracePlus/StackTracePlus.lua:439
---@param thread any
---@param message any
---@param level any
---@param level_limit any
---@param dump_locals any
function libs_StackTracePlus_StackTracePlus.stacktrace(thread, message, level, level_limit, dump_locals) end

---Source : lua/common/libs/StackTracePlus/StackTracePlus.lua:326
---@param thread any
---@param message any
---@param level any
---@param level_limit any
---@param dump_locals any
function libs_StackTracePlus_StackTracePlus.stacktraceSimple(thread, message, level, level_limit, dump_locals) end

--- Classe locale `Dumper` de lua/common/libs/StackTracePlus/StackTracePlus.lua
---@class libs_StackTracePlus_StackTracePlus_Dumper
local libs_StackTracePlus_StackTracePlus_Dumper = {}

--- Private:
---  Iterates over the local variables of a given function.
---  @param level The stack level where the function is.
---Source : lua/common/libs/StackTracePlus/StackTracePlus.lua:254
---@param level any
function libs_StackTracePlus_StackTracePlus_Dumper:DumpLocals(level) end

--- helpers for collecting strings to be used when assembling the final trace
---Source : lua/common/libs/StackTracePlus/StackTracePlus.lua:238
---@param text any
function libs_StackTracePlus_StackTracePlus_Dumper:add(text) end

---Source : lua/common/libs/StackTracePlus/StackTracePlus.lua:241
---@param fmt any
---@param ... any
function libs_StackTracePlus_StackTracePlus_Dumper:add_f(fmt, ...) end

---Source : lua/common/libs/StackTracePlus/StackTracePlus.lua:244
function libs_StackTracePlus_StackTracePlus_Dumper:concat_lines() end

---Source : lua/common/libs/StackTracePlus/StackTracePlus.lua:207
---@param thread any
function libs_StackTracePlus_StackTracePlus_Dumper.new(thread) end

return libs_StackTracePlus_StackTracePlus
