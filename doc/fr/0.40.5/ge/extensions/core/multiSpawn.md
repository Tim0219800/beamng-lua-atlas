# `core_multiSpawn`

*Fichier : `lua/ge/extensions/core/multiSpawn.lua` · VM : Game Engine (GE) · 887 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_multiSpawn` : `extensions.load("core_multiSpawn")`, puis la globale `core_multiSpawn`

Extension GE `core_multiSpawn` : génération et placement de groupes de véhicules. Elle peut construire un groupe aléatoire à partir des véhicules installés (avec poids de population, filtres, pays, année), le faire apparaître en formation (route devant/derrière, grille de course, trafic, lignes), ou téléporter des véhicules existants dans une nouvelle formation. L'apparition se fait via un job, un véhicule par frame, et un seul groupe à la fois (les suivants sont mis en file). Utilisée notamment par l'app trafic de l'interface et par du code de gameplay (onVehicleGroupSpawned est écouté par 5 modules).

## Exemple

```lua
-- 10 véhicules aléatoires (voitures et camions) devant le joueur
local group = core_multiSpawn.createGroup(10, {filters = {Type = {car = 1, truck = 0.4}}})
core_multiSpawn.spawnGroup(group, 10, {name = 'monGroupe', mode = 'roadAhead', gap = 20})
-- plus tard : supprimer ce groupe
core_multiSpawn.deleteVehicles(nil, 'monGroupe')
```

## Remarques

- Un groupe est un tableau d'entrées { model, config, paint, paint2, paint3, paintName, paintName2, paintName3, ... }. L'ancien format tableau { modèle, config, paint, paint2, paint3 } est aussi accepté par setVehicleSpawnData. Une config nil ou 'base' devient la config par défaut du modèle. paintName '(Random)' demande des peintures aléatoires.
- Modes de formation (options.mode) : roadAhead (défaut), roadBehind, roadAheadAlt, roadBehindAlt, traffic, raceGrid, raceGridAlt, lineLeft, lineRight, lineBehind, lineAhead, lineAbove ; 'road' est un alias de roadAhead. Un mode inconnu retombe sur lineAhead. Les modes route utilisent la carte de navigation (map) ; sans route trouvée la fonction de repli est lineAhead.
- Options de position : pos (vec3) et dir (vec3) ou rot (quat) ; sinon le véhicule joueur (OOBB, case 0 réservée au joueur : la numérotation commence à 1), sinon la caméra. gap = espacement en mètres (15 par défaut). startIndex décale le premier emplacement. func(funcData) permet une fonction de placement personnalisée renvoyant pos, dir. customTransforms = tableau {pos, rot} imposé (doit avoir au moins autant d'éléments que de véhicules).
- Le premier véhicule est toujours créé ; les suivants sont refusés (arrêt du groupe avec un avertissement) si canSpawnAnotherVehicle() est faux, sauf si options.canSpawnAnotherVehicleCheck == false.
- Chaque véhicule créé reçoit le champ dynamique 'vehicleGroup' = options.name (lu par deleteVehicles) et éventuellement 'spawnMeta'. Hook onVehicleGroupSpawned(vehIds, groupId, name) à la fin ; onVehicleGroupRespawned(vehIds) à la fin d'un placeGroup.
- Population : une config sans champ Population reçoit 10000 si le modèle ou la config est un mod, 0 si les deux sont officiels. Le poids d'un modèle/config est (popBase*popFactor)^popPower ; les modèles d'autres pays que `country` sont pénalisés (0.25/nombre de modèles du pays). Après chaque tirage, le poids est multiplié par popDecreaseFactor (0.05 par défaut) pour éviter les répétitions. modelPopPower/configPopPower <= 0 ou nil : tirage uniforme ; popPower plafonné à 2. Filtres : {Type = {car = 1, truck = 0.4, other = 0.1}} ; un champ absent du filtre donne facteur 0 sauf clé `other`. maxYear (<= 0 = année courante) exclut les configs plus récentes et pénalise les plus anciennes.
- Bug probable dans buildGroup : `if not modelPopPower then ... else modelIdx = getIndexRandomPop(...)` teste nil alors que le tri préalable teste aussi `<= 0`. Avec modelPopPower = 0, shuffledList est rempli mais ignoré, et l'on tire via getIndexRandomPop sur des poids calculés avec popPower = 1 (déduit du code).
- Bug probable dans spawnGroup : spawningBusy est mis à true avant l'appel de spawnProcessedGroup. Si celui-ci sort tôt (pas de MissionGroup, données vides), spawningBusy reste à true, et tous les groupes suivants restent indéfiniment dans la file.
- onSpawnCCallback : tant qu'un groupe est en cours d'apparition (spawningBusy), les véhicules reçoivent spawnWithEngineRunning = M.startEngines. Ce drapeau s'applique donc aussi à tout véhicule créé pendant ce temps par un autre code.
- setupVehicles est obsolète (log d'avertissement) : utiliser spawnGroup. teleportGroup est un alias de placeGroup.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_multiSpawn.createGroup(amount, params)` | Crée un groupe aléatoire de `amount` véhicules (10 par défaut) à partir des véhicules installés, selon les filtres et populations. | 291 |
| `core_multiSpawn.createSpawnPositions(amount, options)` | Calcule `amount` positions/rotations de formation selon options.mode (voir notes), en partant du joueur, de la caméra ou de options.pos. | 509 |
| `core_multiSpawn.deleteVehicles(amount, groupName)` | Supprime des véhicules créés via ce module (ceux qui ont le champ vehicleGroup), en partant de la fin de la liste, avec limite et nom de groupe facultatifs. Utilisée par l'app de trafic. | 847 |
| `core_multiSpawn.fitGroup(group, amount)` | Ajuste un groupe à `amount` éléments, en place : duplique les entrées en boucle s'il est trop petit, tronque s'il est trop grand. | 703 |
| `core_multiSpawn.getInstalledVehicleData(params)` | Parcourt les modèles et configs installés (core_vehicles) et construit la table de base servant à tirer un groupe : par modèle { model, country, popBase, popFactor, configData = [{ config, popBase, popFactor }] }, plus countryCounts. Par défaut seuls les contenus officiels sont pris (allMods = false). | 140 |
| `core_multiSpawn.onSpawnCCallback(id)` | Hook appelé à la création d'un véhicule côté C++ : pendant un spawn de groupe, demande au véhicule d'apparaître moteur tournant (selon startEngines). *(interne)* *(hook)* | 863 |
| `core_multiSpawn.placeGroup(vehIds, options)` | Téléporte des véhicules existants dans une nouvelle formation (un par intervalle de 0.02 s via un job, ou immédiatement si options.instant). Les positions sont corrigées par le décalage du nœud de référence sauf ignoreAdjust ; safeTeleport est utilisé sauf ignoreSafe. | 685 |
| `core_multiSpawn.setVehicleSpawnData(group, amount)` | Prépare les données d'apparition à partir d'un groupe : copie, ajuste à la taille demandée (fitGroup), complète la config par défaut, résout les peintures (y compris aléatoires). Un modèle introuvable est remplacé par le modèle 'pickup' par défaut (erreur loggée). | 727 |
| `core_multiSpawn.setupVehicles(amount, shuffle, spawnMode, spawnGap)` | Obsolète : crée un groupe aléatoire puis le fait apparaître. Utiliser spawnGroup. | 842 |
| `core_multiSpawn.spawnGroup(group, amount, options)` | Fait apparaître un groupe de véhicules en formation. Si un groupe est déjà en cours, la demande est mise en file. Groupe vide : en crée un par défaut ; amount <= 0 : ne fait rien. | 796 |
| `core_multiSpawn.spawnProcessedGroup(spawnData, spawnOptions)` | Étape basse niveau de spawnGroup : affecte positions et rotations aux données d'apparition déjà préparées par setVehicleSpawnData, les assainit (sanitizeVehicleSpawnOptions) et lance le job de création (un véhicule par frame). | 617 |
| `core_multiSpawn.spawnedVehsToGroup(ignorePlayer, ignoreTraffic)` | Convertit tous les véhicules actuellement dans la scène (getAllVehiclesByType) en groupe, avec exclusions facultatives. | 339 |
| `core_multiSpawn.teleportGroup(vehIds, options)` | Alias de placeGroup. | 685 |
| `core_multiSpawn.vehIdsToGroup(vehIds)` | Convertit des véhicules existants en entrées de groupe (modèle, config, peintures, les noms de peinture valent '(Custom)'). | 316 |

