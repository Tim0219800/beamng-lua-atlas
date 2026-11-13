# `gameplay_rally_stage_stageObserver`

*Fichier : `lua/ge/extensions/gameplay/rally/stage/stageObserver.lua` · VM : Game Engine (GE) · 350 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/stage/stageObserver")` (fichier sous extensions/ mais pas une extension classique)

Observateur de spéciale de rallye : à chaque mise à jour, il compare l'emprise (8 coins de la boîte englobante orientée, OOBB) du véhicule entre deux frames et détecte son passage à travers les « pathnodes » de timing (splits, arrivée). Il calcule le temps de franchissement interpolé dans la frame, renseigne les champs tracker* des données d'observation, marque les nœuds manqués (hors fenêtre ou hors route) et alimente stageTimingState. Utilisé par rallyManager. Le module renvoie un constructeur.

## Remarques

- Deux modes d'autorité : 'shadow' (par défaut, observation seule) et 'tracker' (toute autre valeur est ramenée à 'shadow').
- Fenêtres par défaut en mètres le long de la route : vérification 80 derrière / 120 devant, nœud considéré manqué à plus de 120 derrière.
- Un pathnode est franchi si un coin du véhicule traverse la sphère de rayon pathnodeRadius (sans normale) ou le plan défini par la normale (avec pathnodeHasNormal) pendant la frame.
- Si tracker.state vaut 'offRoute' au franchissement, le split est marqué manquant avec la raison 'offRoute' (sauf l'arrivée) ; si le nœud est dépassé sans être observé, la raison est 'missedWindow'.
- Le franchissement d'un nœud de type 'finish' termine l'étape (stageComplete, completeAt sur stageTimingState).
- setFootprintCorners utilise veh:getSpawnWorldOOBB() si disponible, sinon be:getObjectOOBB*XYZ ; il renvoie false tant que l'OOBB n'est pas initialisée.

## Classe `C`

Objet observateur renvoyé par le constructeur ; options facultatives : authorityMode, checkWindowBehindMeters, checkWindowAheadMeters, missWindowBehindMeters.

Le module renvoie un constructeur : `local obj = require("gameplay_rally_stage_stageObserver")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:getAuthorityMode()` | Renvoie le mode d'autorité courant. | 151 |
| `C:getStageTime()` | Temps de fin d'étape s'il est connu, sinon dernier temps d'étape échantillonné. | 325 |
| `C:getState()` | Instantané : authorityMode, stageComplete, stageFinishTime, currentStageTime, currentStageTimeRounded (au dixième), trackerState, raceActive, raceComplete. | 330 |
| `C:init(options)` | Initialise le mode d'autorité, les tailles de fenêtres et le stockage des coins, puis appelle reset. | 137 |
| `C:recordRaceSplit(splitData, time)` | Renseigne splitData.time et splitData.source ('race') s'ils sont absents. | 220 |
| `C:reset()` | Remet à zéro la distance précédente, l'index de départ d'observation, l'emprise précédente, l'état de fin d'étape, les dernières valeurs et le compteur updateSerial. | 155 |
| `C:resetAfterTeleport()` | Oublie la distance et l'emprise précédentes pour éviter un faux franchissement après une téléportation. | 173 |
| `C:resetFootprint()` | Oublie l'emprise précédente : la prochaine update ne fait que la mémoriser, sans détecter de franchissement. | 169 |
| `C:setAuthorityMode(mode)` | Définit le mode d'autorité : 'tracker' ou, pour toute autre valeur, 'shadow'. | 147 |
| `C:update(context)` | Met à jour l'observation pour la frame : lit le temps d'étape, récupère les coins du véhicule, avance la fenêtre d'observation, teste le franchissement des pathnodes proches et met à jour trackerObserved/trackerMissed, trackerTime, time et source, ainsi que stageTimingState. | 226 |

## Appels vers le moteur (C++)

- `be:` `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfAxisXYZ`, `getObjectOOBBIsInitialized`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/stage/stageObserver.lua`.*
