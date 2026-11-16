# `gameplay_seatOccupants`

*Fichier : `lua/ge/extensions/gameplay/seatOccupants.lua` · VM : Game Engine (GE) · 2030 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_seatOccupants` : `extensions.load("gameplay_seatOccupants")`, puis la globale `gameplay_seatOccupants`

Système de sièges et d'occupants des véhicules. Il enregistre quel joueur (ou quel occupant factice) occupe quel siège de chaque véhicule (occupancy[vehId][seatId]) et la « présence » de chaque joueur (véhicule, siège éventuel, mode de permission). Il applique le poids des occupants au véhicule, affiche ou masque les maillages d'occupants (selon la caméra et le réglage enableSeatOccupants), gère la caméra de siège, le blocage des commandes de conduite pour un passager (masque d'action maps) et la sortie du véhicule. Les véhicules sans configuration de sièges (occupantSystem / occupantSlotsById dans les données JBeam) ne passent pas par ce système. Utile aux moddeurs pour faire monter un joueur dans un siège précis, ajouter des passagers factices lestés ou connaître qui conduit.

## Exemple

```lua
-- installer le joueur 0 en passager sur le siège « RR »
gameplay_seatOccupants.requestEnterSeat(vehId, 'RR', 0)
-- ajouter un passager factice de 80 kg
gameplay_seatOccupants.setDummyOccupant(vehId, 'FR', 80)
print(dumps(gameplay_seatOccupants.getSeats(vehId)))
```

## Remarques

- Modes de permission (gameplay/vehiclePresencePolicy) : 'driver' (commandes de conduite), 'passenger' (aucune commande), 'unrestricted' (toutes). Sans siège, le mode par défaut est 'unrestricted' en freeroam hors multi-siège, sinon 'passenger'.
- Poids par défaut d'un occupant : 89 (kg). cheeseburger / salad ajoutent / retirent 10 kg à tous les occupants du véhicule, borné entre 49 et 119.
- Les identifiants de siège (seatId) viennent des groupes cargo « <seatId>Occupant » du véhicule (par exemple FL, FR). Le siège conducteur est celui dont defaultPermissionMode vaut 'driver', sinon FR (conduite à droite) ou FL.
- Unicycle (marche à pied) exclu du système de sièges.
- Champs de debug : debugDisableOccupantSystem remet le comportement ancien (tout le monde 'unrestricted', sans sièges) ; debugDisableOccupantWeight ; enablePresenceDebugMessages affiche les changements de présence ; enableSeatEjection (false par défaut) permet à enterSeat d'éjecter l'occupant actuel d'un siège occupé et de prendre sa place.
- Sérialisation : version 2 ({version, playerPresence, seatClaims, occupancy}) ; la restauration accepte aussi l'ancien format « occupancy » seul.

**Dépendances (chargées avant) :** `core_camera`, `core_vehicle_manager`, `core_input_actionFilter`, `core_gamestate`, `core_multiseat`, `ui_vehicleSelector_vehicleSpecifications`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_seatOccupants.canEnterVehicle(vehId, player)` | Indique si le joueur peut entrer dans le véhicule (changement de véhicule ou marche autorisés). | 365 |
| `gameplay_seatOccupants.cheeseburger(vehId)` | Ajoute 10 kg à chaque occupant (borné à 119) et affiche un message avec le poids. | 1497 |
| `gameplay_seatOccupants.clearDummyOccupant(vehId, seatId)` | Retire l'occupant factice d'un siège. | 1422 |
| `gameplay_seatOccupants.clearDummyOccupants(vehId)` | Retire tous les occupants factices d'un véhicule, ou de tous les véhicules si vehId est nil. | 1434 |
| `gameplay_seatOccupants.clearOccupied(vehId, seatIdOrPlayer)` | Libère des sièges. Sans second argument : tous les occupants du véhicule. Avec un nombre : retire ce joueur de tous les véhicules. | 875 |
| `gameplay_seatOccupants.enterSeat(vehId, triggerId, player)` | Point d'entrée du déclencheur « enterSeat » d'un siège : retrouve le siège à partir du trigger puis appelle requestEnterSeat. En mode debug, entre en 'unrestricted' sans siège. | 1597 |
| `gameplay_seatOccupants.getDriverPlayer(vehId)` | Plus petit indice de joueur autorisé à conduire le véhicule (mode 'driver' ou 'unrestricted'). | 1388 |
| `gameplay_seatOccupants.getOccupantSystemVersion(vehId)` | Version déclarée du système d'occupants dans les données du véhicule. | 80 |
| `gameplay_seatOccupants.getPlayerPresence(player)` | Copie de la présence d'un joueur dans un véhicule. | 287 |
| `gameplay_seatOccupants.getSeatExitData(player, vehId)` | Calcule où le joueur sort du véhicule : point à côté de la carrosserie, du côté du siège (exitNode/exitSide de l'emplacement, sinon côté déduit de la position), décalé de 0,7 m au-delà de la carrosserie. | 1520 |
| `gameplay_seatOccupants.getSeats(vehId)` | Liste les sièges d'un véhicule avec leur état. | 1322 |
| `gameplay_seatOccupants.getVehiclePresences(vehId)` | Liste des présences des joueurs dans un véhicule, triée par joueur. | 1371 |
| `gameplay_seatOccupants.onBeforeVehicleReplaced(vehId)` | Hook avant le remplacement d'un véhicule : mémorise s'il n'avait pas de système de sièges. *(interne)* *(hook)* | 1809 |
| `gameplay_seatOccupants.onBeforeWalkingModeToggled(enabled, _, player)` | Hook avant la bascule du mode marche : si le joueur passe à pied, lève le blocage de conduite. *(interne)* *(hook)* | 1878 |
| `gameplay_seatOccupants.onCameraChanged(player, camName, vid)` | Hook : la caméra d'un joueur change ; met à jour la visibilité des occupants (par ex. cacher la tête en vue à la première personne). *(interne)* *(hook)* | 1756 |
| `gameplay_seatOccupants.onClientStartMission()` | Hook : efface les forçages d'occupants et occupe le véhicule actuel du joueur 0. *(interne)* *(hook)* | 1865 |
| `gameplay_seatOccupants.onDeserialized(data)` | Hook : restaure l'état après rechargement Lua. *(interne)* *(hook)* | 1971 |
| `gameplay_seatOccupants.onExtensionLoaded(data)` | Hook : restaure l'état sérialisé s'il existe, sinon occupe les joueurs existants. *(interne)* *(hook)* | 1939 |
| `gameplay_seatOccupants.onExtensionUnloaded()` | Hook : retire les forçages, restaure les caméras et libère le masque d'action maps. *(interne)* *(hook)* | 1952 |
| `gameplay_seatOccupants.onLocalParticipantsChanged()` | Hook : recalcule présences et visuels quand les participants locaux changent. *(interne)* *(hook)* | 1870 |
| `gameplay_seatOccupants.onSerialize()` | Hook : sérialise présences et sièges occupés avant un rechargement Lua. *(interne)* *(hook)* | 1962 |
| `gameplay_seatOccupants.onSettingsChanged()` | Hook : réapplique les visuels des occupants (réglage enableSeatOccupants). *(interne)* *(hook)* | 1746 |
| `gameplay_seatOccupants.onSplitScreenChanged()` | Hook : recalcule présences et visuels après changement d'écran partagé. *(interne)* *(hook)* | 1750 |
| `gameplay_seatOccupants.onVehicleDestroyed(vehId)` | Hook : libère toutes les données d'occupation et de présence du véhicule détruit. *(interne)* *(hook)* | 1833 |
| `gameplay_seatOccupants.onVehicleReplaced(vehId)` | Hook après remplacement : réapplique l'état et réassigne les joueurs sans siège. *(interne)* *(hook)* | 1813 |
| `gameplay_seatOccupants.onVehicleResetted(vehId)` | Hook : réapplique poids et visuels après un reset. *(interne)* *(hook)* | 1826 |
| `gameplay_seatOccupants.onVehicleSpawned(vehId)` | Hook : réapplique poids et visuels pour un véhicule qui vient d'apparaître. *(interne)* *(hook)* | 1793 |
| `gameplay_seatOccupants.onVehicleSwitched(oldId, newId, player)` | Hook : le joueur change de véhicule ; met à jour son occupation. *(interne)* *(hook)* | 1612 |
| `gameplay_seatOccupants.onVehicleTriggerActionLabel(data)` | Hook pour personnaliser le libellé et l'icône de l'action « enterSeat » d'un trigger de siège (« S'asseoir ici », siège conducteur ou passager). *(interne)* *(hook)* | 1067 |
| `gameplay_seatOccupants.refreshOccupantMeshes(vehId)` | Réaffirme la visibilité des maillages d'occupants après une modification faite sans passer par les hooks de synchronisation (utilisé par gameplay_traffic). | 646 |
| `gameplay_seatOccupants.requestEnterBestSeat(vehId, player, walkingPos)` | Choisit un siège libre (en tenant compte de la position de marche éventuelle) et y installe le joueur. Sans siège libre, repasse en présence sans siège si le mode par défaut est 'unrestricted', sinon affiche « véhicule plein ». | 1202 |
| `gameplay_seatOccupants.requestEnterSeat(vehId, seatId, player, permissionOverride)` | Demande à un joueur de s'asseoir sur un siège donné, en entrant dans le véhicule si nécessaire (à pied ou en changeant de véhicule). Si le joueur est déjà sur ce siège, il sort (bascule en mode marche). Affiche un message si le siège est pris, si on ne peut pas quitter son siège, ou si le véhicule n'est pas accessible. | 1138 |
| `gameplay_seatOccupants.requestUnseatedPresence(player, vehId, permissionMode)` | Place un joueur dans le véhicule sans siège (présence « non assise »), avec un mode de permission optionnel. | 1217 |
| `gameplay_seatOccupants.salad(vehId)` | Retire 10 kg à chaque occupant (borné à 49) et affiche un message avec le poids. | 1501 |
| `gameplay_seatOccupants.setDummyOccupant(vehId, seatId, weight)` | Place un occupant factice (maillage coloré aléatoire) avec un poids sur un siège libre. | 1400 |
| `gameplay_seatOccupants.setOccupied(vehId, seatId, player, weight, permissionOverride)` | Place un joueur sur un siège (sans animation ni changement de véhicule). Libère ses autres sièges, enregistre la présence, applique le poids, met à jour les commandes et la caméra. | 842 |
| `gameplay_seatOccupants.setPlayerPermissionMode(player, permissionMode)` | Change le mode de permission d'un joueur déjà présent dans un véhicule. | 478 |
| `gameplay_seatOccupants.setVehicleOccupantsEnabledOverride(vehId, enabled)` | Force l'affichage (true) ou le masquage (false) des occupants d'un véhicule, indépendamment du réglage global ; nil retire le forçage. | 1718 |
| `gameplay_seatOccupants.showVehicleFullMessage(player)` | Affiche le message UI « véhicule plein » au joueur. | 379 |
| `gameplay_seatOccupants.switchSeat(player, direction)` | Passe au siège libre suivant (direction > 0) ou précédent (direction < 0) du véhicule actuel, le conducteur étant en tête de liste. | 1254 |
| `gameplay_seatOccupants.toggleUnseated(player)` | Bascule entre « assis » et « sans siège » dans le véhicule actuel. | 1300 |
| `gameplay_seatOccupants.usesSeatSystem(vehId)` | Indique si le véhicule utilise le système de sièges (occupantSystem.enabled, sinon présence d'emplacements d'occupants dans les données du véhicule). Toujours false si debugDisableOccupantSystem. | 85 |

