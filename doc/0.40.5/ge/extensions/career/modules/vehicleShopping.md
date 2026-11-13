# `career_modules_vehicleShopping`

*Fichier : `lua/ge/extensions/career/modules/vehicleShopping.lua` · VM : Game Engine (GE) · 1214 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_vehicleShopping` : `extensions.load("career_modules_vehicleShopping")`, puis la globale `career_modules_vehicleShopping`

Marché de véhicules de la carrière : génère et entretient la liste des véhicules en vente (concessionnaires et vendeurs privés), gère leur durée de vie, leur « vente » en l'absence du joueur, la liste de surveillance (watchlist), l'ouverture de la boutique (depuis un concessionnaire ou l'ordinateur du garage), l'inspection d'un véhicule, l'écran d'achat (frais, taxes de 7 %, reprise, remises, assurance, plaque personnalisée) et la livraison ou l'apparition du véhicule acheté. Envoie les données à l'UI via les guihooks vehicleShoppingData et vehiclePurchaseData. La liste est sauvegardée dans <profil>/career/vehicleShop.json.

## Remarques

- Constantes : offres valables 10 min (vehicleOfferTimeToLive), un véhicule généré par vendeur toutes les 60 s / vehicleGenerationMultiplier, véhicule vendu retiré 5 min après, livraison 60 s (1 s si moins de 500 m), taxe 0,07, plaque personnalisée 300, moduleVersion 61 (liste ignorée si info.json a une version inférieure).
- Génération : util_configListGenerator.getEligibleVehicles puis getRandomVehicleInfos avec une population normalisée (facteur 0,4) ; évite les configs déjà en vente chez le même vendeur. Année tirée entre les bornes de la config, kilométrage tiré selon filter.whiteList.Mileage, valeur ajustée par career_modules_valueCalculator, prix arrondi par seller.priceRoundingType (prestige, private, dealer ou 10), négociation via career_modules_marketplace.generatePersonality. Vendeur « private » : place de parking aléatoire (tag notprivatesale exclu). Concessionnaires à staticInventory : liste fixe générée une fois.
- Les offres expirées sont retirées, sauf celles de la watchlist qui passent « vendues » (soldFor, soldViewCounter) et restent 5 min visibles ; le toast watchlistVehicleSold et le succès TOO_LATE sont déclenchés dans onUpdate quand un véhicule surveillé non inspecté expire.
- Types d'achat (purchaseType) : « inspect » (véhicule déjà apparu, acheté via career_modules_inspectVehicle) et « instant » (achat direct, apparition dans une place du concessionnaire ou envoi au garage avec délai si makeDelivery).
- Succès liés : GOOD_DEAL / DEAL_MAKER (prix négocié < demandé, <= 80 %), SERIOUS_PURCHASE (>= 100 000).
- Bug : generateShopId est censée éviter les identifiants en double, mais la boucle interne `break` puis `return shopId` retourne toujours le premier tirage sans vérification réelle.
- Bug mineur : dans onComputerAddFunctions, le bloc de code d'une ancienne vérification est commenté ; seules les raisons du tutoriel (tutorialPartShoppingActive/tutorialTuningActive) et les permissions « vehicleShopping » désactivent le bouton.
- Les fonctions locales (getRoundedPrice, spawnVehicle, buyVehicleAndSendToGarage, etc.) ne sont pas exportées.
- onExtensionLoaded retourne false si la carrière n'est pas active (le module ne se charge pas).

**Dépendances (chargées avant) :** `career_career`, `util_configListGenerator`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_vehicleShopping.buyFromPurchaseMenu(purchaseType, options)` | Exécute l'achat depuis l'écran d'achat : paie, fait apparaître ou livre le véhicule, retire la reprise éventuelle de l'inventaire, facture la plaque personnalisée et retire l'offre de la liste. | 983 |
| `career_modules_vehicleShopping.buySpawnedVehicle(buyVehicleOptions)` | Achète le véhicule déjà apparu de l'inspection (paie, ajoute à l'inventaire, plaque, entre dedans si le joueur le conduit). | 791 |
| `career_modules_vehicleShopping.cancelPurchase(purchaseType)` | Annule l'achat : ferme les menus pour « inspect », rouvre la boutique pour « instant ». | 1024 |
| `career_modules_vehicleShopping.cancelShopping()` | Retourne au menu de l'ordinateur d'origine, ou ferme tous les menus. | 728 |
| `career_modules_vehicleShopping.endShopping()` | Ferme tous les menus de carrière et émet le hook onVehicleShoppingMenuClosed. Appelée aussi par la laisse. | 723 |
| `career_modules_vehicleShopping.getCurrentSellerId()` | Retourne l'id du concessionnaire courant (nil si via l'ordinateur). | 1107 |
| `career_modules_vehicleShopping.getEligibleVehiclesWithoutDealershipVehicles(eligibleVehicles, seller)` | Retourne une copie de la liste des configs éligibles sans celles déjà proposées par le vendeur donné. | 194 |
| `career_modules_vehicleShopping.getSelectedSellerBreadcrumbTitle()` | Titre du vendeur sélectionné pour le fil d'Ariane de l'UI. | 771 |
| `career_modules_vehicleShopping.getShoppingData()` | Construit les données de la boutique pour l'UI : véhicules en vente et vendus, concessionnaires (avec nombre de véhicules, désactivés pendant l'onboarding sauf apmStarterVehicles), vendeur courant et sélectionné, argent et attributs du joueur, places libres de l'inventaire, droits d'achat. | 101 |
| `career_modules_vehicleShopping.getVehicleInfoByShopId(shopId)` | Trouve un véhicule en vente par son shopId. | 185 |
| `career_modules_vehicleShopping.getVehiclesInShop()` | Retourne la table interne des véhicules en vente. | 787 |
| `career_modules_vehicleShopping.getVisualValueFromMileage(mileage)` | Convertit un kilométrage en facteur visuel d'usure (1 jusqu'à 10 000 000, décroissant jusqu'à 0,75 à 2 000 000 000), passé à partCondition.initConditions à l'apparition. | 497 |
| `career_modules_vehicleShopping.navigateToPos(pos)` | Trace un guidage au sol vers une position et revient à l'écran de jeu (« play »). | 635 |
| `career_modules_vehicleShopping.onAddedVehiclePartsToInventory(inventoryId, newParts)` | Hook de l'inventaire après l'ajout des pièces d'un véhicule acheté : enregistre année, pièces d'origine et slots modifiés, supprime l'objet véhicule si livraison, ferme la boutique, émet onVehicleAddedToInventory et sauvegarde si autosave. *(interne)* *(hook)* | 900 |
| `career_modules_vehicleShopping.onComputerAddFunctions(menuData, computerFunctions)` | Hook de l'ordinateur du garage : ajoute la fonction générale « vehicleShop » (marché de véhicules), désactivée pendant le tutoriel ou si les permissions refusent vehicleShopping. *(interne)* *(hook)* | 1111 |
| `career_modules_vehicleShopping.onExtensionLoaded()` | Hook de chargement : charge vehicleShop.json de la sauvegarde si la version est compatible. Retourne false hors carrière active. *(interne)* *(hook)* | 1071 |
| `career_modules_vehicleShopping.onRouteEnter(context, toRoute, fromRoute, data)` | Hook du routeur d'UI : restaure le vendeur sélectionné depuis les paramètres de route (sellerId). *(interne)* *(hook)* | 657 |
| `career_modules_vehicleShopping.onRouteMount(context, toRoute, fromRoute, data)` | Hook du routeur d'UI : envoie les données de boutique une fois la vue montée. *(interne)* *(hook)* | 744 |
| `career_modules_vehicleShopping.onSaveCurrentProfile(currentSavePath)` | Hook de sauvegarde : écrit vehicleShop.json (offres, vendeurs, watchlist, état statique). *(interne)* *(hook)* | 1097 |
| `career_modules_vehicleShopping.onShoppingMenuClosed()` | Hook émis à la fermeture de la boutique : retire la laisse. *(interne)* *(hook)* | 783 |
| `career_modules_vehicleShopping.onUiChangedState(toState)` | Hook émis à chaque changement d'état de l'UI : mémorise l'état courant. *(interne)* *(hook)* | 1167 |
| `career_modules_vehicleShopping.onUpdate()` | Hook de mise à jour (seulement en état UI « play ») : surveille la watchlist et signale par toast la vente d'un véhicule surveillé dont l'offre a expiré. *(interne)* *(hook)* | 1139 |
| `career_modules_vehicleShopping.onVehicleSpawnFinished(vehId)` | Appelé par le véhicule (queueGameEngineLua) quand ses conditions de pièces sont initialisées : l'ajoute à l'inventaire, y entre si c'est le véhicule joueur, applique délai de livraison et plaque. *(interne)* *(hook)* | 537 |
| `career_modules_vehicleShopping.openInventoryMenuForTradeIn()` | Ouvre le menu d'inventaire pour choisir un véhicule à donner en reprise (réparation requise, propriétaire requis) ; la valeur est calculée par valueCalculator. | 1046 |
| `career_modules_vehicleShopping.openPurchaseMenu(purchaseType, shopId, insuranceId)` | Ouvre l'écran d'achat pour une offre, ajoute l'offre à la watchlist et émet onVehicleShoppingPurchaseMenuOpened({purchaseType, shopId}). | 969 |
| `career_modules_vehicleShopping.openShop(seller, _originComputerId, screenTag)` | Ouvre la boutique : met à jour la liste, calcule distances et prix de voyage rapide, crée la laisse (sphère de 4 m devant un concessionnaire, ou porte de l'ordinateur) et navigue vers l'écran de boutique. Émet le hook onVehicleShoppingMenuOpened({seller}). | 666 |
| `career_modules_vehicleShopping.quickTravelToVehicle(shopId)` | Comme showVehicle, mais téléporte le joueur vers le véhicule. | 964 |
| `career_modules_vehicleShopping.removeTradeInVehicle()` | Retire le véhicule de reprise de l'achat en cours et met à jour l'UI. | 1041 |
| `career_modules_vehicleShopping.requestExit()` | Gestionnaire du bouton retour du routeur : équivaut à cancelShopping. *(interne)* | 739 |
| `career_modules_vehicleShopping.requestPurchaseExit()` | Retour depuis l'écran d'achat : ferme les menus pour « inspect », sinon retourne à la liste de véhicules. *(interne)* | 1032 |
| `career_modules_vehicleShopping.requestVehicleListExit()` | Sortie de la liste de véhicules : avec un vendeur courant, annule la boutique ; sinon désélectionne le vendeur et revient à l'écran des vendeurs. | 763 |
| `career_modules_vehicleShopping.selectSeller(sellerId)` | L'UI a choisi un vendeur : l'enregistre, émet onVehicleShoppingSelectedSellerIdChanged, envoie les données et navigue vers la liste de véhicules. | 750 |
| `career_modules_vehicleShopping.sendPurchaseDataToUi()` | Calcule les prix (frais, remise, reprise, taxes 7 %, prix final), l'assurance, les frais de dégâts d'essai routier, puis envoie vehiclePurchaseData à l'UI. | 805 |
| `career_modules_vehicleShopping.sendShoppingDataToUI()` | Envoie getShoppingData à l'UI (guihooks vehicleShoppingData). | 134 |
| `career_modules_vehicleShopping.showVehicle(shopId)` | Lance l'inspection d'un véhicule en vente (fondu, apparition via career_modules_inspectVehicle.startInspection). Émet onVehicleShoppingVehicleShown en cas de succès. | 959 |
| `career_modules_vehicleShopping.updateInsuranceSelection(insuranceId)` | Change l'assurance sélectionnée pour l'achat en cours et ré-envoie les données. | 976 |
| `career_modules_vehicleShopping.updateVehicleList(fromScratch)` | Met à jour la liste des véhicules en vente : retire les offres expirées ou à modèle manquant, génère les nouveaux véhicules de chaque vendeur selon le temps écoulé. | 257 |

### Détail des paramètres

#### `career_modules_vehicleShopping.buyFromPurchaseMenu(purchaseType, options)`

Exécute l'achat depuis l'écran d'achat : paie, fait apparaître ou livre le véhicule, retire la reprise éventuelle de l'inventaire, facture la plaque personnalisée et retire l'offre de la liste.

- `purchaseType` (*string*) : "inspect" ou "instant".
- `options` (*table*) : {licensePlateText, makeDelivery, insuranceId}.

#### `career_modules_vehicleShopping.buySpawnedVehicle(buyVehicleOptions)`

Achète le véhicule déjà apparu de l'inspection (paie, ajoute à l'inventaire, plaque, entre dedans si le joueur le conduit).

