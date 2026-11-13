---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/marketplace.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Place de marché de véhicules de la carrière, dans deux sens. (1) Le joueur met en vente des véhicules de son inventaire (listVehicles) ; des acheteurs virtuels génèrent des offres au fil du temps (offre de base = valeur de marché, avec bruit et plafonds selon le rapport prix demandé / valeur de marché), qui expirent après environ 500 s. Le joueur accepte, refuse ou négocie. (2) Le joueur négocie le prix d'un véhicule en vente chez un vendeur (concession ou particulier). Le moteur de négociation simule la patience, les contre-offres et les insultes d'une personnalité (fichier levels/west_coast_usa/facilities/negotiationPersonalities.json) et informe l'UI via guihooks negotiationData. Sauvegarde dans career/marketplace.json.
--- Accès : extension `career_modules_marketplace` : `extensions.load("career_modules_marketplace")`, puis la globale `career_modules_marketplace`
---@class career_modules_marketplace
---@field dealershipBuyerQuotes string[] 25 clés de traduction de phrases d'acheteurs de concession (ui.career.negotiation.dealershipBuyerQuotes.01..25).
---@field firstNameCount integer Nombre de prénoms (#firstNames).
---@field firstNames string[] Liste de prénoms pour générer les noms d'acheteurs/vendeurs particuliers.
---@field initialCount integer Nombre d'entrées de initials.
---@field initialProbabilities table<string, number> Fréquence relative de chaque initiale (A-Z) pour les noms de famille.
---@field initials string[] Liste d'initiales pondérée par initialProbabilities (math.ceil(p*100) copies chacune).
---@field privateSellerQuotes string[] 50 clés de traduction de phrases de vendeurs particuliers (ui.career.negotiation.privateSellerQuotes.01..50).
career_modules_marketplace = {}

--- Accepte une offre : la retire de l'annonce et vend le véhicule à la valeur de l'offre (career_modules_inventory.sellVehicle).
---Source : lua/ge/extensions/career/modules/marketplace.lua:214
---@param inventoryId integer Id d'inventaire.
---@param offerId integer Id de l'offre.
function career_modules_marketplace.acceptOffer(inventoryId, offerId) end

--- Annule la négociation (statut failed) ; si le joueur avait déjà fait une offre, empêche de renégocier cette offre ou ce véhicule.
---Source : lua/ge/extensions/career/modules/marketplace.lua:506
function career_modules_marketplace.cancelNegotiation() end

--- Refuse (supprime) une offre de l'annonce.
---Source : lua/ge/extensions/career/modules/marketplace.lua:225
---@param inventoryId integer Id d'inventaire.
---@param offerId integer Id de l'offre.
function career_modules_marketplace.declineOffer(inventoryId, offerId) end

--- À la sortie de l'écran : prend l'offre si le statut est accepted et non prise, sinon annule la négociation.
---Source : lua/ge/extensions/career/modules/marketplace.lua:871
function career_modules_marketplace.finalizeNegotiationExit() end

--- Cherche l'annonce d'un véhicule de l'inventaire.
---Source : lua/ge/extensions/career/modules/marketplace.lua:20
---@param inventoryId integer Id d'inventaire.
---@return table|nil  Annonce (id, value, marketValue, offers...).
function career_modules_marketplace.findVehicleListing(inventoryId) end

--- Crée une offre d'un acheteur aléatoire pour une annonce (celle donnée ou une annonce au hasard) : valeur = valeur de marché * multiplicateur * bruit, plafonnée selon le rapport de prix, arrondie à 50.
---Source : lua/ge/extensions/career/modules/marketplace.lua:171
---@param inventoryId integer|nil Id d'inventaire de l'annonce.
---@return table  Offre {id, timestamp, value, ttl, negotiationPossible, buyerPersonality}.
function career_modules_marketplace.generateOffer(inventoryId) end

--- Tire au hasard un archétype de négociation (acheteur ou vendeur) dans negotiationPersonalities.json et construit la personnalité : nom, patience, seuils d'acceptation/insulte, multiplicateur de prix (1 - m pour un acheteur, 1 + m pour un vendeur), délais, citations.
---Source : lua/ge/extensions/career/modules/marketplace.lua:77
---@param buyer boolean|nil true pour un acheteur.
---@param _archetypes string[]|nil Liste d'archétypes imposée (sinon randomBuyerArchetypes / randomSellerArchetypes).
---@return table|nil  Personnalité, nil si fichier absent ou liste vide.
function career_modules_marketplace.generatePersonality(buyer, _archetypes) end

--- Renvoie une copie des annonces pour l'UI : nom traduit, annonce désactivée si la valeur a trop baissé, offres expirées marquées disabled, offres triées (actives d'abord, les plus récentes en premier).
---Source : lua/ge/extensions/career/modules/marketplace.lua:935
---@return table[]  Annonces.
function career_modules_marketplace.getListings() end

