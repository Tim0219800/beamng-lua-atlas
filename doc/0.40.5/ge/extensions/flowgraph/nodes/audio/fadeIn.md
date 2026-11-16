# `flowgraph_nodes_audio_fadeIn`

*File: `lua/ge/extensions/flowgraph/nodes/audio/fadeIn.lua` · VM: Game Engine (GE) · 54 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/audio/fadeIn")` (file under extensions/ but not a regular extension)

Flowgraph node "Audio Fade In" (category once_f_duration, tags sound/audio/volume). Brings the global volume back up: sets the FMOD global parameters g_FadeTimeMS (= duration in ms) and g_GameLoading = 0 via SFXSystem.setGlobalParameter, then waits for the duration to signal completion. Input: duration (s, default 1). The output flow goes to the "finished" state when the time has elapsed.

## Notes

- This is the mirror version of Audio Fade Out (which sets g_GameLoading to 1). The actual fade is done by the audio system through these parameters; the node only counts the time.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Calls reset() when the graph stops. | 23 |
| `C:init()` | Sets the timer to 0. | 19 |
| `C:onNodeReset()` | Calls reset() when the node is reset. | 27 |
| `C:reset()` | Sets the timer back to 0, the duration state to 'inactive' and the parameters g_FadeTimeMS and g_GameLoading to 0. | 31 |
| `C:work()` | Every frame: advances the timer (mgr.dtReal) and sets the state to 'finished' once duration is reached. | 44 |
| `C:workOnce()` | On the first flow: g_FadeTimeMS = duration*1000, g_GameLoading = 0, duration state 'started'. | 38 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/audio/fadeIn.lua`.*
