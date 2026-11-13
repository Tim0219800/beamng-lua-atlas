# `gameplay_crashTest_scenarioManager`

*Fichier : `lua/ge/extensions/gameplay/crashTest/scenarioManager.lua` · VM : Game Engine (GE) · 799 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_crashTest_scenarioManager` : `extensions.load("gameplay_crashTest_scenarioManager")`, puis la globale `gameplay_crashTest_scenarioManager`

Chef d'orchestre de la mission « crashTest » (analyse de collisions). processData transforme la définition de la mission en étapes (véhicule joueur et cibles retrouvés par champ dynamique, zones statiques, destinations) puis charge les extensions secondaires (TaskList, Scoring, Boundaries, Countdown, DamageChecker, freeroam_crashCamMode). Pour chaque étape : fondu, placement dans le véhicule, compte à rebours de 3 s, dégel du joueur, suivi des crashs via gameplay_util_crashDetection, puis réussite ou échec selon l'objectif ('Simple crash' ou 'Crash target vehicle into target area'). Il affiche marqueurs, distance/vitesse des cibles et chrono, calcule les scores et émet des hooks vers l'UI.

## Remarques

- Les véhicules sont repérés par un champ dynamique dont le nom correspond à crashTestVehName / jbeamTargetName (findObjectsWithDynField, recherche par string.find).
- Les véhicules du joueur sont gelés (setFreeze) tant que le compte à rebours n'est pas fini ; le joueur est aussi gelé après un 'Simple crash' ou la fin d'une étape.
- Types de cible : 'A single Jbeam', 'Multiple Jbeams', 'Static object'. aiType : 'ScriptAi' (fichier scriptAi<id>.track.json de la mission, rejoué en 'firstOnlyTeleport') ou 'Stuck Throttle' (electrics.values.throttleOverride = throttleValue/100).
- Causes d'échec : temps écoulé, joueur hors zone, cible endommagée sans le joueur, véhicule non cible endommagé, cible arrivée sans dégâts (ScriptAi), crash hors de la zone, cibles non toutes touchées.
- Crash détecté avec : verticallyUnweighted, minAccel 0, maxAccel 40, minDamage 150, maxDamage 40000, enableImpactLocationData.
- Incohérence probable : dans delayedShowStepScoreJob, nextStepId vaut currentStepIndex + 1, puis +1 de plus s'il ne s'agit pas de la dernière étape (donc currentStepIndex + 2) ; l'intention exacte côté UI n'est pas visible dans ce fichier.
- Dans la branche 'Crash target vehicle into target area' de checkStepFinishedAfterEndOfCrash, la dernière partie du code est vide.
- isDebug, boolTrace, traceData, endScreenDataDebug et blackI sont déclarés mais peu ou pas utilisés ; setDebug ne change que isDebug.
- Hooks émis : onCrashTestShowStepDetails({currStepIndex, stepInstructions}), onCrashTestShowEndStepDetails({nextStep, isLastStep, currentStepScoreData}), onCrashScenarioFailed(crashTestData).
- L'extension se décharge toute seule quand une mission de type crashTest passe à l'état 'stopped'.

**Dépendances (chargées avant) :** `ui_apps_genericMissionData`, `ui_apps_pointsBar`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_crashTest_scenarioManager.activatesAllVehForReset()` | Réactive tous les véhicules des étapes (utile avant un reset quand les véhicules des autres étapes ont été désactivés). Sans effet si l'option deactivateVehiclesFromOtherSteps est fausse. | 753 |
| `gameplay_crashTest_scenarioManager.clearMarkers()` | Supprime les marqueurs de cibles (race_marker). *(interne)* | 572 |
| `gameplay_crashTest_scenarioManager.getCrashTestData()` | Retourne l'état global du scénario. | 769 |
| `gameplay_crashTest_scenarioManager.goToNextStepFromUI()` | Passe à l'étape suivante (fondu, placement du joueur dans son véhicule, hook onCrashTestShowStepDetails). Appelée par l'UI. | 757 |
| `gameplay_crashTest_scenarioManager.onAnyMissionChanged(status, mission)` | Hook appelé quand l'état d'une mission change : décharge cette extension si une mission crashTest est arrêtée. *(interne)* *(hook)* | 737 |
| `gameplay_crashTest_scenarioManager.onCrashCamEnded()` | Hook appelé à la fin de la caméra de crash : remet la caméra 'external'. *(interne)* *(hook)* | 765 |
| `gameplay_crashTest_scenarioManager.onExtensionUnloaded(extension)` | Hook appelé au déchargement : efface les marqueurs, décharge les extensions secondaires (restaure les réglages de caméra de crash) et remet la caméra 'orbit'. *(interne)* *(hook)* | 743 |
| `gameplay_crashTest_scenarioManager.onPlayerOutOfBounds()` | Hook appelé par crashTestBoundaries quand le joueur sort de la zone : échec de l'étape (« Player exited the control area »). *(interne)* *(hook)* | 749 |
| `gameplay_crashTest_scenarioManager.onPreRender(dt, dtSim)` | Hook appelé avant le rendu : fait le rendu des marqueurs de cibles. *(interne)* *(hook)* | 566 |
| `gameplay_crashTest_scenarioManager.onUpdate(dtReal, dtSim)` | Hook appelé à chaque image : tant que le scénario n'est pas fini, dessine les marqueurs et zones, et, une fois lancé, vérifie l'arrêt de l'IA, affiche distance/vitesse des cibles, décompte le temps et met à jour le chrono UI. *(interne)* *(hook)* | 621 |
| `gameplay_crashTest_scenarioManager.onVehicleCrashEnded(crashEndData)` | Hook appelé par la détection de crash quand un crash se termine : mémorise les données de fin puis évalue si l'étape est réussie ou échouée. *(interne)* *(hook)* | 728 |
| `gameplay_crashTest_scenarioManager.onVehicleCrashStarted(crashStartData)` | Hook appelé par la détection de crash quand un véhicule suivi commence un crash : enregistre les données de départ et le temps écoulé de l'étape ; gèle le joueur pour un 'Simple crash' ; si c'est une cible, efface les marqueurs et arrête son IA ScriptAi. *(interne)* *(hook)* | 701 |
| `gameplay_crashTest_scenarioManager.processData(crashTestData, deactivateVehiclesFromOtherSteps_)` | Initialise le scénario : réinitialise l'état, charge les extensions secondaires, convertit chaque étape de la définition en données nettoyées (ids de véhicules, vec3 pour positions et échelles, objectifs, dégâts, durées), initialise la liste de tâches de l'UI et gèle les véhicules joueurs. | 203 |
| `gameplay_crashTest_scenarioManager.reset()` | Remet le scénario à zéro : données, véhicules réactivés pour la première étape, scores et liste de tâches effacés, IA arrêtées, véhicules joueurs gelés. | 318 |
| `gameplay_crashTest_scenarioManager.setDebug(_debug)` | Active ou désactive le drapeau de debug du module. | 792 |
| `gameplay_crashTest_scenarioManager.startScenario()` | Démarre le scénario : remet les points à 0, passe à la première étape (avec fondu), efface les marqueurs et marque le scénario comme lancé. | 466 |
| `gameplay_crashTest_scenarioManager.startStepFromUI()` | Lance le compte à rebours de 3 s de l'étape courante ; à son terme l'IA des cibles démarre, le joueur est dégelé et le suivi des crashs commence. Appelée par l'UI. | 761 |
| `gameplay_crashTest_scenarioManager.trackVehiclesForCrash()` | Ajoute à gameplay_util_crashDetection (groupe 'crashAnalysis') tous les véhicules joueurs et cibles de toutes les étapes, s'ils ne sont pas déjà suivis. *(interne)* | 342 |

