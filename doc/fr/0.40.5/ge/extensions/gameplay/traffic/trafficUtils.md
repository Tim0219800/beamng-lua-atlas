# `gameplay_traffic_trafficUtils`

*Fichier : `lua/ge/extensions/gameplay/traffic/trafficUtils.lua` · VM : Game Engine (GE) · 741 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_traffic_trafficUtils` : `extensions.load("gameplay_traffic_trafficUtils")`, puis la globale `gameplay_traffic_trafficUtils`

Boîte à outils du système de trafic : création de groupes de véhicules de trafic ou de police (via core_multiSpawn), chargement de fichiers *.vehGroup.json, recherche de points d'apparition (spawn) sur une route, une ligne ou un cercle autour d'une position, placement des véhicules IA de trafic et recherche du véhicule de trafic le plus proche. Un moddeur s'en sert pour faire apparaître du trafic de façon réaliste à partir d'une position et d'une direction (par défaut celles de la caméra).

## Exemple

```lua
local data, valid = gameplay_traffic_trafficUtils.findSafeSpawnPoint(pos, dir, 80, 400, 200)
if valid then --[[ data.pos, data.dir, data.n1, data.n2 ]] end
```

## Remarques

- baseValues : minDrivability 0,5 ; minRadius 1,2 m ; lowDamage 1000 ; highDamage 30000 ; lowSpeed 2,5 m/s.
- findSpawnPoint est un alias de findSpawnPointOnRoute ; findSafeSpawnPoint correspond à la fonction interne findSpawnPointActual.
- Les fonctions findSpawnPoint* renvoient (spawnData, valid) où spawnData = {pos, dir, n1?, n2?} ; n1 et n2 sont absents si valid est false.
- Les arguments de recherche sont tous facultatifs : startPos/startDir = caméra, minDist = 20 m, maxDist = 2000 m, targetDist = 0 (distance idéale jusqu'à laquelle on teste la visibilité par raycast).
- getTrafficGroupFromFile : cherche d'abord les *.vehGroup.json du dossier du niveau, sinon dans /vehicleGroups/ ; choisit un fichier au hasard.
- Dans createTrafficGroup, les paramètres allMods, allConfigs et simpleVehs sont écrasés au début de la fonction (valeurs des réglages trafficAllowMods et trafficSimpleVehicles, allConfigs forcé à true) : les arguments passés sont ignorés.
- Dans getBaseGroupParams, maxYear/minPop et country dépendent du niveau ; seuls USA, Allemagne, Italie, France, Japon sont reconnus (sinon 'default').
- getAheadPos renvoie un vecteur mis en cache : le copier si on doit le conserver.
- findSafeSpawnPoint ne renvoie jamais nil : en dernier recours il téléporte loin (10 000 à 12 000 m) avec pos.z = 1 ; son second retour valid peut alors rester false.
- Les fonctions checkRoad, checkRayCast, checkUsability, checkVehicles et getDefaultSpawnParams sont locales et non exportées.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_traffic_trafficUtils.checkSpawnPoint(pos, origPos, minDist, maxDist, minVehDist, n1, n2)` | Vérifie qu'un point est utilisable : entre minDist et maxDist de l'origine, hors des carrefours, et sans conflit avec les autres véhicules actifs. | 293 |
| `gameplay_traffic_trafficUtils.createPoliceGroup(amount, allMods)` | Crée un groupe de véhicules de police (configs de type 'police'), favorisant le pays du niveau, selon le réglage trafficAllowMods. | 85 |
| `gameplay_traffic_trafficUtils.createTrafficGroup(amount, allMods, allConfigs, simpleVehs)` | Crée un groupe de véhicules de trafic selon les réglages du joueur (trafficSimpleVehicles, trafficAllowMods, trafficSmartSelections) : sans véhicules de police, ou uniquement des véhicules 'proptraffic' en mode simple. | 58 |
| `gameplay_traffic_trafficUtils.finalizeSpawnPoint(pos, dir, mapNode1, mapNode2, options)` | Cale un point sur une voie de la route (position et direction), en tenant compte du sens de circulation (conduite à droite ou à gauche), des sens uniques et du nombre de voies estimé. Si aucune route n'est trouvée à moins de 30 m, renvoie les valeurs d'entrée. | 297 |
| `gameplay_traffic_trafficUtils.findSafeSpawnPoint(startPos, startDir, minDist, maxDist, targetDist, options)` | Renvoie toujours un point d'apparition (téléportation forcée). Essaie d'abord la route devant, puis une recherche radiale proche (200-1000 m), une recherche large moins stricte (200-2000 m, drivability 0,5) et enfin très loin (10 000-12 000 m, z = 1). | 648 |
| `gameplay_traffic_trafficUtils.findSpawnPoint(startPos, startDir, minDist, maxDist, targetDist, options)` | Alias de findSpawnPointOnRoute (même fonction, mêmes paramètres et retours). | 519 |
| `gameplay_traffic_trafficUtils.findSpawnPointOnLine(startPos, startDir, minDist, maxDist, targetDist, options)` | Cherche un point d'apparition le long d'une droite partant de l'origine dans la direction startDir, par pas de options.gap (50 m par défaut). | 452 |
| `gameplay_traffic_trafficUtils.findSpawnPointOnRoute(startPos, startDir, minDist, maxDist, targetDist, options)` | Génère un chemin sur la route devant l'origine (aléatoire avec ramifications, ou options.route) et teste des points de ce chemin entre minDist et maxDist. Les pas peuvent être modulés par la limite de vitesse du tronçon (gapVehCoef, gapSpeedCoef, bornés à 20-50 m). Exportée aussi sous le nom findSpawnPoint. | 519 |
| `gameplay_traffic_trafficUtils.findSpawnPointRadial(startPos, startDir, minDist, maxDist, targetDist, options)` | Cherche un point d'apparition en testant des directions aléatoires autour de l'origine, de minDist à maxDist par pas de options.gap (50 m par défaut), jusqu'à trouver une route valide. | 384 |
| `gameplay_traffic_trafficUtils.getAheadPos(pos, dir, scale, useZ0)` | Renvoie une position située devant pos, dans la direction dir, à la distance scale. Sert à comparer à moindre coût les distances entre véhicules. | 161 |
| `gameplay_traffic_trafficUtils.getBaseGroupParams()` | Construit les paramètres de base d'un groupe de véhicules (filtre de types voiture/camion, pays du niveau, minPop 50 ; filtre de région si le réglage trafficSmartSelections est actif). | 49 |
| `gameplay_traffic_trafficUtils.getBaseValues()` | Renvoie la table des valeurs de seuil partagées par les modules de trafic (référence directe). | 45 |
| `gameplay_traffic_trafficUtils.getLevelInfo()` | Lit le fichier d'infos du niveau courant et renvoie son pays (converti en nom anglais parmi une liste restreinte, sinon 'default') et sa région. | 26 |
| `gameplay_traffic_trafficUtils.getNearestTrafficVehicle(pos, filters)` | Renvoie l'id du véhicule IA de trafic le plus proche d'une position, avec filtres optionnels sur les propriétés du véhicule de trafic. | 678 |
| `gameplay_traffic_trafficUtils.getRoleConstructor(roleName)` | Renvoie le constructeur d'un rôle de trafic (module sous traffic/roles/), mis en cache. Si le rôle n'existe pas, un avertissement est écrit et le rôle 'standard' est utilisé. | 150 |
| `gameplay_traffic_trafficUtils.getTrafficGroupFromFile(options)` | Renvoie les données d'un fichier de groupe de véhicules (*.vehGroup.json), choisi au hasard parmi ceux du niveau (ou de /vehicleGroups/). | 107 |
| `gameplay_traffic_trafficUtils.placeTrafficVehicles(pos, dir, options)` | Téléporte tous les véhicules IA de trafic à la position donnée et les aligne (core_multiSpawn.placeGroup), par défaut en mode 'roadAhead' avec un écart de 15 m. | 669 |
| `gameplay_traffic_trafficUtils.setTrafficSpeedFromApp(speed, mode)` | Convertit une vitesse saisie dans l'application Trafic (km/h, mph ou auto) en m/s et l'applique comme limite de vitesse du trafic (setTrafficVars({speedLimit})). Le mode 'auto' envoie -1. | 707 |

