# `ui_gameBlur`

*File: `lua/ge/extensions/ui/gameBlur.lua` · VM: Game Engine (GE) · 73 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_gameBlur`: `extensions.load("ui_gameBlur")`, then the global `ui_gameBlur`

Manages fullscreen blur rectangles drawn behind the interface (scenetree.ScreenBlurFX effect). The rectangles are stored in groups in M.blurRects; at each onPreRender they are sent to addFrameBlurRect. Normalized coordinates: (0,0) at top left, (1,1) at bottom right.

## Example

```lua
ui_gameBlur.replaceGroup('myPanel', { {0, 0.15, 1, 0.8, 1} })  -- x, y, w, h, opacity
ui_gameBlur.removeGroup('myPanel')
```

## Notes

- Each rectangle is a table {x, y, width, height, alpha} (indices 1 to 5), the color is ColorF(1,1,1,alpha).
- Nothing is drawn if the CEF UI is hidden (ui_visibility.getCef()), unless the test_singleLevelLong extension is loaded, nor if an OpenXR session is running.
- Bug: M.onExtensionLoaded, M.onExtensionUnloaded and M.setColor are assigned from local variables that are never defined, so they are nil.
- addToGroup and removeFromGroup exist but are not exported; only replaceGroup, removeGroup and removeAllGroups are public.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_gameBlur.onPreRender()` | Pre-render hook: sends each rectangle to the ScreenBlurFX (addFrameBlurRect) if the UI is visible. *(internal)* *(hook)* | 48 |
| `ui_gameBlur.removeAllGroups()` | Removes all the blur rectangle groups. | 39 |
| `ui_gameBlur.removeGroup(group)` | Removes a group of rectangles. | 35 |
| `ui_gameBlur.replaceGroup(group, data)` | Replaces all the rectangles of a group with the given list. | 31 |

### Parameter details

#### `ui_gameBlur.removeGroup(group)`

Removes a group of rectangles.

- `group` (*string*) : Group name.

#### `ui_gameBlur.replaceGroup(group, data)`

Replaces all the rectangles of a group with the given list.

- `group` (*string*) : Group name.
- `data` (*table*) : List of rectangles {x, y, w, h, alpha}.

## Fields

| Field | Type | Description |
|---|---|---|
| `onExtensionLoaded` | nil | Always nil (reference to an undefined variable). ⚠ reference `onExtensionLoaded` not defined in the file (probably nil) |
| `onExtensionUnloaded` | nil | Always nil (reference to an undefined variable). ⚠ reference `onExtensionUnloaded` not defined in the file (probably nil) |
| `setColor` | nil | Always nil (reference to an undefined variable). ⚠ reference `setColor` not defined in the file (probably nil) |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/gameBlur.lua`.*
