# `editor_vehicleUiTextureDebug`

*File: `lua/ge/extensions/editor/vehicleUiTextureDebug.lua` · VM: Game Engine (GE) · 187 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_vehicleUiTextureDebug`: `extensions.load("editor_vehicleUiTextureDebug")`, then the global `editor_vehicleUiTextureDebug`

Editor debug tool (Window > Vehicles > "Vehicle UI Textures" menu). It lists the vehicles, then the active HTML UI texture tags (CEF screens drawn on vehicles) of the chosen vehicle. For a tag, it lets you open/close the texture's console, export the texture as PNG and show the debug info (fps, size, usage mode, start URL).

## Notes

- Vehicle methods used: getActiveUITextureTagNames, getConsoleOpenUITexture, openConsoleUITexture(tag, bool), dumpCEFTexture(tag, file), getActiveUITextureDebugInfo(tag).
- The "Dump texture" button writes /vehicle_ui_<tag>_<UTC date>.png to the game's file system.
- Bug: the code calls log("I", logTag, ...) while logTag is not defined in the file (nil unless a global logTag exists).

**Dependencies (loaded first):** `ui_imgui`

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_vehicleUiTextureDebug.onEditorGui()` | Editor hook called every frame: draws the vehicle and tag dropdown lists, the console/dump buttons and the debug information. *(internal)* *(hook)* | 62 |
| `editor_vehicleUiTextureDebug.onEditorInitialized()` | Editor hook called at initialization. Gets ui_imgui, registers the 'Vehicle UI Textures' window (520x420) and adds the menu entry in the 'Vehicles' group. *(internal)* *(hook)* | 56 |

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | {'ui_imgui'}: extension loaded before this one. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/vehicleUiTextureDebug.lua`.*
