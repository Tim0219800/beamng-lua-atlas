# `ui_visibility`

*File: `lua/ge/extensions/ui/visibility.lua` · VM: Game Engine (GE) · 66 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_visibility`: `extensions.load("ui_visibility")`, then the global `ui_visibility`

Shows or hides the game interface: the web UI (CEF) and the imgui windows. Useful for screenshots, videos or tools. It stores the state in M.state (cefVisible, imguiVisible) and broadcasts the CEF visibility change.

## Example

```lua
ui_visibility.set(false)  -- hides everything
ui_visibility.setCef(true)  -- shows only the web UI again
```

## Notes

- The initial state is cefVisible = true and imguiVisible = current state of Engine.imgui.
- The CEF visibility change emits the UI event 'onCefVisibilityChanged' (guihooks) and the hook of the same name (extensions.hook), with a boolean, only if the value changes.
- get() returns only the CEF state, not the imgui state.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_visibility.get()` | Returns the general visibility state, which is that of the web UI (CEF). | 46 |
| `ui_visibility.getCef()` | Returns whether the web UI (CEF) is visible. | 10 |
| `ui_visibility.getImgui()` | Returns whether imgui is enabled. | 35 |
| `ui_visibility.set(visible)` | Shows or hides the web UI and imgui at the same time. | 40 |
| `ui_visibility.setCef(visible)` | Shows or hides the web UI; emits 'onCefVisibilityChanged' (UI and extensions) only if the state changes. | 13 |
| `ui_visibility.setImgui(visible)` | Enables or disables imgui (Engine.imgui.setEnabled) if the state changes. | 27 |
| `ui_visibility.toggle()` | Toggles the general visibility (according to get(), so the CEF state) and applies it to CEF and imgui. | 50 |
| `ui_visibility.toggleCef()` | Toggles the web UI visibility. | 22 |

### Parameter details

#### `ui_visibility.get()`

Returns the general visibility state, which is that of the web UI (CEF).

- **returns**: boolean true if visible.

#### `ui_visibility.getCef()`

Returns whether the web UI (CEF) is visible.

- **returns**: boolean true if visible.

#### `ui_visibility.getImgui()`

Returns whether imgui is enabled.

- **returns**: boolean true if visible.

#### `ui_visibility.set(visible)`

Shows or hides the web UI and imgui at the same time.

- `visible` (*boolean*) : true to show.

#### `ui_visibility.setCef(visible)`

Shows or hides the web UI; emits 'onCefVisibilityChanged' (UI and extensions) only if the state changes.

- `visible` (*boolean*) : true to show.

#### `ui_visibility.setImgui(visible)`

Enables or disables imgui (Engine.imgui.setEnabled) if the state changes.

- `visible` (*boolean*) : true to enable.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onCefVisibilityChanged` — listened to by 2 module(s)

**UI events (guihooks.trigger):** `onCefVisibilityChanged`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/visibility.lua`.*
