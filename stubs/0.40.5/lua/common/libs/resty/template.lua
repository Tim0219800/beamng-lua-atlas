---@meta
-- tim19Atlas stub generated from lua/common/libs/resty/template.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Third-party library lua-resty-template (version 1.9, designed for OpenResty/nginx but usable in pure Lua): template engine that converts tagged text into compiled Lua code. Tags: `{{expr}}` (HTML-escaped output), `{*expr*}` (raw output), `{% code %}` (Lua code), `{# comment #}`, `{(file)}` / `{(file, context)}` (include), `{[expr]}` (dynamic include), `{-block-}...{-block-}` (layout blocks), `{-verbatim-}`/`{-raw-}` (uninterpreted text). A `\` before a tag escapes it.
--- Access: `require("libs/resty/template")`
---@class libs_resty_template
---@field _VERSION string Module version: "1.9".
---@field cache table<string, function> Cache of compiled templates.
local libs_resty_template = {}

--- Enables/disables the compilation cache if `enable` is given, and returns the current state.
---Source: lua/common/libs/resty/template.lua:166
---@param enable boolean|nil true to enable, false to disable; nil leaves it unchanged.
---@return boolean  Cache state.
function libs_resty_template.caching(enable) end

--- Parses and compiles a template into a function `f(context)`. Caches the result under `key` (by default the template text).
---Source: lua/common/libs/resty/template.lua:236
---@param view string Template or path.
---@param key string|nil Cache key; "no-cache" disables the cache for this call.
---@param plain boolean|nil If true, `view` is raw text (no file loading).
---@return function  Render function.
---@return boolean  true if it comes from the cache.
function libs_resty_template.compile(view, key, plain) end

--- HTML-escapes a string (& < > " ' /). If `c` is true, also escapes { and } (code mode). Non-string values go through `output`.
---Source: lua/common/libs/resty/template.lua:177
---@param s any Value.
---@param c boolean|nil Also escape the braces.
---@return string  Escaped text (the string version also returns the number of replacements).
function libs_resty_template.escape(s, c) end

--- Creates a template object with `render(context)` and `tostring`, with an optional layout, table or text.
---Source: lua/common/libs/resty/template.lua:185
---@param view string Template (text or path).
---@param layout string|table|nil Layout template; receives the rendered `view` in context.view.
---@return table  Object {render} with __tostring.
function libs_resty_template.new(view, layout) end

--- Converts a value to output text: nil (or ngx.null) -> "", function -> result of its call, otherwise tostring.
---Source: lua/common/libs/resty/template.lua:171
---@param s any Value to display.
---@return string  Text.
function libs_resty_template.output(s) end

--- Translates the template into Lua source code (string) ready for load.
---Source: lua/common/libs/resty/template.lua:249
---@param view string Template or path.
---@param plain boolean|nil If true, does not go through template.load.
---@return string  Lua code (or bytecode if the template already is).
function libs_resty_template.parse(view, plain) end

--- Compiles the template and returns its bytecode (string.dump); writes it to `path` if provided.
---Source: lua/common/libs/resty/template.lua:226
---@param view string Template.
---@param path string|nil Output file (io.open, mode wb).
---@param strip boolean|nil Strip the debug info (default true).
---@return string  Bytecode.
function libs_resty_template.precompile(view, path, strip) end

--- Compiles (with cache) then runs the template with `context` and returns the produced text.
---Source: lua/common/libs/resty/template.lua:473
---@param view string Template.
---@param context table Variables available in the template.
---@param key string|nil Cache key.
---@param plain boolean|nil Template as raw text.
---@return string  Rendered text.
function libs_resty_template.renderReturn(view, context, key, plain) end

return libs_resty_template
