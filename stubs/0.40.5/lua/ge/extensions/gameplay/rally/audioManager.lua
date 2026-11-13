---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/audioManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/rally/audioManager.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_rally_audioManager
local gameplay_rally_audioManager = {}

--- single source of truth for a clip's playback length incl. its trailing gap/overlap
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:117
---@param audioObj any
function gameplay_rally_audioManager:_audioObjEffectiveLen(audioObj) end

---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:307
---@param audioObj any
---@param addToFront any
function gameplay_rally_audioManager:_enqueueAudioObj(audioObj, addToFront) end

---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:100
---@param audioObj any
function gameplay_rally_audioManager:_getAudioObjGapAfterMs(audioObj) end

---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:40
function gameplay_rally_audioManager:_loadPacenoteMetadata() end

---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:83
function gameplay_rally_audioManager:_loadVoicepackTimingDefaults() end

---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:186
function gameplay_rally_audioManager:_stopAudio() end

---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:159
function gameplay_rally_audioManager:_stopExpiredAudioChannels() end

---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:145
---@param channelId any
---@param expiresAt any
function gameplay_rally_audioManager:_trackAudioChannel(channelId, expiresAt) end

---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:233
---@param audioObjs any
---@param addToFront any
function gameplay_rally_audioManager:enqueueAudioObjs(audioObjs, addToFront) end

---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:244
---@param pacenote any
---@param addToFront any
function gameplay_rally_audioManager:enqueuePacenoteAudio(pacenote, addToFront) end

---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:212
---@param secs any
---@param addToFront any
function gameplay_rally_audioManager:enqueuePauseSecs(secs, addToFront) end

---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:260
---@param pacenote any
---@param addToFront any
---@param audioLen any
function gameplay_rally_audioManager:enqueueSystemPacenote(pacenote, addToFront, audioLen) end

---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:79
function gameplay_rally_audioManager:getCodriverTimingOffsetSeconds() end

---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:43
function gameplay_rally_audioManager:getCornerGapMs() end

---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:59
function gameplay_rally_audioManager:getLinkWordGapMs() end

---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:67
function gameplay_rally_audioManager:getPacenoteGapMs() end

---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:51
function gameplay_rally_audioManager:getPhraseGapMs() end

---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:332
function gameplay_rally_audioManager:getQueueInfo() end

---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:198
function gameplay_rally_audioManager:handleDamage() end

---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:13
---@param rallyManager any
function gameplay_rally_audioManager:init(rallyManager) end

---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:323
function gameplay_rally_audioManager:isPlaying() end

---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:75
function gameplay_rally_audioManager:isSpeedScalingEnabled() end

---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:379
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_rally_audioManager:onUpdate(dtReal, dtSim, dtRaw) end

--- total spoken duration of a pacenote: all clip effective lengths minus the
---  trailing pacenote gap (that gap is spacing to the next note, not this note ending)
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:125
---@param pacenote any
function gameplay_rally_audioManager:pacenoteEffectiveAudioLen(pacenote) end

---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:340
function gameplay_rally_audioManager:playNextInQueue() end

---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:136
function gameplay_rally_audioManager:resetQueue() end

---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:47
---@param ms any
function gameplay_rally_audioManager:setCornerGapMs(ms) end

---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:63
---@param ms any
function gameplay_rally_audioManager:setLinkWordGapMs(ms) end

---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:71
---@param ms any
function gameplay_rally_audioManager:setPacenoteGapMs(ms) end

---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:55
---@param ms any
function gameplay_rally_audioManager:setPhraseGapMs(ms) end

---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:91
---@param voicepackEntry any
function gameplay_rally_audioManager:setVoicepackTiming(voicepackEntry) end

