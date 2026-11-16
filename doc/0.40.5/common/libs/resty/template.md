# `libs_resty_template`

*File: `lua/common/libs/resty/template.lua` · VM: Common (GE + vehicle) · 479 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/resty/template")`

Third-party library lua-resty-template (version 1.9, designed for OpenResty/nginx but usable in pure Lua): template engine that converts tagged text into compiled Lua code. Tags: `{{expr}}` (HTML-escaped output), `{*expr*}` (raw output), `{% code %}` (Lua code), `{# comment #}`, `{(file)}` / `{(file, context)}` (include), `{[expr]}` (dynamic include), `{-block-}...{-block-}` (layout blocks), `{-verbatim-}`/`{-raw-}` (uninterpreted text). A `\` before a tag escapes it.

## Example

```lua
local template = require('libs/resty/template')
local f = template.compile('Bonjour {{nom}} !')
print(f({nom = 'Tim'}))
print(template.renderReturn('{% for i = 1, 3 do %}{*i*} {% end %}', {}))
```

## Notes

- Outside nginx (ngx == nil), `template.load` reads the file at the given path or, if it does not exist, uses the string as the template text; `template.print` is io.write.
- Bug: `template.new(view, layout)` uses `template.render`, which is not defined anywhere in this file (only `renderReturn` exists); calling `:render()` on an object without a layout table (or with a string layout) therefore fails (call of nil).
- The generated code is loaded with `load` in an environment that falls back to the context, then `template`, then the globals; the template can therefore read the game's globals.
- Compiled templates are cached in `template.cache` (key = template text or `key`) as long as `caching` is active; the special key "no-cache" bypasses the cache.
- Precompiled templates (bytecode, first byte 27) are accepted by `parse` as is.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_resty_template.caching(enable)` | Enables/disables the compilation cache if `enable` is given, and returns the current state. | 166 |
| `libs_resty_template.compile(view, key, plain)` | Parses and compiles a template into a function `f(context)`. Caches the result under `key` (by default the template text). | 236 |
| `libs_resty_template.escape(s, c)` | HTML-escapes a string (& < > " ' /). If `c` is true, also escapes { and } (code mode). Non-string values go through `output`. | 177 |
| `libs_resty_template.new(view, layout)` | Creates a template object with `render(context)` and `tostring`, with an optional layout, table or text. | 185 |
| `libs_resty_template.output(s)` | Converts a value to output text: nil (or ngx.null) -> "", function -> result of its call, otherwise tostring. | 171 |
| `libs_resty_template.parse(view, plain)` | Translates the template into Lua source code (string) ready for load. | 249 |
| `libs_resty_template.precompile(view, path, strip)` | Compiles the template and returns its bytecode (string.dump); writes it to `path` if provided. | 226 |
| `libs_resty_template.renderReturn(view, context, key, plain)` | Compiles (with cache) then runs the template with `context` and returns the produced text. | 473 |

### Parameter details

#### `libs_resty_template.caching(enable)`

Enables/disables the compilation cache if `enable` is given, and returns the current state.

- `enable` (*boolean|nil*) : true to enable, false to disable; nil leaves it unchanged.
- **returns**: boolean Cache state.

#### `libs_resty_template.compile(view, key, plain)`

Parses and compiles a template into a function `f(context)`. Caches the result under `key` (by default the template text).

- `view` (*string*) : Template or path.
- `key` (*string|nil*) : Cache key; "no-cache" disables the cache for this call.
- `plain` (*boolean|nil*) : If true, `view` is raw text (no file loading).
- **returns**: function Render function.
- **returns**: boolean true if it comes from the cache.

#### `libs_resty_template.escape(s, c)`

HTML-escapes a string (& < > " ' /). If `c` is true, also escapes { and } (code mode). Non-string values go through `output`.

- `s` (*any*) : Value.
- `c` (*boolean|nil*) : Also escape the braces.
- **returns**: string Escaped text (the string version also returns the number of replacements).

#### `libs_resty_template.new(view, layout)`

Creates a template object with `render(context)` and `tostring`, with an optional layout, table or text.

- `view` (*string*) : Template (text or path).
- `layout` (*string|table|nil*) : Layout template; receives the rendered `view` in context.view.
- **returns**: table Object {render} with __tostring.

#### `libs_resty_template.output(s)`

Converts a value to output text: nil (or ngx.null) -> "", function -> result of its call, otherwise tostring.

- `s` (*any*) : Value to display.
- **returns**: string Text.

#### `libs_resty_template.parse(view, plain)`

Translates the template into Lua source code (string) ready for load.

- `view` (*string*) : Template or path.
- `plain` (*boolean|nil*) : If true, does not go through template.load.
- **returns**: string Lua code (or bytecode if the template already is).

#### `libs_resty_template.precompile(view, path, strip)`

Compiles the template and returns its bytecode (string.dump); writes it to `path` if provided.

- `view` (*string*) : Template.
- `path` (*string|nil*) : Output file (io.open, mode wb).
- `strip` (*boolean|nil*) : Strip the debug info (default true).
- **returns**: string Bytecode.

#### `libs_resty_template.renderReturn(view, context, key, plain)`

Compiles (with cache) then runs the template with `context` and returns the produced text.

- `view` (*string*) : Template.
- `context` (*table*) : Variables available in the template.
- `key` (*string|nil*) : Cache key.
- `plain` (*boolean|nil*) : Template as raw text.
- **returns**: string Rendered text.

## Fields

| Field | Type | Description |
|---|---|---|
| `_VERSION` | string | Module version: "1.9". |
| `cache` | table<string, function> | Cache of compiled templates. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/resty/template.lua`.*
