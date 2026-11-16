# `gameplay_race_race`

*Fichier : `lua/ge/extensions/gameplay/race/race.lua` · VM : Game Engine (GE) · 1351 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/race/race")` (fichier sous extensions/ mais pas une extension classique)

Classe du moteur de course : fait courir un ou plusieurs véhicules sur un chemin de course (gameplay/race/path). À chaque image elle suit les coins des roues de chaque véhicule, détecte l'entrée dans les segments, le franchissement des pathnodes, les tours, l'arrivée, les départs lancés, les annonces de copilote (pacenotes) et les récupérations (recovery), calcule les temps, le classement et l'état « sur la route ». Elle pilote aussi les véhicules IA le long du chemin et alimente les applications Hotlapping et LapTimes. Le module renvoie une fabrique : require('/lua/ge/extensions/gameplay/race/race')(). Elle sert aux missions de course, au mode rallye et au flowgraph.

## Exemple

```lua
local race = require('/lua/ge/extensions/gameplay/race/race')()
race:setPathFile('/levels/west_coast_usa/race/test.race.json')
race.lapCount = 3
race:setVehicleIds({be:getPlayerVehicleID(0)})
race:startRace()
-- puis appeler race:onUpdate(dtSim) à chaque image
```

## Remarques

- Options de la table race (à régler avant startRace) : lapCount (1), useHotlappingApp (false), useLapTimesApp (true), useDebugDraw (false), useWaypointAudio (true), alwaysAdvanceTime (false), autoAiMode (démarre l'IA des véhicules non pilotés), recoverAffectsTotalTime, logRaceInfo (écrit raceRecord/<date>/ à l'arrivée), saveFileSuffix, suspended.
- États par véhicule (self.states[id]) : active, complete, currentLap (0 pour le premier tour), currentSegments, currentTimes, historicTimes, bestLapTime, nextPathnodes, overNextPathnodes, placement, startTime, endTime, events, eventLog, isOnRoad, aiPathIdx, recoveriesUsed, timeDifferenceToFirst (en millisecondes).
- Événements (state.events, vidés à chaque image si le temps est > 0) : raceStarted, rollingStarted, pathnodeReached (+ pathnodeReachedId), lapComplete, lapSkipped, raceComplete, raceAborted, recovered, recoveredTo, recoveryReached, pacenoteReached (+ pacenoteIdReached).
- Hooks émis par digestEvents / updateVehicle : onRaceStarted({race, time}), onRacePathnodeReached({race, time, pathnode}), onRaceComplete({race, time}), onRaceAborted({race, time}). Pour un pathnode non visible, onRacePathnodeReached est émis sans champ time.
- Bug probable : onUpdate et findNextPathnodes testent self.path.branching (toujours nil) au lieu de self.path.config.branching ; getTrackedData tourne donc aussi pour les chemins branchés, où linearCPIndex est nil.
- Bug probable : handleRecover utilise #self.recoveryStates (nombre d'entrées indexées par ids de véhicules, souvent 0) au lieu de #self.recoveryStates[id] pour events.recovered.
- updateVehicle contient un print(string.format('T: ...')) de débogage à chaque pathnode visible atteint.
- timeDifferenceToFirst est stocké en millisecondes alors que formatTimeDifference le traite comme des secondes (mm:ss.ms) : l'écart affiché est faux d'un facteur 1000.
- isDebug = true dans le fichier : detectOffTrack dumpe et dessine ses données, mais son appel est commenté (« temporarily disabled until errors get resolved »).
- state.reverse = self.path.config.reverse : champ jamais défini dans autoConfig (nil).
- Les distances de getDistOnNav sont en mètres ; les temps en secondes de simulation.
- Les fonctions in* (inDrawEventlog, inDrawTimes…) sont des utilitaires ImGui de debug ; leur appel est commenté dans onUpdate.

## Classe `C`

Course en cours. Champs : path, vehIds, states (par id de véhicule), recoveryStates (instantanés de récupération par id), time (temps de course en s), lapCount, finishCount, started, suspended, checkpointTimes ('<tour>_<segment>' -> temps), aiPath, aiDetailedPath, sortPlacements (comparateur de classement : tour décroissant, puis index de point de contrôle décroissant, puis distance croissante au prochain point).

