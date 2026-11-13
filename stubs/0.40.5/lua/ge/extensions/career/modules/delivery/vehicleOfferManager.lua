---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère les offres de livraison de véhicules et de remorques en mode carrière (la liste allOffers) : ajout, recherche (par lieu, par installation, non expirées), libellés de catégories de véhicules (junkerVeh, smallVeh, largeVeh, fleetVeh, exoticVeh, remorques vides/chargées petites, moyennes, grandes) avec leur drapeau de déblocage, et apparition (spawn) d'un véhicule d'offre dans le monde via une séquence util_stepHandler. Sert aussi à fabriquer le libellé d'une tâche de véhicule pour l'UI.
--- Accès : extension `career_modules_delivery_vehicleOfferManager` : `extensions.load("career_modules_delivery_vehicleOfferManager")`, puis la globale `career_modules_delivery_vehicleOfferManager`
---@class career_modules_delivery_vehicleOfferManager
---@field dependencies table<integer, string> Extensions chargées avant : util_stepHandler.
career_modules_delivery_vehicleOfferManager = {}

--- Ajoute une offre à la liste globale.
---Source : lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:206
---@param offer table Offre (id, origin, offerExpiresAt, vehicle, task, rewards…).
function career_modules_delivery_vehicleOfferManager.addOffer(offer) end

--- Offres non expirées et non apparues dont l'origine est l'installation facId.
---Source : lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:250
---@param facId string Identifiant de l'installation.
---@param psPath string|nil Ignoré.
---@return table  Liste d'offres.
function career_modules_delivery_vehicleOfferManager.getAllOfferAtFacilityUnexpired(facId, psPath) end

--- Renvoie les offres pour lesquelles filter(offer, ...) est vrai, après avoir déclenché les générateurs.
---Source : lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:222
---@param filter function fonction(offer, ...) -> boolean.
---@param ... any Arguments supplémentaires pour filter.
---@return table  Liste d'offres.
function career_modules_delivery_vehicleOfferManager.getAllOfferCustomFilter(filter, ...) end

--- Offres dont l'origine est le lieu donné.
---Source : lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:233
---@param loc table Lieu.
---@return table  Liste d'offres.
function career_modules_delivery_vehicleOfferManager.getAllOfferForLocation(loc) end

--- Offres non expirées et non encore apparues (spawned faux).
---Source : lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:237
---@return table  Liste d'offres.
function career_modules_delivery_vehicleOfferManager.getAllOfferUnexpired() end

--- Renvoie les deux modificateurs affichés par défaut pour une offre de véhicule : 'route' (suivre le trajet) et 'damage' (dégâts), avec icône, libellé et description traduits.
---Source : lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:141
---@return table  Liste de {type, icon, active, label, description}.
function career_modules_delivery_vehicleOfferManager.getDefaultVehicleModifiersForUI() end

--- Cherche une offre par id.
---Source : lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:268
---@param id integer Identifiant de l'offre.
---@return table|nil  Offre ou nil.
function career_modules_delivery_vehicleOfferManager.getOfferById(id) end

--- Libellé traduit au pluriel de la catégorie (ou « noCategory » si inconnue).
---Source : lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:135
---@param tag string Catégorie.
---@return string  Libellé.
function career_modules_delivery_vehicleOfferManager.getVehicleTagLabelPlural(tag) end

--- Libellé traduit au singulier de la catégorie (ou « noCategory » si inconnue).
---Source : lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:130
---@param tag string Catégorie.
---@return string  Libellé.
function career_modules_delivery_vehicleOfferManager.getVehicleTagLabelSingular(tag) end

--- État de déblocage de toutes les catégories de véhicules.
---Source : lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:121
---@return table<string, boolean>  tag -> débloqué.
function career_modules_delivery_vehicleOfferManager.getVehicleTagUnlockedSimple() end

--- Indique si le drapeau de déblocage de la catégorie est actif dans career_modules_unlockFlags. Une catégorie inconnue est considérée débloquée.
---Source : lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:110
---@param tag string Catégorie de véhicule (ex. 'smallVeh', 'loadedLargeTrailers').
---@return boolean  true si débloquée.
---@return table|nil  Définition du drapeau (absente pour une catégorie inconnue).
function career_modules_delivery_vehicleOfferManager.isVehicleTagUnlocked(tag) end

--- Fabrique le libellé traduit d'une tâche d'offre : vehicleDropOff selon lookupType (réparation, domicile privé, retour après réparation, camion, par défaut « bringTo »), trailerDropOff (« towTo »), ou « dropOffAt » si la tâche a une destination ; sinon « unknown ».
---Source : lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:21
---@param task table Tâche d'offre (type, lookupType, destination).
---@return string  Libellé traduit.
function career_modules_delivery_vehicleOfferManager.makeTaskLabel(task) end

--- Hook appelé à l'activation de la carrière : mémorise les autres extensions de livraison et util_stepHandler.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:8
function career_modules_delivery_vehicleOfferManager.onCareerActivated() end

--- Teste l'égalité de deux lieux en comparant chaque clé de a avec celle de b.
---Source : lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:214
---@param a table Lieu de référence.
---@param b table Lieu comparé.
---@return boolean  true si égaux.
function career_modules_delivery_vehicleOfferManager.sameLocation(a, b) end

--- Compare l'origine d'une offre avec un lieu via sameLocation.
---Source : lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:210
---@param offer table Offre.
---@param otherLoc table Lieu.
---@return boolean  true si identique.
function career_modules_delivery_vehicleOfferManager.sameLocationOffer(offer, otherLoc) end

--- Fait apparaître le véhicule d'une offre (voir notes), l'enregistre comme tâche de véhicule et démarre le mode livraison. Logue une erreur et s'arrête si l'offre est introuvable.
---Source : lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:277
---@param offerId integer Identifiant de l'offre.
---@param fadeToBlack boolean|nil Fondu au noir autour du spawn ; true par défaut.
---@param callback function|nil Appelé à la fin de la séquence d'étapes.
function career_modules_delivery_vehicleOfferManager.spawnOffer(offerId, fadeToBlack, callback) end