### Détail des paramètres

#### `gameplay_crashTest_scenarioManager.getCrashTestData()`

Retourne l'état global du scénario.

- **renvoie** : table {scoreData, accepted, endScreenText, scenarioFinished, targetCrashInfo?}.

#### `gameplay_crashTest_scenarioManager.onAnyMissionChanged(status, mission)`

Hook appelé quand l'état d'une mission change : décharge cette extension si une mission crashTest est arrêtée.

- `status` (*string*) : État de la mission (ex. 'stopped').
- `mission` (*table*) : Mission concernée (missionType).

#### `gameplay_crashTest_scenarioManager.onExtensionUnloaded(extension)`

Hook appelé au déchargement : efface les marqueurs, décharge les extensions secondaires (restaure les réglages de caméra de crash) et remet la caméra 'orbit'.

- `extension` (*string*) : Nom de l'extension déchargée (non utilisé).

#### `gameplay_crashTest_scenarioManager.onPreRender(dt, dtSim)`

Hook appelé avant le rendu : fait le rendu des marqueurs de cibles.

- `dt` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulation (s).

#### `gameplay_crashTest_scenarioManager.onUpdate(dtReal, dtSim)`

Hook appelé à chaque image : tant que le scénario n'est pas fini, dessine les marqueurs et zones, et, une fois lancé, vérifie l'arrêt de l'IA, affiche distance/vitesse des cibles, décompte le temps et met à jour le chrono UI.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulation (s).