### Détail des paramètres

#### `gameplay_traffic_trafficUtils.checkSpawnPoint(pos, origPos, minDist, maxDist, minVehDist, n1, n2)`

Vérifie qu'un point est utilisable : entre minDist et maxDist de l'origine, hors des carrefours, et sans conflit avec les autres véhicules actifs.

- `pos` (*vec3*) : Point à tester.
- `origPos` (*vec3|nil*) : Origine des distances (caméra par défaut).
- `minDist` (*number|nil*) : Distance minimale (80 m par défaut).
- `maxDist` (*number|nil*) : Distance maximale (illimitée par défaut).
- `minVehDist` (*number|nil*) : Distance minimale aux autres véhicules (15 m par défaut).
- `n1` (*string|nil*) : Premier nœud de route (pour exclure les carrefours).
- `n2` (*string|nil*) : Second nœud de route.
- **renvoie** : boolean true si le point est valide.

#### `gameplay_traffic_trafficUtils.createPoliceGroup(amount, allMods)`

Crée un groupe de véhicules de police (configs de type 'police'), favorisant le pays du niveau, selon le réglage trafficAllowMods.

- `amount` (*integer*) : Nombre de véhicules.
- `allMods` (*boolean*) : Ignoré : écrasé par le réglage trafficAllowMods.
- **renvoie** : table Groupe renvoyé par core_multiSpawn.createGroup.

