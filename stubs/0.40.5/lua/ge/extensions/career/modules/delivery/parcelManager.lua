---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/parcelManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire central des cargaisons (colis et matériaux) de la livraison en mode carrière. Il tient la liste allCargo (chaque cargo a un id, une location, une origin, une destination, des slots, un poids, des modifiers, des rewards…), déplace les cargaisons entre lieux (installation, véhicule, avatar du joueur), gère les « déplacements transitoires » (transientMoves) validés ensuite en bloc, fournit des requêtes de recherche, calcule les récompenses avec détail (retard, loaner, niveau de branche, précision de stationnement), envoie les messages de retard et nettoie les cargaisons périmées.
--- Accès : extension `career_modules_delivery_parcelManager` : `extensions.load("career_modules_delivery_parcelManager")`, puis la globale `career_modules_delivery_parcelManager`
---@class career_modules_delivery_parcelManager
---@field addParcelRewards nil Exporté mais toujours nil (référence non définie dans le fichier).
---@field dependencies table<integer, string> Extensions chargées avant : freeroam_facilities.
career_modules_delivery_parcelManager = {}

--- Ajoute une cargaison à la liste globale et émet le hook onCargoGenerated(cargo) sauf si silent.
---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:40
---@param cargo table Cargaison complète (id, location, origin, destination, slots…).
---@param silent boolean|nil true pour ne pas émettre onCargoGenerated.
function career_modules_delivery_parcelManager.addCargo(cargo, silent) end

--- Calcule originalRewards/breakdown/adjustedRewards de chaque cargaison, regroupe par groupId et heure de chargement, formate chaque groupe via cargoScreen.formatCargoGroup et trie par plus petit id.
---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:578
---@param cargo table Liste de cargaisons au même lieu actuel.
---@return table|nil  Liste de groupes formatés pour l'UI (nil si la liste est vide).
function career_modules_delivery_parcelManager.addParcelRewardsSummary(cargo) end

--- Enregistre un déplacement en attente pour la cargaison (cargo._transientMove). Refusé avec une erreur loguée si elle en a déjà un.
---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:79
---@param cargoId integer Identifiant de la cargaison.
---@param targetLocation table Lieu cible.
function career_modules_delivery_parcelManager.addTransientMoveCargo(cargoId, targetLocation) end

--- Applique les déplacements transitoires dont la cargaison est au lieu currentLocation (ou tous si currentLocation est nil), met à jour les organisations prêteuses (loaner) des véhicules cibles, fusionne les cargaisons mergeables de même matériau au même lieu, et conserve les autres déplacements pour plus tard.
---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:134
---@param currentLocation table|nil Lieu courant ; nil pour tout appliquer.
---@return table  Cargaisons déplacées.
---@return table  Cargaisons dont le déplacement reste en attente.
function career_modules_delivery_parcelManager.applyTransientMoves(currentLocation) end

--- Déplace immédiatement la cargaison vers newLocation. Ajuste le stock de matériaux de l'installation (retire à l'ancien lieu, ajoute au nouveau), horodate loadedAtTimeStamp au premier chargement dans un véhicule, et marque cargo.data.delivered = true si le nouveau lieu est la destination.
---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:47
---@param cargoId integer Identifiant de la cargaison.
---@param newLocation table Nouveau lieu (une erreur est loguée si nil ou vide).
function career_modules_delivery_parcelManager.changeCargoLocation(cargoId, newLocation) end

--- Supprime les cargaisons de lieu « delete » et celles restées à leur origine, expirées depuis plus de 120 s et sans déplacement transitoire. Remet le minuteur de nettoyage à zéro.
---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:670
function career_modules_delivery_parcelManager.cleanUpCargo() end

--- Annule tous les déplacements transitoires et remet le drapeau « non validé » à false.
---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:125
function career_modules_delivery_parcelManager.clearAllTransientMoves() end

--- Obsolète : ne fait que loguer une erreur « no longer needed ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:210
function career_modules_delivery_parcelManager.clearTransientFlags() end

--- Annule le déplacement transitoire d'une cargaison (sans effet si aucun).
---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:108
---@param cargoId integer Identifiant de la cargaison.
function career_modules_delivery_parcelManager.clearTransientMoveForCargo(cargoId) end

--- Cargaisons non expirées encore à leur origine, située dans l'installation facId.
---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:341
---@param facId string Installation d'origine.
---@return table  Liste de cargaisons.
function career_modules_delivery_parcelManager.getAllCargoAtFacilityUnexpired(facId) end

--- Renvoie les cargaisons pour lesquelles filter(cargo, ...) est vrai, après avoir déclenché tous les générateurs.
---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:257
---@param filter function fonction(cargo, ...) -> boolean.
---@param ... any Arguments supplémentaires passés à filter.
---@return table  Liste de cargaisons.
function career_modules_delivery_parcelManager.getAllCargoCustomFilter(filter, ...) end

--- Cargaisons non expirées encore à leur origine et dont la destination est l'installation facId.
---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:328
---@param facId string Installation de destination.
---@return table  Liste de cargaisons.
function career_modules_delivery_parcelManager.getAllCargoForDestinationFacilityStillAtOriginUnexpired(facId) end

--- Même filtre mais sur toutes les places d'une installation (facId).
---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:312
---@param facId string Identifiant de l'installation.
---@param timeExpire number|nil Seuil d'expiration.
---@param timeGenerated number|nil Horodatage maximal de génération.
---@return table  Liste de cargaisons.
function career_modules_delivery_parcelManager.getAllCargoForFacilityUnexpiredUndelivered(facId, timeExpire, timeGenerated) end

