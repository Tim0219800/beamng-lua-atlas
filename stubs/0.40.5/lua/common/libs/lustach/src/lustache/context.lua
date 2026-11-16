---@meta
-- tim19Atlas stub generated from lua/common/libs/lustach/src/lustache/context.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Third-party library lustache: Mustache rendering context. A context wraps the current view (data table), keeps a link to the parent context (section nesting stack) and a name-resolution cache. The renderer uses it to resolve `{{name}}`, `{{a.b.c}}` and `{{.}}`.
--- Access: `require("libs/lustach/src/lustache/context")`
---@class libs_lustach_src_lustache_context
---@field __index table Self-reference of the class (the `context` table serves as metatable).
local libs_lustach_src_lustache_context = {}

--- Clears the resolution cache of this context.
---Source: lua/common/libs/lustach/src/lustache/context.lua:7
---@param self any
function libs_lustach_src_lustache_context.clear_cache(self) end

--- Resolves a name in the current view, then, failing that, in the parent contexts. Handles dotted paths (`a.b.c`) and the name `.` (the view itself). The result is cached.
---Source: lua/common/libs/lustach/src/lustache/context.lua:15
---@param self any
---@param name string Name or path to resolve.
---@return any  Value found, or nil.
function libs_lustach_src_lustache_context.lookup(self, name) end

--- Creates a context for `view` with an optional parent and an empty cache.
---Source: lua/common/libs/lustach/src/lustache/context.lua:57
---@param self table Context class (call with a colon).
---@param view any Context data (table, number or other value).
---@param parent table|nil Parent context.
---@return table  New context {view, parent, cache}.
function libs_lustach_src_lustache_context.new(self, view, parent) end

--- Creates a child context for `view` whose parent is the current context (entering a section).
---Source: lua/common/libs/lustach/src/lustache/context.lua:11
---@param self any
---@param view any Section data.
---@return table  Child context.
function libs_lustach_src_lustache_context.push(self, view) end

return libs_lustach_src_lustache_context