#### `gameplay_traffic_trafficUtils.createTrafficGroup(amount, allMods, allConfigs, simpleVehs)`

Crée un groupe de véhicules de trafic selon les réglages du joueur (trafficSimpleVehicles, trafficAllowMods, trafficSmartSelections) : sans véhicules de police, ou uniquement des véhicules 'proptraffic' en mode simple.

- `amount` (*integer*) : Nombre de véhicules du groupe.
- `allMods` (*boolean*) : Ignoré : écrasé par le réglage trafficAllowMods.
- `allConfigs` (*boolean*) : Ignoré : forcé à true.
- `simpleVehs` (*boolean*) : Ignoré : écrasé par le réglage trafficSimpleVehicles.
- **renvoie** : table Groupe renvoyé par core_multiSpawn.createGroup.

#### `gameplay_traffic_trafficUtils.finalizeSpawnPoint(pos, dir, mapNode1, mapNode2, options)`

Cale un point sur une voie de la route (position et direction), en tenant compte du sens de circulation (conduite à droite ou à gauche), des sens uniques et du nombre de voies estimé. Si aucune route n'est trouvée à moins de 30 m, renvoie les valeurs d'entrée.

- `pos` (*vec3*) : Position à ajuster.
- `dir` (*vec3|nil*) : Direction ; si nil, prend le sens de la route (legalDirection = true).
- `mapNode1` (*string|nil*) : Premier nœud de la route (recherché si absent).
- `mapNode2` (*string|nil*) : Second nœud de la route.
- `options` (*table|nil*) : legalDirection (sens légal), minLane/maxLane (voies autorisées), roadDir (±1, vers/loin du joueur), roadLateralXnorm (décalage latéral direct de -1 à 1).
- **renvoie** : vec3 Nouvelle position.
- **renvoie** : vec3 Nouvelle direction.

#### `gameplay_traffic_trafficUtils.findSafeSpawnPoint(startPos, startDir, minDist, maxDist, targetDist, options)`

Renvoie toujours un point d'apparition (téléportation forcée). Essaie d'abord la route devant, puis une recherche radiale proche (200-1000 m), une recherche large moins stricte (200-2000 m, drivability 0,5) et enfin très loin (10 000-12 000 m, z = 1).

- `startPos` (*vec3|nil*) : Origine.
- `startDir` (*vec3|nil*) : Direction de marche.
- `minDist` (*number|nil*) : Distance minimale de la première recherche.
- `maxDist` (*number|nil*) : Distance maximale de la première recherche.
- `targetDist` (*number|nil*) : Distance idéale de la première recherche.
- `options` (*table|nil*) : Mêmes options que findSpawnPointOnRoute (modifiée : minDrivability passe à 0,5 dans les recherches de repli).
- **renvoie** : table {pos, dir, ...}, jamais nil.
- **renvoie** : boolean true si une méthode a trouvé un point valide.