Le module renvoie un constructeur : `local obj = require("gameplay_race_race")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:abortRace(id)` | Abandonne la course d'un véhicule (ignoré s'il a fini ou n'est pas actif) : événement raceAborted, IA arrêtée. | 615 |
| `C:calcAIPath()` | Calcule le chemin IA (aiPath, aiDetailedPath) à partir du chemin de course. | 47 |
| `C:changeRaceVehicle(lastId, newId)` | Remplace un véhicule de course par un autre (transfère états et récupérations, recalcule les coins des roues). | 361 |
| `C:clearEvents(id)` | Vide la table d'événements d'un véhicule. | 1166 |
| `C:completeLap(id, endTime)` | Termine le tour d'un véhicule : enregistre les temps du tour (lap, beginTime, endTime, lapTime, segmentTimes). S'il reste des tours, repart sur les segments de départ (événement lapComplete) ; sinon marque la course terminée (placement, raceComplete, IA à l'agressivité 0.5) et écrit éventuellement l'historique dans raceRecord/ si logRaceInfo. | 667 |
| `C:createRecoveryPoint(id, recovery)` | Enregistre un instantané de l'état du véhicule avec le temps de course et la position de récupération associée. | 628 |
| `C:debugDraw(data)` | Dessine des sphères pour les données hors piste d'un véhicule (chemin hors piste, points de sortie, de retour et de coupe maximale). | 109 |
| `C:detectOffTrack(data, dt)` | Détecte les sorties et retours de piste d'un véhicule, enregistre sa trajectoire hors piste et calcule la profondeur de coupe et la distance parcourue hors piste (données de debug). Son appel est actuellement désactivé dans getTrackedData. | 118 |
| `C:detectRollingStart(id, dt)` | En attente d'un départ lancé : teste si le véhicule est entré dans un des segments de départ, calcule alors l'heure exacte de départ (interpolée) et lève rollingStarted. | 822 |
| `C:digestEvents(id, dt)` | Traite les événements d'un véhicule : notifie Hotlapping et LapTimes (pour le véhicule du joueur), remplit le journal d'événements, émet les hooks onRaceStarted, onRacePathnodeReached, onRaceComplete, onRaceAborted, enregistre les points de récupération et joue le son de point de passage. | 1028 |
| `C:doSuspend(sus)` | Suspend ou reprend la course (le temps et le suivi s'arrêtent) et prévient les applications Hotlapping et LapTimes. | 330 |
| `C:drawDebug(id)` | Dessine les prochains pathnodes (rouge), les suivants (orange) et les annonces restantes d'un véhicule. | 1175 |
| `C:findNextPathnodes(id)` | Recalcule pour un véhicule les prochains pathnodes visibles (nextPathnodes), ceux d'après (overNextPathnodes) et la liste décalée sans branchement, avec un type par pathnode : 'branch', 'final', 'lap', 'start', 'recovery' ou 'default'. | 734 |
| `C:formatTimeDifference(timeDiff)` | Formate un écart de temps avec signe au format +MM:SS.mmm ; renvoie 'N/A' si nil. Attend des secondes (voir notes pour l'incohérence avec timeDifferenceToFirst). | 1315 |
| `C:getDistOnNav(pointA, pointB, inNextAiPathIdx, inPrevAiPathIdx, outNextAiPathIdx, outPrevAiPathIdx)` | Calcule, pour une portion hors route, la distance qu'il aurait fallu parcourir le long du chemin de navigation et la distance coupée à vol d'oiseau. | 67 |
| `C:getTimeDifferencesToFirst()` | Pour chaque véhicule ayant un timeDifferenceToFirst, renvoie l'écart avec le premier à avoir franchi le même point, son texte formaté et le classement. | 1327 |
| `C:getTrackedData(dt)` | Met à jour pour chaque véhicule en course la position de l'avant, l'index sur le chemin IA, l'état isOnRoad, puis calcule le classement (placement), en comptant les véhicules déjà arrivés. | 182 |
| `C:getVehiclePosition(id)` | Position d'un véhicule : objet de scène, sinon map.objects ; renvoie vec3() avec un log d'erreur si introuvable. | 602 |
| `C:handlePacenotes(id)` | Détecte si le véhicule traverse une annonce non encore déclenchée dans ses segments courants ; lève pacenoteReached et pacenoteIdReached (une seule par image). | 1005 |
| `C:handleRecover(id)` | Restaure l'état du dernier instantané, le temps de course si recoverAffectsTotalTime, et replace le véhicule sur la position de récupération sans réparation (moveResetVehicleTo avec repair false), puis réinitialise la caméra. | 650 |
| `C:hasRecoveryPosition(id)` | Indique s'il existe au moins un point de récupération pour ce véhicule. | 636 |
| `C:inDrawEventlog(id, im)` | Affiche en ImGui le journal d'événements d'un véhicule (colonnes Time et Event). | 1194 |
| `C:inDrawLapTimes(lTimes, im)` | Affiche en ImGui un tour et ses temps de segments. | 1300 |
| `C:inDrawSegmentTimes(sTimes, im, mode, prefix)` | Affiche en ImGui la liste des temps de segments (du plus récent au plus ancien). | 1280 |
| `C:inDrawTimes(id, im, detail)` | Affiche en ImGui les temps d'un véhicule (tour courant, total, tours précédents, segments si detail). | 1220 |
| `C:init()` | Constructeur : valeurs par défaut et comparateur de classement. | 7 |
| `C:onUpdate(dt)` | À appeler à chaque image : pour chaque véhicule, vide les événements, gère les récupérations demandées, met à jour la position sur le parcours (updateVehicle), le dessin de debug et digère les événements ; puis met à jour le classement, l'application LapTimes et avance le temps de course. Ne fait rien tant que la course n'est pas démarrée. | 278 |
| `C:raceTime(time)` | Formate un temps en secondes au format MM:SS.mmm. | 1308 |
| `C:requestRecover(id)` | Demande la récupération du véhicule au dernier point de récupération ; effective à la prochaine mise à jour. | 644 |
| `C:setPath(path)` | Définit le chemin de course, lance autoConfig et calcule le chemin IA. | 51 |
| `C:setPathFile(file)` | Charge un chemin de course depuis un fichier JSON (désérialisé dans un nouveau chemin) puis l'applique avec setPath. Logue une erreur si le fichier est introuvable. | 35 |
| `C:setVehicleIds(ids)` | Définit la liste des véhicules participants et réinitialise leurs états. | 57 |
| `C:skipLap(id, keepLapProgress)` | Invalide le tour en cours d'un véhicule (circuits fermés uniquement). Sans keepLapProgress, saute aussi la progression : le prochain pathnode devient la ligne d'arrivée du tour. | 349 |
| `C:startAiVehicle(id, aggression)` | Lance l'IA d'un véhicule sur le chemin de course (ai.driveUsingPath) : boucle jusqu'à un tour de plus pour un circuit fermé, ou chemin prolongé de 250 m après l'arrivée sinon. Sans agressivité donnée, l'estime d'après la classe de performance du véhicule (S 1, A 0.9, B 0.8, C 0.7, D 0.6, autre 0.85). | 395 |
| `C:startRace()` | Démarre la course : charge si besoin core_hotlapping / core_lapTimes, remet le temps à 0, crée l'état de chaque véhicule (segments de départ, coins des roues, IA si autoAiMode) et calcule les prochains pathnodes. L'événement raceStarted est levé pour chaque véhicule. | 469 |
| `C:stopAiVehicle(id)` | Arrête l'IA d'un véhicule (mode 'stop'). | 461 |
| `C:stopRace()` | Arrête la course : prévient Hotlapping et LapTimes et arrête les véhicules IA. | 584 |
| `C:updateVehicle(id, dt)` | Avance les coins des roues du véhicule, gère le départ lancé, les annonces, un éventuel tour invalidé, puis teste si un segment est terminé ou un suivant atteint. Enregistre le temps du segment (interpolé avec l'instant de franchissement), applique l'agressivité IA des champs personnalisés (aiAggression, tag aiCoef), termine le tour si besoin, met à jour les prochains pathnodes et signale un point de récupération atteint. | 852 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRaceAborted`
- `onRaceComplete`
- `onRacePathnodeReached` — écouté par 2 module(s)
- `onRaceStarted` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `HotlappingResetApp`, `HotlappingTimerPause`, `HotlappingTimerUnpause`, `setQuickRaceMode`

## Appels vers le moteur (C++)

- `be:` `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfExtentsXYZ`, `getPlayerVehicleID`
- `debugDrawer:` `drawSphere`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/race/race.lua`.*
