---@meta
-- tim19Atlas stub generated from lua/common/libs/lustach/src/lustache/renderer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Third-party library lustache: core of the Mustache engine. The renderer parses a template (`parse`) into a token tree (text, variables, `#` sections, `^` inverted sections, `>` partials, triple braces `{`/`&`, delimiter change `=`), compiles it into a function _anon(`compile`) and renders it with a view (`render`). Compiled templates are cached. `{{x}}` values are HTML-escaped; `{{{x}}}` and `{{&x}}` are not.
--- Access: global `renderer`
---@class renderer
renderer = {}

--- Renders an inverted section `{{^name}}` only if the value is nil, false or an empty array. Internal.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/lustach/src/lustache/renderer.lua:238
---@param self any
---@param name string Name tested.
---@param context table Current context.
---@param callback function Rendering of the content.
---@return string  Rendered text or "".
function renderer._inverted(self, name, context, callback) end

--- Renders a variable: resolves the name (calls the value if it is a function, with the view), converts to string (nil becomes "") and HTML-escapes if `escape` is true. Internal.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/lustach/src/lustache/renderer.lua:270
---@param self any
---@param name string Variable name.
---@param context table Current context.
---@param escape boolean true for {{x}}, false for {{{x}}} and {{&x}}.
---@return string  Text (with, when escape is true, a second return value: the number of gsub replacements).
function renderer._name(self, name, context, escape) end

--- Renders the partial `{{>name}}` from self.partials (compiled then cached); "" if the partial is absent. Internal.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/lustach/src/lustache/renderer.lua:252
---@param self any
---@param name string Partial name.
---@param context table Current context.
---@param originalTemplate string Original template.
---@return string  Rendered text.
function renderer._partial(self, name, context, originalTemplate) end

--- Renders a section `{{#name}}...{{/name}}` according to the value of the name (array: iteration; table: sub-context; function: call with the raw text; otherwise truthy value). Internal.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/lustach/src/lustache/renderer.lua:206
---@param self any
---@param token table Section token.
---@param context table Current context.
---@param callback function Rendering of the section content.
---@param originalTemplate string Original template.
---@return string  Rendered text.
function renderer._section(self, token, context, callback, originalTemplate) end

--- Clears the cache of compiled templates and that of partials.
---Source: lua/common/libs/lustach/src/lustache/renderer.lua:163
---@param self any
function renderer.clear_cache(self) end

--- Compiles a template (string) or a list of tokens into a function `function(view) -> string`.
---Source: lua/common/libs/lustach/src/lustache/renderer.lua:168
---@param self any
---@param tokens string|table Raw template (parsed by parse) or token tree.
---@param tags string[]|nil Delimiters {opening, closing}; default self.tags.
---@param originalTemplate string|nil Original text, needed to extract the raw text of function sections.
---@return function  Render function taking the view.
function renderer.compile(self, tokens, tags, originalTemplate) end

--- Creates a renderer instance (empty caches, {{ }} delimiters).
---Source: lua/common/libs/lustach/src/lustache/renderer.lua:379
---@param self table Renderer class (call with a colon).
---@return table  Instance.
function renderer.new(self) end

--- Splits the template into a token tree. `tags` is an array of two strings (opening and closing delimiter, mustaches by default). Raises an error "Unclosed tag at <pos>", "Unopened section" or "Unclosed section".
---Source: lua/common/libs/lustach/src/lustache/renderer.lua:291
---@param self any
---@param template string Template text.
---@param tags string[]|nil Custom delimiters.
---@return table  Token tree {type, value, startIndex, endIndex, tokens?}.
function renderer.parse(self, template, tags) end

--- Renders the template `template` with `view`. Compiles and caches the template on the first call. If `partials` is provided, it is stored as the partials table. Returns "" if `template` is nil. Error if called with a dot (`self` is a string).
---Source: lua/common/libs/lustach/src/lustache/renderer.lua:181
---@param self any
---@param template string|nil Template text.
---@param view table|Context|nil Data; a table is wrapped in a Context.
---@param partials table<string, string>|nil Partials: name -> template text.
---@return string  Rendered text.
function renderer.render(self, template, view, partials) end

