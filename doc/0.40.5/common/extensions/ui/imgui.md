# `ui_imgui`

*File: `lua/common/extensions/ui/imgui.lua` · VM: Common (GE + vehicle) · 47 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_imgui`: `extensions.load("ui_imgui")`, then the global `ui_imgui`

Extension ui_imgui: ImGui entry point for Lua modders. In the game VM (GE) it simply becomes the module ui/imgui_api (no wrapper); the hundreds of ImGui functions (Begin, Text, Button...) and their enums therefore come from imgui_luaintf.lua and imgui_custom_luaintf.lua. It gets the main ImGui context on load and enables the BeamNG style.

## Example

```lua
local im = ui_imgui
if im.Begin('My window') then
  im.Text('Hello')
end
im.End()
```

## Notes

- setEnabled is only defined in the 'game' VM and just logs an error "imgui cannot be switched on or off in GE lua". In another VM, M.setEnabled is nil (the local variable is never assigned).
- M.flags is simply bit.bor: used to combine ImGui flags.
- The ImGui fields and functions are only added if vmType == 'game' (M = require imgui_api); otherwise M is an empty module with flags/hooks.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_imgui.onExtensionLoaded()` | Hook called on load (including dynamic reload): gets the main ImGui context again. *(internal)* *(hook)* | 29 |
| `ui_imgui.onImGuiReady()` | Hook called when ImGui is ready for the first time: gets the main context (M.ctx = Engine.imgui.GetMainContext()) and calls Engine.imgui.enableBeamNGStyle(). *(internal)* *(hook)* | 22 |

## Fields

| Field | Type | Description |
|---|---|---|
| `flags` | function | Alias of bit.bor, to combine flags (im.flags(im.WindowFlags_NoMove, im.WindowFlags_NoResize)). |
| `setEnabled` | function|nil | In GE: function that logs an error (imgui cannot be enabled/disabled on the GE side). nil outside the game VM. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/extensions/ui/imgui.lua`.*