### Détail des paramètres

#### `gameplay_seatOccupants.canEnterVehicle(vehId, player)`

Indique si le joueur peut entrer dans le véhicule (changement de véhicule ou marche autorisés).

- `vehId` (*integer*) : Identifiant du véhicule.
- `player` (*integer|nil*) : Indice du joueur (0 par défaut).
- **renvoie** : boolean true si l'entrée est possible.

#### `gameplay_seatOccupants.cheeseburger(vehId)`

Ajoute 10 kg à chaque occupant (borné à 119) et affiche un message avec le poids.

- `vehId` (*integer|nil*) : Véhicule ; défaut véhicule du joueur 0.
- **renvoie** : number|nil Poids affiché, nil si aucun occupant.

#### `gameplay_seatOccupants.clearDummyOccupant(vehId, seatId)`

Retire l'occupant factice d'un siège.

- `vehId` (*integer*) : Identifiant du véhicule.
- `seatId` (*string*) : Siège.
- **renvoie** : boolean true si retiré.
- **renvoie** : string|nil 'notDummy' si rien à retirer.

#### `gameplay_seatOccupants.clearDummyOccupants(vehId)`

Retire tous les occupants factices d'un véhicule, ou de tous les véhicules si vehId est nil.

- `vehId` (*integer|nil*) : Véhicule ciblé.
- **renvoie** : integer Nombre d'occupants retirés.

