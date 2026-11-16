---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools/fs.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- MCP file system tools: read/write text files, list, search, delete, copy, rename, create folders. Read/write go through io.open (relative to the game's current folder: loose files on disk only); listing and search go through BeamNG's VFS (also see the contents of zips).
--- Access: extension `mcp_tools_fs`: `extensions.load("mcp_tools_fs")`, then the global `mcp_tools_fs`
---@class mcp_tools_fs
---@field schemas table<string, table> Schemas of the file tools.
mcp_tools_fs = {}

--- Copies a file (FS:copyFile).
---Source: lua/ge/extensions/mcp/tools/fs.lua:62
---@param args table {from: string, to: string}
---@return string  Result.
---@return boolean  true if from/to are missing.
function mcp_tools_fs.copy_file(args) end

--- Deletes a file (FS:removeFile).
---Source: lua/ge/extensions/mcp/tools/fs.lua:56
---@param args table {path: string}
---@return string  "deleted …" or "delete failed: …".
---@return boolean  true only if path is missing.
function mcp_tools_fs.delete_file(args) end

--- Searches for files by glob pattern (FS:findFiles).
---Source: lua/ge/extensions/mcp/tools/fs.lua:46
---@param args table|nil {path?: string (default '/'), pattern?: string (default '*'), depth?: integer (default 1, -1 = all)}
---@return string  JSON {count, files}.
---@return boolean  false.
function mcp_tools_fs.find_files(args) end

--- Lists a folder (VFS) as JSON via FS:directoryList.
---Source: lua/ge/extensions/mcp/tools/fs.lua:39
---@param args table|nil {path?: string (default '/'), files?: boolean, dirs?: boolean}; if neither files nor dirs, both are included.
---@return string  JSON.
---@return boolean  always false.
function mcp_tools_fs.list_dir(args) end

--- Creates a folder recursively (FS:directoryCreate).
---Source: lua/ge/extensions/mcp/tools/fs.lua:72
---@param args table {path: string}
---@return string  Result.
---@return boolean  true if path is missing.
function mcp_tools_fs.make_dir(args) end

--- Reads a text file (jbeam, json, lua…) and returns it, truncated at maxBytes.
---Source: lua/ge/extensions/mcp/tools/fs.lua:14
---@param args table {path: string, maxBytes?: integer}
---@return string  Content or error message.
---@return boolean  true on error.
function mcp_tools_fs.read_file(args) end

--- Renames or moves a file (FS:renameFile).
---Source: lua/ge/extensions/mcp/tools/fs.lua:67
---@param args table {from: string, to: string}
---@return string  Result.
---@return boolean  true if from/to are missing.
function mcp_tools_fs.rename_file(args) end

--- Writes (overwrites) a text file, creating the parent folders (FS:directoryCreate).
---Source: lua/ge/extensions/mcp/tools/fs.lua:26
---@param args table {path: string, content: string}
---@return string  "wrote N bytes to …" or error.
---@return boolean  true on error.
function mcp_tools_fs.write_file(args) end

