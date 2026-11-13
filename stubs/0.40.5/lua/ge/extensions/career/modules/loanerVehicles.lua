---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/loanerVehicles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Véhicules prêtés (loaners) par les organisations de livraison en carrière. Il construit les offres affichées dans l'UI (formatLoanerOfferForUi), gère la sélection puis le spawn de véhicules prêtés via une séquence util_stepHandler (fondu, spawn, placement sur une place de parking, ajout à l'inventaire avec owned = false, fondu retour), le retour des véhicules et une surveillance : un véhicule « work » laissé à plus de 100 m pendant 300 s est rendu automatiquement.
--- Accès : extension `career_modules_loanerVehicles` : `extensions.load("career_modules_loanerVehicles")`, puis la globale `career_modules_loanerVehicles`
---@class career_modules_loanerVehicles
---@field dependencies table<integer, string> Extensions chargées avant : util_stepHandler.
---@field spawnAndLoanVehicle nil Toujours nil : variable inexistante dans le fichier (bug).
career_modules_loanerVehicles = {}

--- Prépare pour l'UI les offres de prêt d'une installation : disponibilité (enabled), raison d'indisponibilité, infos de déblocage, kilométrage, capacité, miniature.
---Source : lua/ge/extensions/career/modules/loanerVehicles.lua:288
---@param facility table Installation de livraison (associatedOrganization, loanerTrailerSpots, loanerNonTrailerSpots, id).
---@return table[]|nil  Offres, nil si l'organisation est inconnue.
function career_modules_loanerVehicles.formatLoanerOfferForUi(facility) end

--- Prépare pour l'UI la liste des loaners déjà dans l'inventaire : part de l'organisation (loanerCut), nom, kilométrage, type véhicule/remorque, capacité en fluides.
---Source : lua/ge/extensions/career/modules/loanerVehicles.lua:254
---@return table[]  Entrées d'UI (isSpawnedLoaner = true).
function career_modules_loanerVehicles.formatSpawnedLoanersForUi() end

--- Liste (copies profondes avec miniature) les véhicules de l'inventaire prêtés par l'organisation donnée.
---Source : lua/ge/extensions/career/modules/loanerVehicles.lua:139
---@param organizationId string Id de l'organisation.
---@return table[]  Infos de véhicules.
function career_modules_loanerVehicles.getLoanedVehiclesByOrg(organizationId) end

--- Renvoie les organisations propriétaires du véhicule et, s'il est attelé, du véhicule tracteur non-remorque.
---Source : lua/ge/extensions/career/modules/loanerVehicles.lua:210
---@param vehId integer Id d'objet du véhicule.
---@return table<string, boolean>  Ensemble des ids d'organisations.
function career_modules_loanerVehicles.getLoaningOrgsOfVehicle(vehId) end

--- Bascule la sélection d'une offre : l'ajoute à la liste des loaners à faire apparaître, ou la retire si elle y était déjà.
---Source : lua/ge/extensions/career/modules/loanerVehicles.lua:18
---@param offer table Offre (id, model, config, sourceFacility, loanType, vehMileage).
function career_modules_loanerVehicles.markForSpawning(offer) end

--- Hook de frame : surveille l'éloignement des véhicules work (avertissement, puis retour automatique après le délai).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/loanerVehicles.lua:151
---@param dtReal number Temps réel (s).
---@param dtSim number Temps de simulation (s).
---@param dtRaw number Temps brut (s).
function career_modules_loanerVehicles.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook appelé à l'ajout d'un véhicule à l'inventaire : débloque l'étape d'attente de la séquence de spawn.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/loanerVehicles.lua:33
---@param id integer Id du véhicule.
function career_modules_loanerVehicles.onVehicleAdded(id) end

--- Rend un véhicule prêté : met à jour les conditions de pièces s'il est présent dans le monde, applique la pénalité de réputation si le véhicule work est endommagé, puis le retire de l'inventaire et appelle callback.
---Source : lua/ge/extensions/career/modules/loanerVehicles.lua:114
---@param inventoryId integer Id d'inventaire du véhicule.
---@param callback function|nil Appelée une fois le véhicule retiré.
function career_modules_loanerVehicles.returnVehicle(inventoryId, callback) end

--- Fait apparaître toutes les offres sélectionnées avec un fondu : spawn, initialisation des conditions de pièces (kilométrage), placement sur la meilleure place de parking (remorques ou non), ajout à l'inventaire. Ne fait rien si rien n'est sélectionné.
---Source : lua/ge/extensions/career/modules/loanerVehicles.lua:37
function career_modules_loanerVehicles.spawnAllOffers() end

--- Vide la liste des offres sélectionnées.
---Source : lua/ge/extensions/career/modules/loanerVehicles.lua:27
function career_modules_loanerVehicles.unmarkAllForSpawning() end

