# `flowgraph_modules_fileModule`

*File: `lua/ge/extensions/flowgraph/modules/fileModule.lua` · VM: Game Engine (GE) · 68 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/modules/fileModule")` (file under extensions/ but not a regular extension)

Flowgraph module (moduleOrder 0) that reads and writes small JSON save files specific to flowgraph projects. The files are stored under 'settings/cloud/flowgraphSaveData' + name + '.save.json' with the structure {lastModified, data}. The files are loaded on demand, cached, and rewritten to disk at the end of the tick (afterTrigger) if they were modified.

## Notes

- The path is built by simple concatenation savePath .. file .. ext: the name 'file' must therefore start with '/' to get a correct path.
- If the JSON read has no data field, its entire content is wrapped in {lastModified = 0, data = <content>}.
- The cache is cleared when the project starts and stops.

## Functions

| Function | Description | Line |
|---|---|---|
| `flowgraph_modules_fileModule.afterTrigger()` | Called after the graph tick: writes each modified file to disk (jsonWriteFile) and clears the modification list. (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_fileModule.clear()` | Clears the file cache and the list of modified files. (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_fileModule.executionStarted()` | Called when the project starts: calls clear(). (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_fileModule.executionStopped()` | Called when the project stops: calls clear(). (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_fileModule.forceReload(file)` | Forgets the cached file; it will be re-read on next access. (dynamically assigned) | dyn |
| `flowgraph_modules_fileModule.getFile(file)` | Returns the file's {lastModified, data} table, loading it from disk (or creating an empty table) on the first request. (dynamically assigned) | dyn |
| `flowgraph_modules_fileModule.init()` | Called when the module is created: calls clear(). (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_fileModule.read(file, field)` | Reads data[field] from the file. (dynamically assigned) | dyn |
| `flowgraph_modules_fileModule.write(file, field, value)` | Writes a value into data[field], updates lastModified (os.time()) and marks the file to be saved. (dynamically assigned) | dyn |

### Parameter details

#### `flowgraph_modules_fileModule.forceReload(file)`

Forgets the cached file; it will be re-read on next access. (dynamically assigned)

- `file` (*string*) : file name (without folder prefix or extension)

#### `flowgraph_modules_fileModule.getFile(file)`

Returns the file's {lastModified, data} table, loading it from disk (or creating an empty table) on the first request. (dynamically assigned)

- `file` (*string*) : file name
- **returns**: table {lastModified = number, data = table}

#### `flowgraph_modules_fileModule.read(file, field)`

Reads data[field] from the file. (dynamically assigned)

- `file` (*string*) : file name
- `field` (*string*) : key
- **returns**: any value or nil

#### `flowgraph_modules_fileModule.write(file, field, value)`

Writes a value into data[field], updates lastModified (os.time()) and marks the file to be saved. (dynamically assigned)

- `file` (*string*) : file name
- `field` (*string*) : key
- `value` (*any*) : JSON-serializable value

## Class `C`

| Method | Description | Line |
|---|---|---|
| `C:afterTrigger()` |  | 51 |
| `C:clear()` |  | 14 |
| `C:executionStarted()` |  | 64 |
| `C:executionStopped()` |  | 60 |
| `C:forceReload(file)` |  | 19 |
| `C:getFile(file)` |  | 23 |
| `C:init()` |  | 10 |
| `C:read(file, field)` |  | 47 |
| `C:write(file, field, value)` |  | 40 |

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/modules/fileModule.lua`.*
