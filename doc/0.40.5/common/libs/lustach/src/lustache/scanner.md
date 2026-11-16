# `libs_lustach_src_lustache_scanner`

*File: `lua/common/libs/lustach/src/lustache/scanner.lua` · VM: Common (GE + vehicle) · 58 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/lustach/src/lustache/scanner")`

Third-party library lustache: string scanner used by the template parser. It keeps the remaining "tail" of the string (`tail`) and the current position (`pos`) and advances by consuming text with Lua patterns.

## Notes

- Instance created by `Scanner:new(str)`: fields str, tail (remainder to read) and pos (position, starts at 1).
- The source comments talk about "null"; in Lua, `scan` returns nil when the pattern does not match at the start of the tail.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_lustach_src_lustache_scanner.eos(self)` | True if the tail is empty (end of string). | 7 |
| `libs_lustach_src_lustache_scanner.new(self, str)` | Creates a scanner on `str` (tail = str, pos = 1). | 48 |
| `libs_lustach_src_lustache_scanner.scan(self, pattern)` | Tries to match `pattern` exactly at the start of the tail; if so, consumes and returns the text found, otherwise returns nil. | 13 |
| `libs_lustach_src_lustache_scanner.scan_until(self, pattern)` | Advances to the next match of `pattern` and returns the skipped text. Returns the whole tail if there is no match; returns nil if the pattern matches right at the current position. | 28 |

### Parameter details

#### `libs_lustach_src_lustache_scanner.eos(self)`

True if the tail is empty (end of string).

- `self` (*any*) : 
- **returns**: boolean true at the end.

#### `libs_lustach_src_lustache_scanner.new(self, str)`

Creates a scanner on `str` (tail = str, pos = 1).

- `self` (*table*) : Scanner class (call with a colon).
- `str` (*string*) : Text to scan.
- **returns**: table Scanner instance.

#### `libs_lustach_src_lustache_scanner.scan(self, pattern)`

Tries to match `pattern` exactly at the start of the tail; if so, consumes and returns the text found, otherwise returns nil.

- `self` (*any*) : 
- `pattern` (*string*) : Lua pattern.
- **returns**: string|nil Consumed text or nil.

#### `libs_lustach_src_lustache_scanner.scan_until(self, pattern)`

Advances to the next match of `pattern` and returns the skipped text. Returns the whole tail if there is no match; returns nil if the pattern matches right at the current position.

- `self` (*any*) : 
- `pattern` (*string*) : Lua pattern.
- **returns**: string|nil Skipped text, or nil.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/lustach/src/lustache/scanner.lua`.*
