# `gameplay_rally_driveline_drivelineRoute`

*Fichier : `lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua` · VM : Game Engine (GE) · 2122 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/driveline/drivelineRoute")` (fichier sous extensions/ mais pas une extension classique)

Deuxième version de la driveline de rallye, fondée sur gameplay/route/raceRoute. À partir d'un RacePath (race.json), d'un carnet de notes (NotebookPath) et d'une liste de points enregistrés (PointList), construit deux routes : une route dynamique (recalculée depuis la position du véhicule) et une route statique immuable (avec RallyRouteTracker pour suivre le véhicule et gérer la sortie de route). Les points de départ, de zone d'arrêt, les pathnodes de course et les waypoints de début/fin de virage (Cs/Ce) des notes sont insérés dans la polyligne. Ensuite, à chaque frame, onUpdate évalue la fenêtre de notes : quand le temps restant avant le début du virage passe sous (délai du copilote + durée parlée de la note), l'audio de la note est déclenché via les callbacks onPacenote*Hit. Fournit aussi des distances (course, fraction parcourue, splits), le replacement du véhicule (notes, récupération) et des dessins de débogage. Le module renvoie un constructeur : require(...)().

## Exemple

```lua
local dl = require('/lua/ge/extensions/gameplay/rally/driveline/drivelineRoute')()
dl.onPacenoteCsDynamicHit = function(pacenote, shouldTriggerAudio) end
dl:setVehicleTracker(vehicleTracker)
if dl:loadRouteFromRecordedDriveline(racePath, notebookPath, pointList) then
  -- chaque frame : dl:onUpdate(dtReal, dtSim, dtRaw)
end
```

## Remarques

