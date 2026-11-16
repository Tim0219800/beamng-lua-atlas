# `libs_lunajson_lunajson_sax`

*File: `lua/common/libs/lunajson/lunajson/sax.lua` · VM: Common (GE + vehicle) · 719 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/lunajson/lunajson/sax")`

Third-party library lunajson: SAX-type (event-driven) JSON parser. You give it a table of callbacks; it calls them as it reads without building the full tree, which allows processing large files or streams split into chunks.

## Example

```lua
local sax = require('libs/lunajson/lunajson.sax')
local p = sax.newparser('{"a":[1,2]}', {
  startobject = function() print('{') end,
  key = function(k) print('key', k) end,
  number = function(n) print('num', n) end,
  endobject = function() print('}') end,
})
p.run()
```

## Notes

- Callbacks recognized in `saxtbl` (all optional): startobject, key, endobject, startarray, endarray, string, number, boolean, null.
- The object returned by newparser contains run() (starts parsing), tryc() (reads the next non-blank character), read(n) (reads n raw bytes, n >= 0) and tellpos() (absolute position in the stream).
- `src` can be a string or a no-argument function that successively returns pieces of text (nil at the end).

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_lunajson_lunajson_sax.newfileparser(fn, saxtbl)` | Like newparser, but reads the file `fn` in 8192-byte blocks (the file is opened with io.open then closed at the end of reading). | 700 |
| `libs_lunajson_lunajson_sax.newparser(src, saxtbl)` | Creates a SAX parser on a JSON string or on a source function that supplies the text in pieces. | 30 |

### Parameter details

#### `libs_lunajson_lunajson_sax.newfileparser(fn, saxtbl)`

Like newparser, but reads the file `fn` in 8192-byte blocks (the file is opened with io.open then closed at the end of reading).

- `fn` (*string*) : Path of the JSON file (io.open, real disk path).
- `saxtbl` (*table*) : Callback table (see newparser).
- **returns**: table Object {run, tryc, read, tellpos}.

#### `libs_lunajson_lunajson_sax.newparser(src, saxtbl)`

Creates a SAX parser on a JSON string or on a source function that supplies the text in pieces.

- `src` (*string|function*) : JSON text, or function returning the next piece (nil when done).
- `saxtbl` (*table*) : Callback table: startobject, key, endobject, startarray, endarray, string, number, boolean, null.
- **returns**: table Object {run, tryc, read, tellpos}.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/lunajson/lunajson/sax.lua`.*
