---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/vehicleShopping.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Marché de véhicules de la carrière : génère et entretient la liste des véhicules en vente (concessionnaires et vendeurs privés), gère leur durée de vie, leur « vente » en l'absence du joueur, la liste de surveillance (watchlist), l'ouverture de la boutique (depuis un concessionnaire ou l'ordinateur du garage), l'inspection d'un véhicule, l'écran d'achat (frais, taxes de 7 %, reprise, remises, assurance, plaque personnalisée) et la livraison ou l'apparition du véhicule acheté. Envoie les données à l'UI via les guihooks vehicleShoppingData et vehiclePurchaseData. La liste est sauvegardée dans <profil>/career/vehicleShop.json.
--- Accès : extension `career_modules_vehicleShopping` : `extensions.load("career_modules_vehicleShopping")`, puis la globale `career_modules_vehicleShopping`
---@class career_modules_vehicleShopping
---@field dependencies string[] {'career_career', 'util_configListGenerator'}.
career_modules_vehicleShopping = {}

--- Exécute l'achat depuis l'écran d'achat : paie, fait apparaître ou livre le véhicule, retire la reprise éventuelle de l'inventaire, facture la plaque personnalisée et retire l'offre de la liste.
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:983
---@param purchaseType string "inspect" ou "instant".
---@param options table {licensePlateText, makeDelivery, insuranceId}.
function career_modules_vehicleShopping.buyFromPurchaseMenu(purchaseType, options) end

--- Achète le véhicule déjà apparu de l'inspection (paie, ajoute à l'inventaire, plaque, entre dedans si le joueur le conduit).
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:791
---@param buyVehicleOptions table {licensePlateText}.
function career_modules_vehicleShopping.buySpawnedVehicle(buyVehicleOptions) end

--- Annule l'achat : ferme les menus pour « inspect », rouvre la boutique pour « instant ».
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:1024
---@param purchaseType string "inspect" ou "instant".
function career_modules_vehicleShopping.cancelPurchase(purchaseType) end

--- Retourne au menu de l'ordinateur d'origine, ou ferme tous les menus.
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:728
function career_modules_vehicleShopping.cancelShopping() end

--- Ferme tous les menus de carrière et émet le hook onVehicleShoppingMenuClosed. Appelée aussi par la laisse.
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:723
function career_modules_vehicleShopping.endShopping() end

--- Retourne l'id du concessionnaire courant (nil si via l'ordinateur).
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:1107
---@return string|nil  Id.
function career_modules_vehicleShopping.getCurrentSellerId() end

--- Retourne une copie de la liste des configs éligibles sans celles déjà proposées par le vendeur donné.
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:194
---@param eligibleVehicles table[] Liste de configs éligibles (model_key, key).
---@param seller table Vendeur (champ id).
---@return table[]  Liste filtrée.
function career_modules_vehicleShopping.getEligibleVehiclesWithoutDealershipVehicles(eligibleVehicles, seller) end

--- Titre du vendeur sélectionné pour le fil d'Ariane de l'UI.
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:771
---@return string|nil  Nom traduit.
function career_modules_vehicleShopping.getSelectedSellerBreadcrumbTitle() end

--- Construit les données de la boutique pour l'UI : véhicules en vente et vendus, concessionnaires (avec nombre de véhicules, désactivés pendant l'onboarding sauf apmStarterVehicles), vendeur courant et sélectionné, argent et attributs du joueur, places libres de l'inventaire, droits d'achat.
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:101
---@return table  Données envoyées par le guihook vehicleShoppingData.
function career_modules_vehicleShopping.getShoppingData() end

--- Trouve un véhicule en vente par son shopId.
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:185
---@param shopId integer Identifiant de l'offre.
---@return table|nil  Informations de l'offre.
function career_modules_vehicleShopping.getVehicleInfoByShopId(shopId) end