- Les distances sont des 'distToTarget' (distance restante jusqu'à la fin de la route) : elles décroissent le long de la route ; distance depuis le départ = distToTarget du premier point - distToTarget du point.
- Pour charger, racePath doit avoir une position de départ par défaut et une position 'STOP_ZONE', 'SS_stop_control' ou 'TC_out' ; sinon loadRouteFromRecordedDriveline échoue (false) et remet l'objet à zéro.
- Seuls les types de déclenchement dynamic (1) et csImmediate (15) existent dans RallyEnums.triggerType ; les comparaisons avec csStatic, csHalf, csMinus5, ceMinus5, ceStatic valent donc nil et ne déclenchent jamais l'audio (les évènements sont tout de même enregistrés et leurs callbacks appelés sans audio).
- Seuil dynamique : timeToCs < codriverDelayForSpeed(vitesse mph) + durée effective de la note ; timeToCs = (distance restante du véhicule - distance originale du waypoint Cs) / vitesse en m/s.
- Paramètres : staticDistanceThresholdMeters 0,1 ; minEvalSpeedMph 1,0 ; minWaitTimeSinceRecalc 2,0 s ; lissage de la vitesse de déclenchement 0,25 s ; pacenoteLookbehindWindow 5 notes.
- Les callbacks onPacenoteXxxHit (Dynamic, CsImmediate, CsStatic, CeStatic, CsOffset, CeOffset, CornerPercent) sont à renseigner par l'appelant ; ils ne sont pas appelés tant que recalcNeeded est vrai.
- onUpdate n'évalue les notes qu'au moins minWaitTimeSinceRecalc après un recalcul. dtSimSumSinceRecalc reste nil jusqu'au premier recalcul : la comparaison dtSimSumSinceRecalc > minWaitTimeSinceRecalc provoquerait une erreur si la vitesse dépasse minEvalSpeedMph avant tout recalcul (déduit du code).
- evaluatePacenoteEvents sort plusieurs fois avant profilerPopEvent sans l'appeler (déséquilibre du profileur, déduit du code).
- Étiquettes des splits : un chiffre décimal (km) sauf doublons ou '0.0', auquel cas deux chiffres.

## Classe `C`

Driveline V2 renvoyée par le constructeur. Attributs principaux : racePath, notebookPath, route, routeStatic, staticTracker, vehicleTracker, events, eventLog, loaded, nextPacenoteIdxForEval, splitDataList, pathnodeObservationList, raceCompletionData, callbacks onPacenote*Hit.

Le module renvoie un constructeur : `local obj = require("gameplay_rally_driveline_drivelineRoute")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_abortLoadRoute()` | Abandonne un chargement en cours (appelle _reset). | 403 |
| `C:_reset()` | Remet à zéro l'état de chargement et de suivi : routes, trackers, évènements, seuils de déclenchement (0,1 m, 1 mph, 2 s, lissage 0,25 s) et suivi souris. | 72 |
| `C:buildElevationProfile()` | Construit le profil d'altitude : un élément {x, y, z, distFromStart, splitLabel, isRacePathnode} par point de la route statique jusqu'à la ligne d'arrivée incluse. | 2085 |
| `C:callPacenoteEventCallback(callbackFn, ...)` | Appelle un callback d'évènement de note, sauf s'il est nil ou si un recalcul est en attente. | 1331 |
| `C:codriverDelayForSpeed(speedMph)` | Délai du copilote pour une vitesse donnée, avec les réglages du pack vocal actif (mise à l'échelle par la vitesse, décalage) via gameplay_rally_codriverTiming.delayForSpeed. | 123 |
| `C:drawDebugDrivelineRoute(drawRoute, drawPacenotes, drawLimit, monochrome, static, drawHiddenPathnodes, drawRoutePathnodes, drawPointI, drawPointMetadata, drawPacenoteText)` | Dessine la route (dynamique ou statique) : sphères arc-en-ciel et prismes, indices de points, métadonnées, pathnodes de course et étiquettes de notes (drawLimit étiquettes au plus). | 1814 |
| `C:drawDebugDrivelineRouteShort(dist)` | Dessine en vert la route statique devant le véhicule sur une distance donnée. | 2044 |
| `C:drawDebugTriggerPoint()` | Dessine une sphère orange à l'endroit où la prochaine note se déclenchera à la vitesse actuelle. | 1787 |
| `C:effectiveAudioLen(pacenote)` | Durée parlée effective d'une note, avec les écarts de recouvrement structurés (AudioManager:pacenoteEffectiveAudioLen) ; sinon la durée totale brute pacenote:audioLenTotal(). | 114 |
| `C:enableTrackMouseLikeVehicleMovement(val)` | Autorise le déplacement de la position-souris (Maj + clic) en mode débogage. | 1501 |
| `C:enableTriggerLogging()` | Indique si le journal détaillé des déclenchements est actif (gameplay_rally.getDebugLogging()). | 60 |
| `C:evaluatePacenoteEvents(pacenote, speedMs)` | Évalue les déclenchements d'une note : dynamique (temps avant Cs < délai copilote + durée parlée), immédiat, statique Cs, décalage -40 m et 50 % entre Cs et Ce, décalage -5 m et statique Ce. Appelle les callbacks correspondants avec shouldTriggerAudio (vrai une seule fois, pour le type de déclenchement de la note). Renvoie true si l'audio de la note vient d'être déclenché. | 1095 |
| `C:evaluatePacenotesWindow(speedMs)` | Évalue les notes de la fenêtre [prochaine - 5, prochaine] ; avance nextPacenoteIdxForEval à chaque audio déclenché. | 1389 |
| `C:getAheadRoutePointPos()` | Position du deuxième point de la route dynamique (point en avant du véhicule). | 147 |
| `C:getDistanceKmString()` | Longueur de la course formatée '%.2f km', ou 'N/A'. | 1586 |
| `C:getDistanceMeters()` | Longueur de la course (du départ à la ligne d'arrivée) en mètres ; -1 si la ligne d'arrivée est inconnue ; nil sans route ou racePath. | 1573 |
| `C:getFinishLineDistOffset()` | distToTarget du point de route statique du dernier pathnode (ligne d'arrivée) ; nil si indisponible. | 1546 |
| `C:getNearestRoutePoint(pos)` | Position projetée sur la route statique du segment le plus proche (via kd-tree), si la projection est en avant du début du segment (xnorm > 0). | 831 |
| `C:getNextPacenote()` | Prochaine note à évaluer. | 143 |
| `C:getPacenoteEvent(pacenote)` | Renvoie l'évènement mémorisé d'une note ou en crée un : disabledByRecalc, csDynamicHit, csImmediateHit, csStaticHit, csMeterOffsetHit[-40], cornerPercentHit[0.5], ceStaticHit, ceMeterOffsetHit[-5], audioTriggerComplete. | 1033 |
| `C:getPacenotes()` | Liste triée des notes du carnet chargé ({} si aucun carnet). | 135 |
| `C:getPointDistanceFromStartKm(point)` | Distance du départ à un point de la route, en kilomètres. | 1671 |
| `C:getPointDistanceFromStartMeters(point)` | Distance du départ à un point de la route, en mètres (0 sans route). | 1660 |
| `C:getPosition()` | Position du véhicule (ou de la souris en mode débogage). | 1366 |
| `C:getRaceCompletionData()` | Progression de la course : renvoie une table partagée {distM, distPct, distKm, totalDistM} (distance parcourue, fraction, texte '%.2fkm', longueur totale). Valeurs à 0 si la ligne d'arrivée est inconnue. | 1595 |
| `C:getRecoveryDistToTarget(backoffDistance)` | Distance restante où replacer le véhicule après une sortie de route (suiveur statique ; sinon distance suivie). | 892 |
| `C:getRouteCorridorWidth()` | Demi-largeur actuelle du corridor. | 875 |
| `C:getSpeed()` | Vitesse du véhicule en m/s (ou celle de la souris en mode débogage). 0 sans suiveur de véhicule, nil sans véhicule. | 1337 |
| `C:getStaticTrackerState()` | État du suiveur statique (voir RallyRouteTracker:getState). | 859 |
| `C:getTrackedDistToTarget()` | Distance restante jusqu'à la fin de la route : celle du suiveur statique ; à défaut celle du premier point de la route dynamique. | 882 |
| `C:init()` | Initialise les callbacks (nil), les options de débogage souris, les listes de splits et l'état interne (_reset). | 28 |
| `C:isLoaded()` | Indique si une route a été chargée avec succès. | 68 |
| `C:loadRouteFromRecordedDriveline(racePath, notebookPath, pointsList)` | Charge la route à partir d'une driveline enregistrée : construit la liste de points (driveline, position de départ, zone d'arrêt, pathnodes, waypoints Cs/Ce des notes), supprime ceux avant le départ et après l'arrêt, crée route dynamique et route statique, le suiveur statique, les longueurs de notes et les données de splits/pathnodes. Retourne false (et se remet à zéro) si les prérequis manquent. | 412 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` | Appelé à chaque frame : met à jour la souris en mode débogage, la vitesse, le suiveur statique et la vitesse de déclenchement lissée ; exécute un recalcul si demandé, sinon évalue les notes si la vitesse dépasse 1 mph et que 2 s se sont écoulées depuis le dernier recalcul. Ignore les vitesses > 1000 mph. | 1427 |
| `C:positionAtDistToTarget(targetDist)` | Position sur la route statique pour une distance restante donnée (interpolation linéaire entre points). | 1699 |
| `C:projectStaticRoute(pos, options)` | Projette une position sur la route statique sans modifier l'état. | 848 |
| `C:recalculate(options)` | Recalcule la route depuis la position courante : retrouve le prochain waypoint de début de virage (Cs) et le prochain pathnode, désactive les évènements des notes déjà passées (disabledByRecalc), fixe nextPacenoteIdxForEval, appelle route:recalculateRouteWithOriginalPositions et réinitialise le suiveur statique (sauf preserveStaticTracker). | 900 |
| `C:resetStaticTracker(pos)` | Réinitialise le suiveur statique, éventuellement à une position. | 853 |
| `C:setRecalcNeeded(options)` | Demande un recalcul de la route au prochain onUpdate. | 1482 |
| `C:setRouteCorridorWidth(width)` | Règle la demi-largeur du corridor de route du suiveur statique. | 869 |
| `C:setStaticTrackerDebugCapture(enabled)` | Active la capture de diagnostic du suiveur statique. | 863 |
| `C:setTrackMouseLikeVehicle(val)` | Active/désactive le suivi de la souris comme s'il s'agissait du véhicule (débogage). La désactivation efface les données de souris. | 1490 |
| `C:setVehicleTracker(vehicleTracker)` | Définit l'objet qui fournit la position et la vitesse du véhicule (méthodes getVehicle, speedMs, pos). | 131 |
| `C:updateDynamicTriggerSpeed(speedMs, dtSim)` | Lisse la vitesse utilisée pour les déclenchements (filtre exponentiel de constante 0,25 s) ; l'initialise à la vitesse courante si elle est nil ou si dtSim est invalide. | 1014 |
| `C:updateMouseLikeVehicle(dtSim)` | Met à jour la position et la vitesse simulées de la souris (raycast caméra, lissage 0,02) en mode débogage. | 1505 |
| `C:updateStaticTracker(pos, options)` | Met à jour le suiveur de route statique avec la position (RallyRouteTracker:update). | 843 |
| `C:vehiclePlacementPosAndRotForPacenote(pacenote, distBefore, tangentLookAhead)` | Position et orientation pour replacer le véhicule distBefore mètres avant le début du virage (Cs) d'une note, cap pris vers un point tangentLookAhead mètres plus loin sur la route. | 1713 |
| `C:vehiclePlacementPosAndRotForRecovery(backoffDistance, tangentLookAhead)` | Position et orientation pour récupérer le véhicule après une sortie de route (distance de récupération du suiveur, bornée au début de la route). | 1754 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua`.*
