# `career_modules_delivery_cargoCards`

*Fichier : `lua/ge/extensions/career/modules/delivery/cargoCards.lua` · VM : Game Engine (GE) · 588 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_delivery_cargoCards` : `extensions.load("career_modules_delivery_cargoCards")`, puis la globale `career_modules_delivery_cargoCards`

Aide à la présentation de l'écran de cargaison (livraison) : prépare pour l'UI les filtres (parcel, vehicle, trailer, material, all, loaner), les regroupements (par type, destination, conteneur du joueur, tâche) et les tris des « cartes » de cargaison/offres. Appelé par career_modules_delivery_cargoScreen ; ne modifie pas le jeu, il annote les tables de cartes (groupTags, filterTags, sortValues).

## Remarques

- Les filtres sont construits paresseusement (ensureFilterTags) avec des libellés traduits ; onLanguageChanged les réinitialise.
- Verrouillage : le filtre 'trailer' demande le niveau 3 et 'material' le niveau 5 de la branche 'logistics-delivery'.
- Chaque filtre compte facilityCards et playerCards (remis à zéro par resetFilterCounters, incrémentés par getCardGroupSetsByKey avec usePlayerCards faux).
- Bug probable : dans getFilterSets, 'filter.order = i' utilise une variable i non définie (la boucle est 'for _, filter'), donc order vaut nil.
- Incohérence : dans le tri 'distance', le test de repli compare a.weight/b.weight au lieu des distances ; les commentaires disent 'high to low' pour rewardMoney et weight alors que les comparateurs trient en ordre croissant.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_delivery_cargoCards.addFilterPlayerData(filterSets, playerGroupSets, playerCargoContainers)` | Marque filter.noContainers pour les filtres 'parcel', 'material' et 'all' lorsque le joueur n'a aucun conteneur adapté (parcel, fluid, dryBulk). | 531 |
| `career_modules_delivery_cargoCards.addSortingValuesToGroups(cardsById, groupSets)` | Donne à chaque groupe des sortValues (cardId, rewardMoney, weight, distance) égales au minimum des valeurs de ses cartes. | 473 |
| `career_modules_delivery_cargoCards.getCardGroupSetsByKey(cardsById, usePlayerCards, playerCargoContainers)` | Construit les ensembles de regroupement ('ungrouped', par type de cargo, par destination, par conteneur/stockage du joueur, par tâche) : renseigne card.groupTags et card.filterTags pour chaque carte, crée les groupes avec leur liste d'ids de cartes et leurs filterTags, et met à jour les compteurs de filtres. | 84 |
| `career_modules_delivery_cargoCards.getCardSortingSetsByKey(cardsById)` | Calcule des rangs de tri (card.sortValues) pour cardId, rewardMoney, weight, distance et availablilty (ordre : limite, plus de place, verrouillé, tutoriel, expiré) et renvoie la description des tris. | 360 |
| `career_modules_delivery_cargoCards.getConfirmButtonFromPlayerCards(cardsById)` | Compte les éléments à confirmer (cartes du joueur avec déplacements transitoires ou spawnWhenCommitingCargo ; un parcelGroup non matériau compte pour #ids) pour le bouton de confirmation de l'UI. | 556 |
| `career_modules_delivery_cargoCards.getFilterSets(cardsById)` | Renvoie la liste des filtres pour l'UI : hasAvailableOffers si des cartes existent, lockedInfo (niveau minimal de logistics-delivery pour 'trailer' et 'material') et order. | 489 |
| `career_modules_delivery_cargoCards.onCareerActivated()` | Hook : mémorise les modules delivery (parcelManager, cargoScreen, general, generator, progress, vehicleOfferManager, parcelMods, vehicleTasks, tutorial). *(interne)* *(hook)* | 8 |
| `career_modules_delivery_cargoCards.onLanguageChanged()` | Hook : vide les filtres mis en cache pour régénérer les libellés dans la nouvelle langue. *(interne)* *(hook)* | 575 |
| `career_modules_delivery_cargoCards.resetFilterCounters()` | Remet à 0 les compteurs facilityCards et playerCards de tous les filtres et reconstruit leur index par clé. | 70 |

### Détail des paramètres

#### `career_modules_delivery_cargoCards.addFilterPlayerData(filterSets, playerGroupSets, playerCargoContainers)`

Marque filter.noContainers pour les filtres 'parcel', 'material' et 'all' lorsque le joueur n'a aucun conteneur adapté (parcel, fluid, dryBulk).

- `filterSets` (*table[]*) : Filtres de getFilterSets.
- `playerGroupSets` (*table*) : Non utilisé dans la fonction.
- `playerCargoContainers` (*table[]*) : Conteneurs du joueur avec cargoTypesLookup.

#### `career_modules_delivery_cargoCards.addSortingValuesToGroups(cardsById, groupSets)`

Donne à chaque groupe des sortValues (cardId, rewardMoney, weight, distance) égales au minimum des valeurs de ses cartes.

- `cardsById` (*table<any, table>*) : Cartes avec sortValues.
- `groupSets` (*table<string, table>*) : Ensembles issus de getCardGroupSetsByKey.

#### `career_modules_delivery_cargoCards.getCardGroupSetsByKey(cardsById, usePlayerCards, playerCargoContainers)`

Construit les ensembles de regroupement ('ungrouped', par type de cargo, par destination, par conteneur/stockage du joueur, par tâche) : renseigne card.groupTags et card.filterTags pour chaque carte, crée les groupes avec leur liste d'ids de cartes et leurs filterTags, et met à jour les compteurs de filtres.

- `cardsById` (*table<any, table>*) : Cartes (parcelGroup, storage, vehicleOffer, loaner) indexées par id.
- `usePlayerCards` (*boolean*) : true : ne traiter que les cartes du joueur ; false : celles de la facilité.
- `playerCargoContainers` (*table[]|nil*) : Conteneurs du joueur (voir career_modules_delivery_general.getNearbyVehicleCargoContainers), utilisés pour les groupes de conteneurs et de stockage total.
- **renvoie** : table<string, table> Ensembles de regroupement par clé, chacun avec key, label et groups.

#### `career_modules_delivery_cargoCards.getCardSortingSetsByKey(cardsById)`

Calcule des rangs de tri (card.sortValues) pour cardId, rewardMoney, weight, distance et availablilty (ordre : limite, plus de place, verrouillé, tutoriel, expiré) et renvoie la description des tris.

- `cardsById` (*table<any, table>*) : Cartes à trier.
- **renvoie** : table<string, {label: string, key: string}> Tris disponibles par clé.

#### `career_modules_delivery_cargoCards.getConfirmButtonFromPlayerCards(cardsById)`

Compte les éléments à confirmer (cartes du joueur avec déplacements transitoires ou spawnWhenCommitingCargo ; un parcelGroup non matériau compte pour #ids) pour le bouton de confirmation de l'UI.

- `cardsById` (*table<any, table>*) : Cartes.
- **renvoie** : {itemCount: integer} Nombre d'éléments à confirmer.

#### `career_modules_delivery_cargoCards.getFilterSets(cardsById)`

Renvoie la liste des filtres pour l'UI : hasAvailableOffers si des cartes existent, lockedInfo (niveau minimal de logistics-delivery pour 'trailer' et 'material') et order.

- `cardsById` (*table*) : Non utilisé dans la fonction.
- **renvoie** : table[] Filtres.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/delivery/cargoCards.lua`.*
