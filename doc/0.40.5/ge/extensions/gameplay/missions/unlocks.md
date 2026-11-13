# `gameplay_missions_unlocks`

*Fichier : `lua/ge/extensions/gameplay/missions/unlocks.lua` · VM : Game Engine (GE) · 485 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_missions_unlocks` : `extensions.load("gameplay_missions_unlocks")`, puis la globale `gameplay_missions_unlocks`

Extension GE qui évalue les conditions de déblocage et de visibilité des missions (champs startCondition et visibleCondition). Au chargement, elle charge tous les types de condition du dossier gameplay/missions/unlocks/conditions/. Elle construit aussi des caches : mission précédentes (backward), missions suivantes (forward), profondeur dans l'arbre et niveau de branche de carrière requis. Un moddeur s'en sert pour savoir si une mission est démarrable/visible ou pour forcer ces états.

## Exemple

```lua
local m = gameplay_missions_missions.getMissionById('west_coast_usa/timeTrials/xyz')
if gameplay_missions_unlocks.isMissionStartable(m) then ... end
gameplay_missions_unlocks.overrideStartable(m, true)
```

## Remarques

- M.startConditionMet est exportée mais référence une variable locale inexistante : elle vaut toujours nil (bug du jeu).
- Hors carrière, une mission affichée à la fois en carrière et en freeroam est toujours démarrable et visible (computeStartableDetails renvoie nil).
- Les résultats sont mis en cache par id de mission : appeler clearUnlockStatusCache() après un changement de progression.
- Un visibleCondition de type 'automatic' rend la mission visible si au moins une mission précédente est démarrable (ou s'il n'y en a aucune).
- getBranchLevelForCondition appelle M.getBranchLevelForCondition pour la récursion (pas la locale) : pas de conséquence tant que M n'est pas remplacé.
- Les overrides (overrideStartable / overrideVisible) priment sur le calcul et ne sont jamais effacés par clearCache.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_missions_unlocks.clearCache()` | Vide le cache d'état ainsi que les caches backward et forward. | 478 |
| `gameplay_missions_unlocks.clearUnlockStatusCache()` | Vide le cache d'état démarrable/visible (et celui des ligues de carrière si présent). | 471 |
| `gameplay_missions_unlocks.conditionMet(condition)` | Évalue récursivement une condition. Cherche le type dans les types chargés (retombe sur 'missing' si inconnu), appelle sa conditionMet et son getLabel. | 16 |
| `gameplay_missions_unlocks.constructUnlocksField(mission)` | Assemble le champ unlocks d'une mission. | 399 |
| `gameplay_missions_unlocks.depthIdSort(a, b)` | Comparateur pour table.sort sur des missions : par profondeur croissante puis par id. | 450 |
| `gameplay_missions_unlocks.depthIdSortUsingIds(aId, bId)` | Comme depthIdSort mais à partir d'ids de missions. Renvoie false si l'une des missions n'existe pas. | 459 |
| `gameplay_missions_unlocks.getBackwardMissionIds(mission)` | Ids des missions requises par la startCondition de cette mission (mis en cache). | 363 |
| `gameplay_missions_unlocks.getBranchLevelForCondition(cond, list)` | Collecte récursivement les niveaux de branche de carrière exigés (conditions branchLevel, et league via la branche de la ligue, niveau 1). | 112 |
| `gameplay_missions_unlocks.getForwardMissionInfo(mission)` | Informations vers l'avant : missions débloquées, niveau de branche max, étiquettes de branche et profondeur. Reconstruit le cache complet si besoin (charge toutes les missions). | 374 |
| `gameplay_missions_unlocks.getMissionBasedUnlockDiff(mission, diff)` | Pour une mission, liste les missions directement débloquées par elle (forwardIds), avec leur état démarrable et si elles ont changé dans diff. | 82 |
| `gameplay_missions_unlocks.getMissionsForCondition(cond, list)` | Collecte récursivement les ids de missions référencés par les conditions missionPassed et missionCompleted. | 98 |
| `gameplay_missions_unlocks.getSimpleUnlockedStatus()` | Construit une table plate (id de mission -> copie profonde de constructUnlocksField) pour comparer l'état de déblocage avant/après une action. | 33 |
| `gameplay_missions_unlocks.getStartableDetails(mission)` | Détails (mis en cache) de l'évaluation de startCondition. Renvoie nil pour une mission présente en carrière et en freeroam quand la carrière n'est pas active. | 277 |
| `gameplay_missions_unlocks.getUnlockDiff(before, after)` | Compare deux résultats de getSimpleUnlockedStatus sur les clés startable et visible. | 58 |
| `gameplay_missions_unlocks.isMissionStartable(mission)` | Indique si la mission est démarrable. Un override posé par overrideStartable prime, sinon le résultat de startCondition est utilisé. | 296 |
| `gameplay_missions_unlocks.isMissionVisible(mission)` | Indique si la mission est visible (selon le mode carrière/freeroam et visibleCondition). Un override posé par overrideVisible prime. Résultat mis en cache. | 346 |
| `gameplay_missions_unlocks.onExtensionLoaded()` | Hook appelé au chargement de l'extension : charge tous les fichiers de /lua/ge/extensions/gameplay/missions/unlocks/conditions et enregistre chaque type de condition. *(interne)* *(hook)* | 435 |
| `gameplay_missions_unlocks.overrideStartable(mission, value)` | Force l'état démarrable d'une mission (nil pour retirer l'override). | 391 |
| `gameplay_missions_unlocks.overrideVisible(mission, value)` | Force la visibilité d'une mission (nil pour retirer l'override). | 395 |

