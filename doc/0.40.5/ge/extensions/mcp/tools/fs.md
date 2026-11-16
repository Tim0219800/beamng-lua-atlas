# `mcp_tools_fs`

*File: `lua/ge/extensions/mcp/tools/fs.lua` · VM: Game Engine (GE) · 114 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `mcp_tools_fs`: `extensions.load("mcp_tools_fs")`, then the global `mcp_tools_fs`

MCP file system tools: read/write text files, list, search, delete, copy, rename, create folders. Read/write go through io.open (relative to the game's current folder: loose files on disk only); listing and search go through BeamNG's VFS (also see the contents of zips).

## Notes

- Security warning: these tools allow reading, writing and deleting files with no path restriction on the Lua side (the only limit is io.open's sandbox; delete/copy/rename/make_dir go through FS:).
- read_file/write_file strip leading '/' from the path (VFS path -> relative disk path); read_file truncates at maxBytes (default 100000).
- find_files returns at most 1000 entries (count gives the total); depth -1 = fully recursive.
- delete_file, copy_file, rename_file, make_dir treat return code 0 as success and return "failed" in the text without setting isError to true.

## Functions

| Function | Description | Line |
|---|---|---|
| `mcp_tools_fs.copy_file(args)` | Copies a file (FS:copyFile). | 62 |
| `mcp_tools_fs.delete_file(args)` | Deletes a file (FS:removeFile). | 56 |
| `mcp_tools_fs.find_files(args)` | Searches for files by glob pattern (FS:findFiles). | 46 |
| `mcp_tools_fs.list_dir(args)` | Lists a folder (VFS) as JSON via FS:directoryList. | 39 |
| `mcp_tools_fs.make_dir(args)` | Creates a folder recursively (FS:directoryCreate). | 72 |
| `mcp_tools_fs.read_file(args)` | Reads a text file (jbeam, json, lua…) and returns it, truncated at maxBytes. | 14 |
| `mcp_tools_fs.rename_file(args)` | Renames or moves a file (FS:renameFile). | 67 |
| `mcp_tools_fs.write_file(args)` | Writes (overwrites) a text file, creating the parent folders (FS:directoryCreate). | 26 |

### Parameter details

#### `mcp_tools_fs.copy_file(args)`

Copies a file (FS:copyFile).

- `args` (*table*) : {from: string, to: string}
- **returns**: string Result.
- **returns**: boolean true if from/to are missing.

#### `mcp_tools_fs.delete_file(args)`

Deletes a file (FS:removeFile).

- `args` (*table*) : {path: string}
- **returns**: string "deleted …" or "delete failed: …".
- **returns**: boolean true only if path is missing.

#### `mcp_tools_fs.find_files(args)`

Searches for files by glob pattern (FS:findFiles).

- `args` (*table|nil*) : {path?: string (default '/'), pattern?: string (default '*'), depth?: integer (default 1, -1 = all)}
- **returns**: string JSON {count, files}.
- **returns**: boolean false.

#### `mcp_tools_fs.list_dir(args)`

Lists a folder (VFS) as JSON via FS:directoryList.

- `args` (*table|nil*) : {path?: string (default '/'), files?: boolean, dirs?: boolean}; if neither files nor dirs, both are included.
- **returns**: string JSON.
- **returns**: boolean always false.

#### `mcp_tools_fs.make_dir(args)`

Creates a folder recursively (FS:directoryCreate).

- `args` (*table*) : {path: string}
- **returns**: string Result.
- **returns**: boolean true if path is missing.

#### `mcp_tools_fs.read_file(args)`

Reads a text file (jbeam, json, lua…) and returns it, truncated at maxBytes.

- `args` (*table*) : {path: string, maxBytes?: integer}
- **returns**: string Content or error message.
- **returns**: boolean true on error.

#### `mcp_tools_fs.rename_file(args)`

Renames or moves a file (FS:renameFile).

- `args` (*table*) : {from: string, to: string}
- **returns**: string Result.
- **returns**: boolean true if from/to are missing.

#### `mcp_tools_fs.write_file(args)`

Writes (overwrites) a text file, creating the parent folders (FS:directoryCreate).

- `args` (*table*) : {path: string, content: string}
- **returns**: string "wrote N bytes to …" or error.
- **returns**: boolean true on error.

## Fields

| Field | Type | Description |
|---|---|---|
| `schemas` | table<string, table> | Schemas of the file tools. |

## Calls into the engine (C++)

- `FS:` `copyFile`, `directoryCreate`, `directoryExists`, `directoryList`, `findFiles`, `removeFile`, `renameFile`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/mcp/tools/fs.lua`.*
