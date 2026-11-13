---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/lowPerformance.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tests automatisés du détecteur gameplay/lowPerformance, à lancer avec require('testFramework/TestManager'):runTestFiles('gameplay/lowPerformance'). Chaque test charge lowPerformance.lua dans un environnement simulé (setfenv avec faux settings, Engine, ui_router, VariableRegistry, guihooks...) puis fait avancer des images à une fréquence donnée pour vérifier les transitions d'état. Ce n'est pas une API de jeu : aucune utilité directe pour un moddeur, sauf comme exemple de test avec environnement simulé.
--- Accès : extension `gameplay_lowPerformance.test` : `extensions.load("gameplay_lowPerformance.test")`, puis la globale `gameplay_lowPerformance.test`
---@class gameplay_lowPerformance.test
gameplay_lowPerformance.test = {}

--- En mode mission rien n'est détecté ni notifié ; passer de freeroam à mission annule l'effet (isLowPerformance faux, pas de pause notice).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/lowPerformance.test.lua:91
---@param ctx table Contexte de test.
function gameplay_lowPerformance.test.testCuratedContentIsNeverChecked(ctx) end

--- Une chute brève (moyenne sous 25 pendant environ 3 s, moins que les 5 s requis) ne déclenche rien ; une chute prolongée à 5 FPS déclenche.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/lowPerformance.test.lua:57
---@param ctx table Contexte de test.
function gameplay_lowPerformance.test.testDipShorterThanDwellDoesNotTrigger(ctx) end

--- Vérifie muteAndConfirmPendingSpawn (réglage notifyLowPerformance = false, détection maintenue sans notification) et le mode menu simple (notifications toujours actives, dialogue à 2 boutons au lieu de 3).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/lowPerformance.test.lua:131
---@param ctx table Contexte de test.
function gameplay_lowPerformance.test.testNotificationsCanBeMuted(ctx) end

--- Vérifie que la pause (route différente de play), l'apparition d'un véhicule et un fondu d'écran en cours redémarrent la période de grâce.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/lowPerformance.test.lua:70
---@param ctx table Contexte de test.
function gameplay_lowPerformance.test.testSkippedFramesRestartGrace(ctx) end

--- confirmSpawn exécute directement hors faible performance ; en faible performance il retourne false et diffère jusqu'à confirmPendingSpawn ; l'avertissement n'apparaît qu'une fois par épisode (deux dialogues sur deux épisodes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/lowPerformance.test.lua:107
---@param ctx table Contexte de test.
function gameplay_lowPerformance.test.testSpawnWarningOncePerEpisode(ctx) end

--- 20 FPS pendant 12 s doit activer la faible performance (un seul toast) ; 60 FPS pendant 15 s doit la désactiver.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/lowPerformance.test.lua:48
---@param ctx table Contexte de test.
function gameplay_lowPerformance.test.testSustainedLowFpsEntersAndRecovers(ctx) end

