# `flowgraph_nodes_gameplay_countdown`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/countdown.lua` · VM : Game Engine (GE) · 159 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/countdown")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Countdown » (tag scenario). Gère un compte à rebours affiché à l'écran via le hook ScenarioFlashMessage (et Message si data.useMessages). Pins d'entrée : flow, reset (impulsion), duration (3 s par défaut), countdownMsg (caché, '%d'), finishMsg ('Go!'), finishMsgDuration (caché, 1 s). Sorties : flow (vrai une fois terminé), finished (impulsion), ongoing (en cours). Le décompte démarre quand flow est actif, et utilise mgr.dtSim.

## Remarques

- data.playSounds (vrai par défaut) joue UI_Countdown1 à chaque seconde et UI_CountdownGo à la fin.
- Si core_flowgraphManager.skipCountdowns est vrai, le timer démarre à 0 (fin immédiate).
- Si finishMsg est nil, le message vaut la clé de traduction « ui.scenarios.go ».

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appelle stopTimer. | 50 |
| `C:countdown()` | Décrémente le timer de mgr.dtSim, affiche chaque seconde et signale la fin. | 93 |
| `C:drawMiddle(builder, style)` | Barre de progression et état (Running, Done, Stopped) dans l'éditeur. | 126 |
| `C:init(mgr, ...)` | Initialise les options data (useImgui, useMessages, playSounds, bigFinishMsg) et l'état. | 28 |
| `C:onExecutionStarted()` | Remet durée, timer et message par défaut. | 44 |
| `C:reset()` | Arrête le compte à rebours et remet les sorties à faux. | 54 |
| `C:show(msg, big, duration, luaCall)` | Affiche un message flash (ScenarioFlashMessage), et un Message si data.useMessages. | 79 |
| `C:startTimer()` | Lit la durée, arme le timer, vide le message flash précédent et démarre. | 69 |
| `C:stopTimer()` | Arrête le timer et efface done et flags. | 61 |
| `C:work(args)` | Gère reset, démarre le timer si flow est actif, appelle countdown et remplit les sorties. | 140 |

**Évènements UI (guihooks.trigger) :** `Message`, `ScenarioFlashMessage`, `ScenarioFlashMessageClear`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/countdown.lua`.*
