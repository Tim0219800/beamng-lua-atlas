# `gameplay_rally_audioManager`

*Fichier : `lua/ge/extensions/gameplay/rally/audioManager.lua` · VM : Game Engine (GE) · 393 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/audioManager")` (fichier sous extensions/ mais pas une extension classique)

Gestionnaire de la file audio du copilote de rallye. Il met en file des 'audioObj' (clips de notes, notes système, pauses) et les joue un par un via Engine.Audio.intercomPlayPacenote, en respectant la durée de chaque clip plus un espacement configurable (entre virages, phrases, mots de liaison et notes). Les espacements viennent de l'entrée du pack vocal actif (voicepack) et sont bornés par gameplay_rally_audioTiming. Le module renvoie un constructeur : require(...)(rallyManager). onUpdate doit être appelé à chaque frame.

## Exemple

```lua
local am = require('/lua/ge/extensions/gameplay/rally/audioManager')(rallyManager)
am:enqueuePacenoteAudio(pacenote)
-- chaque frame :
am:onUpdate(dtReal, dtSim, dtRaw)
```

## Remarques

- Les durées audioLen et timeouts sont en secondes ; les écarts (gap) sont en millisecondes et peuvent être négatifs (chevauchement).
- Un clip a une durée effective minimale de 0,01 s.
- Un audioObj peut porter audioCandidates : un candidat est alors tiré au hasard (math.random) au moment de la mise en file.
- Un canal audio est arrêté de force après audioLen + 0,25 s (audioStopGraceSecs) s'il n'est pas terminé.
- Une pause (audioType='pause') ne joue aucun son, elle bloque simplement la file pendant audioLen secondes.
- enqueueSystemPacenote : le test d'erreur 'else' lit pacenote.name alors que pacenote est nil : plantage si on lui passe nil.
- C:_loadPacenoteMetadata est vide ; pacenoteMetadataOfflineStructured et pacenoteMetadataOnlineStructuredAndFreeform restent nil.

## Classe `C`

Gestionnaire audio renvoyé par le constructeur du module. Attributs : rallyManager, queue (dequeue), currAudioObj, activeAudioChannels, cornerGapMs, phraseGapMs, linkWordGapMs, pacenoteGapMs, enableSpeedScaling, codriverTimingOffsetSeconds.

