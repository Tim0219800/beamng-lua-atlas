# `career_modules_inspectVehicle`

*Fichier : `lua/ge/extensions/career/modules/inspectVehicle.lua` · VM : Game Engine (GE) · 539 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_inspectVehicle` : `extensions.load("career_modules_inspectVehicle")`, puis la globale `career_modules_inspectVehicle`

Gère l'inspection d'un véhicule à vendre (concession ou vendeur privé) en mode carrière avant achat. startInspection fait apparaître le véhicule gelé sur une place de parking, soit en téléportant le joueur, soit en lui donnant un trajet GPS à parcourir dans un temps limité ; une fois arrivé, un « tether » (laisse de distance) limite l'éloignement. Le module définit les règles d'essai (testDriveInfo : durée 60 s, zone, route, frais d'abandon), ouvre le menu d'achat, démarre l'essai via career_modules_testDrive, publie un point d'intérêt (POI) et nettoie à la fin (achat, abandon, trop loin, véhicule déplacé, mode livraison ou mission lancé).

## Remarques

- Constantes : distance de départ du vendeur 25 m (leaveSaleDist), arrivée à l'inspection à moins de 20 m avec ligne de vue (castRayStatic), véhicule déplacé de plus de 10 m de sa place = vente annulée, tether du menu d'achat 3 m, essai de 60 s.
- Temps pour arriver à l'inspection : longueur du chemin GPS / 5 (m/s), arrondie à la minute supérieure ; au bout, la vente est annulée (sellerTimedOut).
- Le véhicule inspecté est gelé (setFreeze) et contact coupé ; il est réinitialisé avec partCondition.initConditions selon son kilométrage (vehicleInfo.Mileage).
- leaveSaleCallback modes de despawn : 'despawn' (supprime le véhicule), 'flagForDeletion' (marque pour suppression par career_modules_vehicleDeletionService), 'dontDespawn' (défaut : le garde, gelé si freezePreviousVeh).
- Bug : repairVehicle utilise la variable `vehId` qui n'est définie nulle part dans la fonction (nil) : payRepairIfNeededGenericVeh reçoit nil. Le code est indiqué « utilisé seulement pendant le tutoriel ».
- Bug : leaveSaleCallback teste `dontShowLeaveSaleMessage`, variable globale jamais définie (nil) : le message de départ s'affiche toujours.
- Les marqueurs POI de type 'inspectVehicle' sont ajoutés à la liste des POI via onGetRawPoiListForLevel et l'invite d'activité propose « voir les informations d'achat ».

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_inspectVehicle.buySpawnedVehicle(buyVehicleOptions)` | Achète le véhicule inspecté via career_modules_vehicleShopping puis quitte la vente en le conservant. | 293 |
| `career_modules_inspectVehicle.getDidTestDrive()` | Indique si le joueur a fait l'essai pendant cette inspection. | 471 |
| `career_modules_inspectVehicle.getInspectVehiclePoi()` | Construit le POI du véhicule inspecté (marqueur inspectVehicleMarker sur la place de départ ; marqueur de grande carte si le joueur doit s'y rendre). | 403 |
| `career_modules_inspectVehicle.getSpawnedVehicleInfo()` | Infos du véhicule actuellement inspecté. | 388 |
| `career_modules_inspectVehicle.isTestDriveDamageDetected()` | Indique si des dégâts ont été détectés pendant l'essai. | 368 |
| `career_modules_inspectVehicle.leaveSaleCallback(despawnPreviousVehMode, freezePreviousVeh, checkDamage, defaultLeaveMessage)` | Termine la vente en cours (laisse dépassée, abandon, achat…) : ferme les menus, abandonne l'essai si actif, déclare une réclamation de dégâts d'essai s'il y a lieu, gère le véhicule selon despawnPreviousVehMode, puis réinitialise l'état. Ignoré sans véhicule inspecté ou si un départ est déjà en cours. *(interne)* | 157 |
| `career_modules_inspectVehicle.onActivityAcceptGatherData(elemData, activityData)` | Hook du prompt d'activité : pour un élément de type inspectVehicle, ajoute une carte avec le nom du véhicule, le vendeur et un bouton qui ouvre le menu d'achat avec tether. *(interne)* *(hook)* | 443 |
| `career_modules_inspectVehicle.onAnyMissionChanged(status, id)` | Hook : quand une mission démarre en carrière, quitte la vente et supprime le véhicule. *(interne)* *(hook)* | 372 |
| `career_modules_inspectVehicle.onDeliveryModeStarted()` | Hook : le début du mode livraison termine l'inspection et supprime le véhicule. *(interne)* *(hook)* | 379 |
| `career_modules_inspectVehicle.onGetRawPoiListForLevel(levelIdentifier, elements)` | Hook de collecte des POI : ajoute le POI d'inspection à la liste. *(interne)* *(hook)* | 436 |
| `career_modules_inspectVehicle.onPurchaseMenuClosed()` | Hook : le menu d'achat est fermé ; retire le tether sphérique du menu. *(interne)* *(hook)* | 475 |
| `career_modules_inspectVehicle.onTestDriveAbandoned()` | Hook : essai abandonné ; quitte la vente (véhicule marqué pour suppression). *(interne)* *(hook)* | 482 |
| `career_modules_inspectVehicle.onTestDriveDamageDetected()` | Hook : un dégât a été détecté pendant l'essai. *(interne)* *(hook)* | 364 |
| `career_modules_inspectVehicle.onTestDriveEndedAfterFade()` | Hook : essai terminé après fondu ; réarme les tethers et rouvre le menu d'achat. *(interne)* *(hook)* | 486 |
| `career_modules_inspectVehicle.onTestDriveStarted()` | Hook de début d'essai : note qu'un essai a eu lieu et retire les tethers. *(interne)* *(hook)* | 356 |
| `career_modules_inspectVehicle.onUpdate(dtReal, dtSim, dtRaw)` | Hook par image : détecte le déplacement du véhicule à vendre, décompte le temps imparti pour arriver et détecte l'arrivée du joueur. *(interne)* *(hook)* | 333 |
| `career_modules_inspectVehicle.onVehicleDestroyed(vehId)` | Hook : si le véhicule inspecté est détruit, réinitialise l'inspection. *(interne)* *(hook)* | 349 |
| `career_modules_inspectVehicle.onVehicleSwitched(oldId, newId, player)` | Hook : si le joueur passe dans le véhicule inspecté hors essai, le regèle. *(interne)* *(hook)* | 502 |
| `career_modules_inspectVehicle.repairVehicle()` | Utilisé seulement dans le tutoriel : fondu d'écran puis paiement de la réparation d'un véhicule générique (voir bug dans notes : vehId non défini). *(interne)* | 393 |
| `career_modules_inspectVehicle.showVehicle(vehicleInfo)` | Fait apparaître le véhicule à vendre (shopId) sans l'activer (contact coupé, gelé, conditions de pièces initialisées) et mémorise ses infos (shopId, vehId, nom, valeur). | 98 |
| `career_modules_inspectVehicle.startInspection(vehicleInfo, teleportToVehicle, job)` | Démarre l'inspection : ferme une inspection précédente, fait apparaître le véhicule, choisit la place de parking (celle du vendeur privé, ou la meilleure place de la concession), déplace d'éventuels véhicules gênants, place le véhicule, puis téléporte le joueur (quickTravel) ou lui trace un chemin GPS avec limite de temps. Définit les règles d'essai. | 222 |
| `career_modules_inspectVehicle.startTestDrive()` | Ferme les menus et démarre l'essai du véhicule inspecté avec les règles testDriveInfo. | 383 |

### Détail des paramètres

#### `career_modules_inspectVehicle.buySpawnedVehicle(buyVehicleOptions)`

Achète le véhicule inspecté via career_modules_vehicleShopping puis quitte la vente en le conservant.

- `buyVehicleOptions` (*table*) : Options d'achat transmises à vehicleShopping.buySpawnedVehicle.

#### `career_modules_inspectVehicle.getDidTestDrive()`

Indique si le joueur a fait l'essai pendant cette inspection.

- **renvoie** : boolean|nil true si un essai a eu lieu.

#### `career_modules_inspectVehicle.getInspectVehiclePoi()`

Construit le POI du véhicule inspecté (marqueur inspectVehicleMarker sur la place de départ ; marqueur de grande carte si le joueur doit s'y rendre).

- **renvoie** : table|nil POI ou nil si carrière inactive / pas d'essai défini.

#### `career_modules_inspectVehicle.getSpawnedVehicleInfo()`

Infos du véhicule actuellement inspecté.

- **renvoie** : table|nil {shopId, vehId, name, value} ou nil.

#### `career_modules_inspectVehicle.isTestDriveDamageDetected()`

Indique si des dégâts ont été détectés pendant l'essai.

- **renvoie** : boolean true si oui.

#### `career_modules_inspectVehicle.leaveSaleCallback(despawnPreviousVehMode, freezePreviousVeh, checkDamage, defaultLeaveMessage)`

Termine la vente en cours (laisse dépassée, abandon, achat…) : ferme les menus, abandonne l'essai si actif, déclare une réclamation de dégâts d'essai s'il y a lieu, gère le véhicule selon despawnPreviousVehMode, puis réinitialise l'état. Ignoré sans véhicule inspecté ou si un départ est déjà en cours.

- `despawnPreviousVehMode` (*string|nil*) : 'despawn', 'flagForDeletion' ou 'dontDespawn' (défaut).
- `freezePreviousVeh` (*boolean|nil*) : Geler le véhicule s'il est gardé ; true par défaut.
- `checkDamage` (*boolean|nil*) : Vérifier les dégâts après un essai ; true par défaut.
- `defaultLeaveMessage` (*string|nil*) : Message affiché si aucun essai actif ; « leftSale » par défaut.

#### `career_modules_inspectVehicle.onActivityAcceptGatherData(elemData, activityData)`

Hook du prompt d'activité : pour un élément de type inspectVehicle, ajoute une carte avec le nom du véhicule, le vendeur et un bouton qui ouvre le menu d'achat avec tether.

- `elemData` (*table*) : Éléments proches.
- `activityData` (*table*) : Données d'activité à compléter.

#### `career_modules_inspectVehicle.onAnyMissionChanged(status, id)`

Hook : quand une mission démarre en carrière, quitte la vente et supprime le véhicule.

- `status` (*string*) : État de la mission ('started'…).
- `id` (*string*) : Identifiant de la mission.

#### `career_modules_inspectVehicle.onGetRawPoiListForLevel(levelIdentifier, elements)`

Hook de collecte des POI : ajoute le POI d'inspection à la liste.

- `levelIdentifier` (*string*) : Niveau courant.
- `elements` (*table*) : Liste de POI à compléter.

#### `career_modules_inspectVehicle.onUpdate(dtReal, dtSim, dtRaw)`

Hook par image : détecte le déplacement du véhicule à vendre, décompte le temps imparti pour arriver et détecte l'arrivée du joueur.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps de simulation (s).
- `dtRaw` (*number*) : Delta temps brut (s).

#### `career_modules_inspectVehicle.onVehicleDestroyed(vehId)`

Hook : si le véhicule inspecté est détruit, réinitialise l'inspection.

- `vehId` (*integer*) : Véhicule supprimé.

#### `career_modules_inspectVehicle.onVehicleSwitched(oldId, newId, player)`

Hook : si le joueur passe dans le véhicule inspecté hors essai, le regèle.

- `oldId` (*integer*) : Ancien véhicule.
- `newId` (*integer*) : Nouveau véhicule.
- `player` (*integer*) : Joueur concerné.

#### `career_modules_inspectVehicle.showVehicle(vehicleInfo)`

Fait apparaître le véhicule à vendre (shopId) sans l'activer (contact coupé, gelé, conditions de pièces initialisées) et mémorise ses infos (shopId, vehId, nom, valeur).

- `vehicleInfo` (*table|nil*) : Infos de l'annonce (shopId, Brand, Name, Value…).
- **renvoie** : userdata|nil Objet véhicule, nil en cas d'échec.

#### `career_modules_inspectVehicle.startInspection(vehicleInfo, teleportToVehicle, job)`

Démarre l'inspection : ferme une inspection précédente, fait apparaître le véhicule, choisit la place de parking (celle du vendeur privé, ou la meilleure place de la concession), déplace d'éventuels véhicules gênants, place le véhicule, puis téléporte le joueur (quickTravel) ou lui trace un chemin GPS avec limite de temps. Définit les règles d'essai.

- `vehicleInfo` (*table*) : Annonce (shopId, sellerId, parkingSpotName pour un privé…).
- `teleportToVehicle` (*boolean*) : true pour téléporter le joueur à la place du véhicule.
- `job` (*table|nil*) : Job coroutine existant ; sinon un job est créé.
- **renvoie** : boolean|nil Avec un job fourni : true si démarré, false si le spawn échoue ; sans job : nil (asynchrone).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table | Table vide : aucune dépendance. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/inspectVehicle.lua`.*
