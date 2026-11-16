# `ui_ambientSound`

*File: `lua/ge/extensions/ui/ambientSound.lua` · VM: Game Engine (GE) · 104 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_ambientSound`: `extensions.load("ui_ambientSound")`, then the global `ui_ambientSound`

Small manager of ambient sound "streams" played in the 'AudioGui' audio channel. Each stream is described by a JSON file (key data) containing a list of sounds and a random delay between two plays. update(dt) must be called by the caller every frame: it plays a randomly drawn sound, waits for the sound to end plus the delay, then draws another.

## Notes

- Bug: in getRandomSound, the "delay with 1 value" and "no delay" branches write to the nonexistent variable temptable (nil) instead of stream.currentSoundData: this triggers a Lua error. Only the delay = {min, max} case works.
- Bug: if a stream has only one sound, the second call of getRandomSound loops forever (repeat … until previousSound ~= temp can never be true).
- The volume is hardcoded to 0.29 in update; stream.volume is never used for playback. The fadeInTime parameter of setStreamState is ignored (stream.fadeInTime is never set by this module).
- update does not check that currentSoundData exists: a stream without sounds will make getRandomSound fail right from init.
- The module does not call itself: no onUpdate hook is exported, so the caller must invoke ui_ambientSound.update(dt).

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_ambientSound.deleteSoundSFX(ID)` | Removes from the list the stream whose streamID matches. | 90 |
| `ui_ambientSound.init(json)` | Loads a sound stream JSON file (key data), adds it to the list of streams, draws a first sound at random and returns the stream ID. If the file does not exist, logs an error and returns nothing. | 69 |
| `ui_ambientSound.setStreamState(streamID, volume, pitch, fadeInTime)` | Sets the volume and pitch of a stream. fadeInTime is accepted but not used. | 33 |
| `ui_ambientSound.update(dt)` | Advances all streams: plays the current sound if it exists (FS:fileExists) via Engine.Audio.playOnce('AudioGui'), then accumulates time and moves to a new sound when duration + delay have elapsed. | 44 |

### Parameter details

#### `ui_ambientSound.deleteSoundSFX(ID)`

Removes from the list the stream whose streamID matches.

- `ID` (*integer*) : Stream ID returned by init.

#### `ui_ambientSound.init(json)`

Loads a sound stream JSON file (key data), adds it to the list of streams, draws a first sound at random and returns the stream ID. If the file does not exist, logs an error and returns nothing.

- `json` (*string*) : Path of the JSON file describing the stream (field data with sounds, delay…).
- **returns**: integer|nil streamID of the new stream, or nil if the file is not found.

#### `ui_ambientSound.setStreamState(streamID, volume, pitch, fadeInTime)`

Sets the volume and pitch of a stream. fadeInTime is accepted but not used.

- `streamID` (*integer*) : Stream ID.
- `volume` (*number*) : Volume stored in the stream (not used at playback, see notes).
- `pitch` (*number*) : Pitch passed to playOnce.
- `fadeInTime` (*number|nil*) : Ignored.

#### `ui_ambientSound.update(dt)`

Advances all streams: plays the current sound if it exists (FS:fileExists) via Engine.Audio.playOnce('AudioGui'), then accumulates time and moves to a new sound when duration + delay have elapsed.

- `dt` (*number*) : Time elapsed since the previous frame, in seconds.

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/ambientSound.lua`.*
