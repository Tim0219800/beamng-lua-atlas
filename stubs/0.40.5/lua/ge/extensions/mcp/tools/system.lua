---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools/system.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- MCP system tools: run Lua in the GE VM, read logs, reload the UI or Lua, render info, screenshots, file info, loading Lua files and extensions, reading/writing VariableRegistry variables.
--- Access: extension `mcp_tools_system`: `extensions.load("mcp_tools_system")`, then the global `mcp_tools_system`
---@class mcp_tools_system
---@field schemas table<string, table> Schemas of the system tools.
mcp_tools_system = {}

--- Information about a path: exists, isDir, realPath (VFS to disk), virtualPath, expanded and stat.
---Source: lua/ge/extensions/mcp/tools/system.lua:99
---@param args table {path: string} VFS or real path.
---@return string  JSON.
---@return boolean  true if path is missing.
function mcp_tools_system.file_info(args) end

--- Reads beamng.log (see notes for the first call / subsequent calls logic).
---Source: lua/ge/extensions/mcp/tools/system.lua:24
---@param args table|nil {lines?: integer}
---@return string  Log lines.
---@return boolean  true if the file is unreadable.
function mcp_tools_system.get_logs(args) end

--- Render info as JSON: adapterType, available, vulkanEnabled, gpu (Engine.Render / Engine.Platform).
---Source: lua/ge/extensions/mcp/tools/system.lua:56
---@return string  JSON.
---@return boolean  false.
function mcp_tools_system.get_render_info() end

--- Reads an engine variable/preference (VariableRegistry.get), e.g. $pref::Video::gpu.
---Source: lua/ge/extensions/mcp/tools/system.lua:144
---@param args table {name: string, default?: any}
---@return string  Value.
---@return boolean  true if name is missing.
function mcp_tools_system.get_var(args) end

--- Loads a GE extension by its name (underscore form).
---Source: lua/ge/extensions/mcp/tools/system.lua:128
---@param args table {name: string}
---@return string  "loaded" or "load failed for".
---@return boolean  true if name is missing.
function mcp_tools_system.load_extension(args) end

--- Loads and runs a Lua file in the GE VM (the VFS path is resolved to the real path).
---Source: lua/ge/extensions/mcp/tools/system.lua:116
---@param args table {path: string}
---@return string  "loaded …" or error.
---@return boolean  true on error.
function mcp_tools_system.load_file(args) end

--- Requests a reload of the GE Lua VM (like Ctrl+L) via Lua:requestReload; deferred to the next frame.
---Source: lua/ge/extensions/mcp/tools/system.lua:50
---@return string  Message.
---@return boolean  true if unavailable.
function mcp_tools_system.reload_lua() end

--- Fully reloads the UI (CEF) ignoring the cache, via reloadUI().
---Source: lua/ge/extensions/mcp/tools/system.lua:43
---@return string  Message.
---@return boolean  true if reloadUI is absent.
function mcp_tools_system.reload_ui() end

--- Compiles (loadstring) and runs Lua code in the GE VM, returns tostring of the chunk's result.
---Source: lua/ge/extensions/mcp/tools/system.lua:14
---@param args table {code: string}. The code must `return …` to return a value.
---@return string  Result or "compile error / error: …".
---@return boolean  true on error.
function mcp_tools_system.run_lua(args) end

--- Takes a screenshot (module `screenshot`, createScreenshotTracked) and returns its absolute path.
---Source: lua/ge/extensions/mcp/tools/system.lua:66
---@param args table|nil {jpg?: boolean} (default PNG).
---@return string  File path.
---@return boolean  true if the capture fails.
function mcp_tools_system.screenshot(args) end

--- Captures a downscaled JPG and returns it as base64 (asynchronous in two calls).
---Source: lua/ge/extensions/mcp/tools/system.lua:80
---@param args table|nil {scale?: number 0..1 (default 0.4)}
---@return table|string  {data, mimeType} once ready, otherwise "capturing…" message.
---@return boolean  true if the capture fails.
function mcp_tools_system.screenshot_image(args) end

--- Writes an engine variable (VariableRegistry.set) and returns the re-read value.
---Source: lua/ge/extensions/mcp/tools/system.lua:150
---@param args table {name: string, value: any}
---@return string  "name = value".
---@return boolean  true if a parameter is missing.
function mcp_tools_system.set_var(args) end

--- Unloads a GE extension (mcp_server and mcp_tools are protected).
---Source: lua/ge/extensions/mcp/tools/system.lua:135
---@param args table {name: string}
---@return string  Message.
---@return boolean  true on refusal or error.
function mcp_tools_system.unload_extension(args) end

