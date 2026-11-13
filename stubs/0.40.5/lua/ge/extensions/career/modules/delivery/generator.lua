---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/generator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Générateur de contenu de la livraison en carrière. Au chargement (setup) il lit les gabarits de colis (*.deliveryParcels.json), de véhicules (*.deliveryVehicles.json) et de matériaux (*.deliveryMaterials.json) dans gameplay/delivery/, prépare les installations (freeroam_facilities de type deliveryProvider : places de parking, types logistiques fournis/reçus, stockages de matériaux, générateurs, progression), puis produit des colis, des offres de véhicules/remorques et fait évoluer les stocks de matériaux selon les intervalles des générateurs. Fournit aussi le calcul des distances et des récompenses initiales, et les opérations sur les matériaux (fractionnement, déplacement, stockage).
--- Accès : extension `career_modules_delivery_generator` : `extensions.load("career_modules_delivery_generator")`, puis la globale `career_modules_delivery_generator`
---@class career_modules_delivery_generator
---@field dependencies table<integer, string> Extensions chargées avant : freeroam_facilities, gameplay_sites_sitesManager, util_configListGenerator.
career_modules_delivery_generator = {}

--- Crée une cargaison de matériau (merge=true, offre sans expiration, destinations 'multi' : installations qui reçoivent ce matériau) à partir du stock d'une installation, et planifie son déplacement transitoire vers le conteneur du véhicule.
---Source : lua/ge/extensions/career/modules/delivery/generator.lua:816
---@param con table Conteneur de cargaison (avec location).
---@param storage table Stockage de matériau de l'installation (materialType, id…).
---@param amount number Quantité (slots).
---@param sourceFacId string Installation d'origine.
---@param sourcePsPath string Place de repli si aucun point d'accès fournisseur trouvé.
function career_modules_delivery_generator.addMaterialAsParcelToContainer(con, storage, amount, sourceFacId, sourcePsPath) end

--- Ajoute ou retire du volume au stock d'un matériau dans une installation, avec bornage à [0, capacité] et avertissement logué en cas de dépassement.
---Source : lua/ge/extensions/career/modules/delivery/generator.lua:957
---@param facId string Identifiant de l'installation.
---@param materialType string Identifiant du matériau.
---@param change number Variation de volume (négative pour retirer).
function career_modules_delivery_generator.changeMaterialAmountInFacility(facId, materialType, change) end

--- Distance par la route entre deux positions : somme des segments du chemin de la carte (map.getPath) plus la distance à la route la plus proche de chaque position.
---Source : lua/ge/extensions/career/modules/delivery/generator.lua:75
---@param posA vec3 Position de départ.
---@param posB vec3 Position d'arrivée.
---@return number  Distance en mètres (1 si l'une des positions n'a pas de route).
function career_modules_delivery_generator.distanceBetween(posA, posB) end

--- Calcule l'XP d'une livraison de matériau selon la distance et le nombre de slots, l'inscrit dans rewards.logistics et rewards['logistics-materials'], ainsi que la réputation de l'organisation et le bonus d'argent.
---Source : lua/ge/extensions/career/modules/delivery/generator.lua:983
---@param item table Cargaison de matériau.
---@param destination table Lieu de dépôt.
function career_modules_delivery_generator.finalizeMaterialDistanceRewards(item, destination) end

--- Prévu pour calculer les fournisseurs/receveurs les plus proches d'une installation ; le corps est entièrement commenté, donc sans effet.
---Source : lua/ge/extensions/career/modules/delivery/generator.lua:713
---@param fac table Installation.
function career_modules_delivery_generator.finalizeMaterialDistances(fac) end

