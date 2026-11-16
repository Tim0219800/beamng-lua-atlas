---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/credits.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Plays the credits music (FMOD event "event:>Music>credits" on the AudioGui channel) with volume fades. Loading the extension starts the music with a 0.4 s fade-in; unloading deletes the sound source.
--- Access: extension `ui_credits`: `extensions.load("ui_credits")`, then the global `ui_credits`
---@class ui_credits
ui_credits = {}

--- Hook called when the extension loads: starts startWithFade with the default duration (0.4 s).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/credits.lua:123
function ui_credits.onExtensionLoaded() end

--- Hook called on unload: stops and deletes the sound source and frees the parameter group.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/credits.lua:127
function ui_credits.onExtensionUnloaded() end

--- Hook called every frame: advances the current fade and calls its callback at the end.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/credits.lua:132
---@param dtReal number Real time elapsed since the last frame (s).
function ui_credits.onUpdate(dtReal) end

--- Creates the credits sound source if needed, starts it at volume 0 if it is not yet playing, then fades to volume 1.
---Source: lua/ge/extensions/ui/credits.lua:85
---@param duration number|nil Fade duration in seconds (default 0.4).
---@return boolean  false if the sound source could not be created, otherwise true.
function ui_credits.startWithFade(duration) end

--- Fades to 0 then stops and deletes the source, then calls onStopped. If there is no sound, stops immediately.
---Source: lua/ge/extensions/ui/credits.lua:105
---@param duration number|nil Fade duration in seconds (default 0.4).
---@param onStopped function|nil Callback with no argument called once the music has stopped.
function ui_credits.stopWithFade(duration, onStopped) end

