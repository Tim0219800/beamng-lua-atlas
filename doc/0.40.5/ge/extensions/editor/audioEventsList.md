# `editor_audioEventsList`

*File: `lua/ge/extensions/editor/audioEventsList.lua` · VM: Game Engine (GE) · 284 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_audioEventsList`: `extensions.load("editor_audioEventsList")`, then the global `editor_audioEventsList`

Editor window "SFX Previewer" (Audio menu) that lists all sound events (FMOD "event:>..." and sound files) of the game and lets you listen to them. The list comes from Sim.getSFXTrackSet(); it is displayed as a folder tree or filtered by a text search. Left click on an event = playback via Engine.Audio.playOnce('AudioGui', name, {position}) at the player vehicle position (or 0,0,0); right click = copy the name to the clipboard. Useful to a modder to find the exact name of an event to put in a jbeam or a scene.

## Notes

- Depends on editor_main; no public function apart from the editor hooks.
- Events whose name starts with "event:>" are split on ">"; the others (objects with getSoundFilename) are split on "/" according to the sound file path.
- The tree is only rebuilt when the window is shown (onEditorToolWindowShow); the eventsList table is never cleared between two rebuilds (inferred from code: only eventsTree is cleaned).
- The sound currently playing is stopped then deleted (stop(-1) then delete) before another is started.

**Dependencies (loaded first):** `editor_main`

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_audioEventsList.onEditorInitialized()` | Hook called at editor initialization: registers the window (500x500) and the menu entry in the "Audio" group. *(internal)* *(hook)* | 273 |
| `editor_audioEventsList.onEditorToolWindowHide(windowName)` | Hook called when a tool window is hidden; for "sfxPreviewer", saves the window state (editor.saveWindowsState). *(internal)* *(hook)* | 263 |
| `editor_audioEventsList.onEditorToolWindowShow(windowName)` | Hook called when an editor tool window is shown; if it is "sfxPreviewer", rebuilds the sound event list. *(internal)* *(hook)* | 257 |
| `editor_audioEventsList.onUpdate(dtReal, dtSim, dtRaw)` | Draws the SFX Previewer window (search field, folder tree navigation or search results, "Stop Current Sound" button). Does nothing if the editor or the window are not registered. *(internal)* *(hook)* | 214 |
| `editor_audioEventsList.onWindowMenuItem()` | Called by the Audio > SFX Previewer menu entry; shows the window. *(internal)* *(hook)* | 269 |

### Parameter details

#### `editor_audioEventsList.onEditorToolWindowHide(windowName)`

Hook called when a tool window is hidden; for "sfxPreviewer", saves the window state (editor.saveWindowsState).

- `windowName` (*string*) : Name of the hidden window.

#### `editor_audioEventsList.onEditorToolWindowShow(windowName)`

Hook called when an editor tool window is shown; if it is "sfxPreviewer", rebuilds the sound event list.

- `windowName` (*string*) : Name of the shown window.

#### `editor_audioEventsList.onUpdate(dtReal, dtSim, dtRaw)`

Draws the SFX Previewer window (search field, folder tree navigation or search results, "Stop Current Sound" button). Does nothing if the editor or the window are not registered.

- `dtReal` (*number*) : Real frame time (s).
- `dtSim` (*number*) : Simulated frame time (s).
- `dtRaw` (*number*) : Raw frame time (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions to load before this one: {"editor_main"}. |

## Calls into the engine (C++)

- `Sim.` `getSFXTrackSet`, `upcast`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/audioEventsList.lua`.*
