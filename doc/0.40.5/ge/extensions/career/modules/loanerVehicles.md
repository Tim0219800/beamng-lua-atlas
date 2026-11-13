# `career_modules_loanerVehicles`

*Fichier : `lua/ge/extensions/career/modules/loanerVehicles.lua` · VM : Game Engine (GE) · 440 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_loanerVehicles` : `extensions.load("career_modules_loanerVehicles")`, puis la globale `career_modules_loanerVehicles`

Véhicules prêtés (loaners) par les organisations de livraison en carrière. Il construit les offres affichées dans l'UI (formatLoanerOfferForUi), gère la sélection puis le spawn de véhicules prêtés via une séquence util_stepHandler (fondu, spawn, placement sur une place de parking, ajout à l'inventaire avec owned = false, fondu retour), le retour des véhicules et une surveillance : un véhicule « work » laissé à plus de 100 m pendant 300 s est rendu automatiquement.

## Remarques

- Réglages : walkAwayRadius 100 m, comeBackRadius 95 m, walkAwayTimeLimit 300 s, avertissement à 60 s restantes.
- Un véhicule loaner est ajouté à l'inventaire avec owningOrganization (facility.associatedOrganization) et loanType (offer.loanType, "work").
- Rendre un véhicule work endommagé (inventoryVehNeedsRepair) coûte la réputation returnLoanerDamaged (-20) de l'organisation et affiche un toast.
- Offre non disponible si : pas de place libre, déjà un loaner non-remorque de cette organisation (limite 1, y compris ceux en attente de spawn), réputation insuffisante, ou niveau de livraison (branche delivery) insuffisant. Une offre déjà cochée reste activée.
- Kilométrage proposé : mileage de l'offre selon le niveau de réputation, plus environ 5,8 * (1 ± 10 %) par seconde écoulée depuis la création de la sauvegarde (soit 500 km par jour selon le commentaire du code).
- Bug : M.spawnAndLoanVehicle = spawnAndLoanVehicle référence une variable non définie : le champ vaut nil.
- spawnAllOffers : la dernière étape ne traite que la première offre de markedForSpawningLoaners (next) pour orienter la caméra, puis vide la liste.
- onUpdate utilise `break` après chaque action : un seul véhicule est traité par frame.

**Dépendances (chargées avant) :** `util_stepHandler`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_loanerVehicles.formatLoanerOfferForUi(facility)` | Prépare pour l'UI les offres de prêt d'une installation : disponibilité (enabled), raison d'indisponibilité, infos de déblocage, kilométrage, capacité, miniature. | 288 |
| `career_modules_loanerVehicles.formatSpawnedLoanersForUi()` | Prépare pour l'UI la liste des loaners déjà dans l'inventaire : part de l'organisation (loanerCut), nom, kilométrage, type véhicule/remorque, capacité en fluides. | 254 |
| `career_modules_loanerVehicles.getLoanedVehiclesByOrg(organizationId)` | Liste (copies profondes avec miniature) les véhicules de l'inventaire prêtés par l'organisation donnée. | 139 |
| `career_modules_loanerVehicles.getLoaningOrgsOfVehicle(vehId)` | Renvoie les organisations propriétaires du véhicule et, s'il est attelé, du véhicule tracteur non-remorque. | 210 |
| `career_modules_loanerVehicles.markForSpawning(offer)` | Bascule la sélection d'une offre : l'ajoute à la liste des loaners à faire apparaître, ou la retire si elle y était déjà. | 18 |
| `career_modules_loanerVehicles.onUpdate(dtReal, dtSim, dtRaw)` | Hook de frame : surveille l'éloignement des véhicules work (avertissement, puis retour automatique après le délai). *(interne)* *(hook)* | 151 |
| `career_modules_loanerVehicles.onVehicleAdded(id)` | Hook appelé à l'ajout d'un véhicule à l'inventaire : débloque l'étape d'attente de la séquence de spawn. *(interne)* *(hook)* | 33 |
| `career_modules_loanerVehicles.returnVehicle(inventoryId, callback)` | Rend un véhicule prêté : met à jour les conditions de pièces s'il est présent dans le monde, applique la pénalité de réputation si le véhicule work est endommagé, puis le retire de l'inventaire et appelle callback. | 114 |
| `career_modules_loanerVehicles.spawnAllOffers()` | Fait apparaître toutes les offres sélectionnées avec un fondu : spawn, initialisation des conditions de pièces (kilométrage), placement sur la meilleure place de parking (remorques ou non), ajout à l'inventaire. Ne fait rien si rien n'est sélectionné. | 37 |
| `career_modules_loanerVehicles.unmarkAllForSpawning()` | Vide la liste des offres sélectionnées. | 27 |

