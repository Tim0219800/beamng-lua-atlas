---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/audioManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire audio renvoyé par le constructeur du module. Attributs : rallyManager, queue (dequeue), currAudioObj, activeAudioChannels, cornerGapMs, phraseGapMs, linkWordGapMs, pacenoteGapMs, enableSpeedScaling, codriverTimingOffsetSeconds.
---@class gameplay_rally_audioManager
local gameplay_rally_audioManager = {}

--- Source unique de la durée de lecture d'un clip, écart de fin inclus : max(audioLen + gap/1000, 0.01).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:117
---@param audioObj table|nil Clip.
---@return number  Durée effective en secondes.
function gameplay_rally_audioManager:_audioObjEffectiveLen(audioObj) end

--- Ajoute un clip à la file (tête ou queue). Si le clip a des audioCandidates, en tire un au hasard et copie ses fname/audioLen.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:307
---@param audioObj table Clip.
---@param addToFront boolean|nil true = push_left, sinon push_right.
function gameplay_rally_audioManager:_enqueueAudioObj(audioObj, addToFront) end

--- Écart à appliquer après un clip : linkWordGap pour la catégorie 'linkword' ; si structuredTimingAfter=='clip', cornerGap entre deux clips 'corner' consécutifs sinon phraseGap ; si 'pacenote', pacenoteGap ; sinon 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:100
---@param audioObj table|nil Clip (category, nextCategory, structuredTimingAfter).
---@return integer  Écart en ms.
function gameplay_rally_audioManager:_getAudioObjGapAfterMs(audioObj) end

--- Fonction vide (ne fait rien).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:40
function gameplay_rally_audioManager:_loadPacenoteMetadata() end

--- Résout le pack vocal actif du carnet (notebook:resolveActiveVoicepack) et applique ses réglages via setVoicepackTiming.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:83
function gameplay_rally_audioManager:_loadVoicepackTimingDefaults() end

--- Arrête immédiatement tous les canaux audio actifs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:186
function gameplay_rally_audioManager:_stopAudio() end

--- Arrête (Engine.Audio.intercomStopPacenote) les canaux dont l'heure d'expiration est dépassée et recalcule la prochaine expiration.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:159
function gameplay_rally_audioManager:_stopExpiredAudioChannels() end

--- Mémorise un canal audio actif et son heure d'expiration (rallyUtil.getTime) pour l'arrêt automatique ; ignore un identifiant non numérique.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:145
---@param channelId number Identifiant de canal renvoyé par intercomPlayPacenote.
---@param expiresAt number|nil Heure d'expiration, nil = pas d'expiration.
function gameplay_rally_audioManager:_trackAudioChannel(channelId, expiresAt) end

--- Met en file une liste d'audioObj.
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:233
---@param audioObjs table[]|nil Liste de clips.
---@param addToFront boolean|nil true pour insérer en tête.
---@return integer  Nombre de clips traités (0 si nil).
function gameplay_rally_audioManager:enqueueAudioObjs(audioObjs, addToFront) end

--- Met en file tous les clips d'une note (pacenote:audioObjs()). Journalise une erreur si aucun clip.
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:244
---@param pacenote table Note avec la méthode audioObjs().
---@param addToFront boolean|nil true pour insérer en tête.
function gameplay_rally_audioManager:enqueuePacenoteAudio(pacenote, addToFront) end

