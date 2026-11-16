# `libs_lustach_src_lustache_context`

*File: `lua/common/libs/lustach/src/lustache/context.lua` · VM: Common (GE + vehicle) · 67 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/lustach/src/lustache/context")`

Third-party library lustache: Mustache rendering context. A context wraps the current view (data table), keeps a link to the parent context (section nesting stack) and a name-resolution cache. The renderer uses it to resolve `{{name}}`, `{{a.b.c}}` and `{{.}}`.

## Notes

- The methods are called with a colon on an instance created by `Context:new(view, parent)`; `new` returns a table whose metatable is `context` itself.
- Minor bug: `lookup` tests `string_find(name, ".") > 0`; the pattern "." matches any character, so the condition is always true for a non-empty name and the dot-split path is always taken (the result remains correct).
- `false` or nil values are not cached effectively (the `if not value` test restarts the lookup) and the lookup then goes up to the parent contexts.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_lustach_src_lustache_context.clear_cache(self)` | Clears the resolution cache of this context. | 7 |
| `libs_lustach_src_lustache_context.lookup(self, name)` | Resolves a name in the current view, then, failing that, in the parent contexts. Handles dotted paths (`a.b.c`) and the name `.` (the view itself). The result is cached. | 15 |
| `libs_lustach_src_lustache_context.new(self, view, parent)` | Creates a context for `view` with an optional parent and an empty cache. | 57 |
| `libs_lustach_src_lustache_context.push(self, view)` | Creates a child context for `view` whose parent is the current context (entering a section). | 11 |

### Parameter details

#### `libs_lustach_src_lustache_context.lookup(self, name)`

Resolves a name in the current view, then, failing that, in the parent contexts. Handles dotted paths (`a.b.c`) and the name `.` (the view itself). The result is cached.

- `self` (*any*) : 
- `name` (*string*) : Name or path to resolve.
- **returns**: any Value found, or nil.

#### `libs_lustach_src_lustache_context.new(self, view, parent)`

Creates a context for `view` with an optional parent and an empty cache.

- `self` (*table*) : Context class (call with a colon).
- `view` (*any*) : Context data (table, number or other value).
- `parent` (*table|nil*) : Parent context.
- **returns**: table New context {view, parent, cache}.

#### `libs_lustach_src_lustache_context.push(self, view)`

Creates a child context for `view` whose parent is the current context (entering a section).

- `self` (*any*) : 
- `view` (*any*) : Section data.
- **returns**: table Child context.

## Fields

| Field | Type | Description |
|---|---|---|
| `__index` | table | Self-reference of the class (the `context` table serves as metatable). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/lustach/src/lustache/context.lua`.*
