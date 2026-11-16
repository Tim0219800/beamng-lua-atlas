# `career_modules_delivery_vehicleTasks`

*Fichier : `lua/ge/extensions/career/modules/delivery/vehicleTasks.lua` · VM : Game Engine (GE) · 713 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_delivery_vehicleTasks` : `extensions.load("career_modules_delivery_vehicleTasks")`, puis la globale `career_modules_delivery_vehicleTasks`

Exécute les tâches de livraison de véhicules et de remorques acceptées en carrière. Chaque offre devient un taskData avec une suite d'étapes (coupleTrailer ou enterVehicle, bringToDestination, confirmDropOff), un index d'étape actif et un chemin GPS (core_groundMarkers). onUpdate fait avancer les étapes selon la position et les attelages, gère la fin de livraison (suppression du véhicule, retrait de la tâche), l'abandon (amende) et calcule les récompenses détaillées (dégâts, détours, retards, organisation prêteuse, niveau de branche, précision de stationnement).

## Remarques

- Étapes générées par expandTasks : trailerDropOff = coupleTrailer, bringToDestination (backOn='unCouple'), confirmDropOff ; vehicleDropOff = enterVehicle, bringToDestination (backOn='exitVehicle'), confirmDropOff.
- Bug probable : expandTasks écrit backOn = 'unCouple' (C majuscule) alors que processActiveTask teste 'uncouple' : le retour en arrière à la désolidarisation d'une remorque ne se déclenche jamais.
- L'étape putIntoParkingSpot est gérée par processActiveTask (checkParking, forwardOn 'unCouple'/'exitVehicle') et par tasklist, mais expandTasks ne la génère jamais dans cette version. Là aussi forwardOn est comparé à 'unCouple' alors que tasklist teste 'uncouple'.
- Seuil d'arrivée à destination : 20 m (distance au carré 400) entre le véhicule et le parking.
- Récompenses : >= 25 % de pièces cassées = argent perdu entièrement et réputation x-2 ; au-delà du seuil de pièces cassées (valueCalculator) = réduction linéaire ; sinon +5 % d'argent. Bonus « pas de détour » (distance < 1.2x la distance d'origine) et « pas de retard » (temps < distance/12 + 30 s) : +15 % d'argent + 10, +12.5 % de réputation, seulement si aucune pièce cassée en excès.
- Les bonus de précision de stationnement sont calculés une seconde fois ici (au lieu de precisionParking.calculateVehiclePrecisionParking) et le bonus logistique est basé sur originalRewards['logistics'].
- Les handlers onCouplerAttached/onCouplerDetached sont dans un bloc commenté : ils ne sont pas exportés.
- navigateToTask change le chemin GPS : une seule destination est suivie à la fois (la dernière tâche ajoutée).

**Dépendances (chargées avant) :** `util_stepHandler`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_delivery_vehicleTasks.abandonAllVehicleTasks()` | Supprime les véhicules de toutes les tâches (le joueur repasse à pied si dans l'un d'eux) et vide la liste, sans appliquer d'amende. | 674 |
| `career_modules_delivery_vehicleTasks.addVehicleTask(vehId, offer)` | Crée le taskData d'une offre (étapes selon le type d'offre, index actif 1, horodatage de départ), l'ajoute à la liste, met à jour la tasklist et lance la navigation vers la première étape. | 73 |
| `career_modules_delivery_vehicleTasks.canDropOffCargoAtPsPath(psPath)` | Compte les véhicules et remorques dont l'étape active est confirmDropOff à cette place de parking. | 420 |
| `career_modules_delivery_vehicleTasks.drawDebugMenu()` | Fenêtre ImGui de debug « Trailer Tasks Debug » qui affiche vehicleTasks avec dumps. | 700 |
| `career_modules_delivery_vehicleTasks.finishTasks(offerIds)` | Termine les tâches des offres données : mémorise la place de dépôt, lit pièces cassées et odomètre, calcule les récompenses, puis marque finished. Le véhicule est supprimé et la tâche retirée à une mise à jour ultérieure (processFinished). | 434 |
| `career_modules_delivery_vehicleTasks.getFineForAbandon(taskData)` | Calcule l'amende d'abandon : -(argent de l'offre) x facteur de pénalité de la livraison, et la pénalité de réputation de l'organisation (événement discardDeliveryVehicle). | 527 |
| `career_modules_delivery_vehicleTasks.getFineForAbandonAllVehicleTasks()` | Somme des amendes d'abandon de toutes les tâches de véhicules. | 663 |
| `career_modules_delivery_vehicleTasks.getTargetDestinationsForActiveTasks()` | Liste les destinations de toutes les étapes de toutes les tâches. | 624 |
| `career_modules_delivery_vehicleTasks.getVehicleDataWithRewardsSummary()` | Prépare les données de récompense des véhicules prêts à être déposés (étape confirmDropOff) pour l'écran de dépôt : lit les pièces cassées et l'odomètre, calcule originalRewards/breakdown/adjustedRewards, puis appelle progress.openDropOffScreenGatheringComplete. Renvoie la liste formatée (finished passe à true plus tard). | 362 |
| `career_modules_delivery_vehicleTasks.getVehicleTaskForOffer(offer)` | Cherche la tâche correspondant à une offre. | 686 |
| `career_modules_delivery_vehicleTasks.getVehicleTasks()` | Renvoie la liste (référence) des tâches de véhicules en cours. | 658 |
| `career_modules_delivery_vehicleTasks.giveBackDeliveryVehicle(vehId)` | Marque la tâche du véhicule comme rendue (giveBack) ; processGiveBack supprimera le véhicule, appliquera l'amende et affichera un message. | 648 |
| `career_modules_delivery_vehicleTasks.isVehicleDeliveryVehicle(vehId)` | Indique si ce véhicule est le véhicule d'une tâche de livraison en cours. | 638 |
| `career_modules_delivery_vehicleTasks.navigateToNextTask()` | Relance le chemin GPS vers l'étape active de la dernière tâche de la liste. | 571 |
| `career_modules_delivery_vehicleTasks.onCareerActivated()` | Hook appelé à l'activation de la carrière : mémorise les extensions de livraison et util_stepHandler. *(interne)* *(hook)* | 8 |
| `career_modules_delivery_vehicleTasks.onTrailerAttached(objId1, objId2)` | Hook appelé quand une remorque est attelée : met à jour les organisations prêteuses (loaner) de chaque tâche de véhicule. *(interne)* *(hook)* | 201 |
| `career_modules_delivery_vehicleTasks.onUpdate(dtReal, dtSim, dtRaw)` | Hook par image : fait avancer ou reculer les étapes selon la position, l'attelage et le véhicule contrôlé, traite les tâches terminées et rendues, retire les tâches finies, quitte le mode livraison si besoin et met à jour la navigation. *(interne)* *(hook)* | 578 |

### Détail des paramètres

#### `career_modules_delivery_vehicleTasks.addVehicleTask(vehId, offer)`

Crée le taskData d'une offre (étapes selon le type d'offre, index actif 1, horodatage de départ), l'ajoute à la liste, met à jour la tasklist et lance la navigation vers la première étape.