--- Renvoie l'état de la négociation pour l'UI : active, sens (amISelling), prix de départ, patience, offres (myOffer/theirOffer), statut, nom et citation de l'adversaire, véhicule (nom, miniature, kilométrage, valeur réelle) et historique d'offres.
---Source : lua/ge/extensions/career/modules/marketplace.lua:320
---@return table  État de négociation.
function career_modules_marketplace.getNegotiationState() end

--- Met en vente des véhicules (ignore les véhicules inconnus ou déjà en vente). Prix = entry.value ou valeur calculée ; fixe marketRatio et offerTimeMultiplier.
---Source : lua/ge/extensions/career/modules/marketplace.lua:28
---@param vehicles {inventoryId: integer, value: number|nil}[] Véhicules à lister, avec prix demandé facultatif.
function career_modules_marketplace.listVehicles(vehicles) end

--- Propose un prix (converti avec tonumber) : s'il est valide, lance en tâche de fond la réponse de l'adversaire (réflexion puis saisie simulées, baisse de patience, acceptation, contre-offre, refus ou échec) et envoie les états à l'UI.
---Source : lua/ge/extensions/career/modules/marketplace.lua:849
---@param price number|string Prix proposé.
---@return boolean  false si le prix n'est pas autorisé.
function career_modules_marketplace.makeNegotiationOffer(price) end

--- Signale l'ouverture/fermeture du menu d'offres (la négociation compte comme menu ouvert) et met à jour les annonces : purge des offres expirées si ouvert, génération de nouvelles offres sinon.
---Source : lua/ge/extensions/career/modules/marketplace.lua:1007
---@param open boolean Menu ouvert ou non.
function career_modules_marketplace.menuOpened(open) end

--- Hook : charge marketplace.json si la carrière est active (renvoie false sinon).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/marketplace.lua:1024
function career_modules_marketplace.onExtensionLoaded() end

--- Hook de sauvegarde : écrit listedVehicles dans <save>/career/marketplace.json.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/marketplace.lua:1018
---@param currentSavePath string Dossier de sauvegarde.
---@param vehiclesThumbnailUpdate integer[]|nil Non utilisé.
function career_modules_marketplace.onSaveCurrentProfile(currentSavePath, vehiclesThumbnailUpdate) end

--- Hook de frame : affiche la fenêtre de debug en négociation (hors shipping) et, toutes les 10 s de simulation, génère de nouvelles offres et fait expirer les anciennes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/marketplace.lua:881
---@param dtReal number Temps réel (s).
---@param dtSim number Temps simulé (s).
---@param dtRaw number Temps brut (s).
function career_modules_marketplace.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook : retire l'annonce d'un véhicule supprimé de l'inventaire.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/marketplace.lua:931
---@param inventoryId integer Id d'inventaire.
function career_modules_marketplace.onVehicleRemoved(inventoryId) end

--- Ouvre la boutique de véhicules en mode « marketplace » depuis l'ordinateur donné.
---Source : lua/ge/extensions/career/modules/marketplace.lua:1014
---@param computerId string Id de l'ordinateur.
function career_modules_marketplace.openMenu(computerId) end

--- Retire l'annonce du véhicule.
---Source : lua/ge/extensions/career/modules/marketplace.lua:69
---@param inventoryId integer Id d'inventaire.
function career_modules_marketplace.removeVehicleListing(inventoryId) end

--- Démarre une négociation où le joueur vend : initialise la personnalité de l'acheteur, la citation, les prix (le joueur demande listing.value, l'acheteur offre offer.value), l'historique, et navigue vers career.computer.vehicleShopping.negotiation.
---Source : lua/ge/extensions/career/modules/marketplace.lua:387
---@param inventoryId integer Id d'inventaire du véhicule en vente.
---@param offerId integer Id de l'offre de départ.
---@return any  Résultat de ui_router.navigate.
function career_modules_marketplace.startNegotiateBuyingOffer(inventoryId, offerId) end

--- Démarre une négociation où le joueur achète un véhicule de la boutique. Refusée (toast d'avertissement) si le véhicule est en promotion ou non négociable. Initialise patience, prix de départ (remisé si discountPercentage) et navigue vers l'écran d'achat.
---Source : lua/ge/extensions/career/modules/marketplace.lua:439
---@param _shopId string|integer Id du véhicule dans la boutique (career_modules_vehicleShopping).
---@return any  Résultat de ui_router.navigate, ou nil si refusée.
function career_modules_marketplace.startNegotiateSellingOffer(_shopId) end

--- Accepte l'offre de l'adversaire. En vente : fixe la valeur de l'offre et vend le véhicule. En achat : fixe le prix du véhicule de la boutique (originalSellValue si baisse) et bloque d'autres négociations.
---Source : lua/ge/extensions/career/modules/marketplace.lua:853
function career_modules_marketplace.takeTheirOffer() end

