# `telemetry_trackers_editor`

*File: `lua/ge/extensions/telemetry/trackers/editor.lua` · VM: Game Engine (GE) · 59 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_trackers_editor`: `extensions.load("telemetry_trackers_editor")`, then the global `telemetry_trackers_editor`

World editor telemetry tracker: measures how long the editor is open (activity "editorActive") and records the tool windows opened (event "editorToolWindowOpened" with tool name and entry point). Only tool names are reported, never level or asset paths. The track builder is tracked by another gameplay tracker.

## Notes

- If the editor is already active when the extension loads (editor.active), the activity starts immediately.
- onExit and onExtensionUnloaded are the same function: it closes the open activity, otherwise the last one would have no duration.

**Dependencies (loaded first):** `telemetry_core`

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_trackers_editor.onEditorActivated()` | Hook called when the editor is activated: starts the editorActive activity (no effect if already open). *(internal)* *(hook)* | 19 |
| `telemetry_trackers_editor.onEditorDeactivated()` | Hook called when the editor is closed: ends the editorActive activity. *(internal)* *(hook)* | 25 |
| `telemetry_trackers_editor.onEditorToolWindowOpened(toolName, entryPoint)` | Hook called when a tool window is opened: records the event. *(internal)* *(hook)* | 31 |
| `telemetry_trackers_editor.onExit()` | Hook called when the game closes: closes the open editor activity. *(internal)* *(hook)* | 45 |
| `telemetry_trackers_editor.onExtensionLoaded()` | Hook called on load: manual unload, and starts the activity if the editor is already active. *(internal)* *(hook)* | 39 |
| `telemetry_trackers_editor.onExtensionUnloaded()` | Hook called on unload: closes the open editor activity (same function as onExit). *(internal)* *(hook)* | 45 |

### Parameter details

#### `telemetry_trackers_editor.onEditorToolWindowOpened(toolName, entryPoint)`

Hook called when a tool window is opened: records the event.

- `toolName` (*string*) : Tool name.
- `entryPoint` (*string*) : Entry point (menu, shortcut, etc., inferred from code).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/trackers/editor.lua`.*
