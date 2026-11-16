# `editor_dynamicDecals_docs`

*File: `lua/ge/extensions/editor/dynamicDecals/docs.lua` · VM: Game Engine (GE) · 423 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dynamicDecals_docs`: `extensions.load("editor_dynamicDecals_docs")`, then the global `editor_dynamicDecals_docs`

Documentation window built into the Dynamic Decals tool (table of contents + content). Each module of the tool registers a page there with register({section = {...}, guiFn = fn}); this module also provides the Introduction, Getting Started and Controls pages (controls are read from the input actions of the "dynamicDecals" action map, keyboard and mouse). selectSection opens the window on a given page.

## Example

```lua
local docs = extensions.editor_dynamicDecals_docs
docs.register({section = {"Ma section"}, guiFn = function(sec) ui_imgui.TextUnformatted("Texte") end, order = 50})
docs.selectSection("Ma section")
```

## Notes

- register: `data.section` must be a table (list of names from parent to child), otherwise a warning is logged and nothing is registered. Missing intermediate sections are created with data.order.
- selectSection accepts either a name (searched in the whole tree, clears the search filter and restarts from the base tree), or a table of names (full path).
- Bug: introductionGui displays the version with tool.version[2] twice (minor, minor) instead of (major, minor, patch).
- showWindow sorts the children of each section (sortFn) before opening and saves a copy of the tree.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dynamicDecals_docs.editorPreferenceValueChanged(path, value)` | Hook called when a preference changes. Does nothing here. *(internal)* | 314 |
| `editor_dynamicDecals_docs.hideWindow()` | Hides the documentation window. | 408 |
| `editor_dynamicDecals_docs.image(path, overrideWidth, title, subtitle)` | Displays an image in the doc page (at the given width, keeping the ratio), with optional tooltip and gray caption. | 173 |
| `editor_dynamicDecals_docs.introductionGui(docsSection)` | Draws the "Introduction" page (welcome message and tool version). *(internal)* | 197 |
| `editor_dynamicDecals_docs.isWindowVisible()` | Indicates whether the documentation window is visible. | 412 |
| `editor_dynamicDecals_docs.register(data)` | Registers (or updates) a documentation page in the section tree. | 328 |
| `editor_dynamicDecals_docs.registerEditorPreferences(prefsRegistry)` | Registers `dynamicDecalsTool.docs`: indentSpacing (int, default 8, from 0 to 64) for the table of contents and verticalSpacing (int, default 16, from 0 to 64). *(internal)* | 307 |
| `editor_dynamicDecals_docs.selectSection(section, doNotOpenWindow)` | Selects a documentation page and, unless doNotOpenWindow, opens the window. | 386 |
| `editor_dynamicDecals_docs.setup(tool_in)` | Called by the tool: declares the window (640x640), registers the UI and update callbacks, the Introduction (order 0), Getting Started (10) and Controls (20) pages, and builds the list of keyboard/mouse controls of the dynamicDecals action map. *(internal)* | 278 |
| `editor_dynamicDecals_docs.showWindow()` | Sorts the sections then displays the documentation window. | 401 |
| `editor_dynamicDecals_docs.verticalSpacing()` | Inserts a vertical space of height `dynamicDecalsTool.docs.verticalSpacing` (default 16). | 193 |

### Parameter details

#### `editor_dynamicDecals_docs.editorPreferenceValueChanged(path, value)`

Hook called when a preference changes. Does nothing here.

- `path` (*string*) : Preference path.
- `value` (*any*) : New value.

#### `editor_dynamicDecals_docs.image(path, overrideWidth, title, subtitle)`

Displays an image in the doc page (at the given width, keeping the ratio), with optional tooltip and gray caption.

- `path` (*string*) : Texture path.
- `overrideWidth` (*number|nil*) : Width in pixels; default is the full available width.
- `title` (*string|nil*) : Tooltip text.
- `subtitle` (*string|nil*) : Caption below the image.

#### `editor_dynamicDecals_docs.introductionGui(docsSection)`

Draws the "Introduction" page (welcome message and tool version).

- `docsSection` (*table*) : Current documentation section.

#### `editor_dynamicDecals_docs.isWindowVisible()`

Indicates whether the documentation window is visible.

- **returns**: boolean true if visible.

#### `editor_dynamicDecals_docs.register(data)`

Registers (or updates) a documentation page in the section tree.

- `data` (*table*) : {section = string[], guiFn = function(docsSection), order = number|nil}.

#### `editor_dynamicDecals_docs.registerEditorPreferences(prefsRegistry)`

Registers `dynamicDecalsTool.docs`: indentSpacing (int, default 8, from 0 to 64) for the table of contents and verticalSpacing (int, default 16, from 0 to 64).

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_dynamicDecals_docs.selectSection(section, doNotOpenWindow)`

Selects a documentation page and, unless doNotOpenWindow, opens the window.

- `section` (*string|string[]*) : Page name, or path as a list of names.
- `doNotOpenWindow` (*boolean|nil*) : If true, does not show the window.

#### `editor_dynamicDecals_docs.setup(tool_in)`

Called by the tool: declares the window (640x640), registers the UI and update callbacks, the Introduction (order 0), Getting Started (10) and Controls (20) pages, and builds the list of keyboard/mouse controls of the dynamicDecals action map.

- `tool_in` (*table*) : Reference to the editor_dynamicDecalsTool tool.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dynamicDecals/docs.lua`.*
