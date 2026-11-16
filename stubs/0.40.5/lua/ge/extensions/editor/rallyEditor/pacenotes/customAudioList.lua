---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/pacenotes/customAudioList.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Imgui list of a rally notebook's custom audio clips, used in the pacenote editor (custom audio mode). It displays all clips in order, grouped under a header per pacenote (alternating yellow/purple colors, green for the selected pacenote). Each row has a play button, an "anchor" button (crosshair) to choose in the 3D view the pacenote to attach the clip to, a button to clear the anchor, and the transcription text (otherwise the file name). A "Sync audio files" button re-reads the audio folder.
--- Access: extension `editor_rallyEditor_pacenotes_customAudioList`: `extensions.load("editor_rallyEditor_pacenotes_customAudioList")`, then the global `editor_rallyEditor_pacenotes_customAudioList`
---@class editor_rallyEditor_pacenotes_customAudioList
editor_rallyEditor_pacenotes_customAudioList = {}

--- Draws the toolbar, the anchor pick help and the scrolling clip list. Displays a message if the notebook is missing or no audio file is found.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes/customAudioList.lua:184
---@param notebook table|nil Notebook (methods customAudioBasenamesFor, scanCustomAudioBasenames, syncCustomAudioFromDisk, resolveCustomAudioBasename, getCustomAudioAnchorInfo, clearCustomAudioAnchor, loadCustomPacenoteTranscriptions).
---@param selectedPacenote table|nil Currently selected pacenote, whose group is highlighted.
---@param pacenoteToolsWindow table|nil Pacenote tools window: provides beginCustomAudioAnchorPick, isPickingCustomAudioAnchorFor, getCustomAudioAnchorPickBasename.
function editor_rallyEditor_pacenotes_customAudioList.draw(notebook, selectedPacenote, pacenoteToolsWindow) end

