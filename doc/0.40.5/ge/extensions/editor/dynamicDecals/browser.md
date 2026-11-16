# `editor_dynamicDecals_browser`

*File: `lua/ge/extensions/editor/dynamicDecals/browser.lua` · VM: Game Engine (GE) · 98 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dynamicDecals_browser`: `extensions.load("editor_dynamicDecals_browser")`, then the global `editor_dynamicDecals_browser`

"Dynamic Decals Tool - Browser" window of the editor's dynamic liveries tool: a central tabbed hub (Textures, Brushes, Fonts...) where other modules register their content with registerBrowserTab. Assets can be dragged and dropped onto the decal system widgets. The module is initialized by the main tool via setup(tool).

## Example

```lua
extensions.editor_dynamicDecals_browser.registerBrowserTab("Textures", function() im.Text("…") end, 10)
```

## Notes

- Tabs are sorted by ascending order (1000 by default).
- registerEditorPreferences and editorPreferenceValueChanged are empty functions (body commented out).
- In onGui, the variable textureBrowserCurrentTab is overwritten at each iteration and has no visible effect.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dynamicDecals_browser.editorPreferenceValueChanged(path, value)` | Hook called when a preference changes: currently does nothing. *(internal)* | 43 |
| `editor_dynamicDecals_browser.hideWindow()` | Hides the browser window. | 80 |
| `editor_dynamicDecals_browser.isWindowVisible()` | Indicates whether the window is visible. | 84 |
| `editor_dynamicDecals_browser.onGui()` | Draws the window and its tab bar by calling the guiFn of each tab. Registered by setup() as the "browser" editor callback. *(internal)* *(hook)* | 20 |
| `editor_dynamicDecals_browser.registerBrowserTab(name, guiFn, order)` | Adds a tab to the browser and re-sorts the list by order. | 71 |
| `editor_dynamicDecals_browser.registerEditorPreferences(prefsRegistry)` | Editor preferences hook: currently does nothing. *(internal)* | 37 |
| `editor_dynamicDecals_browser.setup(tool_in)` | Initializes the module: gets the extensions editor_api_dynamicDecals, editor_dynamicDecals_textures and editor_dynamicDecals_docs, registers the window (800x400), the "browser" UI callback and the "Browser" documentation page. | 60 |
| `editor_dynamicDecals_browser.showWindow()` | Shows the browser window. | 76 |

### Parameter details

#### `editor_dynamicDecals_browser.editorPreferenceValueChanged(path, value)`

Hook called when a preference changes: currently does nothing.

- `path` (*string*) : preference path
- `value` (*any*) : new value

#### `editor_dynamicDecals_browser.isWindowVisible()`

Indicates whether the window is visible.

- **returns**: boolean visibility

#### `editor_dynamicDecals_browser.registerBrowserTab(name, guiFn, order)`

Adds a tab to the browser and re-sorts the list by order.

- `name` (*string*) : tab title
- `guiFn` (*function*) : ImGui function drawing the tab content
- `order` (*number|nil*) : sort rank, 1000 by default

#### `editor_dynamicDecals_browser.registerEditorPreferences(prefsRegistry)`

Editor preferences hook: currently does nothing.

- `prefsRegistry` (*table*) : preferences registry

#### `editor_dynamicDecals_browser.setup(tool_in)`

Initializes the module: gets the extensions editor_api_dynamicDecals, editor_dynamicDecals_textures and editor_dynamicDecals_docs, registers the window (800x400), the "browser" UI callback and the "Browser" documentation page.

- `tool_in` (*table*) : dynamic decals tool (provides registerOnEditorGuiFn)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dynamicDecals/browser.lua`.*
