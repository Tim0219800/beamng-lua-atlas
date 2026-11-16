---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/ambientSound.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small manager of ambient sound "streams" played in the 'AudioGui' audio channel. Each stream is described by a JSON file (key data) containing a list of sounds and a random delay between two plays. update(dt) must be called by the caller every frame: it plays a randomly drawn sound, waits for the sound to end plus the delay, then draws another.
--- Access: extension `ui_ambientSound`: `extensions.load("ui_ambientSound")`, then the global `ui_ambientSound`
---@class ui_ambientSound
ui_ambientSound = {}

--- Removes from the list the stream whose streamID matches.
---Source: lua/ge/extensions/ui/ambientSound.lua:90
---@param ID integer Stream ID returned by init.
function ui_ambientSound.deleteSoundSFX(ID) end

--- Loads a sound stream JSON file (key data), adds it to the list of streams, draws a first sound at random and returns the stream ID. If the file does not exist, logs an error and returns nothing.
---Source: lua/ge/extensions/ui/ambientSound.lua:69
---@param json string Path of the JSON file describing the stream (field data with sounds, delay…).
---@return integer|nil  streamID of the new stream, or nil if the file is not found.
function ui_ambientSound.init(json) end

--- Sets the volume and pitch of a stream. fadeInTime is accepted but not used.
---Source: lua/ge/extensions/ui/ambientSound.lua:33
---@param streamID integer Stream ID.
---@param volume number Volume stored in the stream (not used at playback, see notes).
---@param pitch number Pitch passed to playOnce.
---@param fadeInTime number|nil Ignored.
function ui_ambientSound.setStreamState(streamID, volume, pitch, fadeInTime) end

--- Advances all streams: plays the current sound if it exists (FS:fileExists) via Engine.Audio.playOnce('AudioGui'), then accumulates time and moves to a new sound when duration + delay have elapsed.
---Source: lua/ge/extensions/ui/ambientSound.lua:44
---@param dt number Time elapsed since the previous frame, in seconds.
function ui_ambientSound.update(dt) end