- `vehId` (*integer*) : Identifiant du véhicule ou de la remorque.
- `offer` (*table*) : Offre acceptée (task.type 'trailerDropOff' ou 'vehicleDropOff').

#### `career_modules_delivery_vehicleTasks.canDropOffCargoAtPsPath(psPath)`

Compte les véhicules et remorques dont l'étape active est confirmDropOff à cette place de parking.

- `psPath` (*string*) : Chemin de la place de parking.
- **renvoie** : integer Nombre de véhicules.
- **renvoie** : integer Nombre de remorques.

#### `career_modules_delivery_vehicleTasks.finishTasks(offerIds)`

Termine les tâches des offres données : mémorise la place de dépôt, lit pièces cassées et odomètre, calcule les récompenses, puis marque finished. Le véhicule est supprimé et la tâche retirée à une mise à jour ultérieure (processFinished).

- `offerIds` (*table*) : Liste d'identifiants d'offres.
- **renvoie** : table Liste des taskData concernés (finished mis à jour de façon asynchrone).

#### `career_modules_delivery_vehicleTasks.getFineForAbandon(taskData)`

Calcule l'amende d'abandon : -(argent de l'offre) x facteur de pénalité de la livraison, et la pénalité de réputation de l'organisation (événement discardDeliveryVehicle).

- `taskData` (*table*) : Tâche de véhicule.
- **renvoie** : table<string, number> Montants à ajouter (négatifs) : money et éventuellement <org>Reputation.

#### `career_modules_delivery_vehicleTasks.getFineForAbandonAllVehicleTasks()`

Somme des amendes d'abandon de toutes les tâches de véhicules.

- **renvoie** : table<string, number> Montants cumulés par attribut.

#### `career_modules_delivery_vehicleTasks.getTargetDestinationsForActiveTasks()`

Liste les destinations de toutes les étapes de toutes les tâches.

- **renvoie** : table Liste de destinations (psPath, facId…).

#### `career_modules_delivery_vehicleTasks.getVehicleDataWithRewardsSummary()`

Prépare les données de récompense des véhicules prêts à être déposés (étape confirmDropOff) pour l'écran de dépôt : lit les pièces cassées et l'odomètre, calcule originalRewards/breakdown/adjustedRewards, puis appelle progress.openDropOffScreenGatheringComplete. Renvoie la liste formatée (finished passe à true plus tard).

- **renvoie** : table Liste d'offres formatées pour l'UI.

#### `career_modules_delivery_vehicleTasks.getVehicleTaskForOffer(offer)`

Cherche la tâche correspondant à une offre.

- `offer` (*table*) : Offre (champ id).
- **renvoie** : table|nil taskData ou nil.

#### `career_modules_delivery_vehicleTasks.getVehicleTasks()`

Renvoie la liste (référence) des tâches de véhicules en cours.

- **renvoie** : table Liste de taskData.

#### `career_modules_delivery_vehicleTasks.giveBackDeliveryVehicle(vehId)`

Marque la tâche du véhicule comme rendue (giveBack) ; processGiveBack supprimera le véhicule, appliquera l'amende et affichera un message.

- `vehId` (*integer*) : Identifiant du véhicule.

#### `career_modules_delivery_vehicleTasks.isVehicleDeliveryVehicle(vehId)`

Indique si ce véhicule est le véhicule d'une tâche de livraison en cours.

- `vehId` (*integer*) : Identifiant du véhicule.
- **renvoie** : boolean true si oui.

#### `career_modules_delivery_vehicleTasks.onTrailerAttached(objId1, objId2)`

Hook appelé quand une remorque est attelée : met à jour les organisations prêteuses (loaner) de chaque tâche de véhicule.

- `objId1` (*integer*) : Premier véhicule.
- `objId2` (*integer*) : Second véhicule.

#### `career_modules_delivery_vehicleTasks.onUpdate(dtReal, dtSim, dtRaw)`

Hook par image : fait avancer ou reculer les étapes selon la position, l'attelage et le véhicule contrôlé, traite les tâches terminées et rendues, retire les tâches finies, quitte le mode livraison si besoin et met à jour la navigation.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulation (s).
- `dtRaw` (*number*) : Delta temps brut (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugName` | string | Nom du menu de debug : 'Delivery > Trailer Tasks'. |
| `debugOrder` | number | Ordre dans le menu de debug (12). |
| `dependencies` | table<integer, string> | Extensions chargées avant : util_stepHandler. |

**Évènements UI (guihooks.trigger) :** `Message`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/delivery/vehicleTasks.lua`.*
