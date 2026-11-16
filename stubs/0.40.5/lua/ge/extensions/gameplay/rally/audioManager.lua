---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/audioManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Audio manager returned by the module constructor. Attributes: rallyManager, queue (dequeue), currAudioObj, activeAudioChannels, cornerGapMs, phraseGapMs, linkWordGapMs, pacenoteGapMs, enableSpeedScaling, codriverTimingOffsetSeconds.
---@class gameplay_rally_audioManager
local gameplay_rally_audioManager = {}

--- Single source of a clip's playback duration, trailing gap included: max(audioLen + gap/1000, 0.01).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/audioManager.lua:117
---@param audioObj table|nil Clip.
---@return number  Effective duration in seconds.
function gameplay_rally_audioManager:_audioObjEffectiveLen(audioObj) end

--- Adds a clip to the queue (head or tail). If the clip has audioCandidates, draws one at random and copies its fname/audioLen.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/audioManager.lua:307
---@param audioObj table Clip.
---@param addToFront boolean|nil true = push_left, otherwise push_right.
function gameplay_rally_audioManager:_enqueueAudioObj(audioObj, addToFront) end

--- Gap to apply after a clip: linkWordGap for the 'linkword' category; if structuredTimingAfter=='clip', cornerGap between two consecutive 'corner' clips otherwise phraseGap; if 'pacenote', pacenoteGap; otherwise 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/audioManager.lua:100
---@param audioObj table|nil Clip (category, nextCategory, structuredTimingAfter).
---@return integer  Gap in ms.
function gameplay_rally_audioManager:_getAudioObjGapAfterMs(audioObj) end

--- Empty function _anon(does nothing).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/audioManager.lua:40
function gameplay_rally_audioManager:_loadPacenoteMetadata() end

--- Resolves the notebook's active voicepack (notebook:resolveActiveVoicepack) and applies its settings via setVoicepackTiming.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/audioManager.lua:83
function gameplay_rally_audioManager:_loadVoicepackTimingDefaults() end

--- Immediately stops all active audio channels.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/audioManager.lua:186
function gameplay_rally_audioManager:_stopAudio() end

--- Stops (Engine.Audio.intercomStopPacenote) the channels whose expiry time has passed and recomputes the next expiry.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/audioManager.lua:159
function gameplay_rally_audioManager:_stopExpiredAudioChannels() end

--- Stores an active audio channel and its expiry time (rallyUtil.getTime) for automatic stopping; ignores a non-numeric identifier.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/audioManager.lua:145
---@param channelId number Channel identifier returned by intercomPlayPacenote.
---@param expiresAt number|nil Expiry time, nil = no expiry.
function gameplay_rally_audioManager:_trackAudioChannel(channelId, expiresAt) end

--- Queues a list of audioObj.
---Source: lua/ge/extensions/gameplay/rally/audioManager.lua:233
---@param audioObjs table[]|nil List of clips.
---@param addToFront boolean|nil true to insert at the head.
---@return integer  Number of clips processed (0 if nil).
function gameplay_rally_audioManager:enqueueAudioObjs(audioObjs, addToFront) end

--- Queues all clips of a note (pacenote:audioObjs()). Logs an error if there are no clips.
---Source: lua/ge/extensions/gameplay/rally/audioManager.lua:244
---@param pacenote table Note with the audioObjs() method.
---@param addToFront boolean|nil true to insert at the head.
function gameplay_rally_audioManager:enqueuePacenoteAudio(pacenote, addToFront) end

--- Adds a silent pause to the queue (used at the start and finish lines).
---Source: lua/ge/extensions/gameplay/rally/audioManager.lua:212
---@param secs number Duration in seconds.
---@param addToFront boolean|nil true to place at the head of the queue.
function gameplay_rally_audioManager:enqueuePauseSecs(secs, addToFront) end

--- Queues a system note (audio file audioFname). If the file is missing, shows an error message on screen and does nothing. The default duration is 1.0 s.
---Source: lua/ge/extensions/gameplay/rally/audioManager.lua:260
---@param pacenote table System note (name, text, audioFname).
---@param addToFront boolean|nil true to insert at the head.
---@param audioLen number|nil Clip duration in seconds (1.0 by default).
function gameplay_rally_audioManager:enqueueSystemPacenote(pacenote, addToFront, audioLen) end

--- Voicepack-specific co-driver timing offset, in seconds.
---Source: lua/ge/extensions/gameplay/rally/audioManager.lua:79
---@return number  Offset (0 if invalid).
function gameplay_rally_audioManager:getCodriverTimingOffsetSeconds() end

--- Gap (ms) between two consecutive corner clips.
---Source: lua/ge/extensions/gameplay/rally/audioManager.lua:43
---@return integer  Gap in ms.
function gameplay_rally_audioManager:getCornerGapMs() end

