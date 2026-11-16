---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/hardwareAudio.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Hardware telemetry utility module (loaded by require): turns the raw information of the audio output device into an anonymized summary. The device name is classified by keywords (virtual, headphones, display, speakers, unknown) then discarded: only the category, the sample rate, the speaker mode and the channel count are kept.
--- Access: extension `telemetry_hardwareAudio`: `extensions.load("telemetry_hardwareAudio")`, then the global `telemetry_hardwareAudio`
---@class telemetry_hardwareAudio
telemetry_hardwareAudio = {}

--- Returns {category, sampleRateHz, speakerMode, channels} from the audio device info; the raw name and the diagnostic fields (provider, driverIndex, useHardware, maxBuffers, caps) are never carried over.
---Source: lua/ge/extensions/telemetry/hardwareAudio.lua:48
---@param info table|nil Device info: name, sampleRateHz, speakerMode, channels...
---@return table|nil  Anonymized summary, or nil if info is absent or empty.
function telemetry_hardwareAudio.fromDeviceInfo(info) end

