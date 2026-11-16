# `mcp_tools_system`

*File: `lua/ge/extensions/mcp/tools/system.lua` · VM: Game Engine (GE) · 211 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `mcp_tools_system`: `extensions.load("mcp_tools_system")`, then the global `mcp_tools_system`

MCP system tools: run Lua in the GE VM, read logs, reload the UI or Lua, render info, screenshots, file info, loading Lua files and extensions, reading/writing VariableRegistry variables.

## Notes

- Security warning: run_lua and load_file run arbitrary code in the game; set_var modifies engine variables.
- get_logs: the first call returns the last N lines of beamng.log (default 200, max 5000), subsequent ones only the new lines since the previous call (stored offset).
- screenshot saves to <user folder>/screenshots/mcp/ (PNG or JPG) asynchronously; the path is returned immediately, the file may appear a few frames later.
- screenshot_image: asynchronous in two calls; the result is a table {data=<base64 JPEG>, mimeType='image/jpeg'} that mcp_server converts into image content.
- unload_extension refuses to unload mcp_server and mcp_tools.
- reload_lua: the reload is deferred to the next frame; the MCP server restarts (onSerialize/onDeserialize) but the connection may drop.

## Functions

| Function | Description | Line |
|---|---|---|
| `mcp_tools_system.file_info(args)` | Information about a path: exists, isDir, realPath (VFS to disk), virtualPath, expanded and stat. | 99 |
| `mcp_tools_system.get_logs(args)` | Reads beamng.log (see notes for the first call / subsequent calls logic). | 24 |
| `mcp_tools_system.get_render_info()` | Render info as JSON: adapterType, available, vulkanEnabled, gpu (Engine.Render / Engine.Platform). | 56 |
| `mcp_tools_system.get_var(args)` | Reads an engine variable/preference (VariableRegistry.get), e.g. $pref::Video::gpu. | 144 |
| `mcp_tools_system.load_extension(args)` | Loads a GE extension by its name (underscore form). | 128 |
| `mcp_tools_system.load_file(args)` | Loads and runs a Lua file in the GE VM (the VFS path is resolved to the real path). | 116 |
| `mcp_tools_system.reload_lua()` | Requests a reload of the GE Lua VM (like Ctrl+L) via Lua:requestReload; deferred to the next frame. | 50 |
| `mcp_tools_system.reload_ui()` | Fully reloads the UI (CEF) ignoring the cache, via reloadUI(). | 43 |
| `mcp_tools_system.run_lua(args)` | Compiles (loadstring) and runs Lua code in the GE VM, returns tostring of the chunk's result. | 14 |
| `mcp_tools_system.screenshot(args)` | Takes a screenshot (module `screenshot`, createScreenshotTracked) and returns its absolute path. | 66 |
| `mcp_tools_system.screenshot_image(args)` | Captures a downscaled JPG and returns it as base64 (asynchronous in two calls). | 80 |
| `mcp_tools_system.set_var(args)` | Writes an engine variable (VariableRegistry.set) and returns the re-read value. | 150 |
| `mcp_tools_system.unload_extension(args)` | Unloads a GE extension (mcp_server and mcp_tools are protected). | 135 |

### Parameter details

#### `mcp_tools_system.file_info(args)`

Information about a path: exists, isDir, realPath (VFS to disk), virtualPath, expanded and stat.

- `args` (*table*) : {path: string} VFS or real path.
- **returns**: string JSON.
- **returns**: boolean true if path is missing.

#### `mcp_tools_system.get_logs(args)`

Reads beamng.log (see notes for the first call / subsequent calls logic).

- `args` (*table|nil*) : {lines?: integer}
- **returns**: string Log lines.
- **returns**: boolean true if the file is unreadable.

#### `mcp_tools_system.get_render_info()`

Render info as JSON: adapterType, available, vulkanEnabled, gpu (Engine.Render / Engine.Platform).

- **returns**: string JSON.
- **returns**: boolean false.

#### `mcp_tools_system.get_var(args)`

Reads an engine variable/preference (VariableRegistry.get), e.g. $pref::Video::gpu.

- `args` (*table*) : {name: string, default?: any}
- **returns**: string Value.
- **returns**: boolean true if name is missing.

#### `mcp_tools_system.load_extension(args)`

Loads a GE extension by its name (underscore form).

- `args` (*table*) : {name: string}
- **returns**: string "loaded" or "load failed for".
- **returns**: boolean true if name is missing.

#### `mcp_tools_system.load_file(args)`

Loads and runs a Lua file in the GE VM (the VFS path is resolved to the real path).

- `args` (*table*) : {path: string}
- **returns**: string "loaded …" or error.
- **returns**: boolean true on error.

#### `mcp_tools_system.reload_lua()`

Requests a reload of the GE Lua VM (like Ctrl+L) via Lua:requestReload; deferred to the next frame.

- **returns**: string Message.
- **returns**: boolean true if unavailable.

#### `mcp_tools_system.reload_ui()`

Fully reloads the UI (CEF) ignoring the cache, via reloadUI().

- **returns**: string Message.
- **returns**: boolean true if reloadUI is absent.

#### `mcp_tools_system.run_lua(args)`

Compiles (loadstring) and runs Lua code in the GE VM, returns tostring of the chunk's result.

- `args` (*table*) : {code: string}. The code must `return …` to return a value.
- **returns**: string Result or "compile error / error: …".
- **returns**: boolean true on error.

#### `mcp_tools_system.screenshot(args)`

Takes a screenshot (module `screenshot`, createScreenshotTracked) and returns its absolute path.

- `args` (*table|nil*) : {jpg?: boolean} (default PNG).
- **returns**: string File path.
- **returns**: boolean true if the capture fails.

#### `mcp_tools_system.screenshot_image(args)`

Captures a downscaled JPG and returns it as base64 (asynchronous in two calls).

- `args` (*table|nil*) : {scale?: number 0..1 (default 0.4)}
- **returns**: table|string {data, mimeType} once ready, otherwise "capturing…" message.
- **returns**: boolean true if the capture fails.

#### `mcp_tools_system.set_var(args)`

Writes an engine variable (VariableRegistry.set) and returns the re-read value.

- `args` (*table*) : {name: string, value: any}
- **returns**: string "name = value".
- **returns**: boolean true if a parameter is missing.

#### `mcp_tools_system.unload_extension(args)`

Unloads a GE extension (mcp_server and mcp_tools are protected).

- `args` (*table*) : {name: string}
- **returns**: string Message.
- **returns**: boolean true on refusal or error.

## Fields

| Field | Type | Description |
|---|---|---|
| `schemas` | table<string, table> | Schemas of the system tools. |

## Calls into the engine (C++)

- `Engine.` `getVulkanEnabled`
- `FS:` `directoryCreate`, `directoryExists`, `expandFilename`, `fileExists`, `getFileRealPath`, `getUserPath`, `native2Virtual`, `stat`
- `Lua:` `requestReload`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/mcp/tools/system.lua`.*
