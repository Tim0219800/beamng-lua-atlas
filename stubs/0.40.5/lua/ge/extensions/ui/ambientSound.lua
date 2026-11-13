---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/ambientSound.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_ambientSound` : `extensions.load("ui_ambientSound")`, puis la globale `ui_ambientSound`
---@class ui_ambientSound
ui_ambientSound = {}

--- this function remove stream object from sounstream table
--- @param ID is number represent streamID
---Source : lua/ge/extensions/ui/ambientSound.lua:90
---@param ID any
function ui_ambientSound.deleteSoundSFX(ID) end

--- set soundStreams table that contains number of streams to be played
--- call getrandomSound to set currentSoundData and returns stream ID
--- @param json string
---Source : lua/ge/extensions/ui/ambientSound.lua:69
---@param json any
function ui_ambientSound.init(json) end

--- setStreamState to set volume ,pitch..etc of each stream
---Source : lua/ge/extensions/ui/ambientSound.lua:33
---@param streamID any
---@param volume any
---@param pitch any
---@param fadeInTime any
function ui_ambientSound.setStreamState(streamID, volume, pitch, fadeInTime) end

--- this function update the sounds in currentSoundData
---Source : lua/ge/extensions/ui/ambientSound.lua:44
---@param dt any
function ui_ambientSound.update(dt) end

