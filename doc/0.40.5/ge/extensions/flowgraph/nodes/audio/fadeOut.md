# `flowgraph_nodes_audio_fadeOut`

*File: `lua/ge/extensions/flowgraph/nodes/audio/fadeOut.lua` · VM: Game Engine (GE) · 54 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/audio/fadeOut")` (file under extensions/ but not a regular extension)

Flowgraph node "Audio Fade Out" (category once_f_duration, tags sound/audio/volume). Brings the global volume down to silence: sets g_FadeTimeMS (= duration in ms) and g_GameLoading = 1 via SFXSystem.setGlobalParameter, then waits for the duration to signal completion. Input: duration (s, default 1).

## Notes

- Mirror of Audio Fade In (g_GameLoading = 0 there). When the node stops or resets, both parameters are set back to 0, which cancels the fade.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Calls reset() when the graph stops. | 23 |
| `C:init()` | Sets the timer to 0. | 19 |
| `C:onNodeReset()` | Calls reset() when the node is reset. | 27 |
| `C:reset()` | Sets the timer back to 0, the duration state to 'inactive' and g_FadeTimeMS / g_GameLoading to 0. | 31 |
| `C:work()` | Every frame: advances the timer (mgr.dtReal) and sets the state to 'finished' once duration is reached. | 44 |
| `C:workOnce()` | On the first flow: g_FadeTimeMS = duration*1000, g_GameLoading = 1, state 'started'. | 38 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/audio/fadeOut.lua`.*
