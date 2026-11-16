# `flowgraph_nodes_audio_fade`

*File: `lua/ge/extensions/flowgraph/nodes/audio/fade.lua` · VM: Game Engine (GE) · 100 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/audio/fade")` (file under extensions/ but not a regular extension)

Flowgraph node "Audio Channel Fade" (tags sound/audio/volume, icon audiotrack). Fades the volume of an FMOD audio channel (default 'AudioChannelMaster') toward silence or toward the previous volume, with more control than the Fade In/Out nodes. Inputs: flow, fadeDown (goes down to volumeMin), fadeUp (goes back up to volumeMax), duration (s, default 1), channel, volumeMin (default 0) and volumeMax (default 1) hidden. Outputs: fadeDone (flow) and volume (current volume). Runs every frame (work). Uses an internal timer (mgr.dtReal) for compatibility reasons.

## Notes

- Old pins renamed (legacyPins): fadeTime -> duration, fadeIn -> fadeDown, fadeOut -> fadeUp (the fadeIn/fadeOut mapping seems inverted relative to the meaning, but that is what the code does).
- If fadeDown and fadeUp are active at the same time, the mode is 0 (no fade).
- When the graph stops, the channel volume is set back to its base value (getChannelVolume(channel, false)).
- If volumeMax is not provided, the fade-up target is the channel's "unfaded" volume.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | When the graph stops: restores the channel's base volume then reset(). | 49 |
| `C:init()` | Calls reset(). | 45 |
| `C:reset()` | Resets the timer, mode, volumes and channel. | 37 |
| `C:work()` | Every frame, if flow is active: reads the channel volume, detects a mode change (down/up), advances the timer and applies Engine.Audio.setChannelVolume by linear interpolation; sets fadeDone to true at the end. | 56 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/audio/fade.lua`.*