--- Calcule (une seule fois) la distance d'origine d'un colis, ses modificateurs (dParcelMods.generateModifiers) et ses récompenses : argent, XP logistique, XP de compétence (logistics-materials ou logistics-delivery, +10 pour les colis tutoriel) et réputation de l'organisation (avec bonus de livraison selon son niveau).
---Source : lua/ge/extensions/career/modules/delivery/generator.lua:142
---@param item table Cargaison (slots, weight, origin, destination, templateId, organization…).
function career_modules_delivery_generator.finalizeParcelItemDistanceAndRewards(item) end

--- Complète une offre de véhicule : choisit un véhicule au hasard selon son filtre (modèle, config, kilométrage, nom) si absent, puis calcule distance et récompenses (baseReward + rewardPerKm, XP logistique, XP du type vehicle/trailer, réputation).
---Source : lua/ge/extensions/career/modules/delivery/generator.lua:470
---@param offer table Offre (vehicle.filterId, locations, data.type, organization…).
function career_modules_delivery_generator.finalizeVehicleOffer(offer) end

--- Distance par la route (mise en cache par couple origine/destination) entre deux lieux. Si loc2 est 'multi', renvoie la médiane (haute) des distances vers chaque destination.
---Source : lua/ge/extensions/career/modules/delivery/generator.lua:105
---@param loc1 table Lieu de départ ('facilityParkingspot').
---@param loc2 table Lieu d'arrivée ('facilityParkingspot' ou 'multi').
---@return number|nil  Distance en mètres (nil pour un autre type de lieu).
function career_modules_delivery_generator.getDistanceBetweenFacilities(loc1, loc2) end

--- Liste des installations de livraison, triées par nom traduit.
---Source : lua/ge/extensions/career/modules/delivery/generator.lua:1517
---@return table  Liste d'installations.
function career_modules_delivery_generator.getFacilities() end

--- Installations associées à une organisation.
---Source : lua/ge/extensions/career/modules/delivery/generator.lua:1520
---@param orgId string Identifiant de l'organisation.
---@return table  Liste de {name, id}.
function career_modules_delivery_generator.getFacilitiesForOrganizationId(orgId) end

--- Cherche une installation par id.
---Source : lua/ge/extensions/career/modules/delivery/generator.lua:1518
---@param id string Identifiant de l'installation.
---@return table|nil  Installation.
function career_modules_delivery_generator.getFacilityById(id) end

--- Position monde d'un lieu : place de parking pour 'facilityParkingspot', position du véhicule pour 'vehicle'. Autres types : affiche un message et renvoie nil.
---Source : lua/ge/extensions/career/modules/delivery/generator.lua:90
---@param loc table Lieu.
---@return vec3|nil  Position.
function career_modules_delivery_generator.getLocationCoordinates(loc) end

--- Renvoie le gabarit d'un matériau (*.deliveryMaterials.json) : type (fluid/dryBulk), density, money, name…
---Source : lua/ge/extensions/career/modules/delivery/generator.lua:687
---@param id string Identifiant du matériau.
---@return table|nil  Gabarit.
function career_modules_delivery_generator.getMaterialsTemplatesById(id) end

--- Renvoie le gabarit de colis chargé depuis les fichiers *.deliveryParcels.json.
---Source : lua/ge/extensions/career/modules/delivery/generator.lua:224
---@param templateId string|integer Identifiant du gabarit.
---@return table|nil  Gabarit (names, slots, weight, modChance, offerDuration, isTutorialParcel…).
function career_modules_delivery_generator.getParcelTemplateById(templateId) end

--- Renvoie la place de parking (objet site) correspondant à un chemin d'identification.
---Source : lua/ge/extensions/career/modules/delivery/generator.lua:1519
---@param path string psPath (ps:getPath()).
---@return table|nil  Place de parking (pos, rot, name, customFields…).
function career_modules_delivery_generator.getParkingSpotByPath(path) end

--- Indique si un type de cargaison peut être mélangé dans un même conteneur (parcel : oui, fluid et dryBulk : non).
---Source : lua/ge/extensions/career/modules/delivery/generator.lua:1084
---@param type string 'parcel', 'fluid' ou 'dryBulk'.
---@return boolean|nil  nil pour un type inconnu.
function career_modules_delivery_generator.isMixable(type) end

