---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/settings/audio.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Audio settings: choice of output provider/device, per-channel volumes (master, engine, suspension, music, UI...) and stereo headphone mode. Provides the "option helpers" (get/set) used by core_settings_settings, and a function to reset to default values.
--- Access: extension `core_settings_audio`: `extensions.load("core_settings_audio")`, then the global `core_settings_audio`
---@class core_settings_audio
core_settings_audio = {}

--- Creates and returns (and stores) the options table. Keys: AudioProvider (get/set/getModes; set creates the audio device), AudioMasterVol, AudioPowerVol, AudioForcedInductionVol, AudioTransmissionVol, AudioSuspensionVol, AudioSurfaceVol, AudioCollisionVol, AudioAeroVol, AudioEnvironmentVol, AudioMusicVol, AudioUiVol, AudioOtherVol, AudioLfeVol, AudioIntercomVol (get reads $pref::SFX::AudioChannelXxx), AudioEnableStereoHeadphones (on change: writes $pref::SFX::enableHeadphonesMode, calls core_audio.triggerBankHotloading() and reapplies the volumes).
---Source: lua/ge/extensions/core/settings/audio.lua:48
---@return table<string, table>  Helpers with get/set (and getModes for AudioProvider).
function core_settings_audio.buildOptionHelpers() end

--- Returns the options table stored by buildOptionHelpers.
---Source: lua/ge/extensions/core/settings/audio.lua:329
---@return table|nil  nil until buildOptionHelpers has been called.
function core_settings_audio.getOptions() end

--- Hook called at the first settings update: creates the audio device of the chosen provider ($pref::SFX::providerName), falling back to the first non-Null provider if the name is invalid.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/settings/audio.lua:283
---@param data any Not used.
function core_settings_audio.onFirstUpdateSettings(data) end

--- Resets all volumes to their default values: master 1.0, LFE 0.5, all others 0.8. Then settings.refreshTSState(true), settings.notifyUI() and settings.requestSave(). Requires buildOptionHelpers to have been called.
---Source: lua/ge/extensions/core/settings/audio.lua:262
function core_settings_audio.restoreDefaults() end

--- Changes the FMOD output device: takes the device with the given index in the FMOD list of Engine.Audio.getInfo() and creates the matching audio device.
---Source: lua/ge/extensions/core/settings/audio.lua:317
---@param index integer Index in the FMOD device list.
function core_settings_audio.switchOutputDevice(index) end

