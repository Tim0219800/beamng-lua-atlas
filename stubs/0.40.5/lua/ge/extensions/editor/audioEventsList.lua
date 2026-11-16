---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/audioEventsList.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor window "SFX Previewer" (Audio menu) that lists all sound events (FMOD "event:>..." and sound files) of the game and lets you listen to them. The list comes from Sim.getSFXTrackSet(); it is displayed as a folder tree or filtered by a text search. Left click on an event = playback via Engine.Audio.playOnce('AudioGui', name, {position}) at the player vehicle position (or 0,0,0); right click = copy the name to the clipboard. Useful to a modder to find the exact name of an event to put in a jbeam or a scene.
--- Access: extension `editor_audioEventsList`: `extensions.load("editor_audioEventsList")`, then the global `editor_audioEventsList`
---@class editor_audioEventsList
---@field dependencies table<integer, string> Extensions to load before this one: {"editor_main"}.
editor_audioEventsList = {}

--- Hook called at editor initialization: registers the window (500x500) and the menu entry in the "Audio" group.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/audioEventsList.lua:273
function editor_audioEventsList.onEditorInitialized() end

--- Hook called when a tool window is hidden; for "sfxPreviewer", saves the window state (editor.saveWindowsState).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/audioEventsList.lua:263
---@param windowName string Name of the hidden window.
function editor_audioEventsList.onEditorToolWindowHide(windowName) end

--- Hook called when an editor tool window is shown; if it is "sfxPreviewer", rebuilds the sound event list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/audioEventsList.lua:257
---@param windowName string Name of the shown window.
function editor_audioEventsList.onEditorToolWindowShow(windowName) end

--- Draws the SFX Previewer window (search field, folder tree navigation or search results, "Stop Current Sound" button). Does nothing if the editor or the window are not registered.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/audioEventsList.lua:214
---@param dtReal number Real frame time (s).
---@param dtSim number Simulated frame time (s).
---@param dtRaw number Raw frame time (s).
function editor_audioEventsList.onUpdate(dtReal, dtSim, dtRaw) end

--- Called by the Audio > SFX Previewer menu entry; shows the window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/audioEventsList.lua:269
function editor_audioEventsList.onWindowMenuItem() end