#### `gameplay_seatOccupants.clearOccupied(vehId, seatIdOrPlayer)`

Libère des sièges. Sans second argument : tous les occupants du véhicule. Avec un nombre : retire ce joueur de tous les véhicules.

- `vehId` (*integer|nil*) : Identifiant du véhicule.
- `seatIdOrPlayer` (*string|integer|nil*) : Nil pour tout le véhicule, un nombre pour un joueur ; un nom de siège est géré par le reste de la fonction (déduit du code).

#### `gameplay_seatOccupants.enterSeat(vehId, triggerId, player)`

Point d'entrée du déclencheur « enterSeat » d'un siège : retrouve le siège à partir du trigger puis appelle requestEnterSeat. En mode debug, entre en 'unrestricted' sans siège.

- `vehId` (*integer*) : Identifiant du véhicule.
- `triggerId` (*any*) : Identifiant du trigger de siège.
- `player` (*integer|nil*) : Joueur (0 par défaut).
- **renvoie** : boolean|nil true si assis.

#### `gameplay_seatOccupants.getDriverPlayer(vehId)`

Plus petit indice de joueur autorisé à conduire le véhicule (mode 'driver' ou 'unrestricted').

- `vehId` (*integer*) : Identifiant du véhicule.
- **renvoie** : integer|nil Indice du conducteur, nil s'il n'y a que des passagers.

