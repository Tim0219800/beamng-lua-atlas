# `gameplay_rally_tools_rallyToolbox`

*Fichier : `lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua` · VM : Game Engine (GE) · 1882 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/tools/rallyToolbox")` (fichier sous extensions/ mais pas une extension classique)

Fenêtre imgui de debug du RallyManager (gameplay_rally) : affiche la mission courante et la distance de la driveline, propose Warm Reload (resynchronise l'état d'exécution sans recharger), Cold Reload (vide les caches de voicepacks, recharge route, notebook, driveline et resynchronise le véhicule) et l'ouverture de la fenêtre de reconnaissance (recce). Elle contient des sections repliables : Rally Loop (charger/décharger l'extension, ouvrir la fenêtre Loop Toolbox), Recovery (tester la récupération de route), Vehicle (placer le véhicule d'un clic dans la vue 3D), Prefabs (faire apparaître les prefabs de la mission ou de la boucle), Voicepack (sélecteur et infos de timing), Visual Pacenotes, et de nombreuses cases de visualisation (driveline, course, bas niveau, souris comme véhicule). Le module renvoie un constructeur : `require(...)()` ; le dessin 3D se fait dans drawDebug.

## Remarques

- Les options de dessin sont dans self.debug (drawRacePath, drawRaceSplits, drawRaceAiRoute, drawRaceCurrentSeg, drawStartFinishLines, drawStopZone, drawNotebookPacenotes, drawDrivelineRouteStatic, useMouseRayCast, drawRoutePacenotes, drawRoutePacenoteText, drawRoutePathnodes, drawRoutePointI, drawRoutePointMetadata, drawRouteHiddenPathnodes, drawRouteShort, drawReccePacenotes, drawDynamicTriggerPoint, drawStageNextPathnode, drawRouteCompletion, drawStageTimingFootprints, drawVehicleTracker…).
- Placement du véhicule : clic gauche = téléporte le véhicule joueur (spawn.safeTeleport) en gardant son orientation ; clic droit = annule. Le RallyManager conserve le suivi de récupération lors de ce reset.
- Fichiers prefab cherchés dans le dossier de la mission : <nom>.prefab puis <nom>.prefab.json ; les objets créés sont ajoutés à MissionGroup et nommés '<missionId> - <nom>'.
- Le sélecteur de voicepack met ses entrées en cache par mission (self._vpCache) ; « Refresh » vide les caches de voicepack.lua.
- getRace colore en alternance orange et jaune les segments du chemin de course pour le debug (champ _rallyDebugColor).
- Le constructeur init contient deux fois la même affectation de nextPacenoteIdxForAudioTriggerTesting (doublon sans effet).

## Classe `C`

Outils de debug du rallye. Champs : rallyManager, race, recce, debugLogging, debug (options de dessin), vehiclePlacementActive, vehiclePlacementMessage, selectedPrefabId, _vpCache, ainsi que des IntPtr imgui pour les délais audio (cornerGapMsPtr, phraseGapMsPtr, linkWordGapMsPtr, pacenoteGapMsPtr) et la récupération (rallyRecoveryCorridorWidthPtr = 8, rallyRecoveryBackoffDistancePtr = 3).

Le module renvoie un constructeur : `local obj = require("gameplay_rally_tools_rallyToolbox")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_cancelVehiclePlacement()` | Annule le placement du véhicule. | 386 |
| `C:_invalidateVoicepackCache()` | Vide le cache local des entrées du sélecteur de voicepack. | 117 |
| `C:_placeVehicleAt(pos)` | Téléporte le véhicule joueur 0 à la position donnée en conservant son orientation (spawn.safeTeleport, protégé par pcall). | 391 |
| `C:_spawnPrefab(filepath, ownerMissionId)` | Fait apparaître un prefab dans MissionGroup (position 0 0 0) et le sélectionne. | 489 |
| `C:_startVehiclePlacement()` | Active le mode de placement du véhicule. | 381 |
| `C:_updateVehiclePlacementMode()` | Chaque image en mode placement : trace une sphère au point sous la souris (cameraMouseRayCast) et gère clic gauche (placer) et clic droit (annuler). | 414 |
| `C:clearReccePoints()` | Oublie les points de reconnaissance affichés (self.recce = nil). | 1076 |
| `C:draw()` | Dessine toute la fenêtre (à appeler dans un im.Begin/im.End) : en-tête de mission, boutons de rechargement et sections. | 644 |
| `C:drawDebug()` | Dessin 3D de debug selon self.debug : chemin et segments de la course, splits, lignes départ et arrivée, zone d'arrêt, notes d'allure, route de la driveline, suivi du véhicule, etc. Gère aussi le mode de placement du véhicule. | 1195 |
| `C:drawLoopTools()` | Section « Rally Loop » : état de l'extension gameplay_rallyLoop, boutons Load, Unload et Toggle Loop Debug Window. | 255 |
| `C:drawPrefabTools()` | Section « Prefabs » : boutons de spawn des prefabs de la mission et des boucles qui la contiennent, et suppression. | 562 |
| `C:drawRallyRecoveryTools(rm)` | Section « Recovery » : largeur du couloir et distance de recul, cases (réparer le véhicule, marqueurs du suivi) et bouton « Run Recovery ». | 287 |
| `C:drawVehicleTools()` | Section « Vehicle » avec bouton Place Vehicle / Cancel. | 444 |
| `C:drawVoicepackPicker(rm)` | Menu déroulant de voicepack avec cache d'entrées ; changer de voicepack vide les points de reconnaissance et appelle rm:reloadVoicepackAssets(pick, {writeSettings = false}). Bouton Refresh pour invalider les caches. | 150 |
| `C:getDebugLogging()` | État du log de debug. | 137 |
| `C:getRace()` | Objet course courant de gameplay_rally (si l'extension est chargée), en colorant les segments du chemin pour le debug. | 216 |
| `C:getRallyManager()` | Manager lié, sinon celui de gameplay_rally.getRallyManager(). | 129 |
| `C:init()` | Constructeur : initialise tous les champs d'état et les options de dessin par défaut. | 41 |
| `C:setDebugLogging(debugLogging)` | Active ou coupe le log de debug. | 125 |
| `C:setMouseAsVehicleEnabled(enabled)` | Active ou coupe le mode « souris comme véhicule » de la driveline route (la position sous la souris sert de position de véhicule). | 240 |
| `C:setRallyManager(rallyManager)` | Lie la fenêtre à un RallyManager et invalide le cache du sélecteur de voicepack. | 107 |
| `C:toggleMouseMovementCheckbox()` | Inverse le mode « souris comme véhicule ». | 251 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `Sim.` `getUniqueName`
- `debugDrawer:` `drawLine`, `drawLineInstance`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`
- `obj:` `getClassName`, `getID`, `getName`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua`.*
