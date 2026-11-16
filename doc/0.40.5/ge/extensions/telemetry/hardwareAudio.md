# `telemetry_hardwareAudio`

*File: `lua/ge/extensions/telemetry/hardwareAudio.lua` · VM: Game Engine (GE) · 61 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_hardwareAudio`: `extensions.load("telemetry_hardwareAudio")`, then the global `telemetry_hardwareAudio`

Hardware telemetry utility module (loaded by require): turns the raw information of the audio output device into an anonymized summary. The device name is classified by keywords (virtual, headphones, display, speakers, unknown) then discarded: only the category, the sample rate, the speaker mode and the channel count are kept.

## Notes

- The keywords are searched in lowercase in the name: virtual (virtual, voicemeeter, cable input, sonar, streaming speakers, wave link) takes priority, then headphones (headphone, headset, earphone, earbud, airpods), then display (word 'tv', hdmi, displayport, monitor, NVIDIA/AMD/Intel display audio), then speakers (speaker, soundbar).

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_hardwareAudio.fromDeviceInfo(info)` | Returns {category, sampleRateHz, speakerMode, channels} from the audio device info; the raw name and the diagnostic fields (provider, driverIndex, useHardware, maxBuffers, caps) are never carried over. | 48 |

### Parameter details

#### `telemetry_hardwareAudio.fromDeviceInfo(info)`

Returns {category, sampleRateHz, speakerMode, channels} from the audio device info; the raw name and the diagnostic fields (provider, driverIndex, useHardware, maxBuffers, caps) are never carried over.

- `info` (*table|nil*) : Device info: name, sampleRateHz, speakerMode, channels...
- **returns**: table|nil Anonymized summary, or nil if info is absent or empty.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/hardwareAudio.lua`.*
