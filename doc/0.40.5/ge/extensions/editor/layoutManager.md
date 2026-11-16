# `editor_layoutManager`

*File: `lua/ge/extensions/editor/layoutManager.lua` · VM: Game Engine (GE) · 83 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_layoutManager`: `extensions.load("editor_layoutManager")`, then the global `editor_layoutManager`

Management of the editor's window layouts. Each layout is a folder settings/<tool>/layouts/<name>/ containing windowsState.json; the current layout is settings/<tool>/windowsState.json. The ImGui positions are read/written in settings/imgui.ini (or settings/default_imgui.ini for the Default layout). The tool is "editor" by default.

## Example

```lua
editor_layoutManager.saveWindowLayout("MyLayout")
local list = editor_layoutManager.getWindowLayouts()
```

## Notes

- Depends on editor.loadWindowsState / editor.saveWindowsState (defined elsewhere) and on ui_imgui.
- saveCurrentWindowLayout does not pass toolName to editor.saveWindowsState, unlike saveWindowLayout and loadCurrentWindowLayout.
- resetLayouts deletes all layouts whose path does not contain "/Default", then reloads Default.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_layoutManager.deleteWindowLayout(layoutPath)` | Deletes all files of a layout folder then the folder itself. | 55 |
| `editor_layoutManager.getWindowLayouts(toolName)` | Lists the layout folders of settings/<tool>/layouts/. | 14 |
| `editor_layoutManager.loadCurrentWindowLayout(toolName)` | Loads the current windows state (settings/<tool>/windowsState.json). If editor.needsDefaultImguiIniLoad is true, loads default_imgui.ini once, otherwise imgui.ini. | 37 |
| `editor_layoutManager.loadWindowLayout(layout, toolName)` | Loads the windowsState.json of a layout and reloads imgui.ini: default_imgui.ini if the layout is Default, otherwise imgui.ini. | 18 |
| `editor_layoutManager.resetLayouts(toolName)` | Deletes all custom layouts (everything except Default) from settings/<tool>/layouts then loads the Default layout. | 63 |
| `editor_layoutManager.saveCurrentWindowLayout(toolName)` | Saves the current windows state to settings/<tool>/windowsState.json and saves imgui.ini. | 50 |
| `editor_layoutManager.saveWindowLayout(layoutName, toolName)` | Saves the windows state to settings/<tool>/layouts/<layoutName>/windowsState.json and saves imgui.ini. | 30 |

### Parameter details

#### `editor_layoutManager.deleteWindowLayout(layoutPath)`

Deletes all files of a layout folder then the folder itself.

- `layoutPath` (*string*) : Path of the layout folder to delete.

#### `editor_layoutManager.getWindowLayouts(toolName)`

Lists the layout folders of settings/<tool>/layouts/.

- `toolName` (*string|nil*) : Tool name; "editor" if nil.
- **returns**: table<integer, string> Paths of the layout folders (FS:directoryList).

#### `editor_layoutManager.loadCurrentWindowLayout(toolName)`

Loads the current windows state (settings/<tool>/windowsState.json). If editor.needsDefaultImguiIniLoad is true, loads default_imgui.ini once, otherwise imgui.ini.

- `toolName` (*string|nil*) : Tool name; "editor" if nil.

#### `editor_layoutManager.loadWindowLayout(layout, toolName)`

Loads the windowsState.json of a layout and reloads imgui.ini: default_imgui.ini if the layout is Default, otherwise imgui.ini.

- `layout` (*string|nil*) : Layout folder; settings/editor/layouts/Default if nil.
- `toolName` (*string|nil*) : Tool name passed to editor.loadWindowsState.

#### `editor_layoutManager.resetLayouts(toolName)`

Deletes all custom layouts (everything except Default) from settings/<tool>/layouts then loads the Default layout.

- `toolName` (*string|nil*) : Tool name; "editor" if nil.

#### `editor_layoutManager.saveCurrentWindowLayout(toolName)`

Saves the current windows state to settings/<tool>/windowsState.json and saves imgui.ini.

- `toolName` (*string|nil*) : Used to build the path, but is not passed to editor.saveWindowsState.

#### `editor_layoutManager.saveWindowLayout(layoutName, toolName)`

Saves the windows state to settings/<tool>/layouts/<layoutName>/windowsState.json and saves imgui.ini.

- `layoutName` (*string*) : Layout name (folder name).
- `toolName` (*string|nil*) : Tool name; "editor" if nil.

## Calls into the engine (C++)

- `FS:` `directoryList`, `directoryRemove`, `findFiles`, `getFileRealPath`, `removeFile`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/layoutManager.lua`.*
