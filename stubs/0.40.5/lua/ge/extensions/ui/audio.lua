---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/audio.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Plays the interface sounds (audio channel "AudioGui") from the file ui/soundClasses.json. Each sound class contains events; a simple event plays an sfx once, a "source" event creates and reuses a managed audio source (play, setParameters, stopBeforePlay, recreateBeforePlay). Also used for the long-press sounds (bng_hold_activate: start, complete, cancel).
--- Access: extension `ui_audio`: `extensions.load("ui_audio")`, then the global `ui_audio`
---@class ui_audio
ui_audio = {}

--- Plays the "cancel" event of the bng_hold_activate class (long press released too early).
---Source: lua/ge/extensions/ui/audio.lua:140
---@param instanceId any Instance identifier of the managed source.
function ui_audio.cancelHoldActivateSound(instanceId) end

--- Plays the "complete" event of the bng_hold_activate class (long press completed).
---Source: lua/ge/extensions/ui/audio.lua:136
---@param instanceId any Instance identifier of the managed source.
function ui_audio.completeHoldActivateSound(instanceId) end

--- Hook called by the engine on the first update: reads ui/soundClasses.json into M.ui_sound_classes ({} if absent).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/audio.lua:10
function ui_audio.onFirstUpdate() end

--- Plays the event eventName of the class className. Does nothing if the class or the event does not exist. Simple event: plays the sfx once on AudioGui; source event: creates/reuses the source, applies the parameters then starts it (play(-1)).
---Source: lua/ge/extensions/ui/audio.lua:119
---@param className string Name of the sound class in soundClasses.json.
---@param eventName string Name of the event in the class.
---@param instanceId any Optional instance identifier to have a distinct source per UI component (inferred from code: concatenated to the cache key).
function ui_audio.playEventSound(className, eventName, instanceId) end

--- Plays the "start" event of the bng_hold_activate class (start of a long press).
---Source: lua/ge/extensions/ui/audio.lua:132
---@param instanceId any Instance identifier of the managed source.
function ui_audio.startHoldActivateSound(instanceId) end

