# `career_modules_delivery_cargoScreen`

*Fichier : `lua/ge/extensions/career/modules/delivery/cargoScreen.lua` · VM : Game Engine (GE) · 2017 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_delivery_cargoScreen` : `extensions.load("career_modules_delivery_cargoScreen")`, puis la globale `career_modules_delivery_cargoScreen`

Back-end de l'écran « Cargo Overview » de la carrière (livraison de colis, matériaux, véhicules et remorques). Il formate pour l'UI les cartes de cargaison (colis groupés, stockages de fluides/vrac, offres de véhicules, véhicules prêtés), envoie le tout via guihooks 'cargoDataForUiReady', gère le chargement/déchargement par déplacements transitoires (moveCargoFromUi, moveMaterialFromUi puis commit/cancel), l'ouverture/fermeture de l'écran avec la grande carte, le calcul de la meilleure route (setBestRoute) et les aperçus de route et surbrillances des marqueurs.

## Exemple

```lua
-- ouvrir l'écran de cargaison du joueur (hors facilité)
career_modules_delivery_cargoScreen.enterMyCargo()
```

## Remarques

- Dépend de core_vehicleBridge ; les autres modules delivery sont référencés dans onCareerActivated.
- Les cartes sont stockées dans une table locale cardsById avec des ids préfixés : 'F-' (facilité) ou 'P-' (joueur) puis 'pg-' (parcelGroup), 'st-' (storage), 'vo-' (vehicleOffer) ou 'lo-' (loaner).
- requestCargoDataForUi est asynchrone (passe par getNearbyVehicleCargoContainers) et répond par guihooks.trigger('cargoDataForUiReady', uiData) ; les mises à jour du cargo déclenchent 'newCargoAvailable' (une seule fois par ouverture).
- Un déplacement de cargo est d'abord 'transitoire' : il n'est appliqué qu'à commitDeliveryConfiguration ; cancelDeliveryConfiguration (ou la sortie de la route UI) l'annule.
- commitDeliveryConfiguration démarre le mode livraison si besoin, met à jour les poids des conteneurs, puis fait apparaître les offres de véhicules marquées et les véhicules prêtés.
- Bug probable : dans commitDeliveryConfiguration, step.startStepSequence(sequence, callback) utilise 'callback', variable non définie (nil) ; un print(data) de debug y est aussi laissé.
- setBestRoute : plus proche voisin glouton sur les destinations (distances via gameplay/route/route et dGenerator.getDistanceBetweenFacilities) ; s'il y a des tâches de véhicule, délègue à vehicleTasks.navigateToNextTask. Le cas target.type == 'multi' n'est pas géré (bloc vide).
- setCargoScreenTab(tab) filtre les marqueurs de grande carte selon les filterTags des cartes (ou 'myCargo').
- Plusieurs fonctions ne sont que des passe-plats vers d'autres modules : spawnOffer, requestDropOffData, confirmDropOffData, unloadCargoPopupClosed, clearTransientMoveForCargo.

**Dépendances (chargées avant) :** `core_vehicleBridge`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_delivery_cargoScreen.abandonAcceptedOffer(vehId)` | Abandonne une offre acceptée : déclenche le hook onGameplayActivityAborted puis rend le véhicule de livraison (vehicleTasks.giveBackDeliveryVehicle). | 582 |
| `career_modules_delivery_cargoScreen.applyTransientMoves()` | Déclenche onGameplayActivityAborted puis applique tous les déplacements transitoires (dParcelManager.applyTransientMoves). | 1484 |
| `career_modules_delivery_cargoScreen.cancelDeliveryConfiguration()` | Annule la livraison en cours de configuration : efface les déplacements transitoires, les marquages d'apparition d'offres et de véhicules prêtés, rafraîchit les conteneurs proches et affiche un message. | 1673 |
| `career_modules_delivery_cargoScreen.clearTransientMoveForCargo(...)` | Passe-plat vers career_modules_delivery_parcelManager.clearTransientMoveForCargo. | 2006 |
| `career_modules_delivery_cargoScreen.clearTransientMovesForStorage(materialType)` | Supprime les cargos en déplacement transitoire issus du stockage de matériau donné de la facilité de l'écran ouvert (emplacement 'delete') et annule leur déplacement. | 740 |
| `career_modules_delivery_cargoScreen.commitDeliveryConfiguration()` | Valide la configuration : applique les déplacements transitoires vers la facilité courante, démarre le mode livraison si du cargo est chargé ou restant, met à jour les poids des conteneurs (gel puis délai de chargement avec popup), puis fait apparaître les offres marquées et les véhicules prêtés. | 1595 |
| `career_modules_delivery_cargoScreen.confirmDropOffData(...)` | Passe-plat vers career_modules_delivery_progress.confirmDropOffData. | 2005 |
| `career_modules_delivery_cargoScreen.deliveryMarkerSelected(poiId)` | Callback de clic sur un marqueur : met en surbrillance les cartes et, si la route automatique est désactivée, y navigue (freeroam_bigMapMode.navigateToMission). *(interne)* | 1860 |
| `career_modules_delivery_cargoScreen.deliveryScreenExternalButtonPressed(id)` | Boutons externes de l'écran : 'openDeliveryProgress' ouvre career.branchPage (logistics-delivery) et 'openVehicleDeliveryProgress' (logistics-vehicleDelivery). | 951 |
| `career_modules_delivery_cargoScreen.dropOffPopupClosed(mode)` | Appelée par l'UI à la fermeture d'une popup de dépose : mode 'results' déclenche onDeliveryRewardsPopupClosed, mode 'cargoSelection' déclenche onDeliveryDropOffCargoSelectionPopupClosed. | 2008 |
| `career_modules_delivery_cargoScreen.enterCargoOverviewScreen(facilityId, parkingSpotPath)` | Ouvre l'écran : mémorise facilité/parking spot, déclenche les générateurs du tutoriel si besoin, vide les POI, entre dans la grande carte avec POI personnalisés, navigue vers la route UI 'career.cargoOverview' et déclenche onEnterCargoOverviewScreen. | 1511 |
| `career_modules_delivery_cargoScreen.enterMyCargo()` | Ouvre l'écran sans facilité (enterCargoOverviewScreen()). | 1567 |
| `career_modules_delivery_cargoScreen.exitCargoOverviewScreen(facilityId, parkingSpotPath)` | Appelée à la fermeture de l'écran : le marque fermé, réactive le déplacement, vide les POI, quitte la grande carte, remet la simulation en marche, planifie la mise à jour des poids et vérifie la sortie du mode livraison. | 1583 |
| `career_modules_delivery_cargoScreen.exitDeliveryMode()` | Quitte le mode livraison (avec hook onGameplayActivityAborted s'il était actif) via career_modules_delivery_general.exitDeliveryMode. | 1994 |
| `career_modules_delivery_cargoScreen.formatAcceptedOfferForUI(offer)` | Formate une offre de véhicule/remorque acceptée pour l'UI : nom, marque, kilométrage, destination, tâche en cours (monter dans le véhicule, atteler la remorque, déposer…), vignette, récompense, route, modificateurs, informations d'abandon (pénalité = récompense × facteur d'abandon). | 521 |
| `career_modules_delivery_cargoScreen.formatCargoGroup(group, playerCargoContainers, showFirstSeen)` | Formate un groupe de cargos « identiques » (même nom, destination…) en une entrée pour l'UI : ids, noms court/long d'origine/emplacement/destination, type, slots, distance, récompense, poids, temps d'offre restant, modificateurs, route navgraph, emplacements cibles possibles, etc. | 90 |
| `career_modules_delivery_cargoScreen.getCargoScreenTab()` | Renvoie l'onglet courant ('' à l'ouverture). | 70 |
| `career_modules_delivery_cargoScreen.highlightCargoInPoi(poiId)` | Envoie à l'UI (guihooks 'sendHighlightedCardIds') les ids de cartes liées au marqueur de grande carte donné ; table vide si inconnu. | 1841 |
| `career_modules_delivery_cargoScreen.isCargoScreenOpen()` | Indique si l'écran de cargaison est ouvert. | 46 |
| `career_modules_delivery_cargoScreen.moveCargoFromUi(cargoId, targetLocation)` | Déplace un cargo vers un autre emplacement en tant que déplacement transitoire (dParcelManager.addTransientMoveCargo) ; appliqué seulement au commit. | 1468 |
| `career_modules_delivery_cargoScreen.moveMaterialFromUi(materialType, cargoType, amount, targetLocation)` | Charge un matériau (fluide ou vrac) du stockage de la facilité dans les conteneurs du joueur : avec targetLocation.type 'auto', choisit les conteneurs compatibles (déjà remplis du même matériau d'abord, puis vides) ; avec 'vehicle', le conteneur indiqué. Remplit jusqu'à épuisement du volume, logue un avertissement s'il en reste, puis notifie l'UI ('requestCargoDataSimple'). | 751 |
| `career_modules_delivery_cargoScreen.onBigmapHoveredPoiIdChanged(poiId)` | Hook : au survol d'un marqueur, met en surbrillance les entrées de liste (si l'écran est ouvert). *(interne)* *(hook)* | 1871 |
| `career_modules_delivery_cargoScreen.onCareerActivated()` | Hook : mémorise les modules delivery (parcelManager, cargoScreen, general, generator, progress, vehicleOfferManager, parcelMods, vehicleTasks, tutorial) et util_stepHandler. *(interne)* *(hook)* | 11 |
| `career_modules_delivery_cargoScreen.onCargoGenerated(cargo)` | Hook : si l'écran est ouvert sur la facilité d'origine du cargo généré, notifie l'UI ('newCargoAvailable') une seule fois. *(interne)* *(hook)* | 1450 |
| `career_modules_delivery_cargoScreen.onCargoOverviewRouteLeave(context, toRoute, fromRoute, data)` | Hook de route UI : en quittant la route cargoOverview (sauf vers un enfant), annule les déplacements non validés puis ferme l'écran. *(interne)* *(hook)* | 1687 |
| `career_modules_delivery_cargoScreen.onCargoPickedUp()` | Hook : recalcule la meilleure route (destination la plus proche) si la route automatique est activée. *(interne)* *(hook)* | 1816 |
| `career_modules_delivery_cargoScreen.onDeactivateBigMapCallback()` | Hook : à la sortie de la grande carte, en mode livraison avec route automatique, n'affiche que la route jusqu'à la première destination. *(interne)* *(hook)* | 1824 |
| `career_modules_delivery_cargoScreen.onDeliveryRewardsPopupClosed()` | Hook : après la popup de récompenses, recalcule la route (si automaticRoute) et, après 0,5 s, affiche les popups d'introduction 'delivery/cargoDelivered' et l'astuce du taxi si le joueur est à pied. *(interne)* *(hook)* | 1795 |
| `career_modules_delivery_cargoScreen.requestCargoDataForUi(facId, psPath, updateMaxTimeTimestamp)` | Construit toutes les données de l'écran (joueur, véhicules, conteneurs, offres acceptées, cartes, filtres, tris, regroupements, bouton de confirmation, panneaux de facilité) puis les envoie à l'UI par guihooks 'cargoDataForUiReady'. | 1095 |
| `career_modules_delivery_cargoScreen.requestDropOffData(...)` | Passe-plat vers career_modules_delivery_progress.requestDropOffData. | 2004 |
| `career_modules_delivery_cargoScreen.setBestRoute(onlyClosestTarget)` | Calcule et affiche la meilleure route : tâches de véhicule en priorité, sinon enchaînement de destinations (plus proche voisin) des cargos en véhicule ; efface le chemin s'il n'y a rien à cibler. | 1731 |
| `career_modules_delivery_cargoScreen.setBigMapPanEnabled(enabled)` | Active/désactive le déplacement de la grande carte par les actions bigMapMoveForwardBackward/LeftRight (filtre d'actions) et remet la caméra à 0 quand c'est désactivé. | 1571 |
| `career_modules_delivery_cargoScreen.setCargoRoute(cargoId, origin)` | Au clic sur un cargo, place le focus de navigation de la grande carte sur son origine ou sa destination. | 1959 |
| `career_modules_delivery_cargoScreen.setCargoScreenTab(tab)` | Mémorise l'onglet courant et ne laisse visibles sur la grande carte que les marqueurs liés à des cartes ayant ce filterTag (ou 'myCargo') ; vide les POI et réinitialise les marqueurs. | 47 |
| `career_modules_delivery_cargoScreen.setVisibleIdsForBigMap()` | Reconstruit la correspondance marqueur de grande carte -> cartes (via card.bigMapIds) ; seuls ces marqueurs sont pertinents. | 1974 |
| `career_modules_delivery_cargoScreen.showCargoContainerHelpPopup()` | Affiche la popup d'aide 'cargoContainerHowTo'. | 2000 |
| `career_modules_delivery_cargoScreen.showCargoRoutePreview(cargoId)` | Aperçu de route d'un cargo (origine/emplacement vers destination, ou plusieurs destinations). | 1902 |
| `career_modules_delivery_cargoScreen.showLocationRoutePreview(locationId, asProvider)` | Aperçu de route depuis le parking spot de l'écran vers la facilité donnée (point de ramassage si asProvider, sinon de dépose). | 1944 |
| `career_modules_delivery_cargoScreen.showRoutePreview(route)` | Affiche sur la grande carte un aperçu de route multipoints (type 'navgraph', via gameplay/route/route) ou l'efface si la route est nil/invalide. | 1878 |
| `career_modules_delivery_cargoScreen.showVehicleOfferRoutePreview(offerId)` | Aperçu de route entre les deux emplacements d'une offre de véhicule. | 1929 |
| `career_modules_delivery_cargoScreen.spawnOffer(...)` | Passe-plat vers career_modules_delivery_vehicleOfferManager.spawnOffer. | 1491 |
| `career_modules_delivery_cargoScreen.toggleOfferForSpawning(offerId)` | Inverse le drapeau spawnWhenCommitingCargo d'une offre (apparition au commit de la configuration). | 1493 |
| `career_modules_delivery_cargoScreen.tryLoadAll(ids)` | Corps vide dans cette version : ne fait rien. | 364 |
| `career_modules_delivery_cargoScreen.unloadCargoPopupClosed()` | Passe-plat vers career_modules_delivery_progress.unloadCargoPopupClosed. | 2003 |

### Détail des paramètres

#### `career_modules_delivery_cargoScreen.abandonAcceptedOffer(vehId)`

Abandonne une offre acceptée : déclenche le hook onGameplayActivityAborted puis rend le véhicule de livraison (vehicleTasks.giveBackDeliveryVehicle).

- `vehId` (*integer*) : Id d'objet du véhicule de livraison.

#### `career_modules_delivery_cargoScreen.clearTransientMoveForCargo(...)`

Passe-plat vers career_modules_delivery_parcelManager.clearTransientMoveForCargo.

- `...` (*any*) : Arguments transmis (id de cargo).

#### `career_modules_delivery_cargoScreen.clearTransientMovesForStorage(materialType)`

Supprime les cargos en déplacement transitoire issus du stockage de matériau donné de la facilité de l'écran ouvert (emplacement 'delete') et annule leur déplacement.

- `materialType` (*string*) : Type de matériau du stockage.

#### `career_modules_delivery_cargoScreen.confirmDropOffData(...)`

Passe-plat vers career_modules_delivery_progress.confirmDropOffData.

- `...` (*any*) : Arguments transmis.

#### `career_modules_delivery_cargoScreen.deliveryMarkerSelected(poiId)`

Callback de clic sur un marqueur : met en surbrillance les cartes et, si la route automatique est désactivée, y navigue (freeroam_bigMapMode.navigateToMission).

- `poiId` (*string*) : Id du marqueur.

#### `career_modules_delivery_cargoScreen.deliveryScreenExternalButtonPressed(id)`

Boutons externes de l'écran : 'openDeliveryProgress' ouvre career.branchPage (logistics-delivery) et 'openVehicleDeliveryProgress' (logistics-vehicleDelivery).

- `id` (*string*) : Id du bouton.

#### `career_modules_delivery_cargoScreen.dropOffPopupClosed(mode)`

Appelée par l'UI à la fermeture d'une popup de dépose : mode 'results' déclenche onDeliveryRewardsPopupClosed, mode 'cargoSelection' déclenche onDeliveryDropOffCargoSelectionPopupClosed.

- `mode` (*string*) : 'results' ou 'cargoSelection'.

#### `career_modules_delivery_cargoScreen.enterCargoOverviewScreen(facilityId, parkingSpotPath)`

Ouvre l'écran : mémorise facilité/parking spot, déclenche les générateurs du tutoriel si besoin, vide les POI, entre dans la grande carte avec POI personnalisés, navigue vers la route UI 'career.cargoOverview' et déclenche onEnterCargoOverviewScreen.

- `facilityId` (*string|nil*) : Id de la facilité (nil pour « mon cargo »).
- `parkingSpotPath` (*string|nil*) : Chemin du parking spot.

#### `career_modules_delivery_cargoScreen.exitCargoOverviewScreen(facilityId, parkingSpotPath)`

Appelée à la fermeture de l'écran : le marque fermé, réactive le déplacement, vide les POI, quitte la grande carte, remet la simulation en marche, planifie la mise à jour des poids et vérifie la sortie du mode livraison.

- `facilityId` (*string|nil*) : Non utilisé.
- `parkingSpotPath` (*string|nil*) : Non utilisé.

#### `career_modules_delivery_cargoScreen.formatAcceptedOfferForUI(offer)`

Formate une offre de véhicule/remorque acceptée pour l'UI : nom, marque, kilométrage, destination, tâche en cours (monter dans le véhicule, atteler la remorque, déposer…), vignette, récompense, route, modificateurs, informations d'abandon (pénalité = récompense × facteur d'abandon).

- `offer` (*table*) : Offre de véhicule (champs vehicle, task, data, rewards).
- **renvoie** : table Carte de type offre pour l'UI.

#### `career_modules_delivery_cargoScreen.formatCargoGroup(group, playerCargoContainers, showFirstSeen)`

Formate un groupe de cargos « identiques » (même nom, destination…) en une entrée pour l'UI : ids, noms court/long d'origine/emplacement/destination, type, slots, distance, récompense, poids, temps d'offre restant, modificateurs, route navgraph, emplacements cibles possibles, etc.

- `group` (*table[]*) : Cargos du groupe (triés par id dans la fonction).
- `playerCargoContainers` (*table[]*) : Conteneurs du joueur (getNearbyVehicleCargoContainers).
- `showFirstSeen` (*boolean|nil*) : Gère l'indicateur de première apparition des cargos (déduit du code).
- **renvoie** : table Entrée formatée pour l'UI.

#### `career_modules_delivery_cargoScreen.getCargoScreenTab()`

Renvoie l'onglet courant ('' à l'ouverture).

- **renvoie** : string Onglet courant.

#### `career_modules_delivery_cargoScreen.highlightCargoInPoi(poiId)`

Envoie à l'UI (guihooks 'sendHighlightedCardIds') les ids de cartes liées au marqueur de grande carte donné ; table vide si inconnu.

- `poiId` (*string|nil*) : Id du marqueur/POI.

#### `career_modules_delivery_cargoScreen.isCargoScreenOpen()`

Indique si l'écran de cargaison est ouvert.

- **renvoie** : boolean true si ouvert.

#### `career_modules_delivery_cargoScreen.moveCargoFromUi(cargoId, targetLocation)`

Déplace un cargo vers un autre emplacement en tant que déplacement transitoire (dParcelManager.addTransientMoveCargo) ; appliqué seulement au commit.

- `cargoId` (*any*) : Id du cargo.
- `targetLocation` (*table*) : Emplacement cible (facilité, véhicule/conteneur…).

#### `career_modules_delivery_cargoScreen.moveMaterialFromUi(materialType, cargoType, amount, targetLocation)`

Charge un matériau (fluide ou vrac) du stockage de la facilité dans les conteneurs du joueur : avec targetLocation.type 'auto', choisit les conteneurs compatibles (déjà remplis du même matériau d'abord, puis vides) ; avec 'vehicle', le conteneur indiqué. Remplit jusqu'à épuisement du volume, logue un avertissement s'il en reste, puis notifie l'UI ('requestCargoDataSimple').

- `materialType` (*string*) : Type de matériau.
- `cargoType` (*string*) : Type de cargo ('fluid' ou 'dryBulk').
- `amount` (*number*) : Volume à charger (litres/slots).
- `targetLocation` (*table*) : {type='auto'} ou {type='vehicle', vehId, containerId}.

#### `career_modules_delivery_cargoScreen.onBigmapHoveredPoiIdChanged(poiId)`

Hook : au survol d'un marqueur, met en surbrillance les entrées de liste (si l'écran est ouvert).

- `poiId` (*string|nil*) : Marqueur survolé.

#### `career_modules_delivery_cargoScreen.onCargoGenerated(cargo)`

Hook : si l'écran est ouvert sur la facilité d'origine du cargo généré, notifie l'UI ('newCargoAvailable') une seule fois.

- `cargo` (*table*) : Cargo généré (champ origin).

#### `career_modules_delivery_cargoScreen.onCargoOverviewRouteLeave(context, toRoute, fromRoute, data)`

Hook de route UI : en quittant la route cargoOverview (sauf vers un enfant), annule les déplacements non validés puis ferme l'écran.

- `context` (*any*) : Contexte du routeur UI.
- `toRoute` (*table|nil*) : Route de destination (champ name).
- `fromRoute` (*table|nil*) : Route quittée.
- `data` (*any*) : Données de navigation.

#### `career_modules_delivery_cargoScreen.requestCargoDataForUi(facId, psPath, updateMaxTimeTimestamp)`

Construit toutes les données de l'écran (joueur, véhicules, conteneurs, offres acceptées, cartes, filtres, tris, regroupements, bouton de confirmation, panneaux de facilité) puis les envoie à l'UI par guihooks 'cargoDataForUiReady'.

- `facId` (*string|nil*) : Id de la facilité concernée.
- `psPath` (*string|nil*) : Chemin du parking spot concerné.
- `updateMaxTimeTimestamp` (*boolean|nil*) : Si différent de false, remet à jour l'horodatage maximal d'affichage des offres.

#### `career_modules_delivery_cargoScreen.requestDropOffData(...)`

Passe-plat vers career_modules_delivery_progress.requestDropOffData.

- `...` (*any*) : Arguments transmis.

#### `career_modules_delivery_cargoScreen.setBestRoute(onlyClosestTarget)`

Calcule et affiche la meilleure route : tâches de véhicule en priorité, sinon enchaînement de destinations (plus proche voisin) des cargos en véhicule ; efface le chemin s'il n'y a rien à cibler.

- `onlyClosestTarget` (*boolean|nil*) : Si vrai, ne garde que la destination la plus proche.

#### `career_modules_delivery_cargoScreen.setBigMapPanEnabled(enabled)`

Active/désactive le déplacement de la grande carte par les actions bigMapMoveForwardBackward/LeftRight (filtre d'actions) et remet la caméra à 0 quand c'est désactivé.

- `enabled` (*boolean*) : true pour autoriser le déplacement.

#### `career_modules_delivery_cargoScreen.setCargoRoute(cargoId, origin)`

Au clic sur un cargo, place le focus de navigation de la grande carte sur son origine ou sa destination.

- `cargoId` (*any|nil*) : Id du cargo.
- `origin` (*boolean|nil*) : Si vrai, cible l'origine plutôt que la destination.

#### `career_modules_delivery_cargoScreen.setCargoScreenTab(tab)`

Mémorise l'onglet courant et ne laisse visibles sur la grande carte que les marqueurs liés à des cartes ayant ce filterTag (ou 'myCargo') ; vide les POI et réinitialise les marqueurs.

- `tab` (*string*) : Clé de filtre/onglet (ex. 'parcel', 'vehicle', 'all').

#### `career_modules_delivery_cargoScreen.showCargoRoutePreview(cargoId)`

Aperçu de route d'un cargo (origine/emplacement vers destination, ou plusieurs destinations).

- `cargoId` (*any|nil*) : Id du cargo ; nil efface l'aperçu.

#### `career_modules_delivery_cargoScreen.showLocationRoutePreview(locationId, asProvider)`

Aperçu de route depuis le parking spot de l'écran vers la facilité donnée (point de ramassage si asProvider, sinon de dépose).

- `locationId` (*string|nil*) : Id de facilité ; nil efface l'aperçu.
- `asProvider` (*boolean|nil*) : Utiliser le premier pickUpSpot au lieu du premier dropOffSpot.

#### `career_modules_delivery_cargoScreen.showRoutePreview(route)`

Affiche sur la grande carte un aperçu de route multipoints (type 'navgraph', via gameplay/route/route) ou l'efface si la route est nil/invalide.

- `route` (*table|nil*) : {type='navgraph', locations={...}}.

#### `career_modules_delivery_cargoScreen.showVehicleOfferRoutePreview(offerId)`

Aperçu de route entre les deux emplacements d'une offre de véhicule.

- `offerId` (*any|nil*) : Id de l'offre ; nil efface l'aperçu.

#### `career_modules_delivery_cargoScreen.spawnOffer(...)`

Passe-plat vers career_modules_delivery_vehicleOfferManager.spawnOffer.

- `...` (*any*) : Arguments transmis tels quels.
- **renvoie** : any Valeur renvoyée par spawnOffer.

#### `career_modules_delivery_cargoScreen.toggleOfferForSpawning(offerId)`

Inverse le drapeau spawnWhenCommitingCargo d'une offre (apparition au commit de la configuration).

- `offerId` (*any*) : Id de l'offre.

#### `career_modules_delivery_cargoScreen.tryLoadAll(ids)`

Corps vide dans cette version : ne fait rien.

- `ids` (*any*) : Non utilisé.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"core_vehicleBridge"}. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onDeliveryDropOffCargoSelectionPopupClosed`
- `onDeliveryRewardsPopupClosed` — écouté par 1 module(s)
- `onEnterCargoOverviewScreen`
- `onGameplayActivityAborted`

**Évènements UI (guihooks.trigger) :** `OpenSimpleDelayPopup`, `cargoDataForUiReady`, `newCargoAvailable`, `requestCargoDataSimple`, `sendHighlightedCardIds`

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/delivery/cargoScreen.lua`.*