### Détail des paramètres

#### `core_multiSpawn.createGroup(amount, params)`

Crée un groupe aléatoire de `amount` véhicules (10 par défaut) à partir des véhicules installés, selon les filtres et populations.

- `amount` (*integer|nil*) : Taille du groupe (10 par défaut).
- `params` (*table|nil*) : { allMods, allConfigs, filters, country, modelPopPower, configPopPower, popDecreaseFactor, minPop, maxYear }.
- **renvoie** : table[] Entrées { model, config } ; {} si aucun véhicule ne correspond.

#### `core_multiSpawn.createSpawnPositions(amount, options)`

Calcule `amount` positions/rotations de formation selon options.mode (voir notes), en partant du joueur, de la caméra ou de options.pos.

- `amount` (*integer|nil*) : Nombre de positions (20 par défaut).
- `options` (*table|nil*) : { mode, gap, pos, dir, rot, startIndex, func }.
- **renvoie** : table[] Éléments { pos = vec3, rot = quat }.

#### `core_multiSpawn.deleteVehicles(amount, groupName)`

Supprime des véhicules créés via ce module (ceux qui ont le champ vehicleGroup), en partant de la fin de la liste, avec limite et nom de groupe facultatifs. Utilisée par l'app de trafic.

- `amount` (*integer|nil*) : Nombre max à supprimer ; nil = tous.
- `groupName` (*string|nil*) : Ne supprime que ce groupe ; nil = tout groupe.