- `buyVehicleOptions` (*table*) : {licensePlateText}.

#### `career_modules_vehicleShopping.cancelPurchase(purchaseType)`

Annule l'achat : ferme les menus pour « inspect », rouvre la boutique pour « instant ».

- `purchaseType` (*string*) : "inspect" ou "instant".

#### `career_modules_vehicleShopping.getCurrentSellerId()`

Retourne l'id du concessionnaire courant (nil si via l'ordinateur).

- **renvoie** : string|nil Id.

#### `career_modules_vehicleShopping.getEligibleVehiclesWithoutDealershipVehicles(eligibleVehicles, seller)`

Retourne une copie de la liste des configs éligibles sans celles déjà proposées par le vendeur donné.

- `eligibleVehicles` (*table[]*) : Liste de configs éligibles (model_key, key).
- `seller` (*table*) : Vendeur (champ id).
- **renvoie** : table[] Liste filtrée.

#### `career_modules_vehicleShopping.getSelectedSellerBreadcrumbTitle()`

Titre du vendeur sélectionné pour le fil d'Ariane de l'UI.

- **renvoie** : string|nil Nom traduit.

#### `career_modules_vehicleShopping.getShoppingData()`

Construit les données de la boutique pour l'UI : véhicules en vente et vendus, concessionnaires (avec nombre de véhicules, désactivés pendant l'onboarding sauf apmStarterVehicles), vendeur courant et sélectionné, argent et attributs du joueur, places libres de l'inventaire, droits d'achat.

