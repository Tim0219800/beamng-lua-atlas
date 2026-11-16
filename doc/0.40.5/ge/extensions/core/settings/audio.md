# `core_settings_audio`

*File: `lua/ge/extensions/core/settings/audio.lua` · VM: Game Engine (GE) · 335 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_settings_audio`: `extensions.load("core_settings_audio")`, then the global `core_settings_audio`

Audio settings: choice of output provider/device, per-channel volumes (master, engine, suspension, music, UI...) and stereo headphone mode. Provides the "option helpers" (get/set) used by core_settings_settings, and a function to reset to default values.

## Notes

- The volume setters clamp the value between 0 and 1 then call Engine.Audio.setChannelVolume('AudioChannelXxx', value).
- Probable BUG: in createAudioDevice, the error message uses audioProviderName which is not defined in this function (nil global variable): the concatenation would raise an error if device creation fails.
- AudioEnableStereoHeadphones.set references AudioInterfaceVol and AudioAmbienceVol which do not exist in the helpers (ignored by the if test).
- switchOutputDevice dumps the providers to the log and only acts on the 'FMOD' provider.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_settings_audio.buildOptionHelpers()` | Creates and returns (and stores) the options table. Keys: AudioProvider (get/set/getModes; set creates the audio device), AudioMasterVol, AudioPowerVol, AudioForcedInductionVol, AudioTransmissionVol, AudioSuspensionVol, AudioSurfaceVol, AudioCollisionVol, AudioAeroVol, AudioEnvironmentVol, AudioMusicVol, AudioUiVol, AudioOtherVol, AudioLfeVol, AudioIntercomVol (get reads $pref::SFX::AudioChannelXxx), AudioEnableStereoHeadphones (on change: writes $pref::SFX::enableHeadphonesMode, calls core_audio.triggerBankHotloading() and reapplies the volumes). | 48 |
| `core_settings_audio.getOptions()` | Returns the options table stored by buildOptionHelpers. | 329 |
| `core_settings_audio.onFirstUpdateSettings(data)` | Hook called at the first settings update: creates the audio device of the chosen provider ($pref::SFX::providerName), falling back to the first non-Null provider if the name is invalid. *(internal)* *(hook)* | 283 |
| `core_settings_audio.restoreDefaults()` | Resets all volumes to their default values: master 1.0, LFE 0.5, all others 0.8. Then settings.refreshTSState(true), settings.notifyUI() and settings.requestSave(). Requires buildOptionHelpers to have been called. | 262 |
| `core_settings_audio.switchOutputDevice(index)` | Changes the FMOD output device: takes the device with the given index in the FMOD list of Engine.Audio.getInfo() and creates the matching audio device. | 317 |

### Parameter details

#### `core_settings_audio.buildOptionHelpers()`

Creates and returns (and stores) the options table. Keys: AudioProvider (get/set/getModes; set creates the audio device), AudioMasterVol, AudioPowerVol, AudioForcedInductionVol, AudioTransmissionVol, AudioSuspensionVol, AudioSurfaceVol, AudioCollisionVol, AudioAeroVol, AudioEnvironmentVol, AudioMusicVol, AudioUiVol, AudioOtherVol, AudioLfeVol, AudioIntercomVol (get reads $pref::SFX::AudioChannelXxx), AudioEnableStereoHeadphones (on change: writes $pref::SFX::enableHeadphonesMode, calls core_audio.triggerBankHotloading() and reapplies the volumes).

- **returns**: table<string, table> Helpers with get/set (and getModes for AudioProvider).

#### `core_settings_audio.getOptions()`

Returns the options table stored by buildOptionHelpers.

- **returns**: table|nil nil until buildOptionHelpers has been called.

#### `core_settings_audio.onFirstUpdateSettings(data)`

Hook called at the first settings update: creates the audio device of the chosen provider ($pref::SFX::providerName), falling back to the first non-Null provider if the name is invalid.

- `data` (*any*) : Not used.

#### `core_settings_audio.switchOutputDevice(index)`

Changes the FMOD output device: takes the device with the given index in the FMOD list of Engine.Audio.getInfo() and creates the matching audio device.

- `index` (*integer*) : Index in the FMOD device list.

## Calls into the engine (C++)

- `be:` `sfxGetAvailableDevices`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/settings/audio.lua`.*
