---@meta
-- tim19Atlas stub generated from lua/common/libs/resty/template.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : `require("libs/resty/template")`
---@class libs_resty_template
---@field _VERSION string
---@field cache table
local libs_resty_template = {}

---Source : lua/common/libs/resty/template.lua:166
---@param enable any
function libs_resty_template.caching(enable) end

---Source : lua/common/libs/resty/template.lua:236
---@param view any
---@param key any
---@param plain any
function libs_resty_template.compile(view, key, plain) end

---Source : lua/common/libs/resty/template.lua:177
---@param s any
---@param c any
function libs_resty_template.escape(s, c) end

---Source : lua/common/libs/resty/template.lua:185
---@param view any
---@param layout any
function libs_resty_template.new(view, layout) end

---Source : lua/common/libs/resty/template.lua:171
---@param s any
function libs_resty_template.output(s) end

---Source : lua/common/libs/resty/template.lua:249
---@param view any
---@param plain any
function libs_resty_template.parse(view, plain) end

---Source : lua/common/libs/resty/template.lua:226
---@param view any
---@param path any
---@param strip any
function libs_resty_template.precompile(view, path, strip) end

---Source : lua/common/libs/resty/template.lua:473
---@param view any
---@param context any
---@param key any
---@param plain any
function libs_resty_template.renderReturn(view, context, key, plain) end

return libs_resty_template