- **renvoie** : table Données envoyées par le guihook vehicleShoppingData.

#### `career_modules_vehicleShopping.getVehicleInfoByShopId(shopId)`

Trouve un véhicule en vente par son shopId.

- `shopId` (*integer*) : Identifiant de l'offre.
- **renvoie** : table|nil Informations de l'offre.

#### `career_modules_vehicleShopping.getVehiclesInShop()`

Retourne la table interne des véhicules en vente.

- **renvoie** : table[] Offres courantes.

#### `career_modules_vehicleShopping.getVisualValueFromMileage(mileage)`

Convertit un kilométrage en facteur visuel d'usure (1 jusqu'à 10 000 000, décroissant jusqu'à 0,75 à 2 000 000 000), passé à partCondition.initConditions à l'apparition.

- `mileage` (*number*) : Odomètre en unités du jeu (mètres, déduit du code).
- **renvoie** : number Facteur entre 0,75 et 1.

#### `career_modules_vehicleShopping.navigateToPos(pos)`

Trace un guidage au sol vers une position et revient à l'écran de jeu (« play »).

- `pos` (*vec3*) : Position (champs x, y, z).

#### `career_modules_vehicleShopping.onAddedVehiclePartsToInventory(inventoryId, newParts)`

Hook de l'inventaire après l'ajout des pièces d'un véhicule acheté : enregistre année, pièces d'origine et slots modifiés, supprime l'objet véhicule si livraison, ferme la boutique, émet onVehicleAddedToInventory et sauvegarde si autosave.