#### `gameplay_seatOccupants.getOccupantSystemVersion(vehId)`

Version déclarée du système d'occupants dans les données du véhicule.

- `vehId` (*integer*) : Identifiant du véhicule.
- **renvoie** : any|nil Version, ou nil si absente.

#### `gameplay_seatOccupants.getPlayerPresence(player)`

Copie de la présence d'un joueur dans un véhicule.

- `player` (*integer|nil*) : Indice du joueur (0 par défaut).
- **renvoie** : table|nil {vehicleId, seatId?, permissionMode, permissionOverride?} ou nil.

#### `gameplay_seatOccupants.getSeatExitData(player, vehId)`

Calcule où le joueur sort du véhicule : point à côté de la carrosserie, du côté du siège (exitNode/exitSide de l'emplacement, sinon côté déduit de la position), décalé de 0,7 m au-delà de la carrosserie.

- `player` (*integer|nil*) : Joueur (0 par défaut).
- `vehId` (*integer|nil*) : Véhicule ; défaut véhicule du joueur.
- **renvoie** : vec3|nil Position de sortie.
- **renvoie** : vec3|nil Position du siège.

#### `gameplay_seatOccupants.getSeats(vehId)`

Liste les sièges d'un véhicule avec leur état.

- `vehId` (*integer*) : Identifiant du véhicule.
- **renvoie** : table[] Éléments {seatId, isDriver, occupied, occupantType ('player'|'dummy'), player, weight, color, permissionMode, displayName, defaultPermissionMode, cameraName, actionMaps, seatExitNode, seatExitSide, partPath, seatPartPath}.

#### `gameplay_seatOccupants.getVehiclePresences(vehId)`

Liste des présences des joueurs dans un véhicule, triée par joueur.

- `vehId` (*integer*) : Identifiant du véhicule.
- **renvoie** : table[] Éléments {player, seatId, permissionMode, unseated}.

#### `gameplay_seatOccupants.onBeforeVehicleReplaced(vehId)`

Hook avant le remplacement d'un véhicule : mémorise s'il n'avait pas de système de sièges.

- `vehId` (*integer*) : Identifiant du véhicule.

#### `gameplay_seatOccupants.onBeforeWalkingModeToggled(enabled, _, player)`

Hook avant la bascule du mode marche : si le joueur passe à pied, lève le blocage de conduite.

- `enabled` (*boolean*) : true si on passe à pied.
- `_` (*any*) : Non utilisé.
- `player` (*integer|nil*) : Indice du joueur.

#### `gameplay_seatOccupants.onCameraChanged(player, camName, vid)`

Hook : la caméra d'un joueur change ; met à jour la visibilité des occupants (par ex. cacher la tête en vue à la première personne).

- `player` (*integer|nil*) : Indice du joueur.
- `camName` (*string*) : Nom de la caméra.
- `vid` (*integer|nil*) : Véhicule de la caméra.

#### `gameplay_seatOccupants.onDeserialized(data)`

Hook : restaure l'état après rechargement Lua.

- `data` (*table*) : Données de onSerialize.

#### `gameplay_seatOccupants.onExtensionLoaded(data)`

Hook : restaure l'état sérialisé s'il existe, sinon occupe les joueurs existants.

- `data` (*table|nil*) : Données sérialisées.

#### `gameplay_seatOccupants.onSerialize()`

Hook : sérialise présences et sièges occupés avant un rechargement Lua.

- **renvoie** : table {version, playerPresence, seatClaims, occupancy}.

#### `gameplay_seatOccupants.onVehicleDestroyed(vehId)`

Hook : libère toutes les données d'occupation et de présence du véhicule détruit.

- `vehId` (*integer*) : Identifiant du véhicule.

#### `gameplay_seatOccupants.onVehicleReplaced(vehId)`

Hook après remplacement : réapplique l'état et réassigne les joueurs sans siège.

- `vehId` (*integer*) : Identifiant du véhicule.

#### `gameplay_seatOccupants.onVehicleResetted(vehId)`

Hook : réapplique poids et visuels après un reset.

- `vehId` (*integer*) : Identifiant du véhicule.

#### `gameplay_seatOccupants.onVehicleSpawned(vehId)`

Hook : réapplique poids et visuels pour un véhicule qui vient d'apparaître.

- `vehId` (*integer*) : Identifiant du véhicule.

#### `gameplay_seatOccupants.onVehicleSwitched(oldId, newId, player)`

Hook : le joueur change de véhicule ; met à jour son occupation.

- `oldId` (*integer*) : Ancien véhicule.
- `newId` (*integer*) : Nouveau véhicule.
- `player` (*integer|nil*) : Indice du joueur.

#### `gameplay_seatOccupants.onVehicleTriggerActionLabel(data)`

Hook pour personnaliser le libellé et l'icône de l'action « enterSeat » d'un trigger de siège (« S'asseoir ici », siège conducteur ou passager).

