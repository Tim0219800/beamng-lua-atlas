# `flowgraph_nodes_gameplay_rally_rallySuperCountdown`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua` · VM : Game Engine (GE) · 1227 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Super Countdown » (icône timer, tag rally, couleur rallyLoop). Système complet de ligne de départ de la boucle rally : horloge, recherche de la position de départ, proximité, validation du placement (staging), compte à rebours, report (reschedule) et détection de faux départ. Remplace Rally Clock, Rally Position Getter et Stopped Near Plane. Dépend du gestionnaire de boucle rally : heure d'époque (getEpochTime), heure planifiée de l'évènement eventName (ex. « SS_start_line »). Déroulé : waiting_for_staging_check, puis à stagingCheckTime secondes (10 par défaut) avant le départ, si le véhicule est placé (devant le plan à moins de distance m et à l'arrêt) → countdown_armed (véhicule gelé si les faux départs sont désactivés) ; sinon report au créneau suivant (rm:rescheduleNextSSStart) jusqu'à maxReschedules (3). Ensuite countdown_running (annonces vocales/visuelles), launched (0,5 s) puis finished. Entrées : flow, reset (impulsion), pathData, spName, eventName, vehId, distance, stagingCheckTime, maxReschedules. Sorties : flow, finished, ongoing, waiting, rescheduled, falseStart, maxReschedulesReached (impulsions pour finished/rescheduled/falseStart/maxReschedulesReached).

## Remarques