- `inventoryId` (*integer*) : Id d'inventaire du nouveau véhicule.
- `newParts` (*table*) : Pièces ajoutées (par nom).

#### `career_modules_vehicleShopping.onComputerAddFunctions(menuData, computerFunctions)`

Hook de l'ordinateur du garage : ajoute la fonction générale « vehicleShop » (marché de véhicules), désactivée pendant le tutoriel ou si les permissions refusent vehicleShopping.

- `menuData` (*table*) : Données du menu.
- `computerFunctions` (*table*) : Table à remplir (general).

#### `career_modules_vehicleShopping.onExtensionLoaded()`

Hook de chargement : charge vehicleShop.json de la sauvegarde si la version est compatible. Retourne false hors carrière active.

- **renvoie** : boolean|nil false pour refuser le chargement.

#### `career_modules_vehicleShopping.onRouteEnter(context, toRoute, fromRoute, data)`

Hook du routeur d'UI : restaure le vendeur sélectionné depuis les paramètres de route (sellerId).

- `context` (*any*) : Contexte.
- `toRoute` (*table*) : Route cible (params.sellerId).
- `fromRoute` (*any*) : Route d'origine.
- `data` (*any*) : Données de la route.

#### `career_modules_vehicleShopping.onRouteMount(context, toRoute, fromRoute, data)`

