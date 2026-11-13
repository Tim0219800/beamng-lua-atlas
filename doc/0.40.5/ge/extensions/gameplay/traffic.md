# `gameplay_traffic`

*Fichier : `lua/ge/extensions/gameplay/traffic.lua` · VM : Game Engine (GE) · 1761 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_traffic` : `extensions.load("gameplay_traffic")`, puis la globale `gameplay_traffic`

Système principal de trafic IA en freeroam. Il fait apparaître un groupe de véhicules (via core_multiSpawn), les insère dans la table du trafic (objets gameplay/traffic/vehicle avec rôles), gère un pool de véhicules actifs/inactifs (core_vehicleActivePooling), et les réapparaît devant le point de focus (joueur ou caméra) sur le réseau routier. Gère aussi les variables globales du trafic (agressivité, limite de vitesse, mode IA…), un système de véhicules « réservés » pour des fournisseurs spéciaux (police, taxi…), la sauvegarde/restauration de l'état et le debug visuel. États : 'off', 'spawning', 'loading', 'on'.

## Exemple

```lua
gameplay_traffic.setupTraffic(10, {activeAmount = 8})
-- ...
gameplay_traffic.setTrafficVars({baseAggression = 0.6, speedLimit = 20})
for id, veh in pairs(gameplay_traffic.getTraffic()) do print(id, veh.roleName) end
```

## Remarques

- Variables par défaut (getTrafficVars) : spawnValue 1, spawnDirBias 0,2, activeAmount infini, baseAggression 0,35, speedLimit -1 (désactivé, en m/s), aiMode 'traffic', aiAware 'auto', aiDebug 'off', enableRespawn true, enableDynamicValues true, enableRandomEvents false.
- Alias exportés : forceTeleportAll = scatterTraffic ; getNumOfTraffic = getTrafficAmount ; getTrafficAiVehIds = getTrafficList ; getTraffic = getTrafficData.
- Modèle « réservé » : un véhicule reserved = providerName appartient à la réserve d'un fournisseur et reste dormant (inactif, sans respawn) tant qu'il n'est pas « claimed » (utilisé) via useReservedVehicle. Un véhicule claimed est protégé du pooling automatique.
- Un seul véhicule du trafic est traité par frame pour le respawn (index auxiliaryData.queuedVehicle). L'échantillonnage des conditions de trafic (densité du réseau, direction) se fait toutes les 5 s de temps simulé.
- Le focus (setFocus) a trois modes : 'camera' (défaut), 'vehicle' et 'custom' ; avec auto = true il bascule selon le véhicule joueur ou la caméra libre.
- Les hooks onTrafficStarted et onTrafficStopped sont à la fois émis par onUpdate (quand le premier véhicule IA apparaît ou que le dernier disparaît) et gérés par ce même module (M.onTrafficStarted passe l'état à 'on', M.onTrafficStopped vide les tables).
- Un watchdog de 8 s (spawnWatchdogTimeout) termine le chargement du trafic si aucun véhicule ne rapporte de progression, pour ne pas bloquer l'écran d'attente.
- Modules chargés par dépendance : gameplay_parking, gameplay_police, gameplay_taxi, gameplay_traffic_trafficUtils, core_vehicleActivePooling.

**Dépendances (chargées avant) :** `gameplay_parking`, `gameplay_police`, `gameplay_taxi`, `gameplay_traffic_trafficUtils`, `core_vehicleActivePooling`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_traffic.activate(vehList)` | Active le mode trafic et ajoute des véhicules à la table. Si vehList n'est pas une table, prend tous les véhicules non garés (compatibilité). | 966 |
| `gameplay_traffic.deactivate(stopAi)` | Retire tous les véhicules de la table du trafic. | 992 |
| `gameplay_traffic.deleteVehicles()` | Supprime tous les véhicules du trafic (IA ou marqués isTraffic) de la scène et de la table. | 956 |
| `gameplay_traffic.ensureReservedVehicles(providerName, count)` | S'assure qu'un fournisseur dispose de count véhicules réservés (en fait apparaît au plus 4 à la fois). Émet onTrafficReservedVehiclesReady quand déjà suffisant. | 99 |
| `gameplay_traffic.forceTeleport(id, pos, dir, minDist, maxDist, targetDist)` | Téléporte de force un véhicule du trafic vers un point de spawn sûr trouvé autour de pos. Ignoré si enableRespawn est faux ou si ignoreForceTeleport est vrai ; une réserve non utilisée est simplement rendue dormante. | 508 |
| `gameplay_traffic.forceTeleportAll(vehIds, minDist, maxDist)` | Alias de scatterTraffic. | 540 |
| `gameplay_traffic.freezeState(options)` | Arrête les systèmes de trafic, police et parking et renvoie leurs données sérialisées (utilisé par exemple au début d'une mission). | 1219 |
| `gameplay_traffic.getFocus()` | Renvoie la table de focus {mode, pos, dirVec, speed, vehId, auto}. | 383 |
| `gameplay_traffic.getIdealSpawnAmount(amount, enforceLimit)` | Calcule le nombre idéal de véhicules à créer. | 276 |
| `gameplay_traffic.getNumOfTraffic(activeOnly)` | Alias de getTrafficAmount. | 301 |
| `gameplay_traffic.getState()` | État du système : 'off', 'spawning', 'loading' ou 'on'. | 297 |
| `gameplay_traffic.getTraffic()` | Alias de getTrafficData. | 309 |
| `gameplay_traffic.getTrafficAiVehIds()` | Alias de getTrafficList. | 305 |
| `gameplay_traffic.getTrafficAmount(activeOnly)` | Nombre de véhicules IA du trafic (alias getNumOfTraffic). | 301 |
| `gameplay_traffic.getTrafficData()` | Table complète du trafic : identifiant -> objet traffic vehicle (alias getTraffic). Contient aussi le véhicule joueur. | 309 |
| `gameplay_traffic.getTrafficList()` | Liste des identifiants des véhicules IA du trafic (alias getTrafficAiVehIds). | 305 |
| `gameplay_traffic.getTrafficVars()` | Renvoie la table des variables du trafic (référence directe). | 347 |
| `gameplay_traffic.insertTraffic(id, ignoreAi, ignoreVehPool)` | Insère un véhicule existant dans la table du trafic (crée l'objet traffic vehicle, l'ajoute au pool, règle le mode IA, gère le marquage 'reserved:' via spawnMeta). Émet onTrafficVehicleAdded. | 778 |
| `gameplay_traffic.onClientEndMission()` | Hook : arrête le trafic, vide les spawns réservés, réinitialise variables et focus. *(interne)* *(hook)* | 1566 |
| `gameplay_traffic.onClientStartMission()` | Hook : met à jour la visibilité des passagers des véhicules simple_traffic. *(interne)* *(hook)* | 1554 |
| `gameplay_traffic.onDeserialized(data, options)` | Restaure l'état du trafic ; avec respawnVehicles, recrée les véhicules mémorisés et remappe leurs identifiants (rôle, poursuite, collisions). *(interne)* *(hook)* | 1639 |
| `gameplay_traffic.onExtensionLoaded()` | Hook : met à jour la visibilité des passagers des véhicules simple_traffic. *(interne)* *(hook)* | 1558 |
| `gameplay_traffic.onPreRender(dt)` | Hook de rendu : en mode debug, dessine pour chaque véhicule actif une ligne vers le focus et un texte (id, distance, vitesse en km/h). *(interne)* *(hook)* | 1493 |
| `gameplay_traffic.onSerialize(options)` | Sérialise l'état du trafic (état, véhicules, variables), puis arrête le trafic. Avec despawnVehicles, mémorise aussi les données d'apparition des véhicules et les supprime. *(interne)* *(hook)* | 1591 |
| `gameplay_traffic.onSettingsChanged()` | Hook : met à jour la visibilité des passagers (réglage enableSeatOccupants). *(interne)* *(hook)* | 1562 |
| `gameplay_traffic.onTrafficStarted()` | Hook : passe l'état à 'on', prépare le pool et insère les véhicules joueurs. Émis par onUpdate après l'insertion du premier véhicule IA. *(interne)* *(hook)* | 1516 |
| `gameplay_traffic.onTrafficStopped()` | Hook : supprime le pool et vide les tables du trafic (état 'off'). *(interne)* *(hook)* | 1547 |
| `gameplay_traffic.onUiWaitingState()` | Hook appelé quand l'écran d'attente est affiché : lance setupTrafficHelper avec les paramètres préparés par setupTrafficWaitForUi. *(interne)* *(hook)* | 1574 |
| `gameplay_traffic.onUpdate(dtReal, dtSim)` | Hook appelé à chaque frame : lance le spawn en état 'loading', surveille le watchdog, déclenche onTrafficStarted/onTrafficStopped, met à jour le focus, le pool et la logique de trafic (un véhicule traité par frame). *(interne)* *(hook)* | 1417 |
| `gameplay_traffic.onVehicleActiveChanged(vehId, active)` | Hook appelé quand un véhicule est activé/désactivé : masque un véhicule désactivé et téléporte un véhicule réactivé si sa position n'est pas sûre. *(interne)* *(hook)* | 936 |
| `gameplay_traffic.onVehicleDestroyed(id)` | Hook : retire le véhicule détruit du trafic et du spawn en cours. *(interne)* *(hook)* | 923 |
| `gameplay_traffic.onVehicleGroupSpawned(vehList, groupId, groupName)` | Hook appelé quand un groupe multiSpawn est créé : active les véhicules du groupe 'autoTraffic', applique des plaques fantaisie, traite les réserves et émet onTrafficOrParkingReady quand tout est prêt. *(interne)* *(hook)* | 1346 |
| `gameplay_traffic.onVehicleMapmgrUpdate(id)` | Hook appelé quand le mapmgr d'un véhicule est prêt ; termine le chargement quand tous les véhicules attendus ont rapporté. *(interne)* *(hook)* | 1335 |
| `gameplay_traffic.onVehicleResetted(id)` | Hook : traite le reset d'un véhicule du trafic. *(interne)* *(hook)* | 905 |
| `gameplay_traffic.onVehicleSpawned(id)` | Hook : à l'apparition ou au remplacement d'un véhicule du trafic, réapplique ses données de modèle et son rôle automatique. *(interne)* *(hook)* | 890 |
| `gameplay_traffic.onVehicleSwitched(oldId, newId)` | Hook : vérifie que le nouveau véhicule joueur est dans la table du trafic. *(interne)* *(hook)* | 901 |
| `gameplay_traffic.protectNonReservedVehicle(id, providerName)` | Protège un véhicule non réservé du pooling automatique pendant qu'un fournisseur l'utilise (mêmes protections qu'une réserve prise). | 259 |
| `gameplay_traffic.recycleReservedVehicle(providerName, id, spawnData)` | Remplace en place le modèle/config d'une réserve non utilisée (spawn.setVehicleObject), la met au rôle 'empty' et dormante. | 226 |
| `gameplay_traffic.refreshVehicles()` | Appelle onRefresh sur chaque véhicule du trafic (réinitialise ses données). | 688 |
| `gameplay_traffic.registerSpecialVehicleProvider(provider)` | Enregistre (ou remplace) un fournisseur de véhicules spéciaux (police, taxi…). Champs lus : name (obligatoire), priority, minTotalAmount, guaranteed, getDesiredCount(amount, options), buildGroup(count, options), buildReservedGroup, reserved. | 76 |
| `gameplay_traffic.removeReservedVehicles(providerName)` | Supprime tous les véhicules réservés d'un fournisseur et annule un spawn en cours. | 147 |
| `gameplay_traffic.removeTraffic(id, stopAi)` | Retire un véhicule du trafic : remet l'action du rôle à zéro, réaffiche le véhicule, le rend jouable et le sort du pool. Émet onTrafficVehicleRemoved. | 840 |
| `gameplay_traffic.respawnVehicle(id, pos, rot, strict)` | Déplace un véhicule vers une nouvelle position et rotation (pour le trafic) et appelle onRespawn sur son objet trafic. Mode non strict : spawn.safeTeleport (plus lent, évite la géométrie statique). | 488 |
| `gameplay_traffic.returnReservedVehicle(ids, immediate)` | Rend des réserves en service au pool dormant. Elles continuent de rouler jusqu'à leur prochaine téléportation hors de vue, où elles se désactivent ; avec immediate, elles deviennent dormantes tout de suite. | 215 |
| `gameplay_traffic.scatterTraffic(vehIds, minDist, maxDist)` | Téléporte un groupe de véhicules loin de l'endroit actuel (alias forceTeleportAll). | 540 |
| `gameplay_traffic.setActiveAmount(amount)` | Fixe le nombre maximal de véhicules actifs (visibles). | 773 |
| `gameplay_traffic.setDebugMode(value)` | Active ou coupe le mode debug du trafic (via setTrafficVars aiDebug). | 768 |
| `gameplay_traffic.setFocus(mode, data)` | Définit le point de focus utilisé pour décider quels véhicules rester actifs ou à téléporter (trafic et parking). | 351 |
| `gameplay_traffic.setTrafficVars(data, reset)` | Modifie les variables du trafic et les propage aux véhicules (mode IA, paramètres IA, spawnValue, spawnDirBias, debug, activeAmount). Passer à un aiMode autre que 'traffic' met les rôles à 'empty' (restaurés au retour en 'traffic'). | 713 |
| `gameplay_traffic.setupCustomTraffic(amount, params)` | Fait apparaître un groupe créé avec des paramètres personnalisés. | 1184 |
| `gameplay_traffic.setupTraffic(amount, options)` | Prépare le trafic : supprime le trafic courant (sauf keepCurrent), détermine le nombre de véhicules (réglage ou CPU si -1), construit ou charge le groupe (fichier de niveau, groupe personnalisé ou généré), insère les véhicules des fournisseurs spéciaux (jusqu'à 40 % du total) et les réserves, puis passe en état 'loading' ; le spawn réel se fait ensuite dans onUpdate. | 1008 |
| `gameplay_traffic.setupTrafficHelper(trafficAmount, trafficOptions, parkingAmount, parkingOptions, extraOptions)` | Prépare trafic et véhicules garés en même temps (parking d'abord). Le hook onTrafficOrParkingReady signale la fin. | 1150 |
| `gameplay_traffic.setupTrafficWaitForUi(useTraffic, useParked, options)` | Utilisé par le menu pause : affiche l'icône d'attente (app:waiting) et prépare le trafic ; le spawn démarre dans onUiWaitingState. | 1168 |
| `gameplay_traffic.spawnTraffic(amount, groupData, options)` | Fait apparaître un groupe de véhicules via core_multiSpawn.spawnGroup (nom 'autoTraffic'). Met l'état à 'spawning'. Interface publique de bas niveau ; on préfère setupTraffic. | 998 |
| `gameplay_traffic.toggle(keepInMemory)` | Active ou désactive le trafic en freeroam (ignoré hors freeroam ou si l'action toggleTraffic est bloquée). Si éteint, lance setupTraffic ; si allumé, soit supprime les véhicules, soit avec keepInMemory les désactive (activeAmount = 0) pour une réactivation instantanée. | 1193 |
| `gameplay_traffic.trackAIAllVeh(mode)` | Appelé quand le joueur définit un mode IA pour tous les véhicules : applique ce mode comme aiMode du trafic. | 1330 |
| `gameplay_traffic.unfreezeState(trafficData, policeData, parkingData, options)` | Restaure les systèmes depuis les données de freezeState puis disperse le trafic (scatterTraffic). | 1226 |
| `gameplay_traffic.unprotectNonReservedVehicle(id)` | Retire cette protection : le véhicule redevient du trafic normal. | 264 |
| `gameplay_traffic.unregisterSpecialVehicleProvider(name)` | Retire un fournisseur par son nom. | 90 |
| `gameplay_traffic.useReservedVehicle(providerName, count, onClaim, filter)` | Met en service jusqu'à count réserves dormantes d'un fournisseur et les active (forcé dans le pool). Les véhicules deviennent « claimed ». | 195 |

### Détail des paramètres

#### `gameplay_traffic.activate(vehList)`

Active le mode trafic et ajoute des véhicules à la table. Si vehList n'est pas une table, prend tous les véhicules non garés (compatibilité).

- `vehList` (*integer[]|nil*) : Identifiants à ajouter.

#### `gameplay_traffic.deactivate(stopAi)`

Retire tous les véhicules de la table du trafic.

- `stopAi` (*boolean|nil*) : Arrêter l'IA des véhicules.

#### `gameplay_traffic.ensureReservedVehicles(providerName, count)`

S'assure qu'un fournisseur dispose de count véhicules réservés (en fait apparaît au plus 4 à la fois). Émet onTrafficReservedVehiclesReady quand déjà suffisant.

- `providerName` (*string*) : Nom du fournisseur.
- `count` (*integer*) : Nombre souhaité.
- **renvoie** : boolean false si rien à faire ou échec, true si déjà prêt ou spawn lancé.

#### `gameplay_traffic.forceTeleport(id, pos, dir, minDist, maxDist, targetDist)`

Téléporte de force un véhicule du trafic vers un point de spawn sûr trouvé autour de pos. Ignoré si enableRespawn est faux ou si ignoreForceTeleport est vrai ; une réserve non utilisée est simplement rendue dormante.

- `id` (*integer*) : Identifiant du véhicule.
- `pos` (*vec3|nil*) : Centre de recherche ; défaut position de la caméra.
- `dir` (*vec3|nil*) : Direction ; défaut direction avant de la caméra.
- `minDist` (*number|nil*) : Distance minimale (défaut 100 m).
- `maxDist` (*number|nil*) : Distance maximale (défaut 500 m).
- `targetDist` (*number|nil*) : Distance visible cible.

#### `gameplay_traffic.forceTeleportAll(vehIds, minDist, maxDist)`

Alias de scatterTraffic.

- `vehIds` (*integer[]|nil*) : Véhicules.
- `minDist` (*number|nil*) : Distance minimale.
- `maxDist` (*number|nil*) : Distance maximale.

#### `gameplay_traffic.freezeState(options)`

Arrête les systèmes de trafic, police et parking et renvoie leurs données sérialisées (utilisé par exemple au début d'une mission).

- `options` (*table|nil*) : Options de onSerialize (despawnVehicles, exceptVehicleId, debugVehicleStashing).
- **renvoie** : table Données du trafic.
- **renvoie** : table Données de la police.
- **renvoie** : table Données du parking.

#### `gameplay_traffic.getFocus()`

Renvoie la table de focus {mode, pos, dirVec, speed, vehId, auto}.

- **renvoie** : table Focus courant.

#### `gameplay_traffic.getIdealSpawnAmount(amount, enforceLimit)`

Calcule le nombre idéal de véhicules à créer.

- `amount` (*integer|nil*) : Quantité demandée ; nil ou négatif = réglages (CPU si 0).
- `enforceLimit` (*boolean|nil*) : Soustrait les véhicules actifs non garés déjà présents (plus un pour le joueur).
- **renvoie** : integer Quantité.

#### `gameplay_traffic.getNumOfTraffic(activeOnly)`

Alias de getTrafficAmount.

- `activeOnly` (*boolean|nil*) : Ne compter que les actifs.
- **renvoie** : integer Quantité.

#### `gameplay_traffic.getState()`

État du système : 'off', 'spawning', 'loading' ou 'on'.

- **renvoie** : string État.

#### `gameplay_traffic.getTraffic()`

Alias de getTrafficData.

- **renvoie** : table<integer, table> Véhicules du trafic.

#### `gameplay_traffic.getTrafficAiVehIds()`

Alias de getTrafficList.

- **renvoie** : integer[] Identifiants.

#### `gameplay_traffic.getTrafficAmount(activeOnly)`

Nombre de véhicules IA du trafic (alias getNumOfTraffic).

- `activeOnly` (*boolean|nil*) : Ne compter que les actifs (borné par activeAmount).
- **renvoie** : integer Quantité.

#### `gameplay_traffic.getTrafficData()`

Table complète du trafic : identifiant -> objet traffic vehicle (alias getTraffic). Contient aussi le véhicule joueur.

- **renvoie** : table<integer, table> Véhicules du trafic.

#### `gameplay_traffic.getTrafficList()`

Liste des identifiants des véhicules IA du trafic (alias getTrafficAiVehIds).

- **renvoie** : integer[] Identifiants (table interne, ne pas modifier).

#### `gameplay_traffic.getTrafficVars()`

Renvoie la table des variables du trafic (référence directe).

- **renvoie** : table Variables (voir notes).

#### `gameplay_traffic.insertTraffic(id, ignoreAi, ignoreVehPool)`

Insère un véhicule existant dans la table du trafic (crée l'objet traffic vehicle, l'ajoute au pool, règle le mode IA, gère le marquage 'reserved:' via spawnMeta). Émet onTrafficVehicleAdded.

- `id` (*integer*) : Identifiant du véhicule.
- `ignoreAi` (*boolean|nil*) : N'applique ni IA ni respawn (utilisé pour le véhicule joueur).
- `ignoreVehPool` (*boolean|nil*) : Ne pas l'ajouter au pool de désactivation.

#### `gameplay_traffic.onDeserialized(data, options)`

Restaure l'état du trafic ; avec respawnVehicles, recrée les véhicules mémorisés et remappe leurs identifiants (rôle, poursuite, collisions).

- `data` (*table*) : Données de onSerialize.
- `options` (*table|nil*) : respawnVehicles, debugVehicleStashing.

#### `gameplay_traffic.onPreRender(dt)`

Hook de rendu : en mode debug, dessine pour chaque véhicule actif une ligne vers le focus et un texte (id, distance, vitesse en km/h).

- `dt` (*number*) : Temps de frame.

#### `gameplay_traffic.onSerialize(options)`

Sérialise l'état du trafic (état, véhicules, variables), puis arrête le trafic. Avec despawnVehicles, mémorise aussi les données d'apparition des véhicules et les supprime.

- `options` (*table|nil*) : despawnVehicles, exceptVehicleId, debugVehicleStashing.
- **renvoie** : table Données {state, traffic, vars, vehicleSpawnData, vehicleSpawnOrder}.

#### `gameplay_traffic.onUpdate(dtReal, dtSim)`

Hook appelé à chaque frame : lance le spawn en état 'loading', surveille le watchdog, déclenche onTrafficStarted/onTrafficStopped, met à jour le focus, le pool et la logique de trafic (un véhicule traité par frame).

- `dtReal` (*number*) : Temps réel (s).
- `dtSim` (*number*) : Temps simulé (s).

#### `gameplay_traffic.onVehicleActiveChanged(vehId, active)`

Hook appelé quand un véhicule est activé/désactivé : masque un véhicule désactivé et téléporte un véhicule réactivé si sa position n'est pas sûre.

- `vehId` (*integer*) : Identifiant du véhicule.
- `active` (*boolean*) : Nouvel état.

#### `gameplay_traffic.onVehicleDestroyed(id)`

Hook : retire le véhicule détruit du trafic et du spawn en cours.

- `id` (*integer*) : Identifiant du véhicule.

#### `gameplay_traffic.onVehicleGroupSpawned(vehList, groupId, groupName)`

Hook appelé quand un groupe multiSpawn est créé : active les véhicules du groupe 'autoTraffic', applique des plaques fantaisie, traite les réserves et émet onTrafficOrParkingReady quand tout est prêt.

- `vehList` (*integer[]*) : Véhicules du groupe.
- `groupId` (*any*) : Identifiant du groupe.
- `groupName` (*string*) : Nom du groupe.

#### `gameplay_traffic.onVehicleMapmgrUpdate(id)`

Hook appelé quand le mapmgr d'un véhicule est prêt ; termine le chargement quand tous les véhicules attendus ont rapporté.

- `id` (*integer*) : Identifiant du véhicule.

#### `gameplay_traffic.onVehicleResetted(id)`

Hook : traite le reset d'un véhicule du trafic.

- `id` (*integer*) : Identifiant du véhicule.

#### `gameplay_traffic.onVehicleSpawned(id)`

Hook : à l'apparition ou au remplacement d'un véhicule du trafic, réapplique ses données de modèle et son rôle automatique.

- `id` (*integer*) : Identifiant du véhicule.

#### `gameplay_traffic.onVehicleSwitched(oldId, newId)`

Hook : vérifie que le nouveau véhicule joueur est dans la table du trafic.

- `oldId` (*integer*) : Ancien véhicule.
- `newId` (*integer*) : Nouveau véhicule.

#### `gameplay_traffic.protectNonReservedVehicle(id, providerName)`

Protège un véhicule non réservé du pooling automatique pendant qu'un fournisseur l'utilise (mêmes protections qu'une réserve prise).

- `id` (*integer*) : Identifiant du véhicule.
- `providerName` (*string*) : Nom du fournisseur.

#### `gameplay_traffic.recycleReservedVehicle(providerName, id, spawnData)`

Remplace en place le modèle/config d'une réserve non utilisée (spawn.setVehicleObject), la met au rôle 'empty' et dormante.

- `providerName` (*string*) : Nom du fournisseur.
- `id` (*integer*) : Identifiant du véhicule.
- `spawnData` (*table*) : {model, config} ; config peut être un nom ou un chemin .pc.
- **renvoie** : boolean true si recyclé.

#### `gameplay_traffic.registerSpecialVehicleProvider(provider)`

Enregistre (ou remplace) un fournisseur de véhicules spéciaux (police, taxi…). Champs lus : name (obligatoire), priority, minTotalAmount, guaranteed, getDesiredCount(amount, options), buildGroup(count, options), buildReservedGroup, reserved.

- `provider` (*table*) : Description du fournisseur.

#### `gameplay_traffic.removeReservedVehicles(providerName)`

Supprime tous les véhicules réservés d'un fournisseur et annule un spawn en cours.

- `providerName` (*string*) : Nom du fournisseur.
- **renvoie** : integer Nombre de véhicules supprimés.

#### `gameplay_traffic.removeTraffic(id, stopAi)`

Retire un véhicule du trafic : remet l'action du rôle à zéro, réaffiche le véhicule, le rend jouable et le sort du pool. Émet onTrafficVehicleRemoved.

- `id` (*integer*) : Identifiant du véhicule.
- `stopAi` (*boolean|nil*) : Mettre l'IA du véhicule en mode 'stop'.

#### `gameplay_traffic.respawnVehicle(id, pos, rot, strict)`

Déplace un véhicule vers une nouvelle position et rotation (pour le trafic) et appelle onRespawn sur son objet trafic. Mode non strict : spawn.safeTeleport (plus lent, évite la géométrie statique).

- `id` (*integer*) : Identifiant du véhicule.
- `pos` (*vec3*) : Position.
- `rot` (*quat*) : Rotation.
- `strict` (*boolean|nil*) : Placement direct (setPositionRotation + autoplace) avec rotation de 180° ajoutée.

#### `gameplay_traffic.returnReservedVehicle(ids, immediate)`

Rend des réserves en service au pool dormant. Elles continuent de rouler jusqu'à leur prochaine téléportation hors de vue, où elles se désactivent ; avec immediate, elles deviennent dormantes tout de suite.

- `ids` (*integer|integer[]*) : Identifiant(s).
- `immediate` (*boolean|nil*) : Désactiver immédiatement.

#### `gameplay_traffic.scatterTraffic(vehIds, minDist, maxDist)`

Téléporte un groupe de véhicules loin de l'endroit actuel (alias forceTeleportAll).

- `vehIds` (*integer[]|nil*) : Véhicules ; défaut tous les véhicules IA du trafic.
- `minDist` (*number|nil*) : Distance minimale.
- `maxDist` (*number|nil*) : Distance maximale.

#### `gameplay_traffic.setActiveAmount(amount)`

Fixe le nombre maximal de véhicules actifs (visibles).

- `amount` (*integer|nil*) : Nombre ; nil = illimité.

#### `gameplay_traffic.setDebugMode(value)`

Active ou coupe le mode debug du trafic (via setTrafficVars aiDebug).

- `value` (*boolean*) : true pour activer.

#### `gameplay_traffic.setFocus(mode, data)`

Définit le point de focus utilisé pour décider quels véhicules rester actifs ou à téléporter (trafic et parking).

- `mode` (*string|nil*) : 'camera', 'vehicle' ou 'custom' ; nil = caméra avec changement automatique.
- `data` (*table|nil*) : vehId (mode vehicle) ; pos, dir, speed (mode custom) ; auto (booléen).

#### `gameplay_traffic.setTrafficVars(data, reset)`

Modifie les variables du trafic et les propage aux véhicules (mode IA, paramètres IA, spawnValue, spawnDirBias, debug, activeAmount). Passer à un aiMode autre que 'traffic' met les rôles à 'empty' (restaurés au retour en 'traffic').

- `data` (*table*) : Variables à fusionner.
- `reset` (*boolean|nil*) : Réinitialiser aux valeurs par défaut avant.

#### `gameplay_traffic.setupCustomTraffic(amount, params)`

Fait apparaître un groupe créé avec des paramètres personnalisés.

- `amount` (*integer|nil*) : Quantité (réglages si nil ou négatif).
- `params` (*table|nil*) : Paramètres de core_multiSpawn.createGroup.

#### `gameplay_traffic.setupTraffic(amount, options)`

Prépare le trafic : supprime le trafic courant (sauf keepCurrent), détermine le nombre de véhicules (réglage ou CPU si -1), construit ou charge le groupe (fichier de niveau, groupe personnalisé ou généré), insère les véhicules des fournisseurs spéciaux (jusqu'à 40 % du total) et les réserves, puis passe en état 'loading' ; le spawn réel se fait ensuite dans onUpdate.

- `amount` (*integer|nil*) : Nombre de véhicules ; -1 ou nil = automatique selon les réglages (trafficAmount, trafficExtraVehicles/trafficExtraAmount).
- `options` (*table|nil*) : activeAmount, keepCurrent, vehGroup, autoAdjustAmount, autoLoadFromFile, simpleVehs, allMods, allConfigs, pos, rot.
- **renvoie** : boolean true si un spawn a été lancé, false si rien à créer.

#### `gameplay_traffic.setupTrafficHelper(trafficAmount, trafficOptions, parkingAmount, parkingOptions, extraOptions)`

Prépare trafic et véhicules garés en même temps (parking d'abord). Le hook onTrafficOrParkingReady signale la fin.

- `trafficAmount` (*integer|nil*) : Quantité de trafic.
- `trafficOptions` (*table|nil*) : Options de setupTraffic.
- `parkingAmount` (*integer|nil*) : Quantité de véhicules garés.
- `parkingOptions` (*table|nil*) : Options de gameplay_parking.setupVehicles.
- `extraOptions` (*table|nil*) : Non utilisé.
- **renvoie** : boolean Trafic préparé.
- **renvoie** : boolean Parking préparé.

#### `gameplay_traffic.setupTrafficWaitForUi(useTraffic, useParked, options)`

Utilisé par le menu pause : affiche l'icône d'attente (app:waiting) et prépare le trafic ; le spawn démarre dans onUiWaitingState.

- `useTraffic` (*boolean*) : Activer le trafic.
- `useParked` (*boolean*) : Activer les véhicules garés (ignoré si le trafic est activé mais que le réglage trafficParkedVehicles est faux).
- `options` (*table|nil*) : Options de setupTraffic.

#### `gameplay_traffic.spawnTraffic(amount, groupData, options)`

Fait apparaître un groupe de véhicules via core_multiSpawn.spawnGroup (nom 'autoTraffic'). Met l'état à 'spawning'. Interface publique de bas niveau ; on préfère setupTraffic.

- `amount` (*integer|nil*) : Nombre de véhicules ; défaut : valeur des réglages moins les véhicules existants (au moins 1).
- `groupData` (*table|nil*) : Groupe de véhicules ; défaut core_multiSpawn.createGroup(amount).
- `options` (*table|nil*) : mode ('traffic' par défaut), gap (20 m), pos, dir.
- **renvoie** : any Résultat de core_multiSpawn.spawnGroup.

#### `gameplay_traffic.toggle(keepInMemory)`

Active ou désactive le trafic en freeroam (ignoré hors freeroam ou si l'action toggleTraffic est bloquée). Si éteint, lance setupTraffic ; si allumé, soit supprime les véhicules, soit avec keepInMemory les désactive (activeAmount = 0) pour une réactivation instantanée.

- `keepInMemory` (*boolean|nil*) : Garder les véhicules en mémoire (consomme de la RAM).

#### `gameplay_traffic.trackAIAllVeh(mode)`

Appelé quand le joueur définit un mode IA pour tous les véhicules : applique ce mode comme aiMode du trafic.

- `mode` (*string|nil*) : Mode IA ; défaut 'traffic'.

#### `gameplay_traffic.unfreezeState(trafficData, policeData, parkingData, options)`

Restaure les systèmes depuis les données de freezeState puis disperse le trafic (scatterTraffic).

- `trafficData` (*table|nil*) : Données du trafic.
- `policeData` (*table|nil*) : Données de la police.
- `parkingData` (*table|nil*) : Données du parking.
- `options` (*table|nil*) : Options (respawnVehicles, debugVehicleStashing).

#### `gameplay_traffic.unprotectNonReservedVehicle(id)`

Retire cette protection : le véhicule redevient du trafic normal.

- `id` (*integer*) : Identifiant du véhicule.

#### `gameplay_traffic.unregisterSpecialVehicleProvider(name)`

Retire un fournisseur par son nom.

- `name` (*string*) : Nom du fournisseur.

#### `gameplay_traffic.useReservedVehicle(providerName, count, onClaim, filter)`

Met en service jusqu'à count réserves dormantes d'un fournisseur et les active (forcé dans le pool). Les véhicules deviennent « claimed ».

- `providerName` (*string*) : Nom du fournisseur.
- `count` (*integer|nil*) : Nombre (défaut 1).
- `onClaim` (*function|nil*) : Callback (id, veh) pour chaque véhicule pris.
- `filter` (*function|nil*) : Filtre (id, veh) -> boolean.
- **renvoie** : integer[] Identifiants pris.

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugMode` | boolean | Mode debug visuel et journal (dessine ligne et texte par véhicule dans onPreRender). Modifié par setDebugMode / setTrafficVars({aiDebug='traffic'}). |
| `dependencies` | string[] | Extensions chargées avant ce module. |
| `showMessages` | boolean | Autorise l'affichage automatique de messages UI (true par défaut). |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onTrafficAmountChanged` — écouté par 2 module(s)
- `onTrafficOrParkingReady` — écouté par 2 module(s)
- `onTrafficReservedVehiclesReady`
- `onTrafficSpecialVehiclesProviders` — écouté par 2 module(s)
- `onTrafficStarted` — écouté par 7 module(s)
- `onTrafficStopped` — écouté par 6 module(s)
- `onTrafficVehicleAdded` — écouté par 2 module(s)
- `onTrafficVehicleRemoved` — écouté par 2 module(s)

**Évènements UI (guihooks.trigger) :** `QuickAccessMenu`, `app:waiting`

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `be:` `getEnabled`, `getObjectActive`, `getObjectPositionXYZ`, `getObjectVelocityXYZ`, `getPlayerVehicleID`, `getSurfaceHeightBelow`
- `debugDrawer:` `drawLine`, `drawTextAdvanced`
- `obj:` `autoplace`, `delete`, `getDirectionVector`, `getDirectionVectorUp`, `getDynDataFieldbyName`, `getField`, `getMetallicPaintData`, `getPosition`, `isPlayerControlled`, `queueLuaCommand`, `resetBrokenFlexMesh`, `setDynDataFieldbyName`, `setMeshAlpha`, `setPositionRotation`

**Charge les extensions :** `core_multiSpawn`, `core_vehicleActivePooling`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/traffic.lua`.*
