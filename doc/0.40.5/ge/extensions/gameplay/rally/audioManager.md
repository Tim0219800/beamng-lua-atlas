# `gameplay_rally_audioManager`

*File: `lua/ge/extensions/gameplay/rally/audioManager.lua` · VM: Game Engine (GE) · 393 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/audioManager")` (file under extensions/ but not a regular extension)

Manager of the rally co-driver's audio queue. It queues 'audioObj's (note clips, system notes, pauses) and plays them one by one via Engine.Audio.intercomPlayPacenote, respecting each clip's duration plus a configurable spacing (between corners, phrases, link words and notes). The spacings come from the active voicepack's entry and are bounded by gameplay_rally_audioTiming. The module returns a constructor: require(...)(rallyManager). onUpdate must be called every frame.

## Example

```lua
local am = require('/lua/ge/extensions/gameplay/rally/audioManager')(rallyManager)
am:enqueuePacenoteAudio(pacenote)
-- every frame:
am:onUpdate(dtReal, dtSim, dtRaw)
```

## Notes

- The audioLen and timeouts durations are in seconds; the gaps are in milliseconds and can be negative (overlap).
- A clip has a minimum effective duration of 0.01 s.
- An audioObj can carry audioCandidates: a candidate is then drawn at random (math.random) at queuing time.
- An audio channel is forcibly stopped after audioLen + 0.25 s (audioStopGraceSecs) if it has not finished.
- A pause (audioType='pause') plays no sound, it simply blocks the queue for audioLen seconds.
- enqueueSystemPacenote: the 'else' error test reads pacenote.name while pacenote is nil: crash if nil is passed.
- C:_loadPacenoteMetadata is empty; pacenoteMetadataOfflineStructured and pacenoteMetadataOnlineStructuredAndFreeform stay nil.

## Class `C`

Audio manager returned by the module constructor. Attributes: rallyManager, queue (dequeue), currAudioObj, activeAudioChannels, cornerGapMs, phraseGapMs, linkWordGapMs, pacenoteGapMs, enableSpeedScaling, codriverTimingOffsetSeconds.

The module returns a constructor: `local obj = require("gameplay_rally_audioManager")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:_audioObjEffectiveLen(audioObj)` | Single source of a clip's playback duration, trailing gap included: max(audioLen + gap/1000, 0.01). | 117 |
| `C:_enqueueAudioObj(audioObj, addToFront)` | Adds a clip to the queue (head or tail). If the clip has audioCandidates, draws one at random and copies its fname/audioLen. | 307 |
| `C:_getAudioObjGapAfterMs(audioObj)` | Gap to apply after a clip: linkWordGap for the 'linkword' category; if structuredTimingAfter=='clip', cornerGap between two consecutive 'corner' clips otherwise phraseGap; if 'pacenote', pacenoteGap; otherwise 0. | 100 |
| `C:_loadPacenoteMetadata()` | Empty function (does nothing). | 40 |
| `C:_loadVoicepackTimingDefaults()` | Resolves the notebook's active voicepack (notebook:resolveActiveVoicepack) and applies its settings via setVoicepackTiming. | 83 |
| `C:_stopAudio()` | Immediately stops all active audio channels. | 186 |
| `C:_stopExpiredAudioChannels()` | Stops (Engine.Audio.intercomStopPacenote) the channels whose expiry time has passed and recomputes the next expiry. | 159 |
| `C:_trackAudioChannel(channelId, expiresAt)` | Stores an active audio channel and its expiry time (rallyUtil.getTime) for automatic stopping; ignores a non-numeric identifier. | 145 |
| `C:enqueueAudioObjs(audioObjs, addToFront)` | Queues a list of audioObj. | 233 |
| `C:enqueuePacenoteAudio(pacenote, addToFront)` | Queues all clips of a note (pacenote:audioObjs()). Logs an error if there are no clips. | 244 |
| `C:enqueuePauseSecs(secs, addToFront)` | Adds a silent pause to the queue (used at the start and finish lines). | 212 |
| `C:enqueueSystemPacenote(pacenote, addToFront, audioLen)` | Queues a system note (audio file audioFname). If the file is missing, shows an error message on screen and does nothing. The default duration is 1.0 s. | 260 |
| `C:getCodriverTimingOffsetSeconds()` | Voicepack-specific co-driver timing offset, in seconds. | 79 |
| `C:getCornerGapMs()` | Gap (ms) between two consecutive corner clips. | 43 |
| `C:getLinkWordGapMs()` | Gap (ms) applied after a link word (clip of category 'linkword'). | 59 |
| `C:getPacenoteGapMs()` | Gap (ms) between the end of one note and the next. | 67 |
| `C:getPhraseGapMs()` | Gap (ms) between two phrases (clips) of the same note. | 51 |
| `C:getQueueInfo()` | Returns a reused table {queueSize, paused}; paused is true when nothing is playing. The table is shared between calls: do not keep it. | 332 |
| `C:handleDamage()` | If a note without the 'damage' flag is playing on an active channel, cuts it, clears the queue and forgets the clip: the interrupted note will not be replayed. | 198 |
| `C:init(rallyManager)` | Initializes the state (empty queue, spacings at 0) then loads the timing settings of the active voicepack of the rallyManager's notebook. | 13 |
| `C:isPlaying()` | True as long as the current clip (or pause) has not reached its timeout. | 323 |
| `C:isSpeedScalingEnabled()` | Indicates whether the co-driver's delay depends on speed (true unless the voicepack disabled it). | 75 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` | Called every frame: stops expired channels, then starts the next clip if possible. | 379 |
| `C:pacenoteEffectiveAudioLen(pacenote)` | Total spoken duration of a note: sum of the effective durations of its clips minus the note's end gap (that is spacing toward the next note, not the end of the note). | 125 |
| `C:playNextInQueue()` | If nothing is playing, removes the next clip from the queue: for a note, starts Engine.Audio.intercomPlayPacenote (file pacenoteFname) and computes the timeout; for a pause, only computes the timeout. Ignores notes without a file name. | 340 |
| `C:resetQueue()` | Clears the queue, stops all ongoing audio channels and forgets the current clip. | 136 |
| `C:setCornerGapMs(ms)` | Sets the gap between corners (bounded by audioTiming.clampCornerGapMs). | 47 |
| `C:setLinkWordGapMs(ms)` | Sets the gap after a link word (bounded). | 63 |
| `C:setPacenoteGapMs(ms)` | Sets the gap between notes (bounded). | 71 |
| `C:setPhraseGapMs(ms)` | Sets the gap between phrases (bounded). | 55 |
| `C:setVoicepackTiming(voicepackEntry)` | Applies a voicepack's settings: cornerGapMs, phraseGapMs, linkWordGapMs (default = phraseGapMs), pacenoteGapMs, enableSpeedScaling (true unless equal to false) and codriverTimingOffsetSeconds. Without an entry, everything is 0 and speed scaling is active. | 91 |

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/audioManager.lua`.*
