# `editor_rallyEditor_pacenotes_customAudioList`

*File: `lua/ge/extensions/editor/rallyEditor/pacenotes/customAudioList.lua` · VM: Game Engine (GE) · 214 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_rallyEditor_pacenotes_customAudioList`: `extensions.load("editor_rallyEditor_pacenotes_customAudioList")`, then the global `editor_rallyEditor_pacenotes_customAudioList`

Imgui list of a rally notebook's custom audio clips, used in the pacenote editor (custom audio mode). It displays all clips in order, grouped under a header per pacenote (alternating yellow/purple colors, green for the selected pacenote). Each row has a play button, an "anchor" button (crosshair) to choose in the 3D view the pacenote to attach the clip to, a button to clear the anchor, and the transcription text (otherwise the file name). A "Sync audio files" button re-reads the audio folder.

## Notes

- Clips between two anchors are distributed by estimation ("guessed"); an anchor whose order conflicts with another is flagged by a warning in the tooltip.
- With no pacenote in the notebook, the clips are listed under "Unassigned audio" and the anchor button is disabled.
- A clip whose file does not exist has a red play button.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_rallyEditor_pacenotes_customAudioList.draw(notebook, selectedPacenote, pacenoteToolsWindow)` | Draws the toolbar, the anchor pick help and the scrolling clip list. Displays a message if the notebook is missing or no audio file is found. | 184 |

### Parameter details

#### `editor_rallyEditor_pacenotes_customAudioList.draw(notebook, selectedPacenote, pacenoteToolsWindow)`

Draws the toolbar, the anchor pick help and the scrolling clip list. Displays a message if the notebook is missing or no audio file is found.

- `notebook` (*table|nil*) : Notebook (methods customAudioBasenamesFor, scanCustomAudioBasenames, syncCustomAudioFromDisk, resolveCustomAudioBasename, getCustomAudioAnchorInfo, clearCustomAudioAnchor, loadCustomPacenoteTranscriptions).
- `selectedPacenote` (*table|nil*) : Currently selected pacenote, whose group is highlighted.
- `pacenoteToolsWindow` (*table|nil*) : Pacenote tools window: provides beginCustomAudioAnchorPick, isPickingCustomAudioAnchorFor, getCustomAudioAnchorPickBasename.

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/rallyEditor/pacenotes/customAudioList.lua`.*
