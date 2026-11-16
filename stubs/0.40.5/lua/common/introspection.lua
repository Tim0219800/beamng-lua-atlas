---@meta
-- tim19Atlas stub generated from lua/common/introspection.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Debug tool that walks _G and the standard modules (table, math, string, coroutine, os, io, debug, package) to list the functions of the classes exposed by the engine (tables with a ___type field of the form class<...> or static_class<...>). Used from the console: require('introspection').gather_methods().
--- Access: `require("introspection")`
---@class introspection
local introspection = {}

--- Builds and returns the list of methods of all exposed C++/Lua classes (and standard modules), with class name, method name, signature and static flag.
---Source: lua/common/introspection.lua:10
---@return table[]  Array of entries {class_name=string, method_name=string, signature=string, is_static=boolean}.
function introspection.gather_methods() end

return introspection
