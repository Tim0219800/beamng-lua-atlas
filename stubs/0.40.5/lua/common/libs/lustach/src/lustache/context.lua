---@meta
-- tim19Atlas stub generated from lua/common/libs/lustach/src/lustache/context.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : `require("libs/lustach/src/lustache/context")`
---@class libs_lustach_src_lustache_context
---@field __index table
local libs_lustach_src_lustache_context = {}

---Source : lua/common/libs/lustach/src/lustache/context.lua:7
---@param self any
function libs_lustach_src_lustache_context.clear_cache(self) end

---Source : lua/common/libs/lustach/src/lustache/context.lua:15
---@param self any
---@param name any
function libs_lustach_src_lustache_context.lookup(self, name) end

---Source : lua/common/libs/lustach/src/lustache/context.lua:57
---@param self any
---@param view any
---@param parent any
function libs_lustach_src_lustache_context.new(self, view, parent) end

---Source : lua/common/libs/lustach/src/lustache/context.lua:11
---@param self any
---@param view any
function libs_lustach_src_lustache_context.push(self, view) end

return libs_lustach_src_lustache_context