--- Toutes les cargaisons actuellement à ce lieu (déclenche les générateurs si le lieu est une place d'installation).
---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:268
---@param loc table Lieu.
---@return table  Liste de cargaisons.
function career_modules_delivery_parcelManager.getAllCargoForLocation(loc) end

--- Comme getAllCargoForLocation mais seulement les cargaisons dont l'offre n'a pas expiré (offerExpiresAt > temps de livraison).
---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:282
---@param loc table Lieu.
---@return table  Liste de cargaisons.
function career_modules_delivery_parcelManager.getAllCargoForLocationUnexpired(loc) end

--- Cargaisons à ce lieu, non expirées, qui ne sont pas déjà à leur destination et générées au plus tard à timeGenerated.
---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:296
---@param loc table Lieu.
---@param timeExpire number|nil Seuil d'expiration ; défaut : temps courant.
---@param timeGenerated number|nil Horodatage maximal de génération ; défaut : infini.
---@return table  Liste de cargaisons.
function career_modules_delivery_parcelManager.getAllCargoForLocationUnexpiredUndelivered(loc, timeExpire, timeGenerated) end

--- Cargaisons actuellement dans un véhicule, et optionnellement celles ayant un déplacement transitoire en attente.
---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:354
---@param includeTransient boolean|nil Inclure les cargaisons avec _transientMove.
---@return table  Liste de cargaisons.
function career_modules_delivery_parcelManager.getAllCargoInVehicles(includeTransient) end

--- Cherche une cargaison par id.
---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:423
---@param cargoId integer Identifiant.
---@return table|nil  Cargaison ou nil.
function career_modules_delivery_parcelManager.getCargoById(cargoId) end

--- Libellé long : pour une place d'installation, « Installation - nom de la place » si la place a un champ personnalisé name ; sinon comme le libellé court.
---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:396
---@param loc table Lieu.
---@return string  Libellé.
function career_modules_delivery_parcelManager.getLocationLabelLong(loc) end

--- Libellé court d'un lieu : nom traduit de l'installation, « Current Vehicle (id) » / « Other Vehicle (id) », « Player Avatar », « N possible locations » (ou le libellé de l'unique destination), « Unknown ». Les textes véhicule/avatar ne sont pas traduits.
---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:374
---@param loc table Lieu.
---@return string  Libellé.
function career_modules_delivery_parcelManager.getLocationLabelShort(loc) end

--- Calcule les récompenses d'une cargaison livrée avec le détail : effet du modificateur timed (à l'heure, retardée, en retard), part des organisations prêteuses de véhicule (loaner), multiplicateur du niveau de la branche logistics, bonus ou pénalité de précision de stationnement. Peut débloquer le succès ON_SCHEDULE.
---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:436
---@param cargo table Cargaison (rewards, modifiers, loadedAtTimeStamp, organization, destination, location…).
---@return table  originalRewards : copie des récompenses de base.
---@return table  breakdown : liste d'éléments {label, rewards, simpleBreakdownType}.
---@return table  adjustedRewards : récompenses finales (base + somme des éléments).
function career_modules_delivery_parcelManager.getRewardsWithBreakdown(cargo) end

--- Liste les cargaisons qui ont un déplacement transitoire en attente.
---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:97
---@return table  Liste de cargaisons.
function career_modules_delivery_parcelManager.getTransientMoveCargo() end

--- Liste les cargaisons dont le déplacement transitoire cible le lieu donné.
---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:197
---@param targetLocation table Lieu cible.
---@return table  Liste de cargaisons.
function career_modules_delivery_parcelManager.getTransientMovesForTargetLocationWithCargo(targetLocation) end

--- Indique si des déplacements transitoires ont été ajoutés mais pas encore appliqués.
---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:95
---@return boolean  true si en attente.
function career_modules_delivery_parcelManager.hasUncommittedTransientMoves() end

--- Hook appelé à l'activation de la carrière : mémorise les autres extensions de livraison.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:14
function career_modules_delivery_parcelManager.onCareerActivated() end

--- Hook appelé quand une remorque est attelée : recalcule les organisations prêteuses des cargaisons situées dans des véhicules.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:214
---@param objId1 integer Premier véhicule.
---@param objId2 integer Second véhicule.
function career_modules_delivery_parcelManager.onTrailerAttached(objId1, objId2) end

--- Hook par image : envoie les messages UI « retardé » et « en retard » pour les cargaisons timed dans les véhicules, met à jour le tasklist chaque seconde, relance le tasklist et le nettoyage si des lieux ont changé, et nettoie toutes les 10 s. Inactif hors mode livraison.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:652
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulation (s).
---@param dtRaw number Delta temps brut (s).
function career_modules_delivery_parcelManager.onUpdate(dtReal, dtSim, dtRaw) end

--- Teste l'égalité de deux lieux en comparant chaque clé de a avec la même clé de b (comparaison asymétrique).
---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:249
---@param a table Lieu de référence.
---@param b table Lieu comparé (ne doit pas être nil).
---@return boolean  true si toutes les clés de a valent celles de b.
function career_modules_delivery_parcelManager.sameLocation(a, b) end

--- Compare la position actuelle d'une cargaison avec un lieu via sameLocation.
---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:245
---@param cargo table Cargaison.
---@param otherLoc table Lieu à comparer.
---@return boolean  true si identique.
function career_modules_delivery_parcelManager.sameLocationCargo(cargo, otherLoc) end

--- Obsolète : ne fait que loguer une erreur (code d'annulation commenté, marqué TODO).
---Source : lua/ge/extensions/career/modules/delivery/parcelManager.lua:223
function career_modules_delivery_parcelManager.undoTransientCargo() end

