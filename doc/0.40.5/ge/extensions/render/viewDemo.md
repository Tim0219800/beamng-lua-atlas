# `render_viewDemo`

*File: `lua/ge/extensions/render/viewDemo.lua` · VM: Game Engine (GE) · 74 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `render_viewDemo`: `extensions.load("render_viewDemo")`, then the global `render_viewDemo`

Small example of using render views (RenderViewManagerInstance): creates a view named 'Demo view 1' rendered into a named texture, moves its camera in a circle and displays it in an ImGui window. To be loaded by hand with extensions.load('render_viewDemo'); serves as a template for a modder who wants a virtual camera to a texture.

## Example

```lua
extensions.load('render_viewDemo')
```

## Notes

- The view's name is its unique identifier; renderView.namedTexTargetColor receives this name, and imUtils.texObj('#<name>') retrieves the texture for ImGui.
- luaOwned = true makes the view be deleted when the garbage collector collects it.
- View parameters in the example: resolution 512x256, fov 75, near 0.1, far 2000, renderCubemap false, renderEditorIcons true.
- The text 'Hello world view :)' is drawn via debugDrawer:drawTextAdvanced at (20, 20, 0).
- The view is never destroyed by the extension: no onExtensionUnloaded.

## Functions

| Function | Description | Line |
|---|---|---|
| `render_viewDemo.onUpdate(dtReal, dtSim, dtRaw)` | Hook called every frame: creates the view on the first call, moves the camera (position sin/cos of simulated time, height 1.5), draws a debug text and displays the view's texture in the ImGui window 'Render view test'. *(internal)* *(hook)* | 25 |

### Parameter details

#### `render_viewDemo.onUpdate(dtReal, dtSim, dtRaw)`

Hook called every frame: creates the view on the first call, moves the camera (position sin/cos of simulated time, height 1.5), draws a debug text and displays the view's texture in the ImGui window 'Render view test'.

- `dtReal` (*number*) : Real frame duration (s), unused.
- `dtSim` (*number*) : Simulated duration (s), added to a local timer.
- `dtRaw` (*number*) : Raw duration (s), unused.

## Calls into the engine (C++)

- `debugDrawer:` `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/render/viewDemo.lua`.*
