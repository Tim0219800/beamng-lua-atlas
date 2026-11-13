---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/cargoScreen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Back-end de l'écran « Cargo Overview » de la carrière (livraison de colis, matériaux, véhicules et remorques). Il formate pour l'UI les cartes de cargaison (colis groupés, stockages de fluides/vrac, offres de véhicules, véhicules prêtés), envoie le tout via guihooks 'cargoDataForUiReady', gère le chargement/déchargement par déplacements transitoires (moveCargoFromUi, moveMaterialFromUi puis commit/cancel), l'ouverture/fermeture de l'écran avec la grande carte, le calcul de la meilleure route (setBestRoute) et les aperçus de route et surbrillances des marqueurs.
--- Accès : extension `career_modules_delivery_cargoScreen` : `extensions.load("career_modules_delivery_cargoScreen")`, puis la globale `career_modules_delivery_cargoScreen`
---@class career_modules_delivery_cargoScreen
---@field dependencies string[] {"core_vehicleBridge"}.
career_modules_delivery_cargoScreen = {}

--- Abandonne une offre acceptée : déclenche le hook onGameplayActivityAborted puis rend le véhicule de livraison (vehicleTasks.giveBackDeliveryVehicle).
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:582
---@param vehId integer Id d'objet du véhicule de livraison.
function career_modules_delivery_cargoScreen.abandonAcceptedOffer(vehId) end

--- Déclenche onGameplayActivityAborted puis applique tous les déplacements transitoires (dParcelManager.applyTransientMoves).
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1484
function career_modules_delivery_cargoScreen.applyTransientMoves() end

--- Annule la livraison en cours de configuration : efface les déplacements transitoires, les marquages d'apparition d'offres et de véhicules prêtés, rafraîchit les conteneurs proches et affiche un message.
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1673
function career_modules_delivery_cargoScreen.cancelDeliveryConfiguration() end

--- Passe-plat vers career_modules_delivery_parcelManager.clearTransientMoveForCargo.
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:2006
---@param ... any Arguments transmis (id de cargo).
function career_modules_delivery_cargoScreen.clearTransientMoveForCargo(...) end

--- Supprime les cargos en déplacement transitoire issus du stockage de matériau donné de la facilité de l'écran ouvert (emplacement 'delete') et annule leur déplacement.
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:740
---@param materialType string Type de matériau du stockage.
function career_modules_delivery_cargoScreen.clearTransientMovesForStorage(materialType) end

--- Valide la configuration : applique les déplacements transitoires vers la facilité courante, démarre le mode livraison si du cargo est chargé ou restant, met à jour les poids des conteneurs (gel puis délai de chargement avec popup), puis fait apparaître les offres marquées et les véhicules prêtés.
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1595
function career_modules_delivery_cargoScreen.commitDeliveryConfiguration() end

--- Passe-plat vers career_modules_delivery_progress.confirmDropOffData.
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:2005
---@param ... any Arguments transmis.
function career_modules_delivery_cargoScreen.confirmDropOffData(...) end

--- Callback de clic sur un marqueur : met en surbrillance les cartes et, si la route automatique est désactivée, y navigue (freeroam_bigMapMode.navigateToMission).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1860
---@param poiId string Id du marqueur.
function career_modules_delivery_cargoScreen.deliveryMarkerSelected(poiId) end

--- Boutons externes de l'écran : 'openDeliveryProgress' ouvre career.branchPage (logistics-delivery) et 'openVehicleDeliveryProgress' (logistics-vehicleDelivery).
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:951
---@param id string Id du bouton.
function career_modules_delivery_cargoScreen.deliveryScreenExternalButtonPressed(id) end

--- Appelée par l'UI à la fermeture d'une popup de dépose : mode 'results' déclenche onDeliveryRewardsPopupClosed, mode 'cargoSelection' déclenche onDeliveryDropOffCargoSelectionPopupClosed.
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:2008
---@param mode string 'results' ou 'cargoSelection'.
function career_modules_delivery_cargoScreen.dropOffPopupClosed(mode) end

--- Ouvre l'écran : mémorise facilité/parking spot, déclenche les générateurs du tutoriel si besoin, vide les POI, entre dans la grande carte avec POI personnalisés, navigue vers la route UI 'career.cargoOverview' et déclenche onEnterCargoOverviewScreen.
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1511
---@param facilityId string|nil Id de la facilité (nil pour « mon cargo »).
---@param parkingSpotPath string|nil Chemin du parking spot.
function career_modules_delivery_cargoScreen.enterCargoOverviewScreen(facilityId, parkingSpotPath) end

--- Ouvre l'écran sans facilité (enterCargoOverviewScreen()).
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1567
function career_modules_delivery_cargoScreen.enterMyCargo() end

--- Appelée à la fermeture de l'écran : le marque fermé, réactive le déplacement, vide les POI, quitte la grande carte, remet la simulation en marche, planifie la mise à jour des poids et vérifie la sortie du mode livraison.
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1583
---@param facilityId string|nil Non utilisé.
---@param parkingSpotPath string|nil Non utilisé.
function career_modules_delivery_cargoScreen.exitCargoOverviewScreen(facilityId, parkingSpotPath) end

