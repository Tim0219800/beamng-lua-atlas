# `gameplay_drag_poi`

*Fichier : `lua/ge/extensions/gameplay/drag/poi.lua` · VM : Game Engine (GE) · 221 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drag_poi` : `extensions.load("gameplay_drag_poi")`, puis la globale `gameplay_drag_poi`

Points d'intérêt (POI) des pistes de drag. Pour chaque couloir de chaque piste du niveau, crée un déclencheur invisible de 6 m de rayon posé sur la ligne de stage. Quand un véhicule y entre, le module arme la piste (core.setDragRaceData avec les règles utilisateur sauvegardées) et lance la course (core.startDragRaceActivity), ou ouvre le menu MP si le mode multijoueur est actif. Gère aussi l'entrée multiseat (plusieurs joueurs, un par couloir) et empêche de rejoindre immédiatement après une course tant que le véhicule reste à la ligne.

## Remarques

- Rayon de déclenchement : 6 m (JOIN_RADIUS_SQ = 36). En multiseat, seul le couloir le plus proche du véhicule le prend en charge.
- Dans le tutoriel carrière (career_modules_tutorial actif), le point de stage du POI est décalé de 10 m vers l'arrière de la ligne.
- Les POI ne sont générés que si core.isDragEnabled() est vrai (carrière active ou réglage enableDragRaceInFreeroam).
- Identifiant d'un POI : 'drag##<nom du fichier de piste>-<shortName du couloir ou laneN>'.
- En solo freeroam, si une course est finie et que le joueur revient dans le déclencheur, la course est remise à zéro (dragBridge.reset).
- Un seul appel startDragRaceActivity par couloir tant que la demande n'est pas effacée (poiJoinRequestSent).

**Dépendances (chargées avant) :** `gameplay_drag_rulesMenu`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drag_poi.applyUserRulesToData(data, stripId, levelId)` | Applique à data les règles sauvegardées par l'utilisateur pour la piste (dragType, importantTimerId, prefabs.christmasTree.treeType). | 55 |
| `gameplay_drag_poi.blockRejoinForStagedRacers()` | Marque les racers encore à moins de 6 m d'une ligne de stage : ils ne pourront pas relancer une course tant qu'ils ne sont pas sortis de tous les déclencheurs de stage. | 40 |
| `gameplay_drag_poi.clearRejoinBlocks()` | Efface la liste des véhicules interdits de relance. | 51 |
| `gameplay_drag_poi.createStagePoi(data, lane, laneIndex)` | Crée la définition d'un POI (id et markerInfo.invisibleTrigger multiseat avec onInside/onExit) pour un couloir. Renvoie nil avec un warning si le couloir n'a pas de point de stage. | 68 |
| `gameplay_drag_poi.onGetRawPoiListForLevel(levelIdentifier, elements)` | Hook (relayé par core) : ajoute à elements un POI par couloir de chaque piste de drag du niveau, si le drag est activé. *(interne)* *(hook)* | 205 |

### Détail des paramètres

#### `gameplay_drag_poi.applyUserRulesToData(data, stripId, levelId)`

Applique à data les règles sauvegardées par l'utilisateur pour la piste (dragType, importantTimerId, prefabs.christmasTree.treeType).

- `data` (*table*) : Données de piste, modifiées en place.
- `stripId` (*string|nil*) : Identifiant de piste.
- `levelId` (*string|nil*) : Identifiant de niveau.

#### `gameplay_drag_poi.createStagePoi(data, lane, laneIndex)`

Crée la définition d'un POI (id et markerInfo.invisibleTrigger multiseat avec onInside/onExit) pour un couloir. Renvoie nil avec un warning si le couloir n'a pas de point de stage.

- `data` (*table*) : Données de piste (strip, _fnWithoutExt...).
- `lane` (*table*) : Couloir (waypoints.stage, shortName).
- `laneIndex` (*integer*) : Indice du couloir.
- **renvoie** : table|nil POI {id, markerInfo} ou nil.

#### `gameplay_drag_poi.onGetRawPoiListForLevel(levelIdentifier, elements)`

Hook (relayé par core) : ajoute à elements un POI par couloir de chaque piste de drag du niveau, si le drag est activé.

- `levelIdentifier` (*string*) : Nom du niveau.
- `elements` (*table[]*) : Liste de POI complétée en place.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_drag_rulesMenu. |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drag/poi.lua`.*
