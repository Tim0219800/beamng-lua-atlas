# `ui_credits`

*File: `lua/ge/extensions/ui/credits.lua` · VM: Game Engine (GE) · 163 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_credits`: `extensions.load("ui_credits")`, then the global `ui_credits`

Plays the credits music (FMOD event "event:>Music>credits" on the AudioGui channel) with volume fades. Loading the extension starts the music with a 0.4 s fade-in; unloading deletes the sound source.

## Example

```lua
extensions.load('ui_credits')
-- later:
ui_credits.stopWithFade(1.0, function() extensions.unload('ui_credits') end)
```

## Notes

- The fade is advanced in onUpdate with dtReal (real time, independent of pause).
- The minimum duration of a fade is 0.001 s.
- The volume functions do nothing if the sound object has no setVolume method.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_credits.onExtensionLoaded()` | Hook called when the extension loads: starts startWithFade with the default duration (0.4 s). *(internal)* *(hook)* | 123 |
| `ui_credits.onExtensionUnloaded()` | Hook called on unload: stops and deletes the sound source and frees the parameter group. *(internal)* *(hook)* | 127 |
| `ui_credits.onUpdate(dtReal)` | Hook called every frame: advances the current fade and calls its callback at the end. *(internal)* *(hook)* | 132 |
| `ui_credits.startWithFade(duration)` | Creates the credits sound source if needed, starts it at volume 0 if it is not yet playing, then fades to volume 1. | 85 |
| `ui_credits.stopWithFade(duration, onStopped)` | Fades to 0 then stops and deletes the source, then calls onStopped. If there is no sound, stops immediately. | 105 |

### Parameter details

#### `ui_credits.onUpdate(dtReal)`

Hook called every frame: advances the current fade and calls its callback at the end.

- `dtReal` (*number*) : Real time elapsed since the last frame (s).

#### `ui_credits.startWithFade(duration)`

Creates the credits sound source if needed, starts it at volume 0 if it is not yet playing, then fades to volume 1.

- `duration` (*number|nil*) : Fade duration in seconds (default 0.4).
- **returns**: boolean false if the sound source could not be created, otherwise true.

#### `ui_credits.stopWithFade(duration, onStopped)`

Fades to 0 then stops and deletes the source, then calls onStopped. If there is no sound, stops immediately.

- `duration` (*number|nil*) : Fade duration in seconds (default 0.4).
- `onStopped` (*function|nil*) : Callback with no argument called once the music has stopped.

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/credits.lua`.*
