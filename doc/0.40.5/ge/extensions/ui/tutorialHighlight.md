# `ui_tutorialHighlight`

*File: `lua/ge/extensions/ui/tutorialHighlight.lua` · VM: Game Engine (GE) · 112 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_tutorialHighlight`: `extensions.load("ui_tutorialHighlight")`, then the global `ui_tutorialHighlight`

Manages the list of interface elements to highlight during a tutorial. Each element is identified by an id (string); the state (ids in order of appearance, options, revision) is broadcast to the UI via the `tutorialHighlight` stream (guihooks.triggerStream). A modder or a tutorial script calls show/hide to turn a marker on or off.

## Example

```lua
ui_tutorialHighlight.show("btnGarage", {focus = true, scroll = true})
-- later
ui_tutorialHighlight.hide("btnGarage")
```

## Notes

- Only the focus and scroll options (if true) are kept; if at least one is active, a `requestId` equal to the current revision is added.
- The extension is in "manual" unload mode (setExtensionUnloadMode in onInit).
- Each effective show/hide/hideAll increments the revision and rebroadcasts the stream; show rebroadcasts even if the id is already active.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_tutorialHighlight.getState()` | Returns the current stream payload. | 17 |
| `ui_tutorialHighlight.hide(id)` | Removes the id from the highlight and broadcasts the state. | 65 |
| `ui_tutorialHighlight.hideAll()` | Removes all highlights and broadcasts the state. | 85 |
| `ui_tutorialHighlight.onInit()` | Initialization hook on extension creation: sets the unload mode to "manual". *(internal)* *(hook)* | 100 |
| `ui_tutorialHighlight.onUiReady()` | Hook called when the UI is ready: rebroadcasts the current state. *(internal)* *(hook)* | 96 |
| `ui_tutorialHighlight.show(id, options)` | Enables the highlight of the id (appended at the end of the order if new), stores its options and broadcasts the state. | 44 |

### Parameter details

#### `ui_tutorialHighlight.getState()`

Returns the current stream payload.

- **returns**: table { ids = string[], options = table<string, table>, revision = integer }

#### `ui_tutorialHighlight.hide(id)`

Removes the id from the highlight and broadcasts the state.

- `id` (*string*) : Identifier of the element.
- **returns**: boolean true if the id was active.

#### `ui_tutorialHighlight.hideAll()`

Removes all highlights and broadcasts the state.

- **returns**: boolean false if nothing was active.

#### `ui_tutorialHighlight.show(id, options)`

Enables the highlight of the id (appended at the end of the order if new), stores its options and broadcasts the state.

- `id` (*string*) : Non-empty identifier of the element.
- `options` (*table|nil*) : {focus = boolean, scroll = boolean}.
- **returns**: boolean true if the id was just added; false if it was already active or if the id is invalid.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/tutorialHighlight.lua`.*