--- Retourne la table interne des véhicules en vente.
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:787
---@return table[]  Offres courantes.
function career_modules_vehicleShopping.getVehiclesInShop() end

--- Convertit un kilométrage en facteur visuel d'usure (1 jusqu'à 10 000 000, décroissant jusqu'à 0,75 à 2 000 000 000), passé à partCondition.initConditions à l'apparition.
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:497
---@param mileage number Odomètre en unités du jeu (mètres, déduit du code).
---@return number  Facteur entre 0,75 et 1.
function career_modules_vehicleShopping.getVisualValueFromMileage(mileage) end

--- Trace un guidage au sol vers une position et revient à l'écran de jeu (« play »).
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:635
---@param pos vec3 Position (champs x, y, z).
function career_modules_vehicleShopping.navigateToPos(pos) end

--- Hook de l'inventaire après l'ajout des pièces d'un véhicule acheté : enregistre année, pièces d'origine et slots modifiés, supprime l'objet véhicule si livraison, ferme la boutique, émet onVehicleAddedToInventory et sauvegarde si autosave.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:900
---@param inventoryId integer Id d'inventaire du nouveau véhicule.
---@param newParts table Pièces ajoutées (par nom).
function career_modules_vehicleShopping.onAddedVehiclePartsToInventory(inventoryId, newParts) end

--- Hook de l'ordinateur du garage : ajoute la fonction générale « vehicleShop » (marché de véhicules), désactivée pendant le tutoriel ou si les permissions refusent vehicleShopping.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:1111
---@param menuData table Données du menu.
---@param computerFunctions table Table à remplir (general).
function career_modules_vehicleShopping.onComputerAddFunctions(menuData, computerFunctions) end

--- Hook de chargement : charge vehicleShop.json de la sauvegarde si la version est compatible. Retourne false hors carrière active.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:1071
---@return boolean|nil  false pour refuser le chargement.
function career_modules_vehicleShopping.onExtensionLoaded() end

--- Hook du routeur d'UI : restaure le vendeur sélectionné depuis les paramètres de route (sellerId).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:657
---@param context any Contexte.
---@param toRoute table Route cible (params.sellerId).
---@param fromRoute any Route d'origine.
---@param data any Données de la route.
function career_modules_vehicleShopping.onRouteEnter(context, toRoute, fromRoute, data) end

--- Hook du routeur d'UI : envoie les données de boutique une fois la vue montée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:744
---@param context any Contexte.
---@param toRoute any Route cible.
---@param fromRoute any Route d'origine.
---@param data any Données de la route.
function career_modules_vehicleShopping.onRouteMount(context, toRoute, fromRoute, data) end

--- Hook de sauvegarde : écrit vehicleShop.json (offres, vendeurs, watchlist, état statique).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:1097
---@param currentSavePath string Dossier de sauvegarde.
function career_modules_vehicleShopping.onSaveCurrentProfile(currentSavePath) end

--- Hook émis à la fermeture de la boutique : retire la laisse.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:783
function career_modules_vehicleShopping.onShoppingMenuClosed() end

--- Hook émis à chaque changement d'état de l'UI : mémorise l'état courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:1167
---@param toState string Nouvel état (ex. "play").
function career_modules_vehicleShopping.onUiChangedState(toState) end

--- Hook de mise à jour (seulement en état UI « play ») : surveille la watchlist et signale par toast la vente d'un véhicule surveillé dont l'offre a expiré.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:1139
function career_modules_vehicleShopping.onUpdate() end

--- Appelé par le véhicule (queueGameEngineLua) quand ses conditions de pièces sont initialisées : l'ajoute à l'inventaire, y entre si c'est le véhicule joueur, applique délai de livraison et plaque.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:537
---@param vehId integer Id du véhicule.
function career_modules_vehicleShopping.onVehicleSpawnFinished(vehId) end

