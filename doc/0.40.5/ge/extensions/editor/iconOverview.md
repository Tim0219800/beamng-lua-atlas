# `editor_iconOverview`

*File: `lua/ge/extensions/editor/iconOverview.lua` · VM: Game Engine (GE) · 140 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_iconOverview`: `extensions.load("editor_iconOverview")`, then the global `editor_iconOverview`

Editor window "Available Icons" (Window > Debug menu) that lists all the icons of editor.icons in a filterable grid, with a tooltip of the name. Clicking an icon copies its name to the clipboard. The window menu allows recreating the icon atlas (editor.createIconAtlas). drawContent is reusable by other tools to offer an icon picker.

## Example

```lua
extensions.load('editor_iconOverview')
editor_iconOverview.drawContent(function(iconName) print(iconName) end) -- in an editor ImGui window
```

## Notes

- The icon list (tableKeys(editor.icons), sorted) is computed only once in onEditorInitialized, or again after "Re-create icon atlas".
- drawContent uses the local variables icons and style initialized by onEditorInitialized: calling it before the editor is initialized would cause an error.
- The icons are drawn at 32x32 multiplied by imgui.uiscale; the grid uses an ImGuiListClipper to only draw the visible rows.
- The editEnded parameter passed to uiInputSearchTextFilter is an undefined global (so nil) in this file.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_iconOverview.drawContent(selectedFun)` | Draws the search field and the filtered icon grid in the current ImGui window. Calls selectedFun(iconName) when the user clicks an icon. | 40 |
| `editor_iconOverview.onEditorActivated()` | Hook called when the editor is activated; empty in this file. *(internal)* *(hook)* | 116 |
| `editor_iconOverview.onEditorGui()` | Called every frame by the editor; displays the "Available Icons" window (menu + drawContent with copy to clipboard). *(internal)* *(hook)* | 32 |
| `editor_iconOverview.onEditorInitialized()` | Called at editor initialization; builds the sorted icon list, registers the window (600x600) and adds the "Available Icons" menu in the Debug group. *(internal)* *(hook)* | 123 |
| `editor_iconOverview.onExtensionLoaded()` | Hook called when the extension loads; empty in this file. *(internal)* *(hook)* | 131 |
| `editor_iconOverview.open()` | Shows the "iconOverview" window (editor.showWindow). Same function as the menu entry. | 119 |

### Parameter details

#### `editor_iconOverview.drawContent(selectedFun)`

Draws the search field and the filtered icon grid in the current ImGui window. Calls selectedFun(iconName) when the user clicks an icon.

- `selectedFun` (*function|nil*) : Callback receiving the name of the clicked icon (string). Default nop.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/iconOverview.lua`.*
