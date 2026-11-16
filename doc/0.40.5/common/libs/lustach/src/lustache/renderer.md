# `renderer`

*File: `lua/common/libs/lustach/src/lustache/renderer.lua` · VM: Common (GE + vehicle) · 389 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `renderer`

Third-party library lustache: core of the Mustache engine. The renderer parses a template (`parse`) into a token tree (text, variables, `#` sections, `^` inverted sections, `>` partials, triple braces `{`/`&`, delimiter change `=`), compiles it into a function (`compile`) and renders it with a view (`render`). Compiled templates are cached. `{{x}}` values are HTML-escaped; `{{{x}}}` and `{{&x}}` are not.

## Example

```lua
local renderer = require('common/libs/lustach/src/lustache/renderer'):new()
print(renderer:render('{{#items}}<{{.}}>{{/items}}', {items = {1, 2, 3}}))  -- <1><2><3>
```

## Notes

- The file returns the `renderer` table (local variable); the auto page says "global renderer" but the code does not create a global. An instance is obtained with `renderer:new()` (fields cache, partial_cache, tags = {"{{","}}"}).
- Sections: an array table (contiguous indices 1..n) is iterated; another table becomes the context; a function receives (raw_section_text, render_function); any other truthy value renders the section as is.
- Bug: in nest_tokens, the test `not section.value == token.value` is evaluated as `(not section.value) == token.value`; a section close that does not match the open is therefore not detected (only the "Unopened section" and "Unclosed section" cases are).
- HTML escaping: & < > " ' / are replaced by &amp; &lt; &gt; &quot; &#39; &#x2F;.
- `_partial` reads `self.partials[name]` and compiles the partial; partials are memoized by name in partial_cache (the cache is not invalidated if the partials table is changed without calling clear_cache).
- Methods prefixed with `_` (_section, _inverted, _partial, _name) are internal, called by the compiled code.

## Functions

| Function | Description | Line |
|---|---|---|
| `renderer._inverted(self, name, context, callback)` | Renders an inverted section `{{^name}}` only if the value is nil, false or an empty array. Internal. *(internal)* | 238 |
| `renderer._name(self, name, context, escape)` | Renders a variable: resolves the name (calls the value if it is a function, with the view), converts to string (nil becomes "") and HTML-escapes if `escape` is true. Internal. *(internal)* | 270 |
| `renderer._partial(self, name, context, originalTemplate)` | Renders the partial `{{>name}}` from self.partials (compiled then cached); "" if the partial is absent. Internal. *(internal)* | 252 |
| `renderer._section(self, token, context, callback, originalTemplate)` | Renders a section `{{#name}}...{{/name}}` according to the value of the name (array: iteration; table: sub-context; function: call with the raw text; otherwise truthy value). Internal. *(internal)* | 206 |
| `renderer.clear_cache(self)` | Clears the cache of compiled templates and that of partials. | 163 |
| `renderer.compile(self, tokens, tags, originalTemplate)` | Compiles a template (string) or a list of tokens into a function `function(view) -> string`. | 168 |
| `renderer.new(self)` | Creates a renderer instance (empty caches, {{ }} delimiters). | 379 |
| `renderer.parse(self, template, tags)` | Splits the template into a token tree. `tags` is an array of two strings (opening and closing delimiter, mustaches by default). Raises an error "Unclosed tag at <pos>", "Unopened section" or "Unclosed section". | 291 |
| `renderer.render(self, template, view, partials)` | Renders the template `template` with `view`. Compiles and caches the template on the first call. If `partials` is provided, it is stored as the partials table. Returns "" if `template` is nil. Error if called with a dot (`self` is a string). | 181 |

### Parameter details

#### `renderer._inverted(self, name, context, callback)`

Renders an inverted section `{{^name}}` only if the value is nil, false or an empty array. Internal.

- `self` (*any*) : 
- `name` (*string*) : Name tested.
- `context` (*table*) : Current context.
- `callback` (*function*) : Rendering of the content.
- **returns**: string Rendered text or "".

#### `renderer._name(self, name, context, escape)`

Renders a variable: resolves the name (calls the value if it is a function, with the view), converts to string (nil becomes "") and HTML-escapes if `escape` is true. Internal.

- `self` (*any*) : 
- `name` (*string*) : Variable name.
- `context` (*table*) : Current context.
- `escape` (*boolean*) : true for {{x}}, false for {{{x}}} and {{&x}}.
- **returns**: string Text (with, when escape is true, a second return value: the number of gsub replacements).

#### `renderer._partial(self, name, context, originalTemplate)`

Renders the partial `{{>name}}` from self.partials (compiled then cached); "" if the partial is absent. Internal.

- `self` (*any*) : 
- `name` (*string*) : Partial name.
- `context` (*table*) : Current context.
- `originalTemplate` (*string*) : Original template.
- **returns**: string Rendered text.

#### `renderer._section(self, token, context, callback, originalTemplate)`

Renders a section `{{#name}}...{{/name}}` according to the value of the name (array: iteration; table: sub-context; function: call with the raw text; otherwise truthy value). Internal.

- `self` (*any*) : 
- `token` (*table*) : Section token.
- `context` (*table*) : Current context.
- `callback` (*function*) : Rendering of the section content.
- `originalTemplate` (*string*) : Original template.
- **returns**: string Rendered text.

#### `renderer.compile(self, tokens, tags, originalTemplate)`

Compiles a template (string) or a list of tokens into a function `function(view) -> string`.

- `self` (*any*) : 
- `tokens` (*string|table*) : Raw template (parsed by parse) or token tree.
- `tags` (*string[]|nil*) : Delimiters {opening, closing}; default self.tags.
- `originalTemplate` (*string|nil*) : Original text, needed to extract the raw text of function sections.
- **returns**: function Render function taking the view.

#### `renderer.new(self)`

Creates a renderer instance (empty caches, {{ }} delimiters).

- `self` (*table*) : Renderer class (call with a colon).
- **returns**: table Instance.

#### `renderer.parse(self, template, tags)`

Splits the template into a token tree. `tags` is an array of two strings (opening and closing delimiter, mustaches by default). Raises an error "Unclosed tag at <pos>", "Unopened section" or "Unclosed section".

- `self` (*any*) : 
- `template` (*string*) : Template text.
- `tags` (*string[]|nil*) : Custom delimiters.
- **returns**: table Token tree {type, value, startIndex, endIndex, tokens?}.

#### `renderer.render(self, template, view, partials)`

Renders the template `template` with `view`. Compiles and caches the template on the first call. If `partials` is provided, it is stored as the partials table. Returns "" if `template` is nil. Error if called with a dot (`self` is a string).

- `self` (*any*) : 
- `template` (*string|nil*) : Template text.
- `view` (*table|Context|nil*) : Data; a table is wrapped in a Context.
- `partials` (*table<string, string>|nil*) : Partials: name -> template text.
- **returns**: string Rendered text.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/lustach/src/lustache/renderer.lua`.*
