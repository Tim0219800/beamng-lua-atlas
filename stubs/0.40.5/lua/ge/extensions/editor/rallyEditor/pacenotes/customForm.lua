---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/pacenotes/customForm.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Imgui form of the pacenote editor for pacenotes in "custom" audio mode (custom audio files). It displays the "Slow Corner" checkbox and its release type, the pacenote's text preview (noteOutputCustom), buttons to open or copy the audio files folder, then the list of assigned clips with a play button (Engine.Audio.intercomPlayPacenote). A clip's displayed description comes from the notebook's transcriptions, otherwise from the file name.
--- Access: extension `editor_rallyEditor_pacenotes_customForm`: `extensions.load("editor_rallyEditor_pacenotes_customForm")`, then the global `editor_rallyEditor_pacenotes_customForm`
---@class editor_rallyEditor_pacenotes_customForm
editor_rallyEditor_pacenotes_customForm = {}

--- State reset called by the editor; does nothing in this module.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes/customForm.lua:116
function editor_rallyEditor_pacenotes_customForm.clear() end

--- Draws the form of a pacenote in custom audio mode.
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes/customForm.lua:86
---@param pacenote table Edited pacenote (methods toggleSlowCorner, getCustomAudioFiles, noteOutputCustom, customAudioFileDir...).
function editor_rallyEditor_pacenotes_customForm.draw(pacenote) end

