# `libs_lunajson_lunajson_decoder`

*File: `lua/common/libs/lunajson/lunajson/decoder.lua` · VM: Common (GE + vehicle) · 515 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/lunajson/lunajson/decoder")`

Third-party library lunajson: JSON decoder. The module returns a factory `newdecoder()`; each call creates an independent decoding context and returns the function `decode(json, pos?, nullv?, arraylen?)`. The decoder handles numbers (integers and floats), strings with escapes and Unicode surrogate pairs, and limits the nesting depth to 1000.

## Example

```lua
local newdecoder = require('libs/lunajson/lunajson.decoder')
local decode = newdecoder()
local t = decode('[1, 2, {"a": null}]', nil, false)
```

## Notes

- The module does not define a named exported function: it directly returns the factory function `newdecoder`.
- decode(json, pos, nullv, arraylen): `json` is the string; `pos` (optional) is the start position, and if provided the function returns (value, next position) without requiring the end of the string; `nullv` replaces JSON nulls (nil by default); `arraylen` set to true stores the length of each array in ary[0].
- Errors raised in the form "parse error at <pos>: <message>" (invalid value, invalid number, unterminated string, invalid escape sequence, nesting > 1000, unexpected end, content after the value).
- The context (position, null value...) is shared in the closure: a single decoder must not be re-entered during a decode.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/lunajson/lunajson/decoder.lua`.*