--- Ajoute une pause silencieuse à la file (utilisé aux lignes de départ et d'arrivée).
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:212
---@param secs number Durée en secondes.
---@param addToFront boolean|nil true pour placer en tête de file.
function gameplay_rally_audioManager:enqueuePauseSecs(secs, addToFront) end

--- Met en file une note système (fichier audio audioFname). Si le fichier est absent, affiche un message d'erreur à l'écran et ne fait rien. La durée par défaut est 1,0 s.
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:260
---@param pacenote table Note système (name, text, audioFname).
---@param addToFront boolean|nil true pour insérer en tête.
---@param audioLen number|nil Durée du clip en secondes (1.0 par défaut).
function gameplay_rally_audioManager:enqueueSystemPacenote(pacenote, addToFront, audioLen) end

--- Décalage de timing du copilote propre au pack vocal, en secondes.
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:79
---@return number  Décalage (0 si invalide).
function gameplay_rally_audioManager:getCodriverTimingOffsetSeconds() end

--- Écart (ms) entre deux clips de virage consécutifs.
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:43
---@return integer  Écart en ms.
function gameplay_rally_audioManager:getCornerGapMs() end

--- Écart (ms) appliqué après un mot de liaison (clip de catégorie 'linkword').
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:59
---@return integer  Écart en ms.
function gameplay_rally_audioManager:getLinkWordGapMs() end

--- Écart (ms) entre la fin d'une note et la suivante.
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:67
---@return integer  Écart en ms.
function gameplay_rally_audioManager:getPacenoteGapMs() end

--- Écart (ms) entre deux phrases (clips) d'une même note.
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:51
---@return integer  Écart en ms.
function gameplay_rally_audioManager:getPhraseGapMs() end

--- Renvoie une table réutilisée {queueSize, paused} ; paused vaut true quand rien n'est en cours de lecture. La table est partagée entre appels : ne pas la conserver.
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:332
---@return table  {queueSize = integer, paused = boolean}.
function gameplay_rally_audioManager:getQueueInfo() end

--- Si une note sans drapeau 'damage' est en cours de lecture sur un canal actif, la coupe, vide la file et oublie le clip : la note interrompue ne sera pas rejouée.
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:198
function gameplay_rally_audioManager:handleDamage() end

--- Initialise l'état (file vide, espacements à 0) puis charge les réglages de temps du pack vocal actif du carnet de notes du rallyManager.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:13
---@param rallyManager table Gestionnaire de rallye ; son champ notebook (méthode resolveActiveVoicepack) fournit le pack vocal.
function gameplay_rally_audioManager:init(rallyManager) end

--- Vrai tant que le clip (ou la pause) courant n'a pas atteint son timeout.
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:323
---@return boolean  true si une lecture est en cours.
function gameplay_rally_audioManager:isPlaying() end

--- Indique si le délai du copilote dépend de la vitesse (true sauf si le pack vocal l'a désactivé).
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:75
---@return boolean  État de la mise à l'échelle.
function gameplay_rally_audioManager:isSpeedScalingEnabled() end

--- Appelé à chaque frame : arrête les canaux expirés puis lance le clip suivant si possible.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:379
---@param dtReal number Delta de temps réel (s).
---@param dtSim number Delta de temps de simulation (s).
---@param dtRaw number Delta de temps brut (s).
function gameplay_rally_audioManager:onUpdate(dtReal, dtSim, dtRaw) end

--- Durée parlée totale d'une note : somme des durées effectives de ses clips moins l'écart de fin de note (c'est de l'espacement vers la note suivante, pas la fin de la note).
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:125
---@param pacenote table|nil Note avec la méthode audioObjs().
---@return number  Durée en secondes (0 si pas de clips).
function gameplay_rally_audioManager:pacenoteEffectiveAudioLen(pacenote) end

--- Si rien ne joue, retire le prochain clip de la file : pour une note, lance Engine.Audio.intercomPlayPacenote (fichier pacenoteFname) et calcule le timeout ; pour une pause, calcule seulement le timeout. Ignore les notes sans nom de fichier.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:340
function gameplay_rally_audioManager:playNextInQueue() end

--- Vide la file, arrête tous les canaux audio en cours et oublie le clip courant.
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:136
function gameplay_rally_audioManager:resetQueue() end

--- Règle l'écart entre virages (borné par audioTiming.clampCornerGapMs).
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:47
---@param ms number Écart en ms.
function gameplay_rally_audioManager:setCornerGapMs(ms) end

--- Règle l'écart après mot de liaison (borné).
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:63
---@param ms number Écart en ms.
function gameplay_rally_audioManager:setLinkWordGapMs(ms) end

--- Règle l'écart entre notes (borné).
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:71
---@param ms number Écart en ms.
function gameplay_rally_audioManager:setPacenoteGapMs(ms) end

--- Règle l'écart entre phrases (borné).
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:55
---@param ms number Écart en ms.
function gameplay_rally_audioManager:setPhraseGapMs(ms) end

--- Applique les réglages d'un pack vocal : cornerGapMs, phraseGapMs, linkWordGapMs (par défaut = phraseGapMs), pacenoteGapMs, enableSpeedScaling (vrai sauf si égal à false) et codriverTimingOffsetSeconds. Sans entrée, tout est à 0 et la mise à l'échelle par la vitesse est active.
---Source : lua/ge/extensions/gameplay/rally/audioManager.lua:91
---@param voicepackEntry table|nil Entrée de pack vocal.
function gameplay_rally_audioManager:setVoicepackTiming(voicepackEntry) end

