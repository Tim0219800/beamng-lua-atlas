# `gameplay_rally_audioManager`

*Fichier : `lua/ge/extensions/gameplay/rally/audioManager.lua` · VM : Game Engine (GE) · 393 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/audioManager")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_rally_audioManager")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_audioObjEffectiveLen(audioObj)` | single source of truth for a clip's playback length incl. its trailing gap/overlap | 117 |
| `C:_enqueueAudioObj(audioObj, addToFront)` |  | 307 |
| `C:_getAudioObjGapAfterMs(audioObj)` |  | 100 |
| `C:_loadPacenoteMetadata()` |  | 40 |
| `C:_loadVoicepackTimingDefaults()` |  | 83 |
| `C:_stopAudio()` |  | 186 |
| `C:_stopExpiredAudioChannels()` |  | 159 |
| `C:_trackAudioChannel(channelId, expiresAt)` |  | 145 |
| `C:enqueueAudioObjs(audioObjs, addToFront)` |  | 233 |
| `C:enqueuePacenoteAudio(pacenote, addToFront)` |  | 244 |
| `C:enqueuePauseSecs(secs, addToFront)` |  | 212 |
| `C:enqueueSystemPacenote(pacenote, addToFront, audioLen)` |  | 260 |
| `C:getCodriverTimingOffsetSeconds()` |  | 79 |
| `C:getCornerGapMs()` |  | 43 |
| `C:getLinkWordGapMs()` |  | 59 |
| `C:getPacenoteGapMs()` |  | 67 |
| `C:getPhraseGapMs()` |  | 51 |
| `C:getQueueInfo()` |  | 332 |
| `C:handleDamage()` |  | 198 |
| `C:init(rallyManager)` |  | 13 |
| `C:isPlaying()` |  | 323 |
| `C:isSpeedScalingEnabled()` |  | 75 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` |  | 379 |
| `C:pacenoteEffectiveAudioLen(pacenote)` | total spoken duration of a pacenote: all clip effective lengths minus the<br> trailing pacenote gap (that gap is spacing to the next note, not this note ending) | 125 |
| `C:playNextInQueue()` |  | 340 |
| `C:resetQueue()` |  | 136 |
| `C:setCornerGapMs(ms)` |  | 47 |
| `C:setLinkWordGapMs(ms)` |  | 63 |
| `C:setPacenoteGapMs(ms)` |  | 71 |
| `C:setPhraseGapMs(ms)` |  | 55 |
| `C:setVoicepackTiming(voicepackEntry)` |  | 91 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/audioManager.lua`.*