--- Gap (ms) applied after a link word (clip of category 'linkword').
---Source: lua/ge/extensions/gameplay/rally/audioManager.lua:59
---@return integer  Gap in ms.
function gameplay_rally_audioManager:getLinkWordGapMs() end

--- Gap (ms) between the end of one note and the next.
---Source: lua/ge/extensions/gameplay/rally/audioManager.lua:67
---@return integer  Gap in ms.
function gameplay_rally_audioManager:getPacenoteGapMs() end

--- Gap (ms) between two phrases (clips) of the same note.
---Source: lua/ge/extensions/gameplay/rally/audioManager.lua:51
---@return integer  Gap in ms.
function gameplay_rally_audioManager:getPhraseGapMs() end

--- Returns a reused table {queueSize, paused}; paused is true when nothing is playing. The table is shared between calls: do not keep it.
---Source: lua/ge/extensions/gameplay/rally/audioManager.lua:332
---@return table  {queueSize = integer, paused = boolean}.
function gameplay_rally_audioManager:getQueueInfo() end

--- If a note without the 'damage' flag is playing on an active channel, cuts it, clears the queue and forgets the clip: the interrupted note will not be replayed.
---Source: lua/ge/extensions/gameplay/rally/audioManager.lua:198
function gameplay_rally_audioManager:handleDamage() end

--- Initializes the state (empty queue, spacings at 0) then loads the timing settings of the active voicepack of the rallyManager's notebook.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/audioManager.lua:13
---@param rallyManager table Rally manager; its notebook field (method resolveActiveVoicepack) provides the voicepack.
function gameplay_rally_audioManager:init(rallyManager) end

--- True as long as the current clip (or pause) has not reached its timeout.
---Source: lua/ge/extensions/gameplay/rally/audioManager.lua:323
---@return boolean  true if playback is in progress.
function gameplay_rally_audioManager:isPlaying() end

--- Indicates whether the co-driver's delay depends on speed (true unless the voicepack disabled it).
---Source: lua/ge/extensions/gameplay/rally/audioManager.lua:75
---@return boolean  Scaling state.
function gameplay_rally_audioManager:isSpeedScalingEnabled() end

--- Called every frame: stops expired channels, then starts the next clip if possible.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/audioManager.lua:379
---@param dtReal number Real-time delta (s).
---@param dtSim number Simulation time delta (s).
---@param dtRaw number Raw time delta (s).
function gameplay_rally_audioManager:onUpdate(dtReal, dtSim, dtRaw) end

--- Total spoken duration of a note: sum of the effective durations of its clips minus the note's end gap (that is spacing toward the next note, not the end of the note).
---Source: lua/ge/extensions/gameplay/rally/audioManager.lua:125
---@param pacenote table|nil Note with the audioObjs() method.
---@return number  Duration in seconds (0 if no clips).
function gameplay_rally_audioManager:pacenoteEffectiveAudioLen(pacenote) end

--- If nothing is playing, removes the next clip from the queue: for a note, starts Engine.Audio.intercomPlayPacenote (file pacenoteFname) and computes the timeout; for a pause, only computes the timeout. Ignores notes without a file name.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/audioManager.lua:340
function gameplay_rally_audioManager:playNextInQueue() end

--- Clears the queue, stops all ongoing audio channels and forgets the current clip.
---Source: lua/ge/extensions/gameplay/rally/audioManager.lua:136
function gameplay_rally_audioManager:resetQueue() end

--- Sets the gap between corners (bounded by audioTiming.clampCornerGapMs).
---Source: lua/ge/extensions/gameplay/rally/audioManager.lua:47
---@param ms number Gap in ms.
function gameplay_rally_audioManager:setCornerGapMs(ms) end

--- Sets the gap after a link word (bounded).
---Source: lua/ge/extensions/gameplay/rally/audioManager.lua:63
---@param ms number Gap in ms.
function gameplay_rally_audioManager:setLinkWordGapMs(ms) end

--- Sets the gap between notes (bounded).
---Source: lua/ge/extensions/gameplay/rally/audioManager.lua:71
---@param ms number Gap in ms.
function gameplay_rally_audioManager:setPacenoteGapMs(ms) end

--- Sets the gap between phrases (bounded).
---Source: lua/ge/extensions/gameplay/rally/audioManager.lua:55
---@param ms number Gap in ms.
function gameplay_rally_audioManager:setPhraseGapMs(ms) end

--- Applies a voicepack's settings: cornerGapMs, phraseGapMs, linkWordGapMs (default = phraseGapMs), pacenoteGapMs, enableSpeedScaling (true unless equal to false) and codriverTimingOffsetSeconds. Without an entry, everything is 0 and speed scaling is active.
---Source: lua/ge/extensions/gameplay/rally/audioManager.lua:91
---@param voicepackEntry table|nil Voicepack entry.
function gameplay_rally_audioManager:setVoicepackTiming(voicepackEntry) end

