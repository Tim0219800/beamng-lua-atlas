# `core_hotlapping`

*Fichier : `lua/ge/extensions/core/hotlapping.lua` · VM : Game Engine (GE) · 1072 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_hotlapping` : `extensions.load("core_hotlapping")`, puis la globale `core_hotlapping`

Extension GE `core_hotlapping` : mode « tours chronométrés » du freeroam (appli Hotlapping). Le joueur pose des checkpoints (points de passage avec position, direction et rayon) pour définir un circuit, le chrono démarre quand il passe dans le premier, puis les tours et sections sont chronométrés avec écarts par rapport au meilleur tour. Le circuit peut être sauvegardé/chargé (gameplay/hotlapping/<niveau>/*.race.json) et les véhicules IA peuvent le parcourir. Le module sert aussi d'afficheur de temps pour les scénarios de course (ancien système `onRace*`) et pour le nouveau système de course (`newRace*`).

## Exemple

```lua
extensions.load('core_hotlapping')
core_hotlapping.startHotlapping()      -- entre en mode édition (crée le 1er checkpoint à la position du véhicule)
-- rouler jusqu'au prochain point puis :
core_hotlapping.addCheckPoint()
-- repasser dans le 1er checkpoint pour démarrer le chrono
core_hotlapping.save()                 -- sauvegarde sous <date>.race.json
```

## Remarques

- Unités : tous les temps internes sont en MILLISECONDES (os.clock()*1000, ou race.time*1000 pour le nouveau système). formatMillis donne 'MM:SS.mmm'. Les rayons de checkpoint sont en mètres : défaut automatique (autoRadius) = 5, sinon max(3, rayon de la route interpolé + 1) si une route est à moins de 30 m ; changeRadius borne à 1..15.
- Structure de getTimeInfoRaw() : times[lap] = {startTime, endTime, duration, diff, skipped, lap, [cp] = {startTime, endTime, duration, diff, cp, current}} ; lap et cp sont numérotés à partir de 1. L'écart (diff) d'un tour/section est en ms par rapport au meilleur tour (bestLapIndex), absent pendant le 1er tour et pour les circuits à branches.
- getTimeInfo() renvoie {normal = liste par tour, detail = liste à plat sections puis tour} prête pour l'UI (champs formatés duration, total, diff, diffColor 'red'/'green', durationStyle en CSS inline, best, isSection, isLap).
- Évènements UI : HotlappingTimer (état du chrono, envoyé au passage d'un checkpoint, à la fin d'un tour ou quand forceSendToGui est vrai), HotlappingTimerPause, HotlappingResetApp, HotlappingSuccessfullyLoaded(nom), HotlappingSuccessfullySaved(nom).
- Pause : quand be:getEnabled() est faux (simulation en pause), la durée de pause est cumulée puis retranchée du temps total.
- Trois chemins d'alimentation selon la source de course : le mode freeroam interne (onCheckPointPassed + onUpdate), l'ancien système de scénario (onRaceStart, onRaceWaypointReached, onRaceResult, timer du scénario en secondes x1000) et le nouveau système (newRaceStart, newRacePathnodeReached, newRaceLapSkipped, newRaceStop).
- Incohérences : le commentaire de refreshTracklist dit qu'il envoie la liste à l'appli mais il se contente de la renvoyer ; rename appelle renameFile puis removeFile de l'ancien chemin (le second appel est inutile) ; onCheckPointPassed n'est jamais appelé dans ce fichier ; la liste automatique cite deux fois les mêmes hooks onRace* qui sont des hooks de l'ancien système.
- En mode freeroam, le mode IA (startAi) impose aux véhicules non joueurs et non trafic/garés ai.driveUsingPath avec 1000 tours, aggression 0.9, turnForceCoef 4, awarenessForceCoef 0.15 ; il marque ces véhicules avec le champ dynamique isHotlapping.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_hotlapping.addCheckPoint(cpPos, cpDir, cpRadius)` | Ajoute un checkpoint au circuit (mode édition seulement) et le relie au précédent par un segment. Sans argument, utilise la position du véhicule joueur posée sur la surface (ou la caméra), sa direction si le véhicule est à moins de 5 m, et le rayon courant (automatique ou fixé par changeRadius). | 250 |
| `core_hotlapping.changeRadius(sign)` | Modifie le rayon de tous les checkpoints : +1 m si sign > 0, -1 m si sign < 0 (borné 1..15), retour au rayon automatique si sign == 0 (le 1er changement part de 5). | 842 |
| `core_hotlapping.clearAllCP()` | Oublie le compteur et l'id du dernier checkpoint et arrête l'IA. Ne vide pas le chemin lui-même. | 291 |
| `core_hotlapping.formatMillis(timeInMillis, addSign)` | Formate des millisecondes en 'MM:SS.mmm' (arrondi à l'entier) ; avec addSign, préfixe '+' ou '-'. | 714 |
| `core_hotlapping.getDiffColor(val)` | Couleur CSS d'un écart : 'red' si > 0 (plus lent), 'green' si < 0, '' si nul. | 732 |
| `core_hotlapping.getTimeInfo()` | Données de temps formatées pour l'UI : {normal = résumé par tour, detail = sections puis tour}. La table est réutilisée à chaque appel. | 592 |
| `core_hotlapping.getTimeInfoRaw()` | Table brute des temps par tour et section (voir notes). | 584 |
| `core_hotlapping.load(originalFilename)` | Charge un circuit depuis gameplay/hotlapping/<niveau>/<nom>.race.json ; à défaut, cherche l'ancien format dans settings/hotlapping (fichiers dont le chemin contient le nom). Puis arrête le chrono, vide, relance le mode hotlapping et prévient l'UI. | 748 |
| `core_hotlapping.newRaceLapSkipped(state, info)` | Hook du nouveau système : le tour courant a été sauté ; le marque 'skipped' et remet le checkpoint à 1 si state.skippedLap. *(interne)* | 932 |
| `core_hotlapping.newRacePathnodeReached(state, info)` | Hook du nouveau système : passage d'un pathnode du joueur. Termine la course si state.complete, sinon avance tour/checkpoint (ignore les recoveries) et met à jour les temps. *(interne)* | 906 |
| `core_hotlapping.newRaceStart(race)` | Hook du nouveau système de course : démarre le suivi (course fermée, tours depuis 1, horloge = race.time*1000) et détecte les circuits à branches (comparaisons désactivées). *(interne)* | 890 |
| `core_hotlapping.newRaceStop()` | Hook du nouveau système : arrêt de la course (started = false). *(interne)* | 961 |
| `core_hotlapping.onCheckPointPassed(index)` | Prévu pour le passage d'un checkpoint (mode freeroam hérité) : si index est le prochain attendu, avance le compteur de tours/checkpoints. Aucun appel dans ce fichier. *(interne)* *(hook)* | 329 |
| `core_hotlapping.onClientEndMission()` | Hook de fin de niveau : arrête le mode hotlapping. *(interne)* *(hook)* | 878 |
| `core_hotlapping.onClientStartMission()` | Hook de début de niveau : arrête le mode hotlapping et remet l'appli à zéro (HotlappingResetApp). *(interne)* *(hook)* | 873 |
| `core_hotlapping.onExtensionUnloaded()` | Hook de déchargement : arrête le mode hotlapping. *(interne)* *(hook)* | 882 |
| `core_hotlapping.onGameStateUpdate(...)` | Hook de changement d'état de jeu : force le prochain envoi à l'UI. *(interne)* *(hook)* | 949 |
| `core_hotlapping.onMenuToggled(...)` | Hook d'ouverture/fermeture de menu : force le prochain envoi à l'UI. *(interne)* *(hook)* | 953 |
| `core_hotlapping.onPreRender(dt, dtSim)` | Hook de rendu : en édition, dessine sphères, colonnes verticales (la première en orange) et flèches de direction des checkpoints ; sinon fait rendre les marqueurs de course. *(interne)* *(hook)* | 362 |
| `core_hotlapping.onRaceResult(final)` | Hook de l'ancien système : fin de course ; arrête le chrono et stocke les temps détaillés dans scenario.detailedTimes. *(interne)* *(hook)* | 1017 |
| `core_hotlapping.onRaceStart()` | Hook de l'ancien système de scénario de course : démarre le suivi avec le chrono du scénario (scenario.timer en secondes), course fermée, tours depuis 1 ; circuits à branches si lapConfigBranches est défini. *(interne)* *(hook)* | 969 |
| `core_hotlapping.onRaceWaypointReached(wpInfo)` | Hook de l'ancien système : le joueur a atteint un waypoint. Gère fin de course, changement de tour (lapDiff == 1) ou de checkpoint et met à jour les temps. Ignore les autres véhicules. *(interne)* *(hook)* | 986 |
| `core_hotlapping.onScreenFadeState(...)` | Hook de fondu d'écran : force le prochain envoi à l'UI. *(interne)* *(hook)* | 957 |
| `core_hotlapping.onUpdate(dt, dtSim)` | Hook par image : démarre la course quand le joueur entre dans le premier checkpoint, gère la pause, met à jour la course et le temps total, puis envoie l'état à l'UI. *(interne)* *(hook)* | 389 |
| `core_hotlapping.onVehicleResetted(id)` | Hook de reset de véhicule : si le joueur est remis près (moins de 80 m) du départ pendant une course, arrête l'IA et la replace à son point de départ. *(interne)* *(hook)* | 866 |
| `core_hotlapping.passTimeToGUI()` | Envoie à l'UI (HotlappingTimer) l'état du chrono (getTimeInfo plus stop, justLapped, delta, closed, running, justStarted) si un checkpoint vient d'être passé, un tour terminé ou un envoi forcé est demandé. | 459 |
| `core_hotlapping.refreshTracklist()` | Liste les circuits disponibles (niveau courant, plus anciens dans settings/hotlapping) sans extension. | 827 |
| `core_hotlapping.rename(oldName, newName)` | Renomme un circuit du niveau courant (<ancien>.race.json -> <nouveau>.race.json). | 813 |
| `core_hotlapping.save(filePath)` | Sauvegarde le circuit en JSON (gameplay/hotlapping/<niveau>/<date>.race.json par défaut), envoie HotlappingSuccessfullySaved à l'UI. Refuse si le chemin est invalide. | 797 |
| `core_hotlapping.setEndTime()` | Fige les temps de la section et du tour à totalTime à la fin de la course et met à jour écart et meilleur tour. | 475 |
| `core_hotlapping.setTime(ignoreNewLap)` | Met à jour les temps courants : crée au besoin l'enregistrement du tour et du checkpoint, ferme le précédent, calcule durées, écarts par rapport au meilleur tour et met à jour le meilleur tour (comparaisons désactivées pour les courses à branches). | 504 |
| `core_hotlapping.setVisible(value)` | Affiche ou cache les marqueurs de la course et coupe/remet le son des checkpoints. | 298 |
| `core_hotlapping.skipLap(keepLapProgress)` | Passe le tour en cours (marqué 'skipped' dans les temps) via raceData:skipLap pour le véhicule joueur. | 209 |
| `core_hotlapping.start()` | Démarre le chrono (appelé automatiquement quand le joueur passe dans le premier checkpoint). En mode édition, valide le chemin, crée l'objet de course (1000 tours, appli hotlapping, audio de checkpoint), les marqueurs visuels et joue le son UI_Checkpoint. Arrête immédiatement si le chemin est invalide. | 168 |
| `core_hotlapping.startAi()` | Fait parcourir le circuit en boucle (1000 tours, évitement de véhicules activé) à tous les véhicules IA non trafic/non garés. Si aucune course n'est démarrée et que l'on est en édition, démarre d'abord la course. | 104 |
| `core_hotlapping.startHotlapping()` | Entre en mode édition du circuit : réinitialise l'état, crée un objet de chemin (gameplay/race/path) et ajoute le premier checkpoint à la position du véhicule. Désactive le mode (avertissement) s'il n'y a pas de véhicule joueur. | 56 |
| `core_hotlapping.stopAi(respawn)` | Arrête les véhicules marqués isHotlapping (ai.setMode('stop')) et, si respawn, les replace à leur position sauvegardée (recovery.loadHome). | 135 |
| `core_hotlapping.stopHotlapping()` | Arrête tout : stoppe le chrono, quitte le mode édition, détruit le chemin et retire le marquage isHotlapping des véhicules. | 88 |
| `core_hotlapping.stopTimer()` | Arrête le chrono, vide les temps, arrête la course et les marqueurs ; repasse en mode édition si une course tournait ; arrête l'IA. | 216 |

### Détail des paramètres

#### `core_hotlapping.addCheckPoint(cpPos, cpDir, cpRadius)`

Ajoute un checkpoint au circuit (mode édition seulement) et le relie au précédent par un segment. Sans argument, utilise la position du véhicule joueur posée sur la surface (ou la caméra), sa direction si le véhicule est à moins de 5 m, et le rayon courant (automatique ou fixé par changeRadius).

- `cpPos` (*vec3|nil*) : Position monde du centre.
- `cpDir` (*vec3|nil*) : Direction/normal ; nil = pas de normal (passage dans les deux sens).
- `cpRadius` (*number|nil*) : Rayon en mètres.

#### `core_hotlapping.changeRadius(sign)`

Modifie le rayon de tous les checkpoints : +1 m si sign > 0, -1 m si sign < 0 (borné 1..15), retour au rayon automatique si sign == 0 (le 1er changement part de 5).

- `sign` (*number*) : +1, -1 ou 0.

#### `core_hotlapping.formatMillis(timeInMillis, addSign)`

Formate des millisecondes en 'MM:SS.mmm' (arrondi à l'entier) ; avec addSign, préfixe '+' ou '-'.

- `timeInMillis` (*number|nil*) : Temps en ms.
- `addSign` (*boolean|nil*) : true = ajoute le signe (écarts).
- **renvoie** : string|nil Texte ; nil si timeInMillis est nil.

#### `core_hotlapping.getDiffColor(val)`

Couleur CSS d'un écart : 'red' si > 0 (plus lent), 'green' si < 0, '' si nul.

- `val` (*number*) : Écart en ms.
- **renvoie** : string 'red', 'green' ou ''.

#### `core_hotlapping.getTimeInfo()`

Données de temps formatées pour l'UI : {normal = résumé par tour, detail = sections puis tour}. La table est réutilisée à chaque appel.

- **renvoie** : table {normal, detail}.

#### `core_hotlapping.getTimeInfoRaw()`

Table brute des temps par tour et section (voir notes).

- **renvoie** : table times (référence interne).

#### `core_hotlapping.load(originalFilename)`

Charge un circuit depuis gameplay/hotlapping/<niveau>/<nom>.race.json ; à défaut, cherche l'ancien format dans settings/hotlapping (fichiers dont le chemin contient le nom). Puis arrête le chrono, vide, relance le mode hotlapping et prévient l'UI.

- `originalFilename` (*string*) : Nom du circuit sans extension.

#### `core_hotlapping.newRaceLapSkipped(state, info)`

Hook du nouveau système : le tour courant a été sauté ; le marque 'skipped' et remet le checkpoint à 1 si state.skippedLap.

- `state` (*table*) : État du véhicule.
- `info` (*table*) : Non utilisé.

#### `core_hotlapping.newRacePathnodeReached(state, info)`

Hook du nouveau système : passage d'un pathnode du joueur. Termine la course si state.complete, sinon avance tour/checkpoint (ignore les recoveries) et met à jour les temps.

- `state` (*table*) : État du véhicule dans la course (complete, events).
- `info` (*table*) : Infos du passage (lapped).

#### `core_hotlapping.newRaceStart(race)`

Hook du nouveau système de course : démarre le suivi (course fermée, tours depuis 1, horloge = race.time*1000) et détecte les circuits à branches (comparaisons désactivées).

- `race` (*table*) : Objet course (time, path.pathnodes, path.config.branching).

#### `core_hotlapping.onCheckPointPassed(index)`

Prévu pour le passage d'un checkpoint (mode freeroam hérité) : si index est le prochain attendu, avance le compteur de tours/checkpoints. Aucun appel dans ce fichier.

- `index` (*integer*) : Indice du checkpoint passé (0 = ligne de départ).

#### `core_hotlapping.onGameStateUpdate(...)`

Hook de changement d'état de jeu : force le prochain envoi à l'UI.

- `...` (*any*) : Non utilisé.

#### `core_hotlapping.onMenuToggled(...)`

Hook d'ouverture/fermeture de menu : force le prochain envoi à l'UI.

- `...` (*any*) : Non utilisé.

#### `core_hotlapping.onPreRender(dt, dtSim)`

Hook de rendu : en édition, dessine sphères, colonnes verticales (la première en orange) et flèches de direction des checkpoints ; sinon fait rendre les marqueurs de course.

- `dt` (*number*) : Delta temps de rendu en secondes.
- `dtSim` (*number*) : Delta temps de simulation.

#### `core_hotlapping.onRaceResult(final)`

Hook de l'ancien système : fin de course ; arrête le chrono et stocke les temps détaillés dans scenario.detailedTimes.

- `final` (*any*) : Non utilisé.

#### `core_hotlapping.onRaceWaypointReached(wpInfo)`

Hook de l'ancien système : le joueur a atteint un waypoint. Gère fin de course, changement de tour (lapDiff == 1) ou de checkpoint et met à jour les temps. Ignore les autres véhicules.

- `wpInfo` (*table*) : {vehicleId, next, lapDiff, …}.

#### `core_hotlapping.onScreenFadeState(...)`

Hook de fondu d'écran : force le prochain envoi à l'UI.

- `...` (*any*) : Non utilisé.

#### `core_hotlapping.onUpdate(dt, dtSim)`

Hook par image : démarre la course quand le joueur entre dans le premier checkpoint, gère la pause, met à jour la course et le temps total, puis envoie l'état à l'UI.

- `dt` (*number*) : Delta temps réel en secondes.
- `dtSim` (*number*) : Delta temps de simulation.

#### `core_hotlapping.onVehicleResetted(id)`

Hook de reset de véhicule : si le joueur est remis près (moins de 80 m) du départ pendant une course, arrête l'IA et la replace à son point de départ.

- `id` (*integer*) : Id du véhicule.

#### `core_hotlapping.refreshTracklist()`

Liste les circuits disponibles (niveau courant, plus anciens dans settings/hotlapping) sans extension.

- **renvoie** : string[] Noms de circuits (caractères alphanumériques, '-' et '_' avant le premier autre caractère).

#### `core_hotlapping.rename(oldName, newName)`

Renomme un circuit du niveau courant (<ancien>.race.json -> <nouveau>.race.json).

- `oldName` (*string*) : Ancien nom sans extension.
- `newName` (*string*) : Nouveau nom sans extension.

#### `core_hotlapping.save(filePath)`

Sauvegarde le circuit en JSON (gameplay/hotlapping/<niveau>/<date>.race.json par défaut), envoie HotlappingSuccessfullySaved à l'UI. Refuse si le chemin est invalide.

- `filePath` (*string|nil*) : Chemin de sortie ; défaut daté dans le dossier du niveau courant.

#### `core_hotlapping.setTime(ignoreNewLap)`

Met à jour les temps courants : crée au besoin l'enregistrement du tour et du checkpoint, ferme le précédent, calcule durées, écarts par rapport au meilleur tour et met à jour le meilleur tour (comparaisons désactivées pour les courses à branches).

- `ignoreNewLap` (*any*) : Non utilisé dans le code.

#### `core_hotlapping.setVisible(value)`

Affiche ou cache les marqueurs de la course et coupe/remet le son des checkpoints.

- `value` (*boolean*) : true = visibles.

#### `core_hotlapping.skipLap(keepLapProgress)`

Passe le tour en cours (marqué 'skipped' dans les temps) via raceData:skipLap pour le véhicule joueur.

- `keepLapProgress` (*boolean|nil*) : Transmis à raceData:skipLap : conserver ou non la progression dans le tour (déduit du code).

#### `core_hotlapping.stopAi(respawn)`

Arrête les véhicules marqués isHotlapping (ai.setMode('stop')) et, si respawn, les replace à leur position sauvegardée (recovery.loadHome).

- `respawn` (*boolean|nil*) : true = remettre les véhicules à leur 'home'.

**Évènements UI (guihooks.trigger) :** `HotlappingResetApp`, `HotlappingSuccessfullyLoaded`, `HotlappingSuccessfullySaved`, `HotlappingTimer`, `HotlappingTimerPause`

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`, `removeFile`, `renameFile`
- `be:` `getEnabled`, `getObjectOOBBCenterXYZ`, `getPlayerVehicleID`, `getSurfaceHeightBelow`
- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawSquarePrism`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/hotlapping.lua`.*