Le module renvoie un constructeur : `local obj = require("gameplay_rally_audioManager")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_audioObjEffectiveLen(audioObj)` | Source unique de la durée de lecture d'un clip, écart de fin inclus : max(audioLen + gap/1000, 0.01). | 117 |
| `C:_enqueueAudioObj(audioObj, addToFront)` | Ajoute un clip à la file (tête ou queue). Si le clip a des audioCandidates, en tire un au hasard et copie ses fname/audioLen. | 307 |
| `C:_getAudioObjGapAfterMs(audioObj)` | Écart à appliquer après un clip : linkWordGap pour la catégorie 'linkword' ; si structuredTimingAfter=='clip', cornerGap entre deux clips 'corner' consécutifs sinon phraseGap ; si 'pacenote', pacenoteGap ; sinon 0. | 100 |
| `C:_loadPacenoteMetadata()` | Fonction vide (ne fait rien). | 40 |
| `C:_loadVoicepackTimingDefaults()` | Résout le pack vocal actif du carnet (notebook:resolveActiveVoicepack) et applique ses réglages via setVoicepackTiming. | 83 |
| `C:_stopAudio()` | Arrête immédiatement tous les canaux audio actifs. | 186 |
| `C:_stopExpiredAudioChannels()` | Arrête (Engine.Audio.intercomStopPacenote) les canaux dont l'heure d'expiration est dépassée et recalcule la prochaine expiration. | 159 |
| `C:_trackAudioChannel(channelId, expiresAt)` | Mémorise un canal audio actif et son heure d'expiration (rallyUtil.getTime) pour l'arrêt automatique ; ignore un identifiant non numérique. | 145 |
| `C:enqueueAudioObjs(audioObjs, addToFront)` | Met en file une liste d'audioObj. | 233 |
| `C:enqueuePacenoteAudio(pacenote, addToFront)` | Met en file tous les clips d'une note (pacenote:audioObjs()). Journalise une erreur si aucun clip. | 244 |
| `C:enqueuePauseSecs(secs, addToFront)` | Ajoute une pause silencieuse à la file (utilisé aux lignes de départ et d'arrivée). | 212 |
| `C:enqueueSystemPacenote(pacenote, addToFront, audioLen)` | Met en file une note système (fichier audio audioFname). Si le fichier est absent, affiche un message d'erreur à l'écran et ne fait rien. La durée par défaut est 1,0 s. | 260 |
| `C:getCodriverTimingOffsetSeconds()` | Décalage de timing du copilote propre au pack vocal, en secondes. | 79 |
| `C:getCornerGapMs()` | Écart (ms) entre deux clips de virage consécutifs. | 43 |
| `C:getLinkWordGapMs()` | Écart (ms) appliqué après un mot de liaison (clip de catégorie 'linkword'). | 59 |
| `C:getPacenoteGapMs()` | Écart (ms) entre la fin d'une note et la suivante. | 67 |
| `C:getPhraseGapMs()` | Écart (ms) entre deux phrases (clips) d'une même note. | 51 |
| `C:getQueueInfo()` | Renvoie une table réutilisée {queueSize, paused} ; paused vaut true quand rien n'est en cours de lecture. La table est partagée entre appels : ne pas la conserver. | 332 |
| `C:handleDamage()` | Si une note sans drapeau 'damage' est en cours de lecture sur un canal actif, la coupe, vide la file et oublie le clip : la note interrompue ne sera pas rejouée. | 198 |
| `C:init(rallyManager)` | Initialise l'état (file vide, espacements à 0) puis charge les réglages de temps du pack vocal actif du carnet de notes du rallyManager. | 13 |
| `C:isPlaying()` | Vrai tant que le clip (ou la pause) courant n'a pas atteint son timeout. | 323 |
| `C:isSpeedScalingEnabled()` | Indique si le délai du copilote dépend de la vitesse (true sauf si le pack vocal l'a désactivé). | 75 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` | Appelé à chaque frame : arrête les canaux expirés puis lance le clip suivant si possible. | 379 |
| `C:pacenoteEffectiveAudioLen(pacenote)` | Durée parlée totale d'une note : somme des durées effectives de ses clips moins l'écart de fin de note (c'est de l'espacement vers la note suivante, pas la fin de la note). | 125 |
| `C:playNextInQueue()` | Si rien ne joue, retire le prochain clip de la file : pour une note, lance Engine.Audio.intercomPlayPacenote (fichier pacenoteFname) et calcule le timeout ; pour une pause, calcule seulement le timeout. Ignore les notes sans nom de fichier. | 340 |
| `C:resetQueue()` | Vide la file, arrête tous les canaux audio en cours et oublie le clip courant. | 136 |
| `C:setCornerGapMs(ms)` | Règle l'écart entre virages (borné par audioTiming.clampCornerGapMs). | 47 |
| `C:setLinkWordGapMs(ms)` | Règle l'écart après mot de liaison (borné). | 63 |
| `C:setPacenoteGapMs(ms)` | Règle l'écart entre notes (borné). | 71 |
| `C:setPhraseGapMs(ms)` | Règle l'écart entre phrases (borné). | 55 |
| `C:setVoicepackTiming(voicepackEntry)` | Applique les réglages d'un pack vocal : cornerGapMs, phraseGapMs, linkWordGapMs (par défaut = phraseGapMs), pacenoteGapMs, enableSpeedScaling (vrai sauf si égal à false) et codriverTimingOffsetSeconds. Sans entrée, tout est à 0 et la mise à l'échelle par la vitesse est active. | 91 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/audioManager.lua`.*
