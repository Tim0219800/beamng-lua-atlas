# `editor_flowgraph_basewindow`

*File: `lua/ge/extensions/editor/flowgraph/basewindow.lua` · VM: Game Engine (GE) · 87 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_flowgraph_basewindow`: `extensions.load("editor_flowgraph_basewindow")`, then the global `editor_flowgraph_basewindow`

Base class of the Flowgraph editor windows (legend, history, events, garbageDebug, examples, execution, main...). It wraps the Begin/End of an editor window (editor.beginWindow with self.windowName), focus tracking (hasFocus) and open/close/toggle. use(fgEditor, derivedClass) creates a base instance and copies the derived class's fields onto it.

## Notes

- windowName must be defined by the derived class before Begin/open/close/toggle.
- use() only calls init() again if the derived class overrides one; the base init takes fgEditor, the derived one is called without arguments.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_flowgraph_basewindow.createBase(...)` | Creates an instance of the base class and calls init(...). | 65 |
| `editor_flowgraph_basewindow.use(fgEditor, derivedClass)` | Creates a base instance for fgEditor then copies all fields of derivedClass onto it (overrides); calls the derived init if it differs from the base one. | 73 |

### Parameter details

#### `editor_flowgraph_basewindow.createBase(...)`

Creates an instance of the base class and calls init(...).

- `...` (*any*) : Arguments passed to init (fgEditor).
- **returns**: table Instance.

#### `editor_flowgraph_basewindow.use(fgEditor, derivedClass)`

Creates a base instance for fgEditor then copies all fields of derivedClass onto it (overrides); calls the derived init if it differs from the base one.

- `fgEditor` (*table*) : Owning Flowgraph editor.
- `derivedClass` (*table*) : Window class (windowName, draw, init...).
- **returns**: table Window instance.

## Class `C`

Base class of a Flowgraph window.

| Method | Description | Line |
|---|---|---|
| `C:Begin(name, flags)` | Opens the editor window self.windowName with the given title. | 15 |
| `C:End()` | Updates hasFocus (focus of child windows) then closes the editor window. | 19 |
| `C:__onDeserialized(data)` | Calls _onDeserialized then resets hasFocus to false. | 58 |
| `C:__onSerialize()` | Creates a table, calls _onSerialize and returns it. | 49 |
| `C:_onDeserialized(data)` | Deserialization extension point, empty by default. | 55 |
| `C:_onSerialize(res)` | Serialization extension point, empty by default. | 46 |
| `C:attach(mgr)` | Associates the flowgraph project manager (self.mgr). | 24 |
| `C:close()` | Hides the window and resets hasFocus to false. | 33 |
| `C:init(fgEditor)` | Stores fgEditor and initializes hasFocus to false. | 10 |
| `C:open()` | Shows the window. | 28 |
| `C:toggle()` | Toggles the window's visibility. | 38 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/flowgraph/basewindow.lua`.*