--- Ouvre le menu d'inventaire pour choisir un véhicule à donner en reprise (réparation requise, propriétaire requis) ; la valeur est calculée par valueCalculator.
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:1046
function career_modules_vehicleShopping.openInventoryMenuForTradeIn() end

--- Ouvre l'écran d'achat pour une offre, ajoute l'offre à la watchlist et émet onVehicleShoppingPurchaseMenuOpened({purchaseType, shopId}).
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:969
---@param purchaseType string "inspect" ou "instant".
---@param shopId integer Identifiant de l'offre.
---@param insuranceId integer|nil Assurance présélectionnée.
function career_modules_vehicleShopping.openPurchaseMenu(purchaseType, shopId, insuranceId) end

--- Ouvre la boutique : met à jour la liste, calcule distances et prix de voyage rapide, crée la laisse (sphère de 4 m devant un concessionnaire, ou porte de l'ordinateur) et navigue vers l'écran de boutique. Émet le hook onVehicleShoppingMenuOpened({seller}).
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:666
---@param seller string|nil Id du concessionnaire (nil = depuis l'ordinateur).
---@param _originComputerId any Id de l'ordinateur d'origine.
---@param screenTag string|nil Étiquette d'écran transmise à l'UI.
function career_modules_vehicleShopping.openShop(seller, _originComputerId, screenTag) end

--- Comme showVehicle, mais téléporte le joueur vers le véhicule.
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:964
---@param shopId integer Identifiant de l'offre.
function career_modules_vehicleShopping.quickTravelToVehicle(shopId) end

--- Retire le véhicule de reprise de l'achat en cours et met à jour l'UI.
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:1041
function career_modules_vehicleShopping.removeTradeInVehicle() end

--- Gestionnaire du bouton retour du routeur : équivaut à cancelShopping.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:739
function career_modules_vehicleShopping.requestExit() end

--- Retour depuis l'écran d'achat : ferme les menus pour « inspect », sinon retourne à la liste de véhicules.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:1032
function career_modules_vehicleShopping.requestPurchaseExit() end

--- Sortie de la liste de véhicules : avec un vendeur courant, annule la boutique ; sinon désélectionne le vendeur et revient à l'écran des vendeurs.
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:763
function career_modules_vehicleShopping.requestVehicleListExit() end

--- L'UI a choisi un vendeur : l'enregistre, émet onVehicleShoppingSelectedSellerIdChanged, envoie les données et navigue vers la liste de véhicules.
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:750
---@param sellerId string Id du concessionnaire ou "private".
function career_modules_vehicleShopping.selectSeller(sellerId) end

--- Calcule les prix (frais, remise, reprise, taxes 7 %, prix final), l'assurance, les frais de dégâts d'essai routier, puis envoie vehiclePurchaseData à l'UI.
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:805
function career_modules_vehicleShopping.sendPurchaseDataToUi() end

--- Envoie getShoppingData à l'UI (guihooks vehicleShoppingData).
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:134
function career_modules_vehicleShopping.sendShoppingDataToUI() end

--- Lance l'inspection d'un véhicule en vente (fondu, apparition via career_modules_inspectVehicle.startInspection). Émet onVehicleShoppingVehicleShown en cas de succès.
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:959
---@param shopId integer Identifiant de l'offre.
function career_modules_vehicleShopping.showVehicle(shopId) end

--- Change l'assurance sélectionnée pour l'achat en cours et ré-envoie les données.
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:976
---@param insuranceId integer Id de l'assurance.
function career_modules_vehicleShopping.updateInsuranceSelection(insuranceId) end

--- Met à jour la liste des véhicules en vente : retire les offres expirées ou à modèle manquant, génère les nouveaux véhicules de chaque vendeur selon le temps écoulé.
---Source : lua/ge/extensions/career/modules/vehicleShopping.lua:257
---@param fromScratch boolean|nil Si vrai, vide tout et regénère depuis zéro.
function career_modules_vehicleShopping.updateVehicleList(fromScratch) end

