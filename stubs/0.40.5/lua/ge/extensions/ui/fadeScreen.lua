---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/fadeScreen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Screen fade to black driven from Lua. Sends the UI event "LoadingScreen" (active + fadeIn/pause/fadeOut/data parameters), sets the global FMOD audio parameters g_FadeTimeMS and g_GameLoading, and notifies the other extensions via the hook onScreenFadeState when the UI signals that the screen is black (1), that the pause is over (2) or that the fade back is finished (3). Used for level loads, teleports and transitions.
--- Access: extension `ui_fadeScreen`: `extensions.load("ui_fadeScreen")`, then the global `ui_fadeScreen`
---@class ui_fadeScreen
---@field delayFrames number Number of frames to wait before broadcasting onScreenFadeState (3 by default).
ui_fadeScreen = {}

--- Alias of fadeSequence.
---Source: lua/ge/extensions/ui/fadeScreen.lua:61
---@param fadeIn number|nil Duration of the fade to black.
---@param pause number|nil Duration of the pause.
---@param fadeOut number|nil Duration of the fade back.
---@param screenData table|nil Content displayed during the pause.
---@param args table|nil Options.
function ui_fadeScreen.cycle(fadeIn, pause, fadeOut, screenData, args) end

--- Comes back from black (LoadingScreen active=false with fadeOut), resets g_GameLoading to 0. Alias: stop.
---Source: lua/ge/extensions/ui/fadeScreen.lua:42
---@param fade number|nil Fade-back duration in seconds (default 1).
---@param args table|nil Options; useGlobalAudioFade=false to leave the global audio alone.
function ui_fadeScreen.fadeFromBlack(fade, args) end

--- Full fade: to black, pause, then back. Alias: cycle.
---Source: lua/ge/extensions/ui/fadeScreen.lua:61
---@param fadeIn number|nil Duration of the fade to black (default 1).
---@param pause number|nil Duration of the pause on black (minimum 0.05 s).
---@param fadeOut number|nil Duration of the fade back (default fadeIn).
---@param screenData table|nil Content displayed during the pause: {image, title, text}.
---@param args table|nil Options passed to the fades (useGlobalAudioFade).
function ui_fadeScreen.fadeSequence(fadeIn, pause, fadeOut, screenData, args) end

--- Starts a fade to black and stays there. screenData is displayed during the pause. Also sets the global audio parameters (unless useGlobalAudioFade == false). Alias: start.
---Source: lua/ge/extensions/ui/fadeScreen.lua:15
---@param fade number|nil Fade duration in seconds (default 1).
---@param screenData table|nil Content displayed during the pause: {image, title, text}.
---@param args table|nil Options; useGlobalAudioFade=false to leave the global audio alone.
function ui_fadeScreen.fadeToBlack(fade, screenData, args) end

--- Indicates whether the screen is confirmed black (after the delay of delayFrames frames).
---Source: lua/ge/extensions/ui/fadeScreen.lua:97
---@return boolean  true if the screen is black.
function ui_fadeScreen.isBlack() end

--- GUI per-frame hook: once the delay has elapsed, broadcasts the pending states via extensions.hook('onScreenFadeState', state) and chains the fadeFromBlack of a sequence at state 2.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/fadeScreen.lua:75
function ui_fadeScreen.onGuiUpdate() end

--- Called by the UI/engine when the fade state changes (1, 2 or 3): queues the state and restarts the frame counter; onGuiUpdate then broadcasts it via onScreenFadeState.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/fadeScreen.lua:70
---@param state integer 1 = black reached, 2 = end of pause, 3 = fade back finished.
function ui_fadeScreen.onScreenFadeStateDelayed(state) end

--- Alias of fadeToBlack.
---Source: lua/ge/extensions/ui/fadeScreen.lua:15
---@param fade number|nil Fade duration in seconds.
---@param screenData table|nil Content {image, title, text} displayed during the pause.
---@param args table|nil Options.
function ui_fadeScreen.start(fade, screenData, args) end

--- Alias of fadeFromBlack.
---Source: lua/ge/extensions/ui/fadeScreen.lua:42
---@param fade number|nil Fade-back duration in seconds.
---@param args table|nil Options.
function ui_fadeScreen.stop(fade, args) end

