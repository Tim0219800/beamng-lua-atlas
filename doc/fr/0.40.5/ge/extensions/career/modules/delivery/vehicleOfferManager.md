# `career_modules_delivery_vehicleOfferManager`

*Fichier : `lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua` · VM : Game Engine (GE) · 405 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_delivery_vehicleOfferManager` : `extensions.load("career_modules_delivery_vehicleOfferManager")`, puis la globale `career_modules_delivery_vehicleOfferManager`

Gère les offres de livraison de véhicules et de remorques en mode carrière (la liste allOffers) : ajout, recherche (par lieu, par installation, non expirées), libellés de catégories de véhicules (junkerVeh, smallVeh, largeVeh, fleetVeh, exoticVeh, remorques vides/chargées petites, moyennes, grandes) avec leur drapeau de déblocage, et apparition (spawn) d'un véhicule d'offre dans le monde via une séquence util_stepHandler. Sert aussi à fabriquer le libellé d'une tâche de véhicule pour l'UI.

## Remarques

- Spawn d'une offre : fondu au noir, spawn du véhicule (model/config de offer.vehicle), placement sur la place offer.spawnLocation.psPath, initialisation du kilométrage (partCondition.initConditions), contact coupé (setIgnitionLevel 0), ping puis lecture de l'odomètre de la pièce principale (offer.startingOdometer, -1 si introuvable), création de la tâche via vehicleTasks.addVehicleTask, démarrage du mode livraison, fondu retour.
- offer.spawned = true est posé dès le début de spawnOffer : l'offre disparaît des listes 'unexpired' immédiatement.
- Les filtres getAllOfferUnexpired et getAllOfferAtFacilityUnexpired ne regardent pas la visibilité/déblocage de l'installation (code commenté).
- Le paramètre psPath de getAllOfferAtFacilityUnexpired est ignoré.
- sameLocation(a, b) est asymétrique : seules les clés de a sont comparées (comme dans parcelManager).
- Tous les appels de filtrage déclenchent d'abord triggerAllGenerators() : de nouvelles offres peuvent être générées comme effet de bord.
- La table vehicleTags associe emptyLargeTrailer (singulier, sans 's' final) alors que les autres sont au pluriel : à respecter si on utilise la clé.

**Dépendances (chargées avant) :** `util_stepHandler`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_delivery_vehicleOfferManager.addOffer(offer)` | Ajoute une offre à la liste globale. | 206 |
| `career_modules_delivery_vehicleOfferManager.getAllOfferAtFacilityUnexpired(facId, psPath)` | Offres non expirées et non apparues dont l'origine est l'installation facId. | 250 |
| `career_modules_delivery_vehicleOfferManager.getAllOfferCustomFilter(filter, ...)` | Renvoie les offres pour lesquelles filter(offer, ...) est vrai, après avoir déclenché les générateurs. | 222 |
| `career_modules_delivery_vehicleOfferManager.getAllOfferForLocation(loc)` | Offres dont l'origine est le lieu donné. | 233 |
| `career_modules_delivery_vehicleOfferManager.getAllOfferUnexpired()` | Offres non expirées et non encore apparues (spawned faux). | 237 |
| `career_modules_delivery_vehicleOfferManager.getDefaultVehicleModifiersForUI()` | Renvoie les deux modificateurs affichés par défaut pour une offre de véhicule : 'route' (suivre le trajet) et 'damage' (dégâts), avec icône, libellé et description traduits. | 141 |
| `career_modules_delivery_vehicleOfferManager.getOfferById(id)` | Cherche une offre par id. | 268 |
| `career_modules_delivery_vehicleOfferManager.getVehicleTagLabelPlural(tag)` | Libellé traduit au pluriel de la catégorie (ou « noCategory » si inconnue). | 135 |
| `career_modules_delivery_vehicleOfferManager.getVehicleTagLabelSingular(tag)` | Libellé traduit au singulier de la catégorie (ou « noCategory » si inconnue). | 130 |
| `career_modules_delivery_vehicleOfferManager.getVehicleTagUnlockedSimple()` | État de déblocage de toutes les catégories de véhicules. | 121 |
| `career_modules_delivery_vehicleOfferManager.isVehicleTagUnlocked(tag)` | Indique si le drapeau de déblocage de la catégorie est actif dans career_modules_unlockFlags. Une catégorie inconnue est considérée débloquée. | 110 |
| `career_modules_delivery_vehicleOfferManager.makeTaskLabel(task)` | Fabrique le libellé traduit d'une tâche d'offre : vehicleDropOff selon lookupType (réparation, domicile privé, retour après réparation, camion, par défaut « bringTo »), trailerDropOff (« towTo »), ou « dropOffAt » si la tâche a une destination ; sinon « unknown ». | 21 |
| `career_modules_delivery_vehicleOfferManager.onCareerActivated()` | Hook appelé à l'activation de la carrière : mémorise les autres extensions de livraison et util_stepHandler. *(interne)* *(hook)* | 8 |
| `career_modules_delivery_vehicleOfferManager.sameLocation(a, b)` | Teste l'égalité de deux lieux en comparant chaque clé de a avec celle de b. | 214 |
| `career_modules_delivery_vehicleOfferManager.sameLocationOffer(offer, otherLoc)` | Compare l'origine d'une offre avec un lieu via sameLocation. | 210 |
| `career_modules_delivery_vehicleOfferManager.spawnOffer(offerId, fadeToBlack, callback)` | Fait apparaître le véhicule d'une offre (voir notes), l'enregistre comme tâche de véhicule et démarre le mode livraison. Logue une erreur et s'arrête si l'offre est introuvable. | 277 |