Hook du routeur d'UI : envoie les données de boutique une fois la vue montée.

- `context` (*any*) : Contexte.
- `toRoute` (*any*) : Route cible.
- `fromRoute` (*any*) : Route d'origine.
- `data` (*any*) : Données de la route.

#### `career_modules_vehicleShopping.onSaveCurrentProfile(currentSavePath)`

Hook de sauvegarde : écrit vehicleShop.json (offres, vendeurs, watchlist, état statique).

- `currentSavePath` (*string*) : Dossier de sauvegarde.

#### `career_modules_vehicleShopping.onUiChangedState(toState)`

Hook émis à chaque changement d'état de l'UI : mémorise l'état courant.

- `toState` (*string*) : Nouvel état (ex. "play").

#### `career_modules_vehicleShopping.onVehicleSpawnFinished(vehId)`

Appelé par le véhicule (queueGameEngineLua) quand ses conditions de pièces sont initialisées : l'ajoute à l'inventaire, y entre si c'est le véhicule joueur, applique délai de livraison et plaque.

- `vehId` (*integer*) : Id du véhicule.

#### `career_modules_vehicleShopping.openPurchaseMenu(purchaseType, shopId, insuranceId)`

Ouvre l'écran d'achat pour une offre, ajoute l'offre à la watchlist et émet onVehicleShoppingPurchaseMenuOpened({purchaseType, shopId}).

- `purchaseType` (*string*) : "inspect" ou "instant".
- `shopId` (*integer*) : Identifiant de l'offre.
- `insuranceId` (*integer|nil*) : Assurance présélectionnée.

#### `career_modules_vehicleShopping.openShop(seller, _originComputerId, screenTag)`

Ouvre la boutique : met à jour la liste, calcule distances et prix de voyage rapide, crée la laisse (sphère de 4 m devant un concessionnaire, ou porte de l'ordinateur) et navigue vers l'écran de boutique. Émet le hook onVehicleShoppingMenuOpened({seller}).

- `seller` (*string|nil*) : Id du concessionnaire (nil = depuis l'ordinateur).
- `_originComputerId` (*any*) : Id de l'ordinateur d'origine.
- `screenTag` (*string|nil*) : Étiquette d'écran transmise à l'UI.

#### `career_modules_vehicleShopping.quickTravelToVehicle(shopId)`

Comme showVehicle, mais téléporte le joueur vers le véhicule.

- `shopId` (*integer*) : Identifiant de l'offre.

#### `career_modules_vehicleShopping.selectSeller(sellerId)`

L'UI a choisi un vendeur : l'enregistre, émet onVehicleShoppingSelectedSellerIdChanged, envoie les données et navigue vers la liste de véhicules.

- `sellerId` (*string*) : Id du concessionnaire ou "private".

#### `career_modules_vehicleShopping.showVehicle(shopId)`

Lance l'inspection d'un véhicule en vente (fondu, apparition via career_modules_inspectVehicle.startInspection). Émet onVehicleShoppingVehicleShown en cas de succès.

- `shopId` (*integer*) : Identifiant de l'offre.

#### `career_modules_vehicleShopping.updateInsuranceSelection(insuranceId)`

Change l'assurance sélectionnée pour l'achat en cours et ré-envoie les données.

- `insuranceId` (*integer*) : Id de l'assurance.

#### `career_modules_vehicleShopping.updateVehicleList(fromScratch)`

Met à jour la liste des véhicules en vente : retire les offres expirées ou à modèle manquant, génère les nouveaux véhicules de chaque vendeur selon le temps écoulé.

- `fromScratch` (*boolean|nil*) : Si vrai, vide tout et regénère depuis zéro.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'career_career', 'util_configListGenerator'}. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onVehicleAddedToInventory` — écouté par 4 module(s)
- `onVehicleShoppingMenuClosed`
- `onVehicleShoppingMenuOpened` — écouté par 1 module(s)
- `onVehicleShoppingPurchaseMenuOpened` — écouté par 1 module(s)
- `onVehicleShoppingSelectedSellerIdChanged` — écouté par 1 module(s)
- `onVehicleShoppingVehicleShown`

**Évènements UI (guihooks.trigger) :** `UINavigation`, `toastrMsg`, `vehiclePurchaseData`, `vehicleShoppingData`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/vehicleShopping.lua`.*