- Avertissements à 60, 30, 15 et 10 s (pacenotes warningSeconds<N>) ; sur le planning d'origine, 60 s joue commsCheck, 30 s beltsCheck et 10 s precountdown.
- Faux départ (signedDistance < 0) : pacenote 'falseStart', pénalité rm:recordFalseStartPenalty(), dégel, la spéciale démarre quand même.
- Le véhicule qui quitte la zone de lancement pendant le compte à rebours annule et reporte le départ.
- Saut du compte à rebours (onGameplayInteract) possible quand le véhicule est placé : place l'horloge de la boucle à planifié - 6 s (COUNTDOWN_SKIP_LEAD_SECONDS) avec debounce de 2 s et coupe les audios annexes. Disponibilité signalée via rm:setCountdownCanSkip.
- Seuils : arrêt si vitesse < 0,08 m/s (hystérésis +0,6 km/h) ; saut possible sous 1 km/h (hystérésis +1 km/h, distance +0,5 m).
- Options data : useImgui, useMessages, bigFinishMsg, test (mode test sans gestionnaire de boucle), drawDebug.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Réinitialise l'état du nœud au démarrage du graphe. | 145 |
| `C:_executionStopped()` | Arrête le chrono et dégèle le véhicule. | 169 |
| `C:canSkipCountdown()` | Indique si le saut du compte à rebours est possible (attente, véhicule placé avec hystérésis, pas de debounce). | 1030 |
| `C:checkStagingAt10s()` | Contrôle de placement : armé si placé, sinon report ou fin si plus de reports. | 649 |
| `C:configureCountdownSettings()` | Règle durée (6 s/5 annonces avec voix, 3 s/3 sans), voix, visuel et gel selon les réglages rallyAudioPacenotes/rallyVisualPacenotes et les faux départs. | 572 |
| `C:drawDebugVisualization()` | Dessine le plan de départ et les repères de debug. | 980 |
| `C:drawMiddle(builder, style)` | Dessine l'état du compte à rebours dans le nœud. | 995 |
| `C:enableRallyManagerPacenoteProcessing()` | Réactive le traitement des pacenotes du rally manager. | 513 |
| `C:enqueuePauseSecs(secs)` | Met en file une pause audio. | 532 |
| `C:enqueueSystemPacenote(pacenote_name, audioLenOffset)` | Met en file une pacenote système aléatoire. | 522 |
| `C:finishCountdownImmediately()` | Termine immédiatement (skipCountdowns) : pacenotes, dégel, état finished, flow = true. | 755 |
| `C:freezeVehicle()` | Gèle le véhicule via StagedCountdownUtils.freezeVehicle (une seule fois). | 217 |
| `C:getCurrentEpochTime()` | Heure d'époque rally courante (mode test : horloge de test). | 396 |
| `C:getRallyLoopManager()` | Renvoie le gestionnaire de boucle rally (nil en mode test ou extension non chargée). | 385 |
| `C:getScheduledEventTime()` | Heure planifiée de l'évènement eventName (mise en cache par évènement et mission). | 408 |
| `C:getWallClockTime()` | Heure murale simulée (environment start + époque, modulo 86400). | 942 |
| `C:hasCrossedStartLine()` | Vrai si la distance signée est négative (ligne franchie). | 380 |
| `C:init(mgr, ...)` | Initialise états, caches, drapeaux audio et options data. | 81 |
| `C:isFlowActive()` | Vrai si l'état est finished ou false_start. | 767 |
| `C:isInLaunchZone()` | Vrai si près du plan (arrêt non requis). | 375 |
| `C:isNearPlane()` | État de proximité mis en cache. | 365 |
| `C:isOngoing()` | Vrai si le compte à rebours tourne. | 771 |
| `C:isOriginalSchedule()` | Vrai si aucun report n'a eu lieu. | 763 |
| `C:isStaged()` | Vrai si près du plan et à l'arrêt. | 370 |
| `C:isStopped()` | État « à l'arrêt » mis en cache. | 360 |
| `C:isWaiting()` | Vrai dans les états d'attente (staging check, armé, waiting_for_staged). | 775 |
| `C:monitorCountdown()` | Surveille faux départ et sortie de zone pendant le compte à rebours. | 689 |
| `C:onGameplayInteract()` | Hook d'interaction joueur : demande un saut du compte à rebours si possible. | 1100 |
| `C:processWarnings()` | Déclenche les avertissements 60/30/15/10 s (message et pacenotes). | 781 |
| `C:randomPauseSecs(min, max)` | Pause audio de durée entière aléatoire entre min et max. | 542 |
| `C:requestReschedule()` | Demande le report du départ au prochain créneau ; met à jour rescheduleCount et les avertissements. | 441 |
| `C:reset()` | Arrête le chrono, dégèle le véhicule et met les sorties à false. | 174 |
| `C:shouldDrawDebug()` | Vrai si data.drawDebug ou le drapeau stopZones de la boucle est actif. | 975 |
| `C:shouldPlayVoiceCountdown()` | Réglage de compte à rebours vocal. | 505 |
| `C:shouldShowVisualCountdown()` | Réglage d'affichage visuel. | 509 |
| `C:shouldStartTimer()` | Vrai si flow est actif, l'état est waiting_for_staging_check et aucun départ n'est encore planifié. | 565 |
| `C:show(msg, big, duration)` | Affiche un message via le canal Message si useMessages est actif (le flash message est commenté). | 547 |
| `C:skipToCountdown()` | Avance l'horloge de la boucle jusqu'à 6 s avant le départ. | 1070 |
| `C:startTimer()` | Lit l'heure planifiée et calcule targetStartTime et stagingCheckTime. | 606 |
| `C:stopTimer()` | Réinitialise états, planification, compteurs, avertissements, drapeaux et audio. | 191 |
| `C:unfreezeVehicle()` | Dégèle le véhicule s'il a été gelé par ce nœud. | 225 |
| `C:updateCountdownStateMachine()` | Machine à états principale du départ. | 827 |
| `C:updateProximityState()` | Calcule distance signée, arrêt (avec hystérésis), proximité et état « staged ». | 307 |
| `C:updateStartPosition()` | Cherche la position de départ nommée dans pathData (avec cache) et mémorise la raison en cas d'échec. | 256 |
| `C:updateTimesAfterReschedule()` | Recalcule targetStartTime et stagingCheckTime après un report. | 643 |
| `C:updateVehicleData()` | Met à jour position avant et vitesse du véhicule suivi. | 233 |
| `C:work(args)` | Chaque frame : position, véhicule, proximité, démarrage, machine à états, saut, mise à jour UI (hooks de proximité/compte à rebours) et sorties. | 1106 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRallyDataUpdated` — écouté par 2 module(s)

**Évènements UI (guihooks.trigger) :** `Message`, `RallyUIContextEnter_START_LINE`

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua`.*
