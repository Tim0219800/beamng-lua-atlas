---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/tasklist.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Alimente la liste de tâches affichée à l'écran (tasklist) pendant la livraison en carrière. Il regroupe les cargaisons chargées par destination, les cargaisons à récupérer par lieu de ramassage, les tâches de remorque/véhicule, et un en-tête « livraisons actives ». Chaque élément est marqué à mettre à jour ou à effacer, puis envoyé à l'UI à chaque image via guihooks (SetTasklistTask, SetTasklistHeader, DiscardTasklistItem).
--- Accès : extension `career_modules_delivery_tasklist` : `extensions.load("career_modules_delivery_tasklist")`, puis la globale `career_modules_delivery_tasklist`
---@class career_modules_delivery_tasklist
---@field dependencies table<integer, string> Extensions chargées avant : core_vehicleBridge.
career_modules_delivery_tasklist = {}

--- Marque tous les éléments à effacer ; ils sont retirés à la prochaine mise à jour.
---Source : lua/ge/extensions/career/modules/delivery/tasklist.lua:150
function career_modules_delivery_tasklist.clearAll() end

--- Marque à effacer l'élément lié à une offre de véhicule/remorque.
---Source : lua/ge/extensions/career/modules/delivery/tasklist.lua:143
---@param offerId integer Identifiant de l'offre.
function career_modules_delivery_tasklist.clearTasklistForOfferId(offerId) end

--- Hook appelé à l'activation de la carrière : mémorise les extensions de livraison.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/tasklist.lua:8
function career_modules_delivery_tasklist.onCareerActivated() end

--- Hook par image : appelle updateCargoTasklistElements.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/tasklist.lua:301
---@param dtReal number Delta temps réel (s), inutilisé.
---@param dtSim number Delta temps simulation (s), inutilisé.
---@param dtRaw number Delta temps brut (s), inutilisé.
function career_modules_delivery_tasklist.onUpdate(dtReal, dtSim, dtRaw) end

--- Reconstruit les éléments de tasklist à partir des conteneurs de cargaison des véhicules proches (asynchrone) : marque tous les anciens éléments à effacer, recrée les groupes parcels et pickup, les tâches de véhicules (dVehicleTasks.getVehicleTasks) et l'en-tête avec le nombre de tâches ou d'objets chargés.
---Source : lua/ge/extensions/career/modules/delivery/tasklist.lua:22
function career_modules_delivery_tasklist.sendCargoToTasklist() end

--- Parcourt les éléments : envoie à l'UI les suppressions (DiscardTasklistItem / SetTasklistHeader nil) et les mises à jour (SetTasklistTask avec label, subtext, active, type='message'), puis supprime les éléments effacés. Les libellés dépendent de l'étape en cours des tâches de véhicule (coupleTrailer, enterVehicle, bringToDestination/confirmDropOff, putIntoParkingSpot).
---Source : lua/ge/extensions/career/modules/delivery/tasklist.lua:159
function career_modules_delivery_tasklist.updateCargoTasklistElements() end

--- Marque à rafraîchir l'élément de tasklist qui contient cette cargaison (utile pour le compte à rebours des colis timed).
---Source : lua/ge/extensions/career/modules/delivery/tasklist.lua:129
---@param cargoId integer Identifiant de la cargaison.
function career_modules_delivery_tasklist.updateTasklistForCargoId(cargoId) end

--- Marque à rafraîchir l'élément lié à une offre de véhicule/remorque.
---Source : lua/ge/extensions/career/modules/delivery/tasklist.lua:136
---@param offerId integer Identifiant de l'offre.
function career_modules_delivery_tasklist.updateTasklistForOfferId(offerId) end