#### `gameplay_crashTest_scenarioManager.onVehicleCrashEnded(crashEndData)`

Hook appelé par la détection de crash quand un crash se termine : mémorise les données de fin puis évalue si l'étape est réussie ou échouée.

- `crashEndData` (*table*) : Données de fin de crash (vehId, sanitizedData avec touchedVehIds et initialImpactPos, impacts, jbeamsInvolved).

#### `gameplay_crashTest_scenarioManager.onVehicleCrashStarted(crashStartData)`

Hook appelé par la détection de crash quand un véhicule suivi commence un crash : enregistre les données de départ et le temps écoulé de l'étape ; gèle le joueur pour un 'Simple crash' ; si c'est une cible, efface les marqueurs et arrête son IA ScriptAi.

- `crashStartData` (*table*) : Données de début de crash (vehId, vehImpactSpeed…).

#### `gameplay_crashTest_scenarioManager.processData(crashTestData, deactivateVehiclesFromOtherSteps_)`

Initialise le scénario : réinitialise l'état, charge les extensions secondaires, convertit chaque étape de la définition en données nettoyées (ids de véhicules, vec3 pour positions et échelles, objectifs, dégâts, durées), initialise la liste de tâches de l'UI et gèle les véhicules joueurs.

- `crashTestData` (*table<integer, table>*) : Étapes brutes de la mission (crashTestVehName, jbeamTargetName, objective, impactSpeed, maxTime, staticCrashTransformPos, etc.).
- `deactivateVehiclesFromOtherSteps_` (*boolean*) : Si vrai, seuls les véhicules de l'étape courante sont actifs (setActive) et des fondus d'écran sont joués entre étapes.

#### `gameplay_crashTest_scenarioManager.setDebug(_debug)`

Active ou désactive le drapeau de debug du module.

- `_debug` (*boolean*) : Nouvelle valeur.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : {'ui_apps_genericMissionData', 'ui_apps_pointsBar'}. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onCrashScenarioFailed`
- `onCrashTestShowEndStepDetails`
- `onCrashTestShowStepDetails`

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawTextAdvanced`
- `scenetree.` `findObjectById`

**Charge les extensions :** `freeroam_crashCamMode`, `gameplay_crashTest_crashTestBoundaries`, `gameplay_crashTest_crashTestCountdown`, `gameplay_crashTest_crashTestDamageChecker`, `gameplay_crashTest_crashTestScoring`, `gameplay_crashTest_crashTestTaskList`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/crashTest/scenarioManager.lua`.*