--- Déplace une cargaison de matériau vers une installation. Si le stock ne peut pas tout accueillir, scinde : la partie qui rentre est déplacée, le reste reste dans le véhicule.
---Source : lua/ge/extensions/career/modules/delivery/generator.lua:920
---@param cargo table Cargaison de matériau.
---@param destination table Lieu de destination (facId).
---@return table  Cargaison traitée (la copie déposée en cas de scission).
---@return table|nil  Cargaison restante (nil si tout déposé).
function career_modules_delivery_generator.moveMaterialToDestination(cargo, destination) end

--- Hook appelé à l'activation de la carrière : mémorise les références vers les autres extensions de livraison et util_stepHandler.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/generator.lua:10
function career_modules_delivery_generator.onCareerActivated() end

--- Hook par image : réarme triggerAllGenerators pour l'image suivante.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/generator.lua:1033
---@param dtReal number Delta temps réel (s), inutilisé.
---@param dtSim number Delta temps simulation (s), inutilisé.
---@param dtRaw number Delta temps brut (s), inutilisé.
function career_modules_delivery_generator.onUpdate(dtReal, dtSim, dtRaw) end

--- Choisit au hasard un point d'accès parmi ceux qui gèrent un type logistique donné ; loggue une erreur et affiche la liste si aucun ne convient.
---Source : lua/ge/extensions/career/modules/delivery/generator.lua:56
---@param accessPointsByName table<string, table> Points d'accès d'une installation.
---@param logisticType string Type logistique recherché.
---@param typeLookupKey string 'logisticTypesProvidedLookup' ou 'logisticTypesReceivedLookup'.
---@return table|nil  Point d'accès (ps, psPath, facId…).
function career_modules_delivery_generator.selectAccessPointByLookupKeyByType(accessPointsByName, logisticType, typeLookupKey) end

--- Initialise tout le système de livraison : charge les gabarits de matériaux, colis et véhicules, prépare les installations (setupFacilities), puis soit recharge les colis et offres sauvegardés (en jetant les cargaisons de matériaux temporaires 'addMaterialAsParcelToContainer'), soit génère un stock initial en simulant les générations passées (240 s de colis, 1000 s d'offres de véhicules).
---Source : lua/ge/extensions/career/modules/delivery/generator.lua:1458
---@param loadData table Données de sauvegarde : facilities (progress, materialStorages, logisticGenerators), parcels, vehicleOffers, general.maxGroupId.
function career_modules_delivery_generator.setup(loadData) end

--- Scinde une cargaison de matériau : crée des copies de tailles données et réduit l'original d'autant (poids et argent recalculés).
---Source : lua/ge/extensions/career/modules/delivery/generator.lua:894
---@param cargo table Cargaison de matériau.
---@param otherPartSizes table<integer, number>|nil Tailles (slots) des parties à détacher.
---@return table  Liste : cargaison d'origine puis copies détachées.
function career_modules_delivery_generator.splitOffPartsFromMaterialCargo(cargo, otherPartSizes) end

--- Déclenche tous les générateurs dont l'échéance est atteinte (nextGenerationTimestamp), au plus une fois par image.
---Source : lua/ge/extensions/career/modules/delivery/generator.lua:1020
function career_modules_delivery_generator.triggerAllGenerators() end

--- Exécute une génération pour un générateur : colis (parcelProvider/parcelReceiver), offres de véhicules ou remorques, ou évolution du stock de matériau.
---Source : lua/ge/extensions/career/modules/delivery/generator.lua:1004
---@param fac table Installation.
---@param generator table Générateur (type, min, max, interval, logisticTypes…).
---@param timeOffset number|nil Décalage de temps (négatif pour simuler une génération passée) ; 0 par défaut.
function career_modules_delivery_generator.triggerGenerator(fac, generator, timeOffset) end

