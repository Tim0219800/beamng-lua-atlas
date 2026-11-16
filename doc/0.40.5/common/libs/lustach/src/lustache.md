# `libs_lustach_src_lustache`

*File: `lua/common/libs/lustach/src/lustache.lua` · VM: Common (GE + vehicle) · 28 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/lustach/src/lustache")`

Third-party library lustache (Olivine Labs, MIT license, version 1.3.1-0): Mustache template engine in Lua. This file is the entry point: it creates a renderer and exposes its methods (render, compile, parse, clear_cache) directly on the `lustache` table. The `partials` and `tags` keys can be assigned to define the partials and the delimiters.

## Example

```lua
local lustache = require('common/libs/lustach/src/lustache')
print(lustache:render('Bonjour {{nom}} !', {nom = 'Tim'}))
```

## Notes

- Call the methods with a colon (`lustache:render(...)`): the renderer detects and rejects `lustache.render(...)` with a string as the first argument.
- The file adds a global function `string.split_lustache(str, sep)` (splits on the characters of `sep` taken as a character class) used by the context and the renderer.
- The module is required under the path `common/libs/lustach/src/lustache` (the folder is named `lustach`, without an "e").
- Only the `partials` and `tags` keys are writable on the module (via __newindex); other writes are ignored.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/lustach/src/lustache.lua`.*
