---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/drivePathEditor/playback.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_drivePathEditor_playback` : `extensions.load("editor_drivePathEditor_playback")`, puis la globale `editor_drivePathEditor_playback`
---@class editor_drivePathEditor_playback
editor_drivePathEditor_playback = {}

--- Gets the current playback time.
---Source : lua/ge/extensions/editor/drivePathEditor/playback.lua:25
function editor_drivePathEditor_playback.getPlaybackTime() end

--- Handles playback of all the active drive path splines/vehicles.
---Source : lua/ge/extensions/editor/drivePathEditor/playback.lua:77
function editor_drivePathEditor_playback.handlePlayback() end

--- Starts playback of all linked drive path splines/vehicles.
---  [Adds all vehicles to the playing table if they have a valid link to a spline.]
---  [Note: Execution wont start until the update function is called, where delayTime is used to start the playback.]
---Source : lua/ge/extensions/editor/drivePathEditor/playback.lua:30
---@param splines any
---@param vehicles any
function editor_drivePathEditor_playback.startPlayback(splines, vehicles) end

--- Stops playback of all linked drive path splines/vehicles, and resets the vehicles to their starting positions.
---Source : lua/ge/extensions/editor/drivePathEditor/playback.lua:58
function editor_drivePathEditor_playback.stopPlayback() end