--- Quitte le mode livraison (avec hook onGameplayActivityAborted s'il était actif) via career_modules_delivery_general.exitDeliveryMode.
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1994
function career_modules_delivery_cargoScreen.exitDeliveryMode() end

--- Formate une offre de véhicule/remorque acceptée pour l'UI : nom, marque, kilométrage, destination, tâche en cours (monter dans le véhicule, atteler la remorque, déposer…), vignette, récompense, route, modificateurs, informations d'abandon (pénalité = récompense × facteur d'abandon).
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:521
---@param offer table Offre de véhicule (champs vehicle, task, data, rewards).
---@return table  Carte de type offre pour l'UI.
function career_modules_delivery_cargoScreen.formatAcceptedOfferForUI(offer) end

--- Formate un groupe de cargos « identiques » (même nom, destination…) en une entrée pour l'UI : ids, noms court/long d'origine/emplacement/destination, type, slots, distance, récompense, poids, temps d'offre restant, modificateurs, route navgraph, emplacements cibles possibles, etc.
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:90
---@param group table[] Cargos du groupe (triés par id dans la fonction).
---@param playerCargoContainers table[] Conteneurs du joueur (getNearbyVehicleCargoContainers).
---@param showFirstSeen boolean|nil Gère l'indicateur de première apparition des cargos (déduit du code).
---@return table  Entrée formatée pour l'UI.
function career_modules_delivery_cargoScreen.formatCargoGroup(group, playerCargoContainers, showFirstSeen) end

--- Renvoie l'onglet courant ('' à l'ouverture).
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:70
---@return string  Onglet courant.
function career_modules_delivery_cargoScreen.getCargoScreenTab() end

--- Envoie à l'UI (guihooks 'sendHighlightedCardIds') les ids de cartes liées au marqueur de grande carte donné ; table vide si inconnu.
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1841
---@param poiId string|nil Id du marqueur/POI.
function career_modules_delivery_cargoScreen.highlightCargoInPoi(poiId) end

--- Indique si l'écran de cargaison est ouvert.
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:46
---@return boolean  true si ouvert.
function career_modules_delivery_cargoScreen.isCargoScreenOpen() end

--- Déplace un cargo vers un autre emplacement en tant que déplacement transitoire (dParcelManager.addTransientMoveCargo) ; appliqué seulement au commit.
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1468
---@param cargoId any Id du cargo.
---@param targetLocation table Emplacement cible (facilité, véhicule/conteneur…).
function career_modules_delivery_cargoScreen.moveCargoFromUi(cargoId, targetLocation) end

--- Charge un matériau (fluide ou vrac) du stockage de la facilité dans les conteneurs du joueur : avec targetLocation.type 'auto', choisit les conteneurs compatibles (déjà remplis du même matériau d'abord, puis vides) ; avec 'vehicle', le conteneur indiqué. Remplit jusqu'à épuisement du volume, logue un avertissement s'il en reste, puis notifie l'UI ('requestCargoDataSimple').
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:751
---@param materialType string Type de matériau.
---@param cargoType string Type de cargo ('fluid' ou 'dryBulk').
---@param amount number Volume à charger (litres/slots).
---@param targetLocation table {type='auto'} ou {type='vehicle', vehId, containerId}.
function career_modules_delivery_cargoScreen.moveMaterialFromUi(materialType, cargoType, amount, targetLocation) end

--- Hook : au survol d'un marqueur, met en surbrillance les entrées de liste (si l'écran est ouvert).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1871
---@param poiId string|nil Marqueur survolé.
function career_modules_delivery_cargoScreen.onBigmapHoveredPoiIdChanged(poiId) end

--- Hook : mémorise les modules delivery (parcelManager, cargoScreen, general, generator, progress, vehicleOfferManager, parcelMods, vehicleTasks, tutorial) et util_stepHandler.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:11
function career_modules_delivery_cargoScreen.onCareerActivated() end

--- Hook : si l'écran est ouvert sur la facilité d'origine du cargo généré, notifie l'UI ('newCargoAvailable') une seule fois.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1450
---@param cargo table Cargo généré (champ origin).
function career_modules_delivery_cargoScreen.onCargoGenerated(cargo) end

--- Hook de route UI : en quittant la route cargoOverview (sauf vers un enfant), annule les déplacements non validés puis ferme l'écran.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1687
---@param context any Contexte du routeur UI.
---@param toRoute table|nil Route de destination (champ name).
---@param fromRoute table|nil Route quittée.
---@param data any Données de navigation.
function career_modules_delivery_cargoScreen.onCargoOverviewRouteLeave(context, toRoute, fromRoute, data) end

--- Hook : recalcule la meilleure route (destination la plus proche) si la route automatique est activée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1816
function career_modules_delivery_cargoScreen.onCargoPickedUp() end

--- Hook : à la sortie de la grande carte, en mode livraison avec route automatique, n'affiche que la route jusqu'à la première destination.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1824
function career_modules_delivery_cargoScreen.onDeactivateBigMapCallback() end

--- Hook : après la popup de récompenses, recalcule la route (si automaticRoute) et, après 0,5 s, affiche les popups d'introduction 'delivery/cargoDelivered' et l'astuce du taxi si le joueur est à pied.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1795
function career_modules_delivery_cargoScreen.onDeliveryRewardsPopupClosed() end

--- Construit toutes les données de l'écran (joueur, véhicules, conteneurs, offres acceptées, cartes, filtres, tris, regroupements, bouton de confirmation, panneaux de facilité) puis les envoie à l'UI par guihooks 'cargoDataForUiReady'.
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1095
---@param facId string|nil Id de la facilité concernée.
---@param psPath string|nil Chemin du parking spot concerné.
---@param updateMaxTimeTimestamp boolean|nil Si différent de false, remet à jour l'horodatage maximal d'affichage des offres.
function career_modules_delivery_cargoScreen.requestCargoDataForUi(facId, psPath, updateMaxTimeTimestamp) end

--- Passe-plat vers career_modules_delivery_progress.requestDropOffData.
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:2004
---@param ... any Arguments transmis.
function career_modules_delivery_cargoScreen.requestDropOffData(...) end

--- Calcule et affiche la meilleure route : tâches de véhicule en priorité, sinon enchaînement de destinations (plus proche voisin) des cargos en véhicule ; efface le chemin s'il n'y a rien à cibler.
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1731
---@param onlyClosestTarget boolean|nil Si vrai, ne garde que la destination la plus proche.
function career_modules_delivery_cargoScreen.setBestRoute(onlyClosestTarget) end

--- Active/désactive le déplacement de la grande carte par les actions bigMapMoveForwardBackward/LeftRight (filtre d'actions) et remet la caméra à 0 quand c'est désactivé.
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1571
---@param enabled boolean true pour autoriser le déplacement.
function career_modules_delivery_cargoScreen.setBigMapPanEnabled(enabled) end

--- Au clic sur un cargo, place le focus de navigation de la grande carte sur son origine ou sa destination.
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1959
---@param cargoId any|nil Id du cargo.
---@param origin boolean|nil Si vrai, cible l'origine plutôt que la destination.
function career_modules_delivery_cargoScreen.setCargoRoute(cargoId, origin) end

--- Mémorise l'onglet courant et ne laisse visibles sur la grande carte que les marqueurs liés à des cartes ayant ce filterTag (ou 'myCargo') ; vide les POI et réinitialise les marqueurs.
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:47
---@param tab string Clé de filtre/onglet (ex. 'parcel', 'vehicle', 'all').
function career_modules_delivery_cargoScreen.setCargoScreenTab(tab) end

--- Reconstruit la correspondance marqueur de grande carte -> cartes (via card.bigMapIds) ; seuls ces marqueurs sont pertinents.
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1974
function career_modules_delivery_cargoScreen.setVisibleIdsForBigMap() end

--- Affiche la popup d'aide 'cargoContainerHowTo'.
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:2000
function career_modules_delivery_cargoScreen.showCargoContainerHelpPopup() end

--- Aperçu de route d'un cargo (origine/emplacement vers destination, ou plusieurs destinations).
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1902
---@param cargoId any|nil Id du cargo ; nil efface l'aperçu.
function career_modules_delivery_cargoScreen.showCargoRoutePreview(cargoId) end

--- Aperçu de route depuis le parking spot de l'écran vers la facilité donnée (point de ramassage si asProvider, sinon de dépose).
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1944
---@param locationId string|nil Id de facilité ; nil efface l'aperçu.
---@param asProvider boolean|nil Utiliser le premier pickUpSpot au lieu du premier dropOffSpot.
function career_modules_delivery_cargoScreen.showLocationRoutePreview(locationId, asProvider) end

--- Affiche sur la grande carte un aperçu de route multipoints (type 'navgraph', via gameplay/route/route) ou l'efface si la route est nil/invalide.
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1878
---@param route table|nil {type='navgraph', locations={...}}.
function career_modules_delivery_cargoScreen.showRoutePreview(route) end

--- Aperçu de route entre les deux emplacements d'une offre de véhicule.
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1929
---@param offerId any|nil Id de l'offre ; nil efface l'aperçu.
function career_modules_delivery_cargoScreen.showVehicleOfferRoutePreview(offerId) end

--- Passe-plat vers career_modules_delivery_vehicleOfferManager.spawnOffer.
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1491
---@param ... any Arguments transmis tels quels.
---@return any  Valeur renvoyée par spawnOffer.
function career_modules_delivery_cargoScreen.spawnOffer(...) end

--- Inverse le drapeau spawnWhenCommitingCargo d'une offre (apparition au commit de la configuration).
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1493
---@param offerId any Id de l'offre.
function career_modules_delivery_cargoScreen.toggleOfferForSpawning(offerId) end

--- Corps vide dans cette version : ne fait rien.
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:364
---@param ids any Non utilisé.
function career_modules_delivery_cargoScreen.tryLoadAll(ids) end

--- Passe-plat vers career_modules_delivery_progress.unloadCargoPopupClosed.
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:2003
function career_modules_delivery_cargoScreen.unloadCargoPopupClosed() end

