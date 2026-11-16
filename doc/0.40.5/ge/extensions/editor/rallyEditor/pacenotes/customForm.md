# `editor_rallyEditor_pacenotes_customForm`

*File: `lua/ge/extensions/editor/rallyEditor/pacenotes/customForm.lua` · VM: Game Engine (GE) · 120 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_rallyEditor_pacenotes_customForm`: `extensions.load("editor_rallyEditor_pacenotes_customForm")`, then the global `editor_rallyEditor_pacenotes_customForm`

Imgui form of the pacenote editor for pacenotes in "custom" audio mode (custom audio files). It displays the "Slow Corner" checkbox and its release type, the pacenote's text preview (noteOutputCustom), buttons to open or copy the audio files folder, then the list of assigned clips with a play button (Engine.Audio.intercomPlayPacenote). A clip's displayed description comes from the notebook's transcriptions, otherwise from the file name.

## Notes

- The audio folder is created if it does not exist when you click "open folder".
- Clips whose file does not exist have a red play button and play nothing.
- The Slow Corner fields modify the same fields as the structured form and mark the validation as needing redoing (markValidationDirty).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_rallyEditor_pacenotes_customForm.clear()` | State reset called by the editor; does nothing in this module. *(internal)* | 116 |
| `editor_rallyEditor_pacenotes_customForm.draw(pacenote)` | Draws the form of a pacenote in custom audio mode. | 86 |

### Parameter details

#### `editor_rallyEditor_pacenotes_customForm.draw(pacenote)`

Draws the form of a pacenote in custom audio mode.

- `pacenote` (*table*) : Edited pacenote (methods toggleSlowCorner, getCustomAudioFiles, noteOutputCustom, customAudioFileDir...).

## Calls into the engine (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/rallyEditor/pacenotes/customForm.lua`.*
