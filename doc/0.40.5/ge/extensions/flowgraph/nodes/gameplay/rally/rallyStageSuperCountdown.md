# `flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua` · VM : Game Engine (GE) · 609 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Stage Super Countdown » (icône timer, tag rally, pas de catégorie). Compte à rebours autonome de départ de spéciale rally, sans dépendance au planning de boucle rally : trouve la ligne de départ dans pathData (position nommée spName), mesure la proximité du véhicule (distance signée au plan, zone latérale finie de 10 m, arrêt si vitesse < 0,08 m/s), démarre un compte à rebours lissé (durée et nombre d'annonces issus de StagedCountdownUtils.getStageCountdownSettings, défauts 3 s et 3), annonce 3-2-1 puis « Go! » (messages ScenarioFlashMessage, sons, pacenotes système countdown<n>/countdowngo), dégèle le véhicule, réactive les pacenotes, et détecte un faux départ (état false_start, pacenote 'falseStart'). Entrées : flow, reset (impulsion), pathData, spName, vehId, distance (zone de lancement, 1 m par défaut). Sorties : flow (fin, ou faux départ), finished (impulsion), ongoing, waiting, falseStart (impulsion). Envoie chaque frame onRallyDataUpdated (état countdown ou vehicleProximity, horloge rally).

## Remarques

- États internes : waiting, countdown_running, launched, finished, false_start. « Go! » reste affiché 0,1 s (GO_DISPLAY_DURATION) et le message dure 1 s.
- hasCrossedStartLine() renvoie toujours false dans ce fichier : le faux départ (triggerFalseStart) n'est donc jamais déclenché par ce nœud tel quel.
- core_flowgraphManager.skipCountdowns permet de sauter le compte à rebours.
- Options data : useImgui, useMessages, bigFinishMsg (true), drawDebug.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Charge le pont de boucle rally, remet à zéro le compte à rebours et le cache de position de départ. | 114 |
| `C:_executionStopped()` | Remet le compte à rebours à zéro. | 124 |
| `C:calculateScheduledEventTime()` | Calcule l'horloge et l'heure de lancement d'un compte à rebours immédiat (StagedCountdownUtils.calculateImmediateMinuteCountdown). | 279 |
| `C:configureCountdownSettings()` | Charge durée, nombre d'annonces et options visuel/son/voix depuis StagedCountdownUtils. | 270 |
| `C:drawDebugVisualization()` | Dessine plan, ligne véhicule-plan et point véhicule si le debug est actif. | 260 |
| `C:drawMiddle(builder, style)` | Barre de progression et état dans le nœud. | 572 |
| `C:enableRallyManagerPacenoteProcessing()` | Réactive le traitement des pacenotes du rally manager. | 389 |
| `C:enqueueSystemPacenote(pacenoteName)` | Met en file une pacenote système aléatoire dans le rally manager. | 379 |
| `C:finishCountdown()` | Termine le compte à rebours : « Go! », son, dégel, pacenotes, état launched, flow = true. | 415 |
| `C:getCountdownPhase(showingGo)` | Calcule la phase du compte à rebours (temps restant, valeur entière, valeur annoncée, progression). | 292 |
| `C:getRallyClockData()` | Construit les données d'horloge rally pour l'UI. | 331 |
| `C:getTimeUntilLaunch()` | Temps restant avant le lancement. | 288 |
| `C:getWallClockTime()` | Heure murale simulée (secondes) via StagedCountdownUtils. | 327 |
| `C:hasCrossedStartLine()` | Prévu pour détecter un faux départ ; renvoie toujours false. | 249 |
| `C:init(mgr, ...)` | Initialise toutes les variables d'état et options data. | 67 |
| `C:reset()` | Arrête le chrono et met toutes les sorties à false. | 128 |
| `C:sendRallyDataUpdate()` | Diffuse l'état de proximité et du compte à rebours via le hook onRallyDataUpdated. | 530 |
| `C:shouldDrawDebug()` | Renvoie data.drawDebug. | 256 |
| `C:shouldPlaySoundEffects()` | Renvoie le réglage d'effets sonores. | 375 |
| `C:shouldPlayVoiceCountdown()` | Renvoie le réglage de compte à rebours vocal. | 371 |
| `C:shouldShowVisualCountdown()` | Renvoie le réglage d'affichage visuel du compte à rebours. | 367 |
| `C:show(msg, big, duration, luaCall)` | Affiche un message flash (ScenarioFlashMessage) et éventuellement un Message UI. | 399 |
| `C:startTimer()` | Démarre le compte à rebours : réglages, calcul de l'heure de lancement, état countdown_running. | 352 |
| `C:stopTimer()` | Réinitialise état, chronos, horloge rally et drapeaux. | 137 |
| `C:triggerFalseStart()` | Déclare un faux départ (log, pacenote, état false_start, flow = true). | 442 |
| `C:unfreezeVehicle()` | Dégèle le véhicule (setFreeze false) via core_vehicleBridge. | 335 |
| `C:updateClock()` | Avance l'horloge du compte à rebours de dtSim tant qu'il est en cours. | 319 |
| `C:updateCountdown()` | Machine à états du compte à rebours : annonces 3-2-1 et fin. | 459 |
| `C:updateGoDisplay()` | Décompte l'affichage de « Go! » puis passe à l'état finished. | 519 |
| `C:updateProximityState()` | Calcule distance signée, distance latérale, proximité, arrêt, « staged » et distance d'affichage. | 204 |
| `C:updateStartPosition()` | Cherche la position de départ nommée dans pathData (avec cache) et mémorise pos/rot. | 156 |
| `C:updateVehicleData()` | Met à jour position avant et vitesse du véhicule suivi. | 184 |
| `C:work(args)` | Chaque frame : gère reset, position de départ, véhicule, démarrage, compte à rebours, UI et sorties. | 579 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRallyDataUpdated` — écouté par 2 module(s)

**Évènements UI (guihooks.trigger) :** `Message`, `ScenarioFlashMessage`, `ScenarioFlashMessageClear`

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua`.*
