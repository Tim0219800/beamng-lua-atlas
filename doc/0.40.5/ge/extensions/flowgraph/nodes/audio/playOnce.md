# `flowgraph_nodes_audio_playOnce`

*File: `lua/ge/extensions/flowgraph/nodes/audio/playOnce.lua` · VM: Game Engine (GE) · 73 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/audio/playOnce")` (file under extensions/ but not a regular extension)

Flowgraph node "Play Sound" (category dynamic_p_duration, dynamic mode 'repeat', tags sound/audio/volume). Plays an audio sample with Engine.Audio.playOnce. Inputs: file (source, default 'event:UI_Checkpoint'), channel (hidden, default 'AudioGui'), and hidden pins volume (default 1), pitch (1), fadeInTime (-1), fadeOutTime (-1), unique (false). In 'repeat' mode, the sound is replayed on every flow frame; otherwise only once.

## Notes

- The file pin also accepts ".prefab.json" files in the editor's picker (leftover from the template, unrelated to audio).
- Old pin renamed: source -> file.
- The result of playOnce is stored in a local variable and unused.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:playSound()` | Builds the data (volume, pitch, fades, unique, sampleSource, channel) from the pins and calls Engine.Audio.playOnce(channel, source, data). | 58 |
| `C:postInit()` | Configures the editor: file filter of the file pin and a 0-1 slider for volume. | 35 |
| `C:work()` | If dynamicMode is 'repeat', replays the sound every frame. | 52 |
| `C:workOnce()` | Plays the sound once (playSound). | 48 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/audio/playOnce.lua`.*
