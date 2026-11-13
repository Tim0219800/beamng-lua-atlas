---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crashTest/scenarioManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Chef d'orchestre de la mission « crashTest » (analyse de collisions). processData transforme la définition de la mission en étapes (véhicule joueur et cibles retrouvés par champ dynamique, zones statiques, destinations) puis charge les extensions secondaires (TaskList, Scoring, Boundaries, Countdown, DamageChecker, freeroam_crashCamMode). Pour chaque étape : fondu, placement dans le véhicule, compte à rebours de 3 s, dégel du joueur, suivi des crashs via gameplay_util_crashDetection, puis réussite ou échec selon l'objectif ('Simple crash' ou 'Crash target vehicle into target area'). Il affiche marqueurs, distance/vitesse des cibles et chrono, calcule les scores et émet des hooks vers l'UI.
--- Accès : extension `gameplay_crashTest_scenarioManager` : `extensions.load("gameplay_crashTest_scenarioManager")`, puis la globale `gameplay_crashTest_scenarioManager`
---@class gameplay_crashTest_scenarioManager
---@field dependencies table<integer, string> Extensions chargées avant : {'ui_apps_genericMissionData', 'ui_apps_pointsBar'}.
gameplay_crashTest_scenarioManager = {}

--- Réactive tous les véhicules des étapes (utile avant un reset quand les véhicules des autres étapes ont été désactivés). Sans effet si l'option deactivateVehiclesFromOtherSteps est fausse.
---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:753
function gameplay_crashTest_scenarioManager.activatesAllVehForReset() end

--- Supprime les marqueurs de cibles (race_marker).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:572
function gameplay_crashTest_scenarioManager.clearMarkers() end

--- Retourne l'état global du scénario.
---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:769
---@return table  {scoreData, accepted, endScreenText, scenarioFinished, targetCrashInfo?}.
function gameplay_crashTest_scenarioManager.getCrashTestData() end

--- Passe à l'étape suivante (fondu, placement du joueur dans son véhicule, hook onCrashTestShowStepDetails). Appelée par l'UI.
---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:757
function gameplay_crashTest_scenarioManager.goToNextStepFromUI() end

--- Hook appelé quand l'état d'une mission change : décharge cette extension si une mission crashTest est arrêtée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:737
---@param status string État de la mission (ex. 'stopped').
---@param mission table Mission concernée (missionType).
function gameplay_crashTest_scenarioManager.onAnyMissionChanged(status, mission) end

--- Hook appelé à la fin de la caméra de crash : remet la caméra 'external'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:765
function gameplay_crashTest_scenarioManager.onCrashCamEnded() end

--- Hook appelé au déchargement : efface les marqueurs, décharge les extensions secondaires (restaure les réglages de caméra de crash) et remet la caméra 'orbit'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:743
---@param extension string Nom de l'extension déchargée (non utilisé).
function gameplay_crashTest_scenarioManager.onExtensionUnloaded(extension) end

--- Hook appelé par crashTestBoundaries quand le joueur sort de la zone : échec de l'étape (« Player exited the control area »).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:749
function gameplay_crashTest_scenarioManager.onPlayerOutOfBounds() end

--- Hook appelé avant le rendu : fait le rendu des marqueurs de cibles.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:566
---@param dt number Delta temps réel (s).
---@param dtSim number Delta temps simulation (s).
function gameplay_crashTest_scenarioManager.onPreRender(dt, dtSim) end

--- Hook appelé à chaque image : tant que le scénario n'est pas fini, dessine les marqueurs et zones, et, une fois lancé, vérifie l'arrêt de l'IA, affiche distance/vitesse des cibles, décompte le temps et met à jour le chrono UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:621
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulation (s).
function gameplay_crashTest_scenarioManager.onUpdate(dtReal, dtSim) end

--- Hook appelé par la détection de crash quand un crash se termine : mémorise les données de fin puis évalue si l'étape est réussie ou échouée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:728
---@param crashEndData table Données de fin de crash (vehId, sanitizedData avec touchedVehIds et initialImpactPos, impacts, jbeamsInvolved).
function gameplay_crashTest_scenarioManager.onVehicleCrashEnded(crashEndData) end

--- Hook appelé par la détection de crash quand un véhicule suivi commence un crash : enregistre les données de départ et le temps écoulé de l'étape ; gèle le joueur pour un 'Simple crash' ; si c'est une cible, efface les marqueurs et arrête son IA ScriptAi.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:701
---@param crashStartData table Données de début de crash (vehId, vehImpactSpeed…).
function gameplay_crashTest_scenarioManager.onVehicleCrashStarted(crashStartData) end

--- Initialise le scénario : réinitialise l'état, charge les extensions secondaires, convertit chaque étape de la définition en données nettoyées (ids de véhicules, vec3 pour positions et échelles, objectifs, dégâts, durées), initialise la liste de tâches de l'UI et gèle les véhicules joueurs.
---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:203
---@param crashTestData table<integer, table> Étapes brutes de la mission (crashTestVehName, jbeamTargetName, objective, impactSpeed, maxTime, staticCrashTransformPos, etc.).
---@param deactivateVehiclesFromOtherSteps_ boolean Si vrai, seuls les véhicules de l'étape courante sont actifs (setActive) et des fondus d'écran sont joués entre étapes.
function gameplay_crashTest_scenarioManager.processData(crashTestData, deactivateVehiclesFromOtherSteps_) end

--- Remet le scénario à zéro : données, véhicules réactivés pour la première étape, scores et liste de tâches effacés, IA arrêtées, véhicules joueurs gelés.
---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:318
function gameplay_crashTest_scenarioManager.reset() end

--- Active ou désactive le drapeau de debug du module.
---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:792
---@param _debug boolean Nouvelle valeur.
function gameplay_crashTest_scenarioManager.setDebug(_debug) end

--- Démarre le scénario : remet les points à 0, passe à la première étape (avec fondu), efface les marqueurs et marque le scénario comme lancé.
---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:466
function gameplay_crashTest_scenarioManager.startScenario() end

--- Lance le compte à rebours de 3 s de l'étape courante ; à son terme l'IA des cibles démarre, le joueur est dégelé et le suivi des crashs commence. Appelée par l'UI.
---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:761
function gameplay_crashTest_scenarioManager.startStepFromUI() end

--- Ajoute à gameplay_util_crashDetection (groupe 'crashAnalysis') tous les véhicules joueurs et cibles de toutes les étapes, s'ils ne sont pas déjà suivis.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crashTest/scenarioManager.lua:342
function gameplay_crashTest_scenarioManager.trackVehiclesForCrash() end