- `data` (*table*) : Table modifiée (actionName, vehicleId, player, title, icon).

#### `gameplay_seatOccupants.refreshOccupantMeshes(vehId)`

Réaffirme la visibilité des maillages d'occupants après une modification faite sans passer par les hooks de synchronisation (utilisé par gameplay_traffic).

- `vehId` (*integer*) : Identifiant du véhicule.

#### `gameplay_seatOccupants.requestEnterBestSeat(vehId, player, walkingPos)`

Choisit un siège libre (en tenant compte de la position de marche éventuelle) et y installe le joueur. Sans siège libre, repasse en présence sans siège si le mode par défaut est 'unrestricted', sinon affiche « véhicule plein ».

- `vehId` (*integer*) : Identifiant du véhicule.
- `player` (*integer|nil*) : Joueur.
- `walkingPos` (*vec3|nil*) : Position du joueur à pied pour choisir le siège le plus proche.
- **renvoie** : boolean|nil nil si le véhicule n'utilise pas le système de sièges.

#### `gameplay_seatOccupants.requestEnterSeat(vehId, seatId, player, permissionOverride)`

Demande à un joueur de s'asseoir sur un siège donné, en entrant dans le véhicule si nécessaire (à pied ou en changeant de véhicule). Si le joueur est déjà sur ce siège, il sort (bascule en mode marche). Affiche un message si le siège est pris, si on ne peut pas quitter son siège, ou si le véhicule n'est pas accessible.

- `vehId` (*integer*) : Identifiant du véhicule.
- `seatId` (*string*) : Siège visé.
- `player` (*integer|nil*) : Joueur (0 par défaut).
- `permissionOverride` (*string|nil*) : Mode de permission imposé.
- **renvoie** : boolean|nil true si le joueur est au final sur ce siège (ou sort) ; nil si vehId ou seatId manquent.

#### `gameplay_seatOccupants.requestUnseatedPresence(player, vehId, permissionMode)`

Place un joueur dans le véhicule sans siège (présence « non assise »), avec un mode de permission optionnel.

- `player` (*integer|nil*) : Joueur.
- `vehId` (*integer*) : Identifiant du véhicule.
- `permissionMode` (*string|nil*) : 'driver', 'passenger' ou 'unrestricted'.
- **renvoie** : boolean true si la présence sans siège est établie.
- **renvoie** : string|nil 'invalidVehicle' ou 'invalidPermissionMode' en cas d'échec.

#### `gameplay_seatOccupants.salad(vehId)`

Retire 10 kg à chaque occupant (borné à 49) et affiche un message avec le poids.

- `vehId` (*integer|nil*) : Véhicule ; défaut véhicule du joueur 0.
- **renvoie** : number|nil Poids affiché, nil si aucun occupant.

#### `gameplay_seatOccupants.setDummyOccupant(vehId, seatId, weight)`

Place un occupant factice (maillage coloré aléatoire) avec un poids sur un siège libre.

