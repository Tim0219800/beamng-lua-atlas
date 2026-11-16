# `editor_newsMessage`

*File: `lua/ge/extensions/editor/newsMessage.lua` · VM: Game Engine (GE) · 62 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_newsMessage`: `extensions.load("editor_newsMessage")`, then the global `editor_newsMessage`

Editor extension that displays a "World Editor News" modal window with the important release notes, only once per message version (EditorNewsMessageVersion = 5), with links to the BeamNG support and forum. It remembers the display in two hidden preferences (newsMessage.general.newsMessageShown and newsMessageVersion).

## Notes

- In 0.40.5, newsText is empty: onEditorGui returns immediately and the window is never displayed.
- For the message to be displayed again, EditorNewsMessageVersion must be increased and newsText filled in.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_newsMessage.onEditorGui()` | Editor hook called every frame: opens the modal window if the message has not yet been seen for this version, then draws it (text, links, Close button). *(internal)* *(hook)* | 13 |
| `editor_newsMessage.onEditorInitialized()` | Hook called at editor initialization: registers the "newsModalDlg" modal window. *(internal)* *(hook)* | 54 |
| `editor_newsMessage.onEditorRegisterPreferences(prefsRegistry)` | Preferences registration hook: creates the newsMessage category with the hidden preferences newsMessageShown (bool) and newsMessageVersion (int). *(internal)* *(hook)* | 43 |

### Parameter details

#### `editor_newsMessage.onEditorRegisterPreferences(prefsRegistry)`

Preferences registration hook: creates the newsMessage category with the hidden preferences newsMessageShown (bool) and newsMessageVersion (int).

- `prefsRegistry` (*table*) : Editor preferences registry.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/newsMessage.lua`.*