#### `core_multiSpawn.fitGroup(group, amount)`

Ajuste un groupe à `amount` éléments, en place : duplique les entrées en boucle s'il est trop petit, tronque s'il est trop grand.

- `group` (*table[]*) : Groupe (modifié).
- `amount` (*integer|nil*) : Taille cible.
- **renvoie** : table[] Le même groupe.

#### `core_multiSpawn.getInstalledVehicleData(params)`

Parcourt les modèles et configs installés (core_vehicles) et construit la table de base servant à tirer un groupe : par modèle { model, country, popBase, popFactor, configData = [{ config, popBase, popFactor }] }, plus countryCounts. Par défaut seuls les contenus officiels sont pris (allMods = false).

- `params` (*table|nil*) : { allMods, allConfigs, filters, minPop, maxYear, country }. filters par défaut { Type = { car = 1, truck = 1 } }. Note : si params est fourni sans allConfigs, seule la config par défaut de chaque modèle est retenue.
- **renvoie** : table Liste de modèles avec champ countryCounts.

#### `core_multiSpawn.onSpawnCCallback(id)`

Hook appelé à la création d'un véhicule côté C++ : pendant un spawn de groupe, demande au véhicule d'apparaître moteur tournant (selon startEngines).

- `id` (*integer*) : Id du véhicule créé.

#### `core_multiSpawn.placeGroup(vehIds, options)`

Téléporte des véhicules existants dans une nouvelle formation (un par intervalle de 0.02 s via un job, ou immédiatement si options.instant). Les positions sont corrigées par le décalage du nœud de référence sauf ignoreAdjust ; safeTeleport est utilisé sauf ignoreSafe.

- `vehIds` (*integer[]*) : Ids des véhicules à placer.
- `options` (*table|nil*) : { mode, gap, pos, dir, rot, startIndex, func, customTransforms, instant, ignoreAdjust, ignoreSafe }.

#### `core_multiSpawn.setVehicleSpawnData(group, amount)`