### Détail des paramètres

#### `career_modules_delivery_vehicleOfferManager.addOffer(offer)`

Ajoute une offre à la liste globale.

- `offer` (*table*) : Offre (id, origin, offerExpiresAt, vehicle, task, rewards…).

#### `career_modules_delivery_vehicleOfferManager.getAllOfferAtFacilityUnexpired(facId, psPath)`

Offres non expirées et non apparues dont l'origine est l'installation facId.

- `facId` (*string*) : Identifiant de l'installation.
- `psPath` (*string|nil*) : Ignoré.
- **renvoie** : table Liste d'offres.

#### `career_modules_delivery_vehicleOfferManager.getAllOfferCustomFilter(filter, ...)`

Renvoie les offres pour lesquelles filter(offer, ...) est vrai, après avoir déclenché les générateurs.

- `filter` (*function*) : fonction(offer, ...) -> boolean.
- `...` (*any*) : Arguments supplémentaires pour filter.
- **renvoie** : table Liste d'offres.

#### `career_modules_delivery_vehicleOfferManager.getAllOfferForLocation(loc)`

Offres dont l'origine est le lieu donné.

- `loc` (*table*) : Lieu.
- **renvoie** : table Liste d'offres.

#### `career_modules_delivery_vehicleOfferManager.getAllOfferUnexpired()`

Offres non expirées et non encore apparues (spawned faux).

- **renvoie** : table Liste d'offres.

#### `career_modules_delivery_vehicleOfferManager.getDefaultVehicleModifiersForUI()`

Renvoie les deux modificateurs affichés par défaut pour une offre de véhicule : 'route' (suivre le trajet) et 'damage' (dégâts), avec icône, libellé et description traduits.

- **renvoie** : table Liste de {type, icon, active, label, description}.

#### `career_modules_delivery_vehicleOfferManager.getOfferById(id)`

Cherche une offre par id.

- `id` (*integer*) : Identifiant de l'offre.
- **renvoie** : table|nil Offre ou nil.

#### `career_modules_delivery_vehicleOfferManager.getVehicleTagLabelPlural(tag)`

Libellé traduit au pluriel de la catégorie (ou « noCategory » si inconnue).

- `tag` (*string*) : Catégorie.
- **renvoie** : string Libellé.

#### `career_modules_delivery_vehicleOfferManager.getVehicleTagLabelSingular(tag)`

Libellé traduit au singulier de la catégorie (ou « noCategory » si inconnue).

- `tag` (*string*) : Catégorie.
- **renvoie** : string Libellé.

#### `career_modules_delivery_vehicleOfferManager.getVehicleTagUnlockedSimple()`

État de déblocage de toutes les catégories de véhicules.

- **renvoie** : table<string, boolean> tag -> débloqué.

#### `career_modules_delivery_vehicleOfferManager.isVehicleTagUnlocked(tag)`

Indique si le drapeau de déblocage de la catégorie est actif dans career_modules_unlockFlags. Une catégorie inconnue est considérée débloquée.

- `tag` (*string*) : Catégorie de véhicule (ex. 'smallVeh', 'loadedLargeTrailers').
- **renvoie** : boolean true si débloquée.
- **renvoie** : table|nil Définition du drapeau (absente pour une catégorie inconnue).

#### `career_modules_delivery_vehicleOfferManager.makeTaskLabel(task)`

Fabrique le libellé traduit d'une tâche d'offre : vehicleDropOff selon lookupType (réparation, domicile privé, retour après réparation, camion, par défaut « bringTo »), trailerDropOff (« towTo »), ou « dropOffAt » si la tâche a une destination ; sinon « unknown ».

- `task` (*table*) : Tâche d'offre (type, lookupType, destination).
- **renvoie** : string Libellé traduit.

#### `career_modules_delivery_vehicleOfferManager.sameLocation(a, b)`

Teste l'égalité de deux lieux en comparant chaque clé de a avec celle de b.

- `a` (*table*) : Lieu de référence.
- `b` (*table*) : Lieu comparé.
- **renvoie** : boolean true si égaux.

#### `career_modules_delivery_vehicleOfferManager.sameLocationOffer(offer, otherLoc)`

Compare l'origine d'une offre avec un lieu via sameLocation.

- `offer` (*table*) : Offre.
- `otherLoc` (*table*) : Lieu.
- **renvoie** : boolean true si identique.

#### `career_modules_delivery_vehicleOfferManager.spawnOffer(offerId, fadeToBlack, callback)`

Fait apparaître le véhicule d'une offre (voir notes), l'enregistre comme tâche de véhicule et démarre le mode livraison. Logue une erreur et s'arrête si l'offre est introuvable.

- `offerId` (*integer*) : Identifiant de l'offre.
- `fadeToBlack` (*boolean|nil*) : Fondu au noir autour du spawn ; true par défaut.
- `callback` (*function|nil*) : Appelé à la fin de la séquence d'étapes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : util_stepHandler. |

**Évènements UI (guihooks.trigger) :** `updateCargoData`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua`.*
