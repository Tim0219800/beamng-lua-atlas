# `spawn`

*Fichier : `lua/ge/spawn.lua` · VM : Game Engine (GE) · 1155 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `spawn`

Création et placement de véhicules côté Game Engine. Il crée un objet BeamNGVehicle (spawnVehicle), choisit un point d'apparition (pickSpawnPoint), et surtout place ou téléporte un véhicule sans collision (safeTeleport, safeReset) : le module construit la boîte orientée du véhicule, la pose au sol par raycast, puis la décale en spirale jusqu'à trouver une place libre (autres véhicules, statiques, trafic). Il gère aussi la téléportation vers la dernière route (récupération) et le placement d'une remorque sur un attelage.

## Exemple

```lua
-- téléporter le véhicule joueur à une position en évitant les collisions
local veh = getPlayerVehicle(0)
spawn.safeTeleport(veh, vec3(100, 200, 50), quatFromDir(vec3(0,1,0), vec3(0,0,1)))
-- remettre un véhicule à sa position d'origine
spawn.safeReset(veh)
```

## Remarques

- Convention de rotation : spawnVehicle/setVehicleObject et safeTeleport multiplient la rotation par quat(0,0,1,0) (180 degrés autour de z) car les véhicules BeamNG pointent vers -y. Passer la rotation « visuelle » (avant = direction du véhicule) ; safeReset compense avec le même quat. Le code note lui-même 'the order might still be wrong in some places'.
- safeTeleport ne renvoie rien (pas de booléen) : le résultat n'est lisible que via takeLastSafeTeleportPose(vid), qui contient la pose réellement appliquée. En cas d'échec la pose reste nil.
- L'état de placement est global au module (visibilityPoint, checkOnlyStatics, removeTraffic, caches de boîtes) : les options passées à safeTeleport/spawnVehicle sont gardées jusqu'à la fin du placement puis réinitialisées (removeTraffic repasse à true).
- Les véhicules positionnés pendant la frame courante sont mémorisés dans un cache (vehiclesPositionedThisFrame) pour que les suivants évitent leur nouvelle boîte ; clearCache() le vide, appelé par le moteur à la frame suivante.
- Si aucune place libre n'est trouvée avec safeSpawn actif, spawnVehicle supprime le véhicule (veh:delete()) et affiche un toast 'ui.spawn.noPositionFound' ; passer options.removeWhenNoPositionFound = false pour le garder à sa position initiale.
- Bug probable dans spawnVehicle : le test 'if not datablock' utilise une variable en minuscules jamais définie (la variable s'appelle dataBlock) ; la condition est donc toujours vraie, le datablock 'default_vehicle' est toujours affecté et la branche d'erreur 'Failed to find dataBlock' est inatteignable.
- Bug probable dans pickSpawnPoint : setSpawnpoint.loadDefaultSpawnpoint() renvoie '' (chaîne vide, vraie en Lua) quand il n'y a pas de point par défaut ; 'if defaultSpawnPoint' est donc toujours vrai, scenetree.findObject('') est tenté et un avertissement 'No SpawnPointName in mission file' est loggé à chaque appel avant de passer aux groupes de spawn.
- teleportToLastRoadCallback : le repli final suppose que findClosestRoad a trouvé une arête ; si le graphe est vide la fonction est déjà sortie plus haut, mais si dist < 50 avec n1Id nil l'accès à n1.pos planterait (cas improbable car dist est alors grande).
- spawnPlayer : l'ancien chemin (spawnPlayerOld, variable $beamngVehicle) est conservé pour compatibilité et logue un avertissement ; le chemin normal est core_levels.maybeSpawnDefaultVehicle().
- spawnTrailerBehindVehicle est local au fichier (non exporté) bien qu'utile.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `spawn.calculateRelativeVehiclePlacement(transform0, coupler0_offset, coupler1_offset, rotOffset)` | Calcule la matrice monde d'un second véhicule pour que son attelage coïncide avec celui du premier : transform0 x décalage coupler0 x rotOffset x inverse(décalage coupler1). | 1058 |
| `spawn.clearCache()` | Vide le cache des véhicules placés pendant la frame courante, s'il y en a. Appelée par le moteur pour que le cache ne dure qu'une frame. *(interne)* | 33 |
| `spawn.pickSpawnPoint(spawnName)` | Cherche un point d'apparition valide : d'abord le point par défaut du niveau (setSpawnpoint), puis un objet pris au hasard dans les groupes CameraSpawnPoints, PlayerSpawnPoints, PlayerDropPoints, puis DefaultPlayerSpawnSphere (mods anciens), sinon crée une SpawnSphere par défaut dans MissionCleanup. Voir notes sur le test du point par défaut. | 880 |
| `spawn.placeTrailer(vehId, couplerOffsetVeh, trailerId, couplerOffsetTrailer, couplerTag, rotOffset)` | Positionne une remorque sur le véhicule tracteur en faisant coïncider les attelages, la remet à zéro (requestReset(RESET_PHYSICS), resetBrokenFlexMesh) et active l'attelage automatique si l'option du tag est 'autoCouple'. Si les deux attelages sont du même côté (avant/avant ou arrière/arrière), la remorque est retournée de 180 degrés. | 1088 |
| `spawn.safeReset(veh, checkOnlyStatics_, visibilityPoint_, removeTraffic_)` | Remplacement conseillé de be:resetVehicle(0) : téléporte le véhicule à sa position et rotation d'origine (veh:getOriginalPosition/Rotation) en cherchant une place libre, avec réinitialisation du véhicule. | 696 |
| `spawn.safeTeleport(veh, pos, rot, checkOnlyStatics_, visibilityPoint_, removeTraffic_, centeredPosition, resetVehicle, player, unlimitedSafeSpawnRange)` | Téléporte un véhicule en évitant les collisions : (si resetVehicle) le place à pos/rot et le répare du maillage souple, puis cherche la place libre la plus proche (pose au sol par raycast, spirale de décalages). Applique la pose finale au groupe de noeuds, remet la vitesse à zéro et mémorise la pose finale. | 659 |
| `spawn.setVehicleObject(veh, options)` | Configure puis fait apparaître un objet BeamNGVehicle déjà créé : modèle, config de pièces, peintures (3 palettes), position/rotation (avec rotation de 180 degrés), l'ajoute à MissionGroup et au groupe SpawnedVehicles (canSave = false), puis cherche une place libre sauf si options.safeSpawn == false. | 575 |
| `spawn.spawnCamera()` | Crée (si besoin) la caméra de jeu 'gameCamera' (datablock Observer), l'ajoute à MissionCleanup et la fixe comme caméra de la vue 'main'. *(interne)* | 946 |
| `spawn.spawnPlayer()` | Fait apparaître le véhicule joueur au chargement du niveau : via core_levels.maybeSpawnDefaultVehicle(), ou via l'ancien code (variable $beamngVehicle) avec avertissement. Si preventPlayerSpawning est vrai, ne fait rien une fois. *(interne)* | 1037 |
| `spawn.spawnVehicle(model, partConfig, pos, rot, options)` | Crée un objet BeamNGVehicle, lui donne un nom unique (options.vehicleName ou 'clone', 'clone0'…), applique les options (autoEnterVehicle, autoEnterVehiclePlayer) puis délègue à setVehicleObject. Le véhicule apparaît tourné de 180 degrés autour de z. | 821 |
| `spawn.takeLastSafeTeleportPose(vid)` | Renvoie et efface la dernière pose appliquée par safeTeleport pour ce véhicule (utilisé par la capture du multijoueur). | 690 |
| `spawn.teleportToLastRoad(veh, options)` | Récupération : téléporte le véhicule sur la dernière position de route connue. Demande les points de récupération (recovery.recoveryPoints) à la VM véhicule, puis le callback teleportToLastRoadCallback place le véhicule sur la route côté légal. Le multijoueur peut intercepter l'appel. | 810 |
| `spawn.teleportToLastRoadCallback(data, options, vehId)` | Callback de teleportToLastRoad, exécuté côté GE avec les points de récupération du véhicule. Parcourt les points du plus récent au plus ancien, retient le premier proche d'une route (distance <= rayon moyen), le projette sur l'arête, choisit le côté légal (règles map.getRoadRules) et la direction, puis appelle safeTeleport. Sans point valide, cherche la route la plus proche (< 50 m), sinon garde la position actuelle. *(interne)* | 701 |

### Détail des paramètres

#### `spawn.calculateRelativeVehiclePlacement(transform0, coupler0_offset, coupler1_offset, rotOffset)`

Calcule la matrice monde d'un second véhicule pour que son attelage coïncide avec celui du premier : transform0 x décalage coupler0 x rotOffset x inverse(décalage coupler1).

- `transform0` (*MatrixF*) : Matrice monde du premier véhicule (par ex. veh:getRefNodeMatrix()).
- `coupler0_offset` (*vec3*) : Position de l'attelage sur le premier véhicule, par rapport à son noeud de référence.
- `coupler1_offset` (*vec3*) : Position de l'attelage sur le second véhicule, par rapport à son noeud de référence.
- `rotOffset` (*MatrixF|nil*) : Rotation supplémentaire appliquée entre les deux attelages.
- **renvoie** : MatrixF Matrice de placement du second véhicule.

#### `spawn.pickSpawnPoint(spawnName)`

Cherche un point d'apparition valide : d'abord le point par défaut du niveau (setSpawnpoint), puis un objet pris au hasard dans les groupes CameraSpawnPoints, PlayerSpawnPoints, PlayerDropPoints, puis DefaultPlayerSpawnSphere (mods anciens), sinon crée une SpawnSphere par défaut dans MissionCleanup. Voir notes sur le test du point par défaut.

- `spawnName` (*string*) : 'player' ou 'camera' : type de SpawnSphere à créer si rien n'est trouvé.
- **renvoie** : table|nil Objet de scène du point d'apparition (SpawnSphere, marqueur…), nil en cas d'erreur.

#### `spawn.placeTrailer(vehId, couplerOffsetVeh, trailerId, couplerOffsetTrailer, couplerTag, rotOffset)`

Positionne une remorque sur le véhicule tracteur en faisant coïncider les attelages, la remet à zéro (requestReset(RESET_PHYSICS), resetBrokenFlexMesh) et active l'attelage automatique si l'option du tag est 'autoCouple'. Si les deux attelages sont du même côté (avant/avant ou arrière/arrière), la remorque est retournée de 180 degrés.

- `vehId` (*integer*) : Id du véhicule tracteur.
- `couplerOffsetVeh` (*vec3*) : Position de l'attelage du tracteur par rapport à son noeud de référence.
- `trailerId` (*integer*) : Id de la remorque.
- `couplerOffsetTrailer` (*vec3*) : Position de l'attelage de la remorque.
- `couplerTag` (*string*) : Tag de l'attelage ; consulté dans core_vehicles.couplerTagsOptions pour l'attelage automatique.
- `rotOffset` (*MatrixF|nil*) : Rotation supplémentaire à appliquer.

#### `spawn.safeReset(veh, checkOnlyStatics_, visibilityPoint_, removeTraffic_)`

Remplacement conseillé de be:resetVehicle(0) : téléporte le véhicule à sa position et rotation d'origine (veh:getOriginalPosition/Rotation) en cherchant une place libre, avec réinitialisation du véhicule.

- `veh` (*table*) : Objet véhicule.
- `checkOnlyStatics_` (*boolean|nil*) : Ne tester que les objets statiques.
- `visibilityPoint_` (*vec3|nil*) : Point d'où la place trouvée ne doit pas être visible.
- `removeTraffic_` (*boolean|nil*) : Écarter le trafic de la zone.

#### `spawn.safeTeleport(veh, pos, rot, checkOnlyStatics_, visibilityPoint_, removeTraffic_, centeredPosition, resetVehicle, player, unlimitedSafeSpawnRange)`

Téléporte un véhicule en évitant les collisions : (si resetVehicle) le place à pos/rot et le répare du maillage souple, puis cherche la place libre la plus proche (pose au sol par raycast, spirale de décalages). Applique la pose finale au groupe de noeuds, remet la vitesse à zéro et mémorise la pose finale.

- `veh` (*table*) : Objet véhicule (BeamNGVehicle).
- `pos` (*vec3*) : Position souhaitée (noeud de référence, ou centre de la boîte si centeredPosition).
- `rot` (*quat|nil*) : Rotation souhaitée (quat(0,0,0,-1) par défaut), multipliée en interne par une rotation de 180 degrés autour de z.
- `checkOnlyStatics_` (*boolean|nil*) : Si vrai, ne teste que les statiques (et ne déplace pas le trafic).
- `visibilityPoint_` (*vec3|nil*) : Position de la caméra : la place trouvée doit être hors de sa vue si possible.
- `removeTraffic_` (*boolean|nil*) : Écarter les véhicules de trafic (gameplay_traffic) de la zone. Conserve la valeur précédente si nil (true au départ).
- `centeredPosition` (*boolean|nil*) : true si pos désigne le centre de la boîte du véhicule.
- `resetVehicle` (*boolean|nil*) : true par défaut : utilise les positions initiales des noeuds (véhicule réparé). false : déplace le véhicule tel qu'il est (boîte du groupe de noeuds principal).
- `player` (*any*) : Transmis à setSafePosition (déduit du code : non utilisé dans les fonctions de placement lues).
- `unlimitedSafeSpawnRange` (*boolean|nil*) : Supprime la limite de distance de recherche d'une place.

#### `spawn.setVehicleObject(veh, options)`

Configure puis fait apparaître un objet BeamNGVehicle déjà créé : modèle, config de pièces, peintures (3 palettes), position/rotation (avec rotation de 180 degrés), l'ajoute à MissionGroup et au groupe SpawnedVehicles (canSave = false), puis cherche une place libre sauf si options.safeSpawn == false.

- `veh` (*table*) : Objet créé par createObject('BeamNGVehicle').
- `options` (*table*) : model (string), config (string ou table), paint/paint2/paint3 ({baseColor = {r,g,b,a}, ...}), pos (vec3), rot (quat), centeredPosition, safeSpawn (true par défaut), unlimitedSafeSpawnRange, removeWhenNoPositionFound (true par défaut).
- **renvoie** : boolean|nil true si le véhicule est placé ; nil si veh manque, si MissionGroup n'existe pas, ou si aucune place n'est trouvée (véhicule supprimé).

#### `spawn.spawnVehicle(model, partConfig, pos, rot, options)`

Crée un objet BeamNGVehicle, lui donne un nom unique (options.vehicleName ou 'clone', 'clone0'…), applique les options (autoEnterVehicle, autoEnterVehiclePlayer) puis délègue à setVehicleObject. Le véhicule apparaît tourné de 180 degrés autour de z.

- `model` (*string*) : Nom du modèle JBeam (ex. 'pickup').
- `partConfig` (*string|table*) : Chemin du fichier .pc ou table de config de pièces.
- `pos` (*vec3*) : Position.
- `rot` (*quat*) : Rotation.
- `options` (*table|nil*) : vehicleName, autoEnterVehicle (true par défaut), autoEnterVehiclePlayer, visibilityPoint, removeTraffic, paint/paint2/paint3, centeredPosition, safeSpawn, unlimitedSafeSpawnRange, removeWhenNoPositionFound. La table est modifiée (vehicleName, model, config, pos, rot, cling y sont écrits).
- **renvoie** : table|nil Objet véhicule, ou nil si la création ou le placement échoue.

#### `spawn.takeLastSafeTeleportPose(vid)`

Renvoie et efface la dernière pose appliquée par safeTeleport pour ce véhicule (utilisé par la capture du multijoueur).

- `vid` (*integer*) : Id du véhicule.
- **renvoie** : table|nil {x, y, z, rx, ry, rz, rw} (noeud de référence et quaternion), ou nil si aucune pose.

#### `spawn.teleportToLastRoad(veh, options)`

Récupération : téléporte le véhicule sur la dernière position de route connue. Demande les points de récupération (recovery.recoveryPoints) à la VM véhicule, puis le callback teleportToLastRoadCallback place le véhicule sur la route côté légal. Le multijoueur peut intercepter l'appel.

- `veh` (*table|nil*) : Véhicule (joueur 0 par défaut).
- `options` (*table|nil*) : destinationPos (vec3 : oriente le véhicule vers cette destination), resetVehicle (boolean), unlimitedSafeSpawnRange (boolean).

#### `spawn.teleportToLastRoadCallback(data, options, vehId)`

Callback de teleportToLastRoad, exécuté côté GE avec les points de récupération du véhicule. Parcourt les points du plus récent au plus ancien, retient le premier proche d'une route (distance <= rayon moyen), le projette sur l'arête, choisit le côté légal (règles map.getRoadRules) et la direction, puis appelle safeTeleport. Sans point valide, cherche la route la plus proche (< 50 m), sinon garde la position actuelle.

- `data` (*table|nil*) : File de points de récupération {head, tail, [i] = {pos = vec3, ...}}.
- `options` (*table*) : Mêmes options que teleportToLastRoad.
- `vehId` (*integer|nil*) : Id du véhicule (joueur 0 par défaut).

**Évènements UI (guihooks.trigger) :** `toastrMsg`

## Appels vers le moteur (C++)

- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/spawn.lua`.*
