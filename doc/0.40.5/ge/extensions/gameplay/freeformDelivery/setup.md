# `gameplay_freeformDelivery_setup`

*Fichier : `lua/ge/extensions/gameplay/freeformDelivery/setup.lua` · VM : Game Engine (GE) · 689 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_freeformDelivery_setup` : `extensions.load("gameplay_freeformDelivery_setup")`, puis la globale `gameplay_freeformDelivery_setup`

Mise en place et démontage d'une livraison libre. Associe les véhicules déjà spawnés par le chargeur (delivery._vehicleIndex, par internalName) aux ID de la livraison, applique leur état de départ (mode de boîte, rapport, moteur, niveau d'allumage), enregistre des aperçus, planifie les attelages (couplings) via util_stepHandler, place le joueur (dans un véhicule, à pied ou sur une place de parking) et mémorise les positions initiales pour un reset.

## Remarques

- Les véhicules ne sont pas spawnés ici : setup() les retrouve via delivery._vehicleIndex[internalName] ; une entrée manquante est loguée en erreur et ignorée.
- startupCode accepte driveMode (setGearboxMode), gear (setGear sur le dispositif transmission), engineOn (startEngine/stopEngine) ; setIgnitionLevel passe par core_vehicleBridge.executeAction.
- playerStart.type : "vehicle" (vehicleId), "walking" (position {x,y,z}, rotation {x,y,z,w} facultative) ou "parkingSpot" (targetAreaId d'une zone de type parkingSpot).
- Attelages : attente que les véhicules soient prêts (8 s max), activation via beamstate.activateAutoCoupling(nodeTag), puis vérification dans core_trailerRespawn (8 s max). Les temporisations sont des garde-fous : au timeout la séquence continue sans bloquer.
- Vérifier isSetupComplete() avant de démarrer : il reste false tant qu'un véhicule n'est pas prêt ou qu'un attelage est en attente.
- Un véhicule avec enterable == false est ajouté à la liste noire de gameplay_walk.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_freeformDelivery_setup.cleanup(delivery, keepVehicles)` | Démonte la livraison : si keepVehicles, extrait les véhicules des préfabs (explosion du préfab) et les remet dans MissionGroup ; supprime les préfabs créés (et recharge la collision si besoin) ; sinon supprime les véhicules. Vide ensuite tout l'état. *(interne)* | 568 |
| `gameplay_freeformDelivery_setup.freezeAllVehicles(freeze)` | Gèle ou dégèle tous les véhicules de la livraison (action setFreeze via core_vehicleBridge). | 557 |
| `gameplay_freeformDelivery_setup.getAllCouplingSetup()` | Renvoie la liste des attelages collectés lors du dernier setup. | 549 |
| `gameplay_freeformDelivery_setup.getPendingCouplings()` | Liste des ID de véhicules dont un attelage est en attente. | 541 |
| `gameplay_freeformDelivery_setup.getSpawnedVehicles()` | Renvoie les véhicules indexés par ID d'objet. | 553 |
| `gameplay_freeformDelivery_setup.getVehicleId(deliveryVehicleId)` | Convertit un ID de véhicule de livraison en ID d'objet du jeu. | 529 |
| `gameplay_freeformDelivery_setup.isSetupComplete()` | Indique si la mise en place asynchrone est terminée (tous les véhicules prêts et aucun attelage en attente). Quand c'est le cas, remet setupInProgress à false. | 466 |
| `gameplay_freeformDelivery_setup.isSetupInProgress()` | Renvoie le drapeau interne de mise en place en cours. | 533 |
| `gameplay_freeformDelivery_setup.restoreVehicleTransforms()` | Remet chaque véhicule à sa position/rotation initiale (reset physique, flexmesh réparé), réapplique l'état de départ puis relance la séquence d'attelages. | 490 |
| `gameplay_freeformDelivery_setup.setup(delivery)` | Prépare la livraison : résout les images des zones cibles, indexe les véhicules spawnés, applique l'état de départ, blacklist les véhicules non enterables, collecte et lance les attelages, place le joueur et stocke les transformations initiales. *(interne)* | 394 |
| `gameplay_freeformDelivery_setup.setupPlayer(delivery)` | Place le joueur selon delivery.playerStart (véhicule, marche à une position, ou marche sur une place de parking). | 537 |

### Détail des paramètres

#### `gameplay_freeformDelivery_setup.cleanup(delivery, keepVehicles)`

Démonte la livraison : si keepVehicles, extrait les véhicules des préfabs (explosion du préfab) et les remet dans MissionGroup ; supprime les préfabs créés (et recharge la collision si besoin) ; sinon supprime les véhicules. Vide ensuite tout l'état.

- `delivery` (*table|nil*) : Données de livraison (_prefabIds, _hasColliders).
- `keepVehicles` (*boolean|nil*) : true pour conserver les véhicules (faux par défaut).

#### `gameplay_freeformDelivery_setup.freezeAllVehicles(freeze)`

Gèle ou dégèle tous les véhicules de la livraison (action setFreeze via core_vehicleBridge).

- `freeze` (*boolean|nil*) : true par défaut ; false pour dégeler.

#### `gameplay_freeformDelivery_setup.getAllCouplingSetup()`

Renvoie la liste des attelages collectés lors du dernier setup.

- **renvoie** : table[] Entrées {vehId, nodeTag, targetVehId}.

#### `gameplay_freeformDelivery_setup.getPendingCouplings()`

Liste des ID de véhicules dont un attelage est en attente.

- **renvoie** : integer[] ID d'objets.

#### `gameplay_freeformDelivery_setup.getSpawnedVehicles()`

Renvoie les véhicules indexés par ID d'objet.

- **renvoie** : table<integer, table> Entrées {vehicleId, vehicle, deliveryVehicle}.

#### `gameplay_freeformDelivery_setup.getVehicleId(deliveryVehicleId)`

Convertit un ID de véhicule de livraison en ID d'objet du jeu.

- `deliveryVehicleId` (*string*) : ID du véhicule dans la définition de livraison.
- **renvoie** : integer|nil ID d'objet ou nil.

#### `gameplay_freeformDelivery_setup.isSetupComplete()`

Indique si la mise en place asynchrone est terminée (tous les véhicules prêts et aucun attelage en attente). Quand c'est le cas, remet setupInProgress à false.

- **renvoie** : boolean true si terminée ou non démarrée.

#### `gameplay_freeformDelivery_setup.isSetupInProgress()`

Renvoie le drapeau interne de mise en place en cours.

- **renvoie** : boolean true tant que setup/reset n'est pas terminé.

#### `gameplay_freeformDelivery_setup.setup(delivery)`

Prépare la livraison : résout les images des zones cibles, indexe les véhicules spawnés, applique l'état de départ, blacklist les véhicules non enterables, collecte et lance les attelages, place le joueur et stocke les transformations initiales.

- `delivery` (*table*) : Données de livraison (vehicles, targetAreas, playerStart, _vehicleIndex, _basePath...).
- **renvoie** : boolean false si delivery est nil, sinon true (les opérations asynchrones continuent ensuite).

#### `gameplay_freeformDelivery_setup.setupPlayer(delivery)`

Place le joueur selon delivery.playerStart (véhicule, marche à une position, ou marche sur une place de parking).

- `delivery` (*table*) : Données de livraison contenant playerStart.

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `Sim.` `upcast`
- `be:` `exitVehicle`, `reloadCollision`
- `scenetree.` `findObjectById`

**Charge les extensions :** `util_stepHandler`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/freeformDelivery/setup.lua`.*
