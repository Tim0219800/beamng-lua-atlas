# `libs_lunajson_lunajson`

*File: `lua/common/libs/lunajson/lunajson.lua` · VM: Common (GE + vehicle) · 12 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/lunajson/lunajson")`

Third-party library lunajson (fast pure-Lua JSON decoder/encoder). This file is the entry point: it creates a default decoder and encoder and also exposes the SAX (event-driven) parser. To have several independent contexts, you can require lunajson/decoder or lunajson/encoder directly. The game also provides its own jsonEncode/jsonDecode functions; this is the raw library.

## Example

```lua
local lunajson = require('libs/lunajson/lunajson')
local t = lunajson.decode('{"a":[1,2,3]}')
local s = lunajson.encode(t)
```

## Notes

- The file does `require 'libs/lunajson/lunajson.decoder'` (dot separator); the submodules are the files `lunajson/decoder.lua`, `encoder.lua` and `sax.lua`.
- `decode(json, pos?, nullv?, arraylen?)`: if `pos` is given, also returns the position where decoding stopped (and does not require the end of the string); `nullv` replaces the JSON null (nil by default); if `arraylen` is true, the length of each decoded array is stored at index 0 (`ary[0]`).
- `encode(value, nullv?)`: non-string keys in an object and circular references cause an error.

## Fields

| Field | Type | Description |
|---|---|---|
| `decode` | function | Decodes a JSON string into a Lua value (see lunajson/decoder). |
| `encode` | function | Encodes a Lua value into a JSON string (see lunajson/encoder). |
| `newfileparser` | function | Creates a SAX parser reading a file in 8192-byte blocks (see lunajson/sax). |
| `newparser` | function | Creates a SAX parser on a string or a source function (see lunajson/sax). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/lunajson/lunajson.lua`.*
