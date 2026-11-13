---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/vehicleTasks.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Exécute les tâches de livraison de véhicules et de remorques acceptées en carrière. Chaque offre devient un taskData avec une suite d'étapes (coupleTrailer ou enterVehicle, bringToDestination, confirmDropOff), un index d'étape actif et un chemin GPS (core_groundMarkers). onUpdate fait avancer les étapes selon la position et les attelages, gère la fin de livraison (suppression du véhicule, retrait de la tâche), l'abandon (amende) et calcule les récompenses détaillées (dégâts, détours, retards, organisation prêteuse, niveau de branche, précision de stationnement).
--- Accès : extension `career_modules_delivery_vehicleTasks` : `extensions.load("career_modules_delivery_vehicleTasks")`, puis la globale `career_modules_delivery_vehicleTasks`
---@class career_modules_delivery_vehicleTasks
---@field debugName string Nom du menu de debug : 'Delivery > Trailer Tasks'.
---@field debugOrder number Ordre dans le menu de debug (12).
---@field dependencies table<integer, string> Extensions chargées avant : util_stepHandler.
career_modules_delivery_vehicleTasks = {}

--- Supprime les véhicules de toutes les tâches (le joueur repasse à pied si dans l'un d'eux) et vide la liste, sans appliquer d'amende.
---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:674
function career_modules_delivery_vehicleTasks.abandonAllVehicleTasks() end

--- Crée le taskData d'une offre (étapes selon le type d'offre, index actif 1, horodatage de départ), l'ajoute à la liste, met à jour la tasklist et lance la navigation vers la première étape.
---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:73
---@param vehId integer Identifiant du véhicule ou de la remorque.
---@param offer table Offre acceptée (task.type 'trailerDropOff' ou 'vehicleDropOff').
function career_modules_delivery_vehicleTasks.addVehicleTask(vehId, offer) end

--- Compte les véhicules et remorques dont l'étape active est confirmDropOff à cette place de parking.
---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:420
---@param psPath string Chemin de la place de parking.
---@return integer  Nombre de véhicules.
---@return integer  Nombre de remorques.
function career_modules_delivery_vehicleTasks.canDropOffCargoAtPsPath(psPath) end

--- Fenêtre ImGui de debug « Trailer Tasks Debug » qui affiche vehicleTasks avec dumps.
---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:700
function career_modules_delivery_vehicleTasks.drawDebugMenu() end

--- Termine les tâches des offres données : mémorise la place de dépôt, lit pièces cassées et odomètre, calcule les récompenses, puis marque finished. Le véhicule est supprimé et la tâche retirée à une mise à jour ultérieure (processFinished).
---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:434
---@param offerIds table Liste d'identifiants d'offres.
---@return table  Liste des taskData concernés (finished mis à jour de façon asynchrone).
function career_modules_delivery_vehicleTasks.finishTasks(offerIds) end

--- Calcule l'amende d'abandon : -(argent de l'offre) x facteur de pénalité de la livraison, et la pénalité de réputation de l'organisation (événement discardDeliveryVehicle).
---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:527
---@param taskData table Tâche de véhicule.
---@return table<string, number>  Montants à ajouter (négatifs) : money et éventuellement <org>Reputation.
function career_modules_delivery_vehicleTasks.getFineForAbandon(taskData) end

--- Somme des amendes d'abandon de toutes les tâches de véhicules.
---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:663
---@return table<string, number>  Montants cumulés par attribut.
function career_modules_delivery_vehicleTasks.getFineForAbandonAllVehicleTasks() end

--- Liste les destinations de toutes les étapes de toutes les tâches.
---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:624
---@return table  Liste de destinations (psPath, facId…).
function career_modules_delivery_vehicleTasks.getTargetDestinationsForActiveTasks() end

--- Prépare les données de récompense des véhicules prêts à être déposés (étape confirmDropOff) pour l'écran de dépôt : lit les pièces cassées et l'odomètre, calcule originalRewards/breakdown/adjustedRewards, puis appelle progress.openDropOffScreenGatheringComplete. Renvoie la liste formatée (finished passe à true plus tard).
---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:362
---@return table  Liste d'offres formatées pour l'UI.
function career_modules_delivery_vehicleTasks.getVehicleDataWithRewardsSummary() end

--- Cherche la tâche correspondant à une offre.
---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:686
---@param offer table Offre (champ id).
---@return table|nil  taskData ou nil.
function career_modules_delivery_vehicleTasks.getVehicleTaskForOffer(offer) end

--- Renvoie la liste (référence) des tâches de véhicules en cours.
---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:658
---@return table  Liste de taskData.
function career_modules_delivery_vehicleTasks.getVehicleTasks() end

--- Marque la tâche du véhicule comme rendue (giveBack) ; processGiveBack supprimera le véhicule, appliquera l'amende et affichera un message.
---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:648
---@param vehId integer Identifiant du véhicule.
function career_modules_delivery_vehicleTasks.giveBackDeliveryVehicle(vehId) end

--- Indique si ce véhicule est le véhicule d'une tâche de livraison en cours.
---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:638
---@param vehId integer Identifiant du véhicule.
---@return boolean  true si oui.
function career_modules_delivery_vehicleTasks.isVehicleDeliveryVehicle(vehId) end

--- Relance le chemin GPS vers l'étape active de la dernière tâche de la liste.
---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:571
function career_modules_delivery_vehicleTasks.navigateToNextTask() end

--- Hook appelé à l'activation de la carrière : mémorise les extensions de livraison et util_stepHandler.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:8
function career_modules_delivery_vehicleTasks.onCareerActivated() end

--- Hook appelé quand une remorque est attelée : met à jour les organisations prêteuses (loaner) de chaque tâche de véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:201
---@param objId1 integer Premier véhicule.
---@param objId2 integer Second véhicule.
function career_modules_delivery_vehicleTasks.onTrailerAttached(objId1, objId2) end

--- Hook par image : fait avancer ou reculer les étapes selon la position, l'attelage et le véhicule contrôlé, traite les tâches terminées et rendues, retire les tâches finies, quitte le mode livraison si besoin et met à jour la navigation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:578
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulation (s).
---@param dtRaw number Delta temps brut (s).
function career_modules_delivery_vehicleTasks.onUpdate(dtReal, dtSim, dtRaw) end