### Détail des paramètres

#### `career_modules_loanerVehicles.formatLoanerOfferForUi(facility)`

Prépare pour l'UI les offres de prêt d'une installation : disponibilité (enabled), raison d'indisponibilité, infos de déblocage, kilométrage, capacité, miniature.

- `facility` (*table*) : Installation de livraison (associatedOrganization, loanerTrailerSpots, loanerNonTrailerSpots, id).
- **renvoie** : table[]|nil Offres, nil si l'organisation est inconnue.

#### `career_modules_loanerVehicles.formatSpawnedLoanersForUi()`

Prépare pour l'UI la liste des loaners déjà dans l'inventaire : part de l'organisation (loanerCut), nom, kilométrage, type véhicule/remorque, capacité en fluides.

- **renvoie** : table[] Entrées d'UI (isSpawnedLoaner = true).

#### `career_modules_loanerVehicles.getLoanedVehiclesByOrg(organizationId)`

Liste (copies profondes avec miniature) les véhicules de l'inventaire prêtés par l'organisation donnée.

- `organizationId` (*string*) : Id de l'organisation.
- **renvoie** : table[] Infos de véhicules.

#### `career_modules_loanerVehicles.getLoaningOrgsOfVehicle(vehId)`

Renvoie les organisations propriétaires du véhicule et, s'il est attelé, du véhicule tracteur non-remorque.

- `vehId` (*integer*) : Id d'objet du véhicule.
- **renvoie** : table<string, boolean> Ensemble des ids d'organisations.

#### `career_modules_loanerVehicles.markForSpawning(offer)`

Bascule la sélection d'une offre : l'ajoute à la liste des loaners à faire apparaître, ou la retire si elle y était déjà.

- `offer` (*table*) : Offre (id, model, config, sourceFacility, loanType, vehMileage).

#### `career_modules_loanerVehicles.onUpdate(dtReal, dtSim, dtRaw)`

Hook de frame : surveille l'éloignement des véhicules work (avertissement, puis retour automatique après le délai).

- `dtReal` (*number*) : Temps réel (s).
- `dtSim` (*number*) : Temps de simulation (s).
- `dtRaw` (*number*) : Temps brut (s).

#### `career_modules_loanerVehicles.onVehicleAdded(id)`

Hook appelé à l'ajout d'un véhicule à l'inventaire : débloque l'étape d'attente de la séquence de spawn.

- `id` (*integer*) : Id du véhicule.

#### `career_modules_loanerVehicles.returnVehicle(inventoryId, callback)`

Rend un véhicule prêté : met à jour les conditions de pièces s'il est présent dans le monde, applique la pénalité de réputation si le véhicule work est endommagé, puis le retire de l'inventaire et appelle callback.

- `inventoryId` (*integer*) : Id d'inventaire du véhicule.
- `callback` (*function|nil*) : Appelée une fois le véhicule retiré.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : util_stepHandler. |
| `spawnAndLoanVehicle` | nil | Toujours nil : variable inexistante dans le fichier (bug). ⚠ référence `spawnAndLoanVehicle` non définie dans le fichier (vaut probablement nil) |

**Évènements UI (guihooks.trigger) :** `toastrMsg`

## Appels vers le moteur (C++)

- `be:` `getObjectPositionXYZ`, `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/loanerVehicles.lua`.*
