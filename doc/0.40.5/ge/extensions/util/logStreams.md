# `util_logStreams`

*File: `lua/ge/extensions/util/logStreams.lua` · VM: Game Engine (GE) · 45 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_logStreams`: `extensions.load("util_logStreams")`, then the global `util_logStreams`

Small I/O utility to save and reread logged "streams" (vehicle data streams) in three formats in the user folder: loggedStreams.json, loggedStreams.txt (wikitable) and loggedStreams.rst. The functions only read/write these files; the content generation is done elsewhere.

## Notes

- readWikitable and readRst replace line breaks with the literal sequence \n ("huge hack" according to the code comment), so that the text can be passed as a string.
- readWikitable/readRst fail (Lua error on nil) if the file does not exist, because readFile returns nil.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_logStreams.readJson()` | Reads and decodes loggedStreams.json. | 16 |
| `util_logStreams.readRst()` | Reads loggedStreams.rst, replacing each line break with the literal sequence \n. | 33 |
| `util_logStreams.readWikitable()` | Reads loggedStreams.txt, replacing each line break with the literal sequence \n. | 24 |
| `util_logStreams.saveJson(data)` | Writes data to loggedStreams.json (jsonWriteFile, readable format). | 12 |
| `util_logStreams.saveRst(data)` | Writes the given text to loggedStreams.rst. | 29 |
| `util_logStreams.saveWikitable(data)` | Writes the given text to loggedStreams.txt. | 20 |

### Parameter details

#### `util_logStreams.readJson()`

Reads and decodes loggedStreams.json.

- **returns**: table|nil Decoded content, or nil if the file is missing

#### `util_logStreams.readRst()`

Reads loggedStreams.rst, replacing each line break with the literal sequence \n.

- **returns**: string Content with escaped \n
- **returns**: integer Number of replacements (second return value of gsub)

#### `util_logStreams.readWikitable()`

Reads loggedStreams.txt, replacing each line break with the literal sequence \n.

- **returns**: string Content with escaped \n
- **returns**: integer Number of replacements (second return value of gsub)

#### `util_logStreams.saveJson(data)`

Writes data to loggedStreams.json (jsonWriteFile, readable format).

- `data` (*table*) : Data to serialize

#### `util_logStreams.saveRst(data)`

Writes the given text to loggedStreams.rst.

- `data` (*string*) : Text in reStructuredText format

#### `util_logStreams.saveWikitable(data)`

Writes the given text to loggedStreams.txt.

- `data` (*string*) : Text in wikitable format

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/logStreams.lua`.*
