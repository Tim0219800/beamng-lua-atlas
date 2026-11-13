---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/cargoCards.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Aide à la présentation de l'écran de cargaison (livraison) : prépare pour l'UI les filtres (parcel, vehicle, trailer, material, all, loaner), les regroupements (par type, destination, conteneur du joueur, tâche) et les tris des « cartes » de cargaison/offres. Appelé par career_modules_delivery_cargoScreen ; ne modifie pas le jeu, il annote les tables de cartes (groupTags, filterTags, sortValues).
--- Accès : extension `career_modules_delivery_cargoCards` : `extensions.load("career_modules_delivery_cargoCards")`, puis la globale `career_modules_delivery_cargoCards`
---@class career_modules_delivery_cargoCards
career_modules_delivery_cargoCards = {}

--- Marque filter.noContainers pour les filtres 'parcel', 'material' et 'all' lorsque le joueur n'a aucun conteneur adapté (parcel, fluid, dryBulk).
---Source : lua/ge/extensions/career/modules/delivery/cargoCards.lua:531
---@param filterSets table[] Filtres de getFilterSets.
---@param playerGroupSets table Non utilisé dans la fonction.
---@param playerCargoContainers table[] Conteneurs du joueur avec cargoTypesLookup.
function career_modules_delivery_cargoCards.addFilterPlayerData(filterSets, playerGroupSets, playerCargoContainers) end

--- Donne à chaque groupe des sortValues (cardId, rewardMoney, weight, distance) égales au minimum des valeurs de ses cartes.
---Source : lua/ge/extensions/career/modules/delivery/cargoCards.lua:473
---@param cardsById table<any, table> Cartes avec sortValues.
---@param groupSets table<string, table> Ensembles issus de getCardGroupSetsByKey.
function career_modules_delivery_cargoCards.addSortingValuesToGroups(cardsById, groupSets) end

--- Construit les ensembles de regroupement ('ungrouped', par type de cargo, par destination, par conteneur/stockage du joueur, par tâche) : renseigne card.groupTags et card.filterTags pour chaque carte, crée les groupes avec leur liste d'ids de cartes et leurs filterTags, et met à jour les compteurs de filtres.
---Source : lua/ge/extensions/career/modules/delivery/cargoCards.lua:84
---@param cardsById table<any, table> Cartes (parcelGroup, storage, vehicleOffer, loaner) indexées par id.
---@param usePlayerCards boolean true : ne traiter que les cartes du joueur ; false : celles de la facilité.
---@param playerCargoContainers table[]|nil Conteneurs du joueur (voir career_modules_delivery_general.getNearbyVehicleCargoContainers), utilisés pour les groupes de conteneurs et de stockage total.
---@return table<string, table>  Ensembles de regroupement par clé, chacun avec key, label et groups.
function career_modules_delivery_cargoCards.getCardGroupSetsByKey(cardsById, usePlayerCards, playerCargoContainers) end

--- Calcule des rangs de tri (card.sortValues) pour cardId, rewardMoney, weight, distance et availablilty (ordre : limite, plus de place, verrouillé, tutoriel, expiré) et renvoie la description des tris.
---Source : lua/ge/extensions/career/modules/delivery/cargoCards.lua:360
---@param cardsById table<any, table> Cartes à trier.
---@return table<string, {label: string, key: string}>  Tris disponibles par clé.
function career_modules_delivery_cargoCards.getCardSortingSetsByKey(cardsById) end

--- Compte les éléments à confirmer (cartes du joueur avec déplacements transitoires ou spawnWhenCommitingCargo ; un parcelGroup non matériau compte pour #ids) pour le bouton de confirmation de l'UI.
---Source : lua/ge/extensions/career/modules/delivery/cargoCards.lua:556
---@param cardsById table<any, table> Cartes.
---@return {itemCount: integer}  Nombre d'éléments à confirmer.
function career_modules_delivery_cargoCards.getConfirmButtonFromPlayerCards(cardsById) end

--- Renvoie la liste des filtres pour l'UI : hasAvailableOffers si des cartes existent, lockedInfo (niveau minimal de logistics-delivery pour 'trailer' et 'material') et order.
---Source : lua/ge/extensions/career/modules/delivery/cargoCards.lua:489
---@param cardsById table Non utilisé dans la fonction.
---@return table[]  Filtres.
function career_modules_delivery_cargoCards.getFilterSets(cardsById) end

--- Hook : mémorise les modules delivery (parcelManager, cargoScreen, general, generator, progress, vehicleOfferManager, parcelMods, vehicleTasks, tutorial).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/cargoCards.lua:8
function career_modules_delivery_cargoCards.onCareerActivated() end

--- Hook : vide les filtres mis en cache pour régénérer les libellés dans la nouvelle langue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/cargoCards.lua:575
function career_modules_delivery_cargoCards.onLanguageChanged() end

--- Remet à 0 les compteurs facilityCards et playerCards de tous les filtres et reconstruit leur index par clé.
---Source : lua/ge/extensions/career/modules/delivery/cargoCards.lua:70
function career_modules_delivery_cargoCards.resetFilterCounters() end