#### `gameplay_traffic_trafficUtils.findSpawnPoint(startPos, startDir, minDist, maxDist, targetDist, options)`

Alias de findSpawnPointOnRoute (même fonction, mêmes paramètres et retours).

- `startPos` (*vec3|nil*) : Origine.
- `startDir` (*vec3|nil*) : Direction de marche.
- `minDist` (*number|nil*) : Distance minimale.
- `maxDist` (*number|nil*) : Distance maximale.
- `targetDist` (*number|nil*) : Distance idéale.
- `options` (*table|nil*) : Voir findSpawnPointOnRoute.
- **renvoie** : table {pos, dir, n1, n2}.
- **renvoie** : boolean true si valide.

#### `gameplay_traffic_trafficUtils.findSpawnPointOnLine(startPos, startDir, minDist, maxDist, targetDist, options)`

Cherche un point d'apparition le long d'une droite partant de l'origine dans la direction startDir, par pas de options.gap (50 m par défaut).

- `startPos` (*vec3|nil*) : Origine (caméra par défaut).
- `startDir` (*vec3|nil*) : Direction de la droite (avant de la caméra par défaut).
- `minDist` (*number|nil*) : Distance minimale (20 m).
- `maxDist` (*number|nil*) : Distance maximale (2000 m).
- `targetDist` (*number|nil*) : Distance idéale pour le test de visibilité.
- `options` (*table|nil*) : gap, usePrivateRoads, minDrivability, minRadius.
- **renvoie** : table {pos, dir, n1, n2}.
- **renvoie** : boolean true si un point valide a été trouvé.

#### `gameplay_traffic_trafficUtils.findSpawnPointOnRoute(startPos, startDir, minDist, maxDist, targetDist, options)`

Génère un chemin sur la route devant l'origine (aléatoire avec ramifications, ou options.route) et teste des points de ce chemin entre minDist et maxDist. Les pas peuvent être modulés par la limite de vitesse du tronçon (gapVehCoef, gapSpeedCoef, bornés à 20-50 m). Exportée aussi sous le nom findSpawnPoint.

- `startPos` (*vec3|nil*) : Origine (caméra par défaut).
- `startDir` (*vec3|nil*) : Direction de marche (avant de la caméra par défaut).
- `minDist` (*number|nil*) : Distance minimale (20 m).
- `maxDist` (*number|nil*) : Distance maximale (2000 m).
- `targetDist` (*number|nil*) : Distance idéale pour le test de visibilité.
- `options` (*table|nil*) : gap (20 m), usePrivateRoads, minDrivability, minRadius, pathRandomization (0,5), route (chemin fourni), gapVehCoef, gapSpeedCoef.
- **renvoie** : table {pos, dir, n1, n2}.
- **renvoie** : boolean true si un point valide a été trouvé.

#### `gameplay_traffic_trafficUtils.findSpawnPointRadial(startPos, startDir, minDist, maxDist, targetDist, options)`

Cherche un point d'apparition en testant des directions aléatoires autour de l'origine, de minDist à maxDist par pas de options.gap (50 m par défaut), jusqu'à trouver une route valide.

- `startPos` (*vec3|nil*) : Origine (caméra par défaut).
- `startDir` (*vec3|nil*) : Direction de départ (non utilisée par la méthode radiale, remise à z = 0).
- `minDist` (*number|nil*) : Distance minimale (20 m).
- `maxDist` (*number|nil*) : Distance maximale (2000 m).
- `targetDist` (*number|nil*) : Distance idéale ; en deçà, le point doit être caché à la caméra (raycast statique).
- `options` (*table|nil*) : gap, usePrivateRoads, minDrivability, minRadius.
- **renvoie** : table {pos, dir, n1, n2} (n1/n2 seulement si valide).
- **renvoie** : boolean true si un point valide a été trouvé.

#### `gameplay_traffic_trafficUtils.getAheadPos(pos, dir, scale, useZ0)`

Renvoie une position située devant pos, dans la direction dir, à la distance scale. Sert à comparer à moindre coût les distances entre véhicules.