### Détail des paramètres

#### `gameplay_missions_unlocks.conditionMet(condition)`

Évalue récursivement une condition. Cherche le type dans les types chargés (retombe sur 'missing' si inconnu), appelle sa conditionMet et son getLabel.

- `condition` (*table*) : Condition avec un champ type (ex. missionPassed, branchLevel, multiAnd) et ses paramètres.
- **renvoie** : table {met = boolean, condition = table, nested = table|nil (résultats des sous-conditions), label = string|table, hidden = boolean|nil}

#### `gameplay_missions_unlocks.constructUnlocksField(mission)`

Assemble le champ unlocks d'une mission.

- `mission` (*table*) : Mission.
- **renvoie** : table {startable, visible, startableDetails, backward, forward, maxBranchLevel, branchTags, depth}

#### `gameplay_missions_unlocks.depthIdSort(a, b)`

Comparateur pour table.sort sur des missions : par profondeur croissante puis par id.

- `a` (*table*) : Mission.
- `b` (*table*) : Mission.
- **renvoie** : boolean true si a doit précéder b.

#### `gameplay_missions_unlocks.depthIdSortUsingIds(aId, bId)`

Comme depthIdSort mais à partir d'ids de missions. Renvoie false si l'une des missions n'existe pas.

- `aId` (*string*) : Id de mission.
- `bId` (*string*) : Id de mission.
- **renvoie** : boolean true si a doit précéder b.

#### `gameplay_missions_unlocks.getBackwardMissionIds(mission)`

Ids des missions requises par la startCondition de cette mission (mis en cache).

- `mission` (*table*) : Mission.
- **renvoie** : string[] Liste d'ids.

#### `gameplay_missions_unlocks.getBranchLevelForCondition(cond, list)`

Collecte récursivement les niveaux de branche de carrière exigés (conditions branchLevel, et league via la branche de la ligue, niveau 1).

- `cond` (*table*) : Condition à parcourir.
- `list` (*table<string, integer>*) : Table branchId -> niveau, remplie en place.

#### `gameplay_missions_unlocks.getForwardMissionInfo(mission)`

Informations vers l'avant : missions débloquées, niveau de branche max, étiquettes de branche et profondeur. Reconstruit le cache complet si besoin (charge toutes les missions).

- `mission` (*table*) : Mission.
- **renvoie** : table {forwardIds = string[], maxBranchLevel = integer, branchTags = table<string, boolean>, depth = integer}

#### `gameplay_missions_unlocks.getMissionBasedUnlockDiff(mission, diff)`

Pour une mission, liste les missions directement débloquées par elle (forwardIds), avec leur état démarrable et si elles ont changé dans diff.

- `mission` (*table*) : Mission source.
- `diff` (*table*) : Résultat de getUnlockDiff (utilise diff.byId).
- **renvoie** : table {list = {{missionId, changed, startable}}}

#### `gameplay_missions_unlocks.getMissionsForCondition(cond, list)`

Collecte récursivement les ids de missions référencés par les conditions missionPassed et missionCompleted.

- `cond` (*table*) : Condition (parcourt cond.nested).
- `list` (*string[]*) : Liste remplie en place.

#### `gameplay_missions_unlocks.getSimpleUnlockedStatus()`

Construit une table plate (id de mission -> copie profonde de constructUnlocksField) pour comparer l'état de déblocage avant/après une action.

- **renvoie** : table<string, table> Données de déblocage par id de mission.

#### `gameplay_missions_unlocks.getStartableDetails(mission)`

Détails (mis en cache) de l'évaluation de startCondition. Renvoie nil pour une mission présente en carrière et en freeroam quand la carrière n'est pas active.

- `mission` (*table*) : Mission.
- **renvoie** : table|nil Résultat de conditionMet (met, label, nested…).

#### `gameplay_missions_unlocks.getUnlockDiff(before, after)`

Compare deux résultats de getSimpleUnlockedStatus sur les clés startable et visible.

- `before` (*table*) : État avant.
- `after` (*table*) : État après.
- **renvoie** : table {list = {{missionId, change = {{key, old, new}}}}, byId = table, missionsList = {{name, id}} (missions devenues démarrables)}

#### `gameplay_missions_unlocks.isMissionStartable(mission)`

Indique si la mission est démarrable. Un override posé par overrideStartable prime, sinon le résultat de startCondition est utilisé.

- `mission` (*table*) : Mission.
- **renvoie** : boolean true si démarrable.

#### `gameplay_missions_unlocks.isMissionVisible(mission)`

Indique si la mission est visible (selon le mode carrière/freeroam et visibleCondition). Un override posé par overrideVisible prime. Résultat mis en cache.

- `mission` (*table*) : Mission.
- **renvoie** : boolean true si visible.

#### `gameplay_missions_unlocks.overrideStartable(mission, value)`

Force l'état démarrable d'une mission (nil pour retirer l'override).

- `mission` (*table*) : Mission.
- `value` (*boolean|nil*) : Valeur forcée.

#### `gameplay_missions_unlocks.overrideVisible(mission, value)`

Force la visibilité d'une mission (nil pour retirer l'override).

- `mission` (*table*) : Mission.
- `value` (*boolean|nil*) : Valeur forcée.

## Champs

| Champ | Type | Description |
|---|---|---|
| `startConditionMet` | nil | Exporté depuis une variable non définie : vaut toujours nil. ⚠ référence `startConditionMet` non définie dans le fichier (vaut probablement nil) |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/missions/unlocks.lua`.*