Prépare les données d'apparition à partir d'un groupe : copie, ajuste à la taille demandée (fitGroup), complète la config par défaut, résout les peintures (y compris aléatoires). Un modèle introuvable est remplacé par le modèle 'pickup' par défaut (erreur loggée).

- `group` (*table[]*) : Groupe de véhicules.
- `amount` (*integer|nil*) : Taille voulue ; nil garde la taille du groupe.
- **renvoie** : table[]|nil Données d'apparition, nil si le groupe est vide.

#### `core_multiSpawn.setupVehicles(amount, shuffle, spawnMode, spawnGap)`

Obsolète : crée un groupe aléatoire puis le fait apparaître. Utiliser spawnGroup.

- `amount` (*integer*) : Nombre de véhicules.
- `shuffle` (*boolean|nil*) : Mélange l'ordre.
- `spawnMode` (*string|nil*) : Mode de formation.
- `spawnGap` (*number|nil*) : Espacement en mètres.
- **renvoie** : integer|nil Id du groupe.

#### `core_multiSpawn.spawnGroup(group, amount, options)`

Fait apparaître un groupe de véhicules en formation. Si un groupe est déjà en cours, la demande est mise en file. Groupe vide : en crée un par défaut ; amount <= 0 : ne fait rien.

- `group` (*table[]|nil*) : Groupe de véhicules.
- `amount` (*integer*) : Nombre de véhicules.
- `options` (*table|nil*) : { name ('custom'), mode ('roadAhead'), gap (15), shuffle, randomPaints, cling, ignoreAdjust, canSpawnAnotherVehicleCheck, pos, dir, rot, startIndex, func, customTransforms }.
- **renvoie** : integer|nil Identifiant unique du groupe (nil si en file, refusé, ou scène sans MissionGroup).

#### `core_multiSpawn.spawnProcessedGroup(spawnData, spawnOptions)`

Étape basse niveau de spawnGroup : affecte positions et rotations aux données d'apparition déjà préparées par setVehicleSpawnData, les assainit (sanitizeVehicleSpawnOptions) et lance le job de création (un véhicule par frame).

- `spawnData` (*table[]*) : Sortie de setVehicleSpawnData.
- `spawnOptions` (*table*) : Mêmes options que spawnGroup (name, mode, gap, cling, ...).
- **renvoie** : integer|nil Nouvel identifiant de groupe, nil si pas de MissionGroup ou données vides.

#### `core_multiSpawn.spawnedVehsToGroup(ignorePlayer, ignoreTraffic)`

Convertit tous les véhicules actuellement dans la scène (getAllVehiclesByType) en groupe, avec exclusions facultatives.

- `ignorePlayer` (*boolean|nil*) : Exclut le véhicule joueur 0.
- `ignoreTraffic` (*boolean|nil*) : Exclut les véhicules de trafic ou garés.
- **renvoie** : table[] Entrées de groupe.

#### `core_multiSpawn.teleportGroup(vehIds, options)`

Alias de placeGroup.

- `vehIds` (*integer[]*) : Ids des véhicules.
- `options` (*table|nil*) : Voir placeGroup.

#### `core_multiSpawn.vehIdsToGroup(vehIds)`

Convertit des véhicules existants en entrées de groupe (modèle, config, peintures, les noms de peinture valent '(Custom)').

- `vehIds` (*integer[]|nil*) : Ids de véhicules.
- **renvoie** : table[] Entrées de groupe.

## Champs

| Champ | Type | Description |
|---|---|---|
| `startEngines` | boolean | true par défaut : les véhicules d'un groupe apparaissent moteur démarré (via onSpawnCCallback). |
| `useFullData` | boolean | false par défaut. Si vrai, createGroup ajoute modelPop et configPop dans chaque entrée du groupe. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onVehicleGroupRespawned`
- `onVehicleGroupSpawned` — écouté par 5 module(s)

## Appels vers le moteur (C++)

- `be:` `getObjectOOBBCenterXYZ`, `getPlayerVehicleID`, `getSurfaceHeightBelow`
- `obj:` `getInitialNodePosition`, `getRefNodeId`, `setPosRot`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/multiSpawn.lua`.*