- `pos` (*vec3*) : Position de départ.
- `dir` (*vec3*) : Direction.
- `scale` (*number*) : Distance en mètres ; si 0, renvoie pos tel quel.
- `useZ0` (*boolean|nil*) : Si true, aplatit la direction à l'horizontale (z = 0) avant de la normaliser.
- **renvoie** : vec3 Vecteur mis en cache (à copier si conservé) ; ou pos si scale == 0.

#### `gameplay_traffic_trafficUtils.getBaseGroupParams()`

Construit les paramètres de base d'un groupe de véhicules (filtre de types voiture/camion, pays du niveau, minPop 50 ; filtre de région si le réglage trafficSmartSelections est actif).

- **renvoie** : table Paramètres à passer à core_multiSpawn.createGroup.

#### `gameplay_traffic_trafficUtils.getBaseValues()`

Renvoie la table des valeurs de seuil partagées par les modules de trafic (référence directe).

- **renvoie** : table {minDrivability, minRadius, lowDamage, highDamage, lowSpeed}.

#### `gameplay_traffic_trafficUtils.getLevelInfo()`

Lit le fichier d'infos du niveau courant et renvoie son pays (converti en nom anglais parmi une liste restreinte, sinon 'default') et sa région.

- **renvoie** : table {country = string, region = string|nil}.

#### `gameplay_traffic_trafficUtils.getNearestTrafficVehicle(pos, filters)`

Renvoie l'id du véhicule IA de trafic le plus proche d'une position, avec filtres optionnels sur les propriétés du véhicule de trafic.

- `pos` (*vec3|nil*) : Position de référence (caméra par défaut).
- `filters` (*table|nil*) : Paires propriété = valeur ; un véhicule est exclu si la propriété existe avec une autre valeur.
- **renvoie** : integer|nil Id du véhicule le plus proche.
- **renvoie** : number Distance en mètres (math.huge si aucun véhicule).

#### `gameplay_traffic_trafficUtils.getRoleConstructor(roleName)`

Renvoie le constructeur d'un rôle de trafic (module sous traffic/roles/), mis en cache. Si le rôle n'existe pas, un avertissement est écrit et le rôle 'standard' est utilisé.

- `roleName` (*string*) : Nom du rôle (ex. 'standard', 'police', 'suspect', 'empty').
- **renvoie** : function Constructeur de rôle.

#### `gameplay_traffic_trafficUtils.getTrafficGroupFromFile(options)`

Renvoie les données d'un fichier de groupe de véhicules (*.vehGroup.json), choisi au hasard parmi ceux du niveau (ou de /vehicleGroups/).

- `options` (*table|nil*) : options.name = filtre sur le nom du fichier (sous-chaîne, en minuscules) ; options.useCustom = true pour forcer /vehicleGroups/.
- **renvoie** : table|nil Données du groupe (champ data du fichier si présent).
- **renvoie** : string|nil Chemin du fichier choisi.

#### `gameplay_traffic_trafficUtils.placeTrafficVehicles(pos, dir, options)`

Téléporte tous les véhicules IA de trafic à la position donnée et les aligne (core_multiSpawn.placeGroup), par défaut en mode 'roadAhead' avec un écart de 15 m.

- `pos` (*vec3|nil*) : Position (caméra par défaut).
- `dir` (*vec3|nil*) : Direction (avant de la caméra par défaut).
- `options` (*table|nil*) : Options de placeGroup ; mode ('roadAhead' par défaut) et gap (15 par défaut).

#### `gameplay_traffic_trafficUtils.setTrafficSpeedFromApp(speed, mode)`

Convertit une vitesse saisie dans l'application Trafic (km/h, mph ou auto) en m/s et l'applique comme limite de vitesse du trafic (setTrafficVars({speedLimit})). Le mode 'auto' envoie -1.

- `speed` (*number|nil*) : Vitesse dans l'unité du mode (0 par défaut).
- `mode` (*string|nil*) : 'km/h', 'mph' ou 'auto' (défaut) ; autre valeur = m/s.
- **renvoie** : number Vitesse appliquée en m/s (-1 en mode auto).

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugMode` | boolean | Si true, écrit dans le log les paramètres et résultats des recherches de point d'apparition. false par défaut. |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`
- `core_environment.` `getGravity`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/traffic/trafficUtils.lua`.*
