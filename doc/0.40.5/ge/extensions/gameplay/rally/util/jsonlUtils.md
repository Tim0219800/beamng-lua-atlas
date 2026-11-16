# `gameplay_rally_util_jsonlUtils`

*File: `lua/ge/extensions/gameplay/rally/util/jsonlUtils.lua` · VM: Game Engine (GE) · 87 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_util_jsonlUtils`: `extensions.load("gameplay_rally_util_jsonlUtils")`, then the global `gameplay_rally_util_jsonlUtils`

Utilities for reading JSONL files (one JSON object per line), used to load the rally recce recordings (driveline, cuts, transcriptions). Empty lines and those starting with `//` are ignored by parseJsonlFile.

## Example

```lua
local objs, err = gameplay_rally_util_jsonlUtils.parseJsonlFile(fname, function(o) return o end, rallyUtil)
```

## Notes

- parseJsonlFile calls rallyUtil.trimString: the caller must pass the gameplay/rally/util module.
- readJsonlLines skips neither empty lines nor `//` comments; jsonDecode will be called on each line as is.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_util_jsonlUtils.parseJsonlFile(fname, processLine, rallyUtil)` | Reads a JSONL file, decodes each non-empty, non-comment line, optionally applies processLine to the object and accumulates the non-nil results. | 39 |
| `gameplay_rally_util_jsonlUtils.readFileToMemory(fname)` | Reads a whole file into memory with io.open. | 17 |
| `gameplay_rally_util_jsonlUtils.readJsonlLines(fname, callback)` | Simple reader based on io.lines (compatibility). Calls callback(obj) for each decoded line. | 70 |
| `gameplay_rally_util_jsonlUtils.splitIntoLines(content)` | Splits a text into lines on \r and \n; empty lines disappear. | 27 |
| `gameplay_rally_util_jsonlUtils.startsWithDoubleSlash(line)` | Tests whether the line starts with `//` (comment marker). | 11 |

### Parameter details

#### `gameplay_rally_util_jsonlUtils.parseJsonlFile(fname, processLine, rallyUtil)`

Reads a JSONL file, decodes each non-empty, non-comment line, optionally applies processLine to the object and accumulates the non-nil results.

- `fname` (*string*) : File path.
- `processLine` (*function|nil*) : Receives the decoded object, returns the object to keep or nil to ignore it.
- `rallyUtil` (*table*) : Rally util module (provides trimString).
- **returns**: table|nil List of objects, or nil on error.
- **returns**: string|nil Error message: "file not found" or "failed to read file".

#### `gameplay_rally_util_jsonlUtils.readFileToMemory(fname)`

Reads a whole file into memory with io.open.

- `fname` (*string*) : File path.
- **returns**: string|nil Content, or nil if opening fails.

#### `gameplay_rally_util_jsonlUtils.readJsonlLines(fname, callback)`

Simple reader based on io.lines (compatibility). Calls callback(obj) for each decoded line.

- `fname` (*string*) : File path.
- `callback` (*function|nil*) : Called with the decoded object of each line.
- **returns**: boolean false if the file does not exist, otherwise true.

#### `gameplay_rally_util_jsonlUtils.splitIntoLines(content)`

Splits a text into lines on \r and \n; empty lines disappear.

- `content` (*string*) : Text to split.
- **returns**: string[] List of non-empty lines.

#### `gameplay_rally_util_jsonlUtils.startsWithDoubleSlash(line)`

Tests whether the line starts with `//` (comment marker).

- `line` (*string*) : Line to test.
- **returns**: boolean true if the line starts with //.

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/util/jsonlUtils.lua`.*
