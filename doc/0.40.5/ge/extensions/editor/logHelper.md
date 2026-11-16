# `editor_logHelper`

*File: `lua/ge/extensions/editor/logHelper.lua` · VM: Game Engine (GE) · 31 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_logHelper`: `extensions.load("editor_logHelper")`, then the global `editor_logHelper`

Editor extension that displays in the editor's main menu bar the error counter (red, suffix E) and warning counter (yellow, suffix W) of the development log, via Lua:getDevLogStats().

## Notes

- The guard test uses `Lua.getDevLogStats` (dot) while the call uses `Lua:getDevLogStats()` (colon).
- The code comment states that right-aligning in the bar (SameLine) no longer works: the text is displayed right after the menus.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_logHelper.onEditorMainMenuBar(windowSize)` | Main menu bar draw hook. Writes "LogStats:" then the number of errors and warnings if they are greater than 0. Does nothing if Lua.getDevLogStats does not exist. *(internal)* *(hook)* | 9 |

### Parameter details

#### `editor_logHelper.onEditorMainMenuBar(windowSize)`

Main menu bar draw hook. Writes "LogStats:" then the number of errors and warnings if they are greater than 0. Does nothing if Lua.getDevLogStats does not exist.

- `windowSize` (*table*) : Window size (unused: the SameLine line is commented out).

## Calls into the engine (C++)

- `Lua:` `getDevLogStats`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/logHelper.lua`.*
