# `ui_messagesDebugger`

*File: `lua/ge/extensions/ui/messagesDebugger.lua` · VM: Game Engine (GE) · 112 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_messagesDebugger`: `extensions.load("ui_messagesDebugger")`, then the global `ui_messagesDebugger`

ImGui debug window for on-screen messages ("Message" UI events). It lets you compose a message (text, category, icon, duration in seconds), send it via guihooks.message, clear a category or all messages, and enable a TTL bypass on the UI side. Useful for testing the display of messages and [action=...] bindings.

## Example

```lua
extensions.load('ui_messagesDebugger'); ui_messagesDebugger.show()
```

## Notes

- guihooks events emitted: Message (with clear = true to clear a category), ClearAllMessages, MessagesDebug ({bypassTtl}).
- The "Regex clear" checkbox has no effect: both branches of _clearCategory send the same event (the category is therefore used as is).
- The "Test 3 Messages" button sends three messages in the categories <category>.1, .2 and .3 with durations of 3, 4 and 5 s.

**Dependencies (loaded first):** `ui_imgui`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_messagesDebugger.hide()` | Closes the window. | 38 |
| `ui_messagesDebugger.onUpdate(dtReal, dtSim, dtRaw)` | Hook called every frame; draws the window if it is open (nothing otherwise). *(internal)* *(hook)* | 42 |
| `ui_messagesDebugger.show()` | Opens the "Messages Debugger" window. | 37 |
| `ui_messagesDebugger.toggle()` | Toggles the window's open state. | 39 |

### Parameter details

#### `ui_messagesDebugger.onUpdate(dtReal, dtSim, dtRaw)`

Hook called every frame; draws the window if it is open (nothing otherwise).

- `dtReal` (*number*) : Elapsed real time (s), unused.
- `dtSim` (*number*) : Elapsed simulation time (s), unused.
- `dtRaw` (*number*) : Raw elapsed time (s), unused.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: ui_imgui. |

**UI events (guihooks.trigger):** `ClearAllMessages`, `Message`, `MessagesDebug`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/messagesDebugger.lua`.*
