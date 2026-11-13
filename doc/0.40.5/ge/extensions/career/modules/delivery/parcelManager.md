# `career_modules_delivery_parcelManager`

*Fichier : `lua/ge/extensions/career/modules/delivery/parcelManager.lua` · VM : Game Engine (GE) · 709 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_delivery_parcelManager` : `extensions.load("career_modules_delivery_parcelManager")`, puis la globale `career_modules_delivery_parcelManager`

Gestionnaire central des cargaisons (colis et matériaux) de la livraison en mode carrière. Il tient la liste allCargo (chaque cargo a un id, une location, une origin, une destination, des slots, un poids, des modifiers, des rewards…), déplace les cargaisons entre lieux (installation, véhicule, avatar du joueur), gère les « déplacements transitoires » (transientMoves) validés ensuite en bloc, fournit des requêtes de recherche, calcule les récompenses avec détail (retard, loaner, niveau de branche, précision de stationnement), envoie les messages de retard et nettoie les cargaisons périmées.

## Remarques

- Un lieu (location) est une table : {type='facilityParkingspot', facId, psPath}, {type='vehicle', vehId}, {type='playerAvatar'}, {type='multi', destinations={...}} ou {type='delete'} (marque pour suppression).
- sameLocation(a, b) ne compare que les clés présentes dans a : l'ordre des arguments compte (b peut avoir des clés en plus) et plante si b est nil.
- M.addParcelRewards est exporté mais vaut toujours nil (la variable locale addParcelRewards n'existe pas dans le fichier).
- clearTransientFlags et undoTransientCargo sont des restes : ils ne font que logguer une erreur.
- Les fonctions getAllCargo* appellent triggerAllGenerators() du module generator avant de filtrer : elles peuvent donc générer de nouvelles offres comme effet de bord.
- Le temps utilisé (offerExpiresAt, loadedAtTimeStamp) vient de career_modules_delivery_general.time(), pas de l'horloge réelle.
- Multiplicateurs de retard (modifier timed) : à l'heure = x1 (+10 % d'argent, +50 % de réputation), en retard partiel = 0.2 à 0.8 linéaire, en retard = x0.2 (réputation -1.5x).
- Dans getRewardsWithBreakdown, le bonus logistique de précision est calculé sur originalRewards['logistics'] alors que le bonus de compétence utilise la clé logistics-materials ou logistics-delivery.
- Fusion de matériaux (cargo.merge) : le cargo déplacé est mis à location {type='delete'} et son slots est ajouté à l'autre ; la récompense d'argent est alors fixée à cargo.slots.

**Dépendances (chargées avant) :** `freeroam_facilities`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_delivery_parcelManager.addCargo(cargo, silent)` | Ajoute une cargaison à la liste globale et émet le hook onCargoGenerated(cargo) sauf si silent. | 40 |
| `career_modules_delivery_parcelManager.addParcelRewardsSummary(cargo)` | Calcule originalRewards/breakdown/adjustedRewards de chaque cargaison, regroupe par groupId et heure de chargement, formate chaque groupe via cargoScreen.formatCargoGroup et trie par plus petit id. | 578 |
| `career_modules_delivery_parcelManager.addTransientMoveCargo(cargoId, targetLocation)` | Enregistre un déplacement en attente pour la cargaison (cargo._transientMove). Refusé avec une erreur loguée si elle en a déjà un. | 79 |
| `career_modules_delivery_parcelManager.applyTransientMoves(currentLocation)` | Applique les déplacements transitoires dont la cargaison est au lieu currentLocation (ou tous si currentLocation est nil), met à jour les organisations prêteuses (loaner) des véhicules cibles, fusionne les cargaisons mergeables de même matériau au même lieu, et conserve les autres déplacements pour plus tard. | 134 |
| `career_modules_delivery_parcelManager.changeCargoLocation(cargoId, newLocation)` | Déplace immédiatement la cargaison vers newLocation. Ajuste le stock de matériaux de l'installation (retire à l'ancien lieu, ajoute au nouveau), horodate loadedAtTimeStamp au premier chargement dans un véhicule, et marque cargo.data.delivered = true si le nouveau lieu est la destination. | 47 |
| `career_modules_delivery_parcelManager.cleanUpCargo()` | Supprime les cargaisons de lieu « delete » et celles restées à leur origine, expirées depuis plus de 120 s et sans déplacement transitoire. Remet le minuteur de nettoyage à zéro. | 670 |
| `career_modules_delivery_parcelManager.clearAllTransientMoves()` | Annule tous les déplacements transitoires et remet le drapeau « non validé » à false. | 125 |
| `career_modules_delivery_parcelManager.clearTransientFlags()` | Obsolète : ne fait que loguer une erreur « no longer needed ». *(interne)* | 210 |
| `career_modules_delivery_parcelManager.clearTransientMoveForCargo(cargoId)` | Annule le déplacement transitoire d'une cargaison (sans effet si aucun). | 108 |
| `career_modules_delivery_parcelManager.getAllCargoAtFacilityUnexpired(facId)` | Cargaisons non expirées encore à leur origine, située dans l'installation facId. | 341 |
| `career_modules_delivery_parcelManager.getAllCargoCustomFilter(filter, ...)` | Renvoie les cargaisons pour lesquelles filter(cargo, ...) est vrai, après avoir déclenché tous les générateurs. | 257 |
| `career_modules_delivery_parcelManager.getAllCargoForDestinationFacilityStillAtOriginUnexpired(facId)` | Cargaisons non expirées encore à leur origine et dont la destination est l'installation facId. | 328 |
| `career_modules_delivery_parcelManager.getAllCargoForFacilityUnexpiredUndelivered(facId, timeExpire, timeGenerated)` | Même filtre mais sur toutes les places d'une installation (facId). | 312 |
| `career_modules_delivery_parcelManager.getAllCargoForLocation(loc)` | Toutes les cargaisons actuellement à ce lieu (déclenche les générateurs si le lieu est une place d'installation). | 268 |
| `career_modules_delivery_parcelManager.getAllCargoForLocationUnexpired(loc)` | Comme getAllCargoForLocation mais seulement les cargaisons dont l'offre n'a pas expiré (offerExpiresAt > temps de livraison). | 282 |
| `career_modules_delivery_parcelManager.getAllCargoForLocationUnexpiredUndelivered(loc, timeExpire, timeGenerated)` | Cargaisons à ce lieu, non expirées, qui ne sont pas déjà à leur destination et générées au plus tard à timeGenerated. | 296 |
| `career_modules_delivery_parcelManager.getAllCargoInVehicles(includeTransient)` | Cargaisons actuellement dans un véhicule, et optionnellement celles ayant un déplacement transitoire en attente. | 354 |
| `career_modules_delivery_parcelManager.getCargoById(cargoId)` | Cherche une cargaison par id. | 423 |
| `career_modules_delivery_parcelManager.getLocationLabelLong(loc)` | Libellé long : pour une place d'installation, « Installation - nom de la place » si la place a un champ personnalisé name ; sinon comme le libellé court. | 396 |
| `career_modules_delivery_parcelManager.getLocationLabelShort(loc)` | Libellé court d'un lieu : nom traduit de l'installation, « Current Vehicle (id) » / « Other Vehicle (id) », « Player Avatar », « N possible locations » (ou le libellé de l'unique destination), « Unknown ». Les textes véhicule/avatar ne sont pas traduits. | 374 |
| `career_modules_delivery_parcelManager.getRewardsWithBreakdown(cargo)` | Calcule les récompenses d'une cargaison livrée avec le détail : effet du modificateur timed (à l'heure, retardée, en retard), part des organisations prêteuses de véhicule (loaner), multiplicateur du niveau de la branche logistics, bonus ou pénalité de précision de stationnement. Peut débloquer le succès ON_SCHEDULE. | 436 |
| `career_modules_delivery_parcelManager.getTransientMoveCargo()` | Liste les cargaisons qui ont un déplacement transitoire en attente. | 97 |
| `career_modules_delivery_parcelManager.getTransientMovesForTargetLocationWithCargo(targetLocation)` | Liste les cargaisons dont le déplacement transitoire cible le lieu donné. | 197 |
| `career_modules_delivery_parcelManager.hasUncommittedTransientMoves()` | Indique si des déplacements transitoires ont été ajoutés mais pas encore appliqués. | 95 |
| `career_modules_delivery_parcelManager.onCareerActivated()` | Hook appelé à l'activation de la carrière : mémorise les autres extensions de livraison. *(interne)* *(hook)* | 14 |
| `career_modules_delivery_parcelManager.onTrailerAttached(objId1, objId2)` | Hook appelé quand une remorque est attelée : recalcule les organisations prêteuses des cargaisons situées dans des véhicules. *(interne)* *(hook)* | 214 |
| `career_modules_delivery_parcelManager.onUpdate(dtReal, dtSim, dtRaw)` | Hook par image : envoie les messages UI « retardé » et « en retard » pour les cargaisons timed dans les véhicules, met à jour le tasklist chaque seconde, relance le tasklist et le nettoyage si des lieux ont changé, et nettoie toutes les 10 s. Inactif hors mode livraison. *(interne)* *(hook)* | 652 |
| `career_modules_delivery_parcelManager.sameLocation(a, b)` | Teste l'égalité de deux lieux en comparant chaque clé de a avec la même clé de b (comparaison asymétrique). | 249 |
| `career_modules_delivery_parcelManager.sameLocationCargo(cargo, otherLoc)` | Compare la position actuelle d'une cargaison avec un lieu via sameLocation. | 245 |
| `career_modules_delivery_parcelManager.undoTransientCargo()` | Obsolète : ne fait que loguer une erreur (code d'annulation commenté, marqué TODO). | 223 |

### Détail des paramètres

#### `career_modules_delivery_parcelManager.addCargo(cargo, silent)`

Ajoute une cargaison à la liste globale et émet le hook onCargoGenerated(cargo) sauf si silent.

- `cargo` (*table*) : Cargaison complète (id, location, origin, destination, slots…).
- `silent` (*boolean|nil*) : true pour ne pas émettre onCargoGenerated.

#### `career_modules_delivery_parcelManager.addParcelRewardsSummary(cargo)`

Calcule originalRewards/breakdown/adjustedRewards de chaque cargaison, regroupe par groupId et heure de chargement, formate chaque groupe via cargoScreen.formatCargoGroup et trie par plus petit id.

- `cargo` (*table*) : Liste de cargaisons au même lieu actuel.
- **renvoie** : table|nil Liste de groupes formatés pour l'UI (nil si la liste est vide).

#### `career_modules_delivery_parcelManager.addTransientMoveCargo(cargoId, targetLocation)`

Enregistre un déplacement en attente pour la cargaison (cargo._transientMove). Refusé avec une erreur loguée si elle en a déjà un.

- `cargoId` (*integer*) : Identifiant de la cargaison.
- `targetLocation` (*table*) : Lieu cible.

#### `career_modules_delivery_parcelManager.applyTransientMoves(currentLocation)`

Applique les déplacements transitoires dont la cargaison est au lieu currentLocation (ou tous si currentLocation est nil), met à jour les organisations prêteuses (loaner) des véhicules cibles, fusionne les cargaisons mergeables de même matériau au même lieu, et conserve les autres déplacements pour plus tard.

- `currentLocation` (*table|nil*) : Lieu courant ; nil pour tout appliquer.
- **renvoie** : table Cargaisons déplacées.
- **renvoie** : table Cargaisons dont le déplacement reste en attente.

#### `career_modules_delivery_parcelManager.changeCargoLocation(cargoId, newLocation)`

Déplace immédiatement la cargaison vers newLocation. Ajuste le stock de matériaux de l'installation (retire à l'ancien lieu, ajoute au nouveau), horodate loadedAtTimeStamp au premier chargement dans un véhicule, et marque cargo.data.delivered = true si le nouveau lieu est la destination.

- `cargoId` (*integer*) : Identifiant de la cargaison.
- `newLocation` (*table*) : Nouveau lieu (une erreur est loguée si nil ou vide).

#### `career_modules_delivery_parcelManager.clearTransientMoveForCargo(cargoId)`

Annule le déplacement transitoire d'une cargaison (sans effet si aucun).

- `cargoId` (*integer*) : Identifiant de la cargaison.

#### `career_modules_delivery_parcelManager.getAllCargoAtFacilityUnexpired(facId)`

Cargaisons non expirées encore à leur origine, située dans l'installation facId.

- `facId` (*string*) : Installation d'origine.
- **renvoie** : table Liste de cargaisons.

#### `career_modules_delivery_parcelManager.getAllCargoCustomFilter(filter, ...)`

Renvoie les cargaisons pour lesquelles filter(cargo, ...) est vrai, après avoir déclenché tous les générateurs.

- `filter` (*function*) : fonction(cargo, ...) -> boolean.
- `...` (*any*) : Arguments supplémentaires passés à filter.
- **renvoie** : table Liste de cargaisons.

#### `career_modules_delivery_parcelManager.getAllCargoForDestinationFacilityStillAtOriginUnexpired(facId)`

Cargaisons non expirées encore à leur origine et dont la destination est l'installation facId.

- `facId` (*string*) : Installation de destination.
- **renvoie** : table Liste de cargaisons.

#### `career_modules_delivery_parcelManager.getAllCargoForFacilityUnexpiredUndelivered(facId, timeExpire, timeGenerated)`

Même filtre mais sur toutes les places d'une installation (facId).

- `facId` (*string*) : Identifiant de l'installation.
- `timeExpire` (*number|nil*) : Seuil d'expiration.
- `timeGenerated` (*number|nil*) : Horodatage maximal de génération.
- **renvoie** : table Liste de cargaisons.

#### `career_modules_delivery_parcelManager.getAllCargoForLocation(loc)`

Toutes les cargaisons actuellement à ce lieu (déclenche les générateurs si le lieu est une place d'installation).

- `loc` (*table*) : Lieu.
- **renvoie** : table Liste de cargaisons.

#### `career_modules_delivery_parcelManager.getAllCargoForLocationUnexpired(loc)`

Comme getAllCargoForLocation mais seulement les cargaisons dont l'offre n'a pas expiré (offerExpiresAt > temps de livraison).

- `loc` (*table*) : Lieu.
- **renvoie** : table Liste de cargaisons.

#### `career_modules_delivery_parcelManager.getAllCargoForLocationUnexpiredUndelivered(loc, timeExpire, timeGenerated)`

Cargaisons à ce lieu, non expirées, qui ne sont pas déjà à leur destination et générées au plus tard à timeGenerated.

- `loc` (*table*) : Lieu.
- `timeExpire` (*number|nil*) : Seuil d'expiration ; défaut : temps courant.
- `timeGenerated` (*number|nil*) : Horodatage maximal de génération ; défaut : infini.
- **renvoie** : table Liste de cargaisons.

#### `career_modules_delivery_parcelManager.getAllCargoInVehicles(includeTransient)`

Cargaisons actuellement dans un véhicule, et optionnellement celles ayant un déplacement transitoire en attente.

- `includeTransient` (*boolean|nil*) : Inclure les cargaisons avec _transientMove.
- **renvoie** : table Liste de cargaisons.

#### `career_modules_delivery_parcelManager.getCargoById(cargoId)`

Cherche une cargaison par id.

- `cargoId` (*integer*) : Identifiant.
- **renvoie** : table|nil Cargaison ou nil.

#### `career_modules_delivery_parcelManager.getLocationLabelLong(loc)`

Libellé long : pour une place d'installation, « Installation - nom de la place » si la place a un champ personnalisé name ; sinon comme le libellé court.

- `loc` (*table*) : Lieu.
- **renvoie** : string Libellé.

#### `career_modules_delivery_parcelManager.getLocationLabelShort(loc)`

Libellé court d'un lieu : nom traduit de l'installation, « Current Vehicle (id) » / « Other Vehicle (id) », « Player Avatar », « N possible locations » (ou le libellé de l'unique destination), « Unknown ». Les textes véhicule/avatar ne sont pas traduits.

- `loc` (*table*) : Lieu.
- **renvoie** : string Libellé.

#### `career_modules_delivery_parcelManager.getRewardsWithBreakdown(cargo)`

Calcule les récompenses d'une cargaison livrée avec le détail : effet du modificateur timed (à l'heure, retardée, en retard), part des organisations prêteuses de véhicule (loaner), multiplicateur du niveau de la branche logistics, bonus ou pénalité de précision de stationnement. Peut débloquer le succès ON_SCHEDULE.

- `cargo` (*table*) : Cargaison (rewards, modifiers, loadedAtTimeStamp, organization, destination, location…).
- **renvoie** : table originalRewards : copie des récompenses de base.
- **renvoie** : table breakdown : liste d'éléments {label, rewards, simpleBreakdownType}.
- **renvoie** : table adjustedRewards : récompenses finales (base + somme des éléments).

#### `career_modules_delivery_parcelManager.getTransientMoveCargo()`

Liste les cargaisons qui ont un déplacement transitoire en attente.

- **renvoie** : table Liste de cargaisons.

#### `career_modules_delivery_parcelManager.getTransientMovesForTargetLocationWithCargo(targetLocation)`

Liste les cargaisons dont le déplacement transitoire cible le lieu donné.

- `targetLocation` (*table*) : Lieu cible.
- **renvoie** : table Liste de cargaisons.

#### `career_modules_delivery_parcelManager.hasUncommittedTransientMoves()`

Indique si des déplacements transitoires ont été ajoutés mais pas encore appliqués.

- **renvoie** : boolean true si en attente.

#### `career_modules_delivery_parcelManager.onTrailerAttached(objId1, objId2)`

Hook appelé quand une remorque est attelée : recalcule les organisations prêteuses des cargaisons situées dans des véhicules.

- `objId1` (*integer*) : Premier véhicule.
- `objId2` (*integer*) : Second véhicule.

#### `career_modules_delivery_parcelManager.onUpdate(dtReal, dtSim, dtRaw)`

Hook par image : envoie les messages UI « retardé » et « en retard » pour les cargaisons timed dans les véhicules, met à jour le tasklist chaque seconde, relance le tasklist et le nettoyage si des lieux ont changé, et nettoie toutes les 10 s. Inactif hors mode livraison.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulation (s).
- `dtRaw` (*number*) : Delta temps brut (s).

#### `career_modules_delivery_parcelManager.sameLocation(a, b)`

Teste l'égalité de deux lieux en comparant chaque clé de a avec la même clé de b (comparaison asymétrique).

- `a` (*table*) : Lieu de référence.
- `b` (*table*) : Lieu comparé (ne doit pas être nil).
- **renvoie** : boolean true si toutes les clés de a valent celles de b.

#### `career_modules_delivery_parcelManager.sameLocationCargo(cargo, otherLoc)`

Compare la position actuelle d'une cargaison avec un lieu via sameLocation.

- `cargo` (*table*) : Cargaison.
- `otherLoc` (*table*) : Lieu à comparer.
- **renvoie** : boolean true si identique.

## Champs

| Champ | Type | Description |
|---|---|---|
| `addParcelRewards` | nil | Exporté mais toujours nil (référence non définie dans le fichier). ⚠ référence `addParcelRewards` non définie dans le fichier (vaut probablement nil) |
| `dependencies` | table<integer, string> | Extensions chargées avant : freeroam_facilities. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onCargoGenerated` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `Message`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/delivery/parcelManager.lua`.*