- `vehId` (*integer*) : Identifiant du véhicule.
- `seatId` (*string*) : Siège.
- `weight` (*number|nil*) : Poids ; défaut 89, minimum 0.
- **renvoie** : boolean true si placé.
- **renvoie** : string|nil 'invalidVehicle', 'invalidSeat', 'occupied' ou 'reserved'.

#### `gameplay_seatOccupants.setOccupied(vehId, seatId, player, weight, permissionOverride)`

Place un joueur sur un siège (sans animation ni changement de véhicule). Libère ses autres sièges, enregistre la présence, applique le poids, met à jour les commandes et la caméra.

- `vehId` (*integer*) : Identifiant du véhicule.
- `seatId` (*string|nil*) : Siège ; défaut le siège conducteur.
- `player` (*integer|nil*) : Joueur (0 par défaut).
- `weight` (*number|nil*) : Poids de l'occupant (défaut 89).
- `permissionOverride` (*string|nil*) : Mode de permission imposé.
- **renvoie** : boolean false si véhicule invalide, siège invalide ou indisponible.

#### `gameplay_seatOccupants.setPlayerPermissionMode(player, permissionMode)`

Change le mode de permission d'un joueur déjà présent dans un véhicule.

- `player` (*integer|nil*) : Indice du joueur (0 par défaut).
- `permissionMode` (*string*) : 'driver', 'passenger' ou 'unrestricted'.
- **renvoie** : boolean true si appliqué.
- **renvoie** : string|nil Cause d'échec : 'invalidPermissionMode' ou 'noPresence'.

#### `gameplay_seatOccupants.setVehicleOccupantsEnabledOverride(vehId, enabled)`

Force l'affichage (true) ou le masquage (false) des occupants d'un véhicule, indépendamment du réglage global ; nil retire le forçage.

- `vehId` (*integer*) : Identifiant du véhicule.
- `enabled` (*boolean|nil*) : Forçage.
- **renvoie** : boolean false si le véhicule n'existe pas.

#### `gameplay_seatOccupants.showVehicleFullMessage(player)`

Affiche le message UI « véhicule plein » au joueur.

- `player` (*integer|nil*) : Indice du joueur.

#### `gameplay_seatOccupants.switchSeat(player, direction)`

Passe au siège libre suivant (direction > 0) ou précédent (direction < 0) du véhicule actuel, le conducteur étant en tête de liste.

- `player` (*integer|nil*) : Joueur.
- `direction` (*integer|nil*) : Sens ; 1 par défaut.
- **renvoie** : boolean true si un siège a été pris.

#### `gameplay_seatOccupants.toggleUnseated(player)`

Bascule entre « assis » et « sans siège » dans le véhicule actuel.

- `player` (*integer|nil*) : Joueur.
- **renvoie** : boolean Succès.

#### `gameplay_seatOccupants.usesSeatSystem(vehId)`

Indique si le véhicule utilise le système de sièges (occupantSystem.enabled, sinon présence d'emplacements d'occupants dans les données du véhicule). Toujours false si debugDisableOccupantSystem.

- `vehId` (*integer*) : Identifiant du véhicule.
- **renvoie** : boolean true si le véhicule a des sièges gérés.

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugDisableOccupantSystem` | boolean | Debug : désactive tout le système de sièges et revient au comportement ancien (false par défaut). |
| `debugDisableOccupantWeight` | boolean | Debug : désactive l'ajout du poids des occupants (false par défaut). |
| `dependencies` | string[] | Extensions chargées avant (core_camera, core_vehicle_manager, core_input_actionFilter, core_gamestate, core_multiseat, ui_vehicleSelector_vehicleSpecifications). |
| `enablePresenceDebugMessages` | boolean | Affiche un message à chaque changement de présence (false par défaut). |
| `enableSeatEjection` | boolean | Si true, enterSeat éjecte (mode marche) le joueur déjà assis sur ce siège (false par défaut). |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onPlayerVehiclePresenceChanged` — écouté par 2 module(s)
- `onResolveVehiclePresenceMode`
- `onSeatOccupantEnter` — écouté par 2 module(s)
- `onSeatOccupantExit` — écouté par 2 module(s)

**Évènements UI (guihooks.trigger) :** `Message`

## Appels vers le moteur (C++)

- `be:` `enterVehicle`, `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfAxisXYZ`, `getObjectOOBBIsInitialized`, `getPlayerVehicle`, `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/seatOccupants.lua`.*
