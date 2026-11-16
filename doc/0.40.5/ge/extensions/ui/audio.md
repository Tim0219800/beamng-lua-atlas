# `ui_audio`

*File: `lua/ge/extensions/ui/audio.lua` · VM: Game Engine (GE) · 150 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_audio`: `extensions.load("ui_audio")`, then the global `ui_audio`

Plays the interface sounds (audio channel "AudioGui") from the file ui/soundClasses.json. Each sound class contains events; a simple event plays an sfx once, a "source" event creates and reuses a managed audio source (play, setParameters, stopBeforePlay, recreateBeforePlay). Also used for the long-press sounds (bng_hold_activate: start, complete, cancel).

## Example

```lua
ui_audio.playEventSound('bng_hold_activate', 'start', 'myButton')
```

## Notes

- The sound classes are loaded into M.ui_sound_classes on the first onFirstUpdate (jsonReadFile('ui/soundClasses.json')).
- An event is "managed" (persistent source) if it has type == 'source' or one of the fields sourceKey, action, parameters, stopBeforePlay, recreateBeforePlay. Otherwise, with only sfx, it is played by Engine.Audio.playOnce('AudioGui', sfx).
- Managed sources are cached by key sourceKey (or sfx) suffixed with ':instanceId'; a source whose object no longer exists in scenetree is recreated.
- The recognized managed actions are 'play' (default) and 'setParameters'; any other value does nothing (the source is still created).

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_audio.cancelHoldActivateSound(instanceId)` | Plays the "cancel" event of the bng_hold_activate class (long press released too early). | 140 |
| `ui_audio.completeHoldActivateSound(instanceId)` | Plays the "complete" event of the bng_hold_activate class (long press completed). | 136 |
| `ui_audio.onFirstUpdate()` | Hook called by the engine on the first update: reads ui/soundClasses.json into M.ui_sound_classes ({} if absent). *(internal)* *(hook)* | 10 |
| `ui_audio.playEventSound(className, eventName, instanceId)` | Plays the event eventName of the class className. Does nothing if the class or the event does not exist. Simple event: plays the sfx once on AudioGui; source event: creates/reuses the source, applies the parameters then starts it (play(-1)). | 119 |
| `ui_audio.startHoldActivateSound(instanceId)` | Plays the "start" event of the bng_hold_activate class (start of a long press). | 132 |

### Parameter details

#### `ui_audio.cancelHoldActivateSound(instanceId)`

Plays the "cancel" event of the bng_hold_activate class (long press released too early).

- `instanceId` (*any*) : Instance identifier of the managed source.

#### `ui_audio.completeHoldActivateSound(instanceId)`

Plays the "complete" event of the bng_hold_activate class (long press completed).

- `instanceId` (*any*) : Instance identifier of the managed source.

#### `ui_audio.playEventSound(className, eventName, instanceId)`

Plays the event eventName of the class className. Does nothing if the class or the event does not exist. Simple event: plays the sfx once on AudioGui; source event: creates/reuses the source, applies the parameters then starts it (play(-1)).

- `className` (*string*) : Name of the sound class in soundClasses.json.
- `eventName` (*string*) : Name of the event in the class.
- `instanceId` (*any*) : Optional instance identifier to have a distinct source per UI component (inferred from code: concatenated to the cache key).

#### `ui_audio.startHoldActivateSound(instanceId)`

Plays the "start" event of the bng_hold_activate class (start of a long press).

- `instanceId` (*any*) : Instance identifier of the managed source.

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/audio.lua`.*
