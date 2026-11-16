# `libs_lunajson_lunajson_encoder`

*File: `lua/common/libs/lunajson/lunajson/encoder.lua` · VM: Common (GE + vehicle) · 185 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/lunajson/lunajson/encoder")`

Third-party library lunajson: JSON encoder. The module returns a factory `newencoder()`; each call creates an independent context and returns the function `encode(value, nullv?)`, which serializes booleans, numbers, strings and tables (array or object, automatic detection) into a compact JSON string.

## Example

```lua
local newencoder = require('libs/lunajson/lunajson.encoder')
local encode = newencoder()
local s = encode({a = {1, 2, 3}})
```

## Notes

- The module directly returns the factory function `newencoder`.
- encode(value, nullv): any value equal to `nullv` is written as `null`.
- Errors raised: "loop detected" (table that contains itself), "non-string key" (object with a non-string key), "invalid number" (NaN or infinity), "invalid type value" (function, userdata, nil not replaced by nullv...).
- Numbers are written with `%.17g` (full round-trip precision).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/lunajson/lunajson/encoder.lua`.*
