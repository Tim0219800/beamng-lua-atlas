# `gameplay_lowPerformance.test`

*Fichier : `lua/ge/extensions/gameplay/lowPerformance.test.lua` · VM : Game Engine (GE) · 161 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_lowPerformance.test` : `extensions.load("gameplay_lowPerformance.test")`, puis la globale `gameplay_lowPerformance.test`

Tests automatisés du détecteur gameplay/lowPerformance, à lancer avec require('testFramework/TestManager'):runTestFiles('gameplay/lowPerformance'). Chaque test charge lowPerformance.lua dans un environnement simulé (setfenv avec faux settings, Engine, ui_router, VariableRegistry, guihooks...) puis fait avancer des images à une fréquence donnée pour vérifier les transitions d'état. Ce n'est pas une API de jeu : aucune utilité directe pour un moddeur, sauf comme exemple de test avec environnement simulé.

## Remarques

- La fonction locale runtime(mode) fabrique l'environnement simulé ; runFrames(detector, state, fps, seconds) appelle onUpdate avec dt = 1/fps.
- Chaque fonction testXxx reçoit un contexte ctx (méthodes assert et assertEqual) fourni par testFramework/TestManager.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_lowPerformance.test.testCuratedContentIsNeverChecked(ctx)` | En mode mission rien n'est détecté ni notifié ; passer de freeroam à mission annule l'effet (isLowPerformance faux, pas de pause notice). *(interne)* | 91 |
| `gameplay_lowPerformance.test.testDipShorterThanDwellDoesNotTrigger(ctx)` | Une chute brève (moyenne sous 25 pendant environ 3 s, moins que les 5 s requis) ne déclenche rien ; une chute prolongée à 5 FPS déclenche. *(interne)* | 57 |
| `gameplay_lowPerformance.test.testNotificationsCanBeMuted(ctx)` | Vérifie muteAndConfirmPendingSpawn (réglage notifyLowPerformance = false, détection maintenue sans notification) et le mode menu simple (notifications toujours actives, dialogue à 2 boutons au lieu de 3). *(interne)* | 131 |
| `gameplay_lowPerformance.test.testSkippedFramesRestartGrace(ctx)` | Vérifie que la pause (route différente de play), l'apparition d'un véhicule et un fondu d'écran en cours redémarrent la période de grâce. *(interne)* | 70 |
| `gameplay_lowPerformance.test.testSpawnWarningOncePerEpisode(ctx)` | confirmSpawn exécute directement hors faible performance ; en faible performance il retourne false et diffère jusqu'à confirmPendingSpawn ; l'avertissement n'apparaît qu'une fois par épisode (deux dialogues sur deux épisodes). *(interne)* | 107 |
| `gameplay_lowPerformance.test.testSustainedLowFpsEntersAndRecovers(ctx)` | 20 FPS pendant 12 s doit activer la faible performance (un seul toast) ; 60 FPS pendant 15 s doit la désactiver. *(interne)* | 48 |

### Détail des paramètres

#### `gameplay_lowPerformance.test.testCuratedContentIsNeverChecked(ctx)`

En mode mission rien n'est détecté ni notifié ; passer de freeroam à mission annule l'effet (isLowPerformance faux, pas de pause notice).

- `ctx` (*table*) : Contexte de test.

#### `gameplay_lowPerformance.test.testDipShorterThanDwellDoesNotTrigger(ctx)`

Une chute brève (moyenne sous 25 pendant environ 3 s, moins que les 5 s requis) ne déclenche rien ; une chute prolongée à 5 FPS déclenche.

- `ctx` (*table*) : Contexte de test.

#### `gameplay_lowPerformance.test.testNotificationsCanBeMuted(ctx)`

Vérifie muteAndConfirmPendingSpawn (réglage notifyLowPerformance = false, détection maintenue sans notification) et le mode menu simple (notifications toujours actives, dialogue à 2 boutons au lieu de 3).

- `ctx` (*table*) : Contexte de test.

#### `gameplay_lowPerformance.test.testSkippedFramesRestartGrace(ctx)`

Vérifie que la pause (route différente de play), l'apparition d'un véhicule et un fondu d'écran en cours redémarrent la période de grâce.

- `ctx` (*table*) : Contexte de test.

#### `gameplay_lowPerformance.test.testSpawnWarningOncePerEpisode(ctx)`

confirmSpawn exécute directement hors faible performance ; en faible performance il retourne false et diffère jusqu'à confirmPendingSpawn ; l'avertissement n'apparaît qu'une fois par épisode (deux dialogues sur deux épisodes).

- `ctx` (*table*) : Contexte de test.

#### `gameplay_lowPerformance.test.testSustainedLowFpsEntersAndRecovers(ctx)`

20 FPS pendant 12 s doit activer la faible performance (un seul toast) ; 60 FPS pendant 15 s doit la désactiver.

- `ctx` (*table*) : Contexte de test.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/lowPerformance.test.lua`.*
