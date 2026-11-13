---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/general.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Noyau du système de livraison (logistique) de la carrière : horloge de jeu de livraison, sauvegarde/chargement de logisticsDatabase.json (colis, offres de véhicules, facilités, réglages, progression), mode livraison (démarrage/sortie, pénalité d'abandon de cargaison), réglages (route automatique, dépose détaillée), liste des conteneurs de cargaison des véhicules proches et mise à jour de leur poids dans la VM véhicule. Contribue aussi aux POI de la grande carte et aux permissions du mode livraison.
--- Accès : extension `career_modules_delivery_general` : `extensions.load("career_modules_delivery_general")`, puis la globale `career_modules_delivery_general`
---@class career_modules_delivery_general
---@field dependencies string[] {"core_vehicleBridge"}.
career_modules_delivery_general = {}

--- Quitte le mode livraison s'il ne reste ni cargo dans les véhicules ni tâche de véhicule.
---Source : lua/ge/extensions/career/modules/delivery/general.lua:990
function career_modules_delivery_general.checkExitDeliveryMode() end

--- Quitte le mode livraison : annule les déplacements transitoires, supprime les cargos dans les véhicules (changeCargoLocation 'deleted'), applique la pénalité d'abandon (argent/réputation, toast, son), abandonne les tâches de véhicule, vide le focus de la grande carte, planifie la mise à jour des poids, efface la tasklist et déclenche onDeliveryModeStopped.
---Source : lua/ge/extensions/career/modules/delivery/general.lua:957
function career_modules_delivery_general.exitDeliveryMode() end

--- Renvoie le facteur de base de la pénalité d'abandon de cargaison (0.1).
---Source : lua/ge/extensions/career/modules/delivery/general.lua:29
---@return number  Facteur appliqué à la récompense en argent du cargo abandonné.
function career_modules_delivery_general.getDeliveryAbandonPenaltyFactor() end

--- Calcule la pénalité si le joueur abandonne les cargos en véhicule : table d'attributs négatifs (money et <organisation>Reputation). Ajoute l'amende des tâches de véhicule sauf si onlyVehIdsAsKeys est fourni.
---Source : lua/ge/extensions/career/modules/delivery/general.lua:1046
---@param onlyVehIdsAsKeys table<integer, boolean>|nil Limite le calcul aux véhicules listés.
---@return table<string, number>  Pénalité par attribut (valeurs <= 0).
function career_modules_delivery_general.getDeliveryModePenalty(onlyVehIdsAsKeys) end

--- Dernière liste de conteneurs calculée par getNearbyVehicleCargoContainers (rafraîchie environ chaque seconde dans onUpdate).
---Source : lua/ge/extensions/career/modules/delivery/general.lua:295
---@return table[]  Conteneurs de cargaison.
function career_modules_delivery_general.getMostRecentCargoContainerData() end

--- Interroge (asynchrone, 'getCargoContainers') les véhicules à moins de 25 m du joueur (hors unicycle et véhicules non utilisables) et appelle callback avec la liste triée (vehId puis containerId) des conteneurs de livraison : emplacement, nom, types de cargo, emplacements total/utilisé/transitoire/libre, statut d'attache ('attached', 'nearby' ou 'lost'), colis présents. Appelle callback({}) s'il n'y a aucun véhicule.
---Source : lua/ge/extensions/career/modules/delivery/general.lua:192
---@param callback function Reçoit la table des conteneurs.
---@return table|nil  {} si core_vehicleBridge est absent.
function career_modules_delivery_general.getNearbyVehicleCargoContainers(callback) end

--- Renvoie la table des réglages de livraison.
---Source : lua/ge/extensions/career/modules/delivery/general.lua:1030
---@return table  Réglages (automaticRoute, detailedDropOff…).
function career_modules_delivery_general.getSettings() end

--- Nom traduit d'un véhicule via l'inventaire carrière, ou un libellé de repli contenant l'id.
---Source : lua/ge/extensions/career/modules/delivery/general.lua:171
---@param vehId integer Id d'objet véhicule.
---@return string  Nom affichable.
function career_modules_delivery_general.getVehicleName(vehId) end

--- Renvoie le réglage 'automaticRoute' (route automatique vers la prochaine destination).
---Source : lua/ge/extensions/career/modules/delivery/general.lua:998
---@return boolean  true si activé.
function career_modules_delivery_general.isAutomaticRouteEnabled() end

--- Indique si le mode livraison est actif.
---Source : lua/ge/extensions/career/modules/delivery/general.lua:1044
---@return boolean  true si actif.
function career_modules_delivery_general.isDeliveryModeActive() end

--- Charge logisticsDatabase.json du profil courant (ignoré si info.json est plus ancien que moduleVersion), initialise progress et parcelModProgress, réglages (automaticRoute vaut true par défaut) et temps de livraison ; efface les colis si la sauvegarde a plus d'une heure.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/general.lua:37
function career_modules_delivery_general.loadSaveData() end

--- Hook : pour un élément 'logisticsOffice', ajoute les infos du prompt d'activité (titre de la facilité, propriétés, bouton 'inspecter le cargo').
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/general.lua:642
---@param elemData table[] Éléments POI.
---@param activityData table[] Données d'activité à compléter.
function career_modules_delivery_general.onActivityAcceptGatherData(elemData, activityData) end

--- Hook : quitte le mode livraison quand une mission démarre (change == 'started').
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/general.lua:1111
---@param change string Type de changement de mission.
function career_modules_delivery_general.onAnyMissionChanged(change) end

--- Hook : mémorise les autres modules delivery (parcelManager, cargoScreen, generator, progress, vehicleTasks, tasklist, parcelMods, vehicleOfferManager, tutorial) et util_stepHandler.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/general.lua:10
function career_modules_delivery_general.onCareerActivated() end

--- Hook : à l'activation de la carrière, charge les données, assure la carte (map.assureLoad) et lance dGenerator.setup.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/general.lua:155
---@param active boolean true à l'activation.
function career_modules_delivery_general.onCareerActive(active) end

--- Hook : quitte le mode livraison si la peinture commence.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/general.lua:1090
function career_modules_delivery_general.onCareerPaintingStarted() end

--- Hook : quitte le mode livraison si le tuning commence.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/general.lua:1097
function career_modules_delivery_general.onCareerTuningStarted() end

--- Hook : en mode livraison, si un tag demandé est dans la table des activités restreintes (ex. interaction mission, remorquage vers le garage, achat de véhicule), ajoute une permission avec libellé expliquant la pénalité.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/general.lua:939
---@param tags string[] Tags d'activité testés.
---@param permissions table[] Liste de permissions à compléter.
function career_modules_delivery_general.onCheckPermission(tags, permissions) end

--- Hook de la liste de POI : ajoute les facilités de livraison visibles (ou ciblées) avec leurs points d'accès interactifs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/general.lua:505
---@param levelIdentifier string Id du niveau.
---@param elements table[] Liste de POI à compléter.
function career_modules_delivery_general.onGetRawPoiListForLevel(levelIdentifier, elements) end

--- Hook : avant le retrait de l'objet véhicule de l'inventaire, supprime ses cargos (avec pénalité) et vérifie la sortie du mode livraison.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/general.lua:1152
---@param inventoryId integer Id d'inventaire.
---@param vehId integer Id d'objet véhicule.
function career_modules_delivery_general.onInventoryPreRemoveVehicleObject(inventoryId, vehId) end

--- Hook : quitte le mode livraison si l'achat de pièces commence.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/general.lua:1083
function career_modules_delivery_general.onPartShoppingStarted() end

--- Hook : un véhicule réparé au garage : supprime ses cargos (avec pénalité) et vérifie la sortie du mode livraison.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/general.lua:1147
---@param invVehId integer Id d'inventaire du véhicule.
function career_modules_delivery_general.onRepairInGarage(invVehId) end

--- Hook de sauvegarde : écrit logisticsDatabase.json (temps, pénalité, progression, colis non expirés en facilité, offres de véhicules non expirées, données de facilités, réglages).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/general.lua:75
---@param currentSavePath string Dossier du profil en cours de sauvegarde.
function career_modules_delivery_general.onSaveCurrentProfile(currentSavePath) end

--- Hook : un point de passage manuel posé sur la grande carte désactive la route automatique en mode livraison.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/general.lua:1020
function career_modules_delivery_general.onSetBigmapNavFocus() end

--- Hook : quitte le mode livraison si le joueur est remorqué au garage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/general.lua:1104
---@param garageId string Id du garage.
---@param veh any Véhicule téléporté (non utilisé).
function career_modules_delivery_general.onTeleportedToGarage(garageId, veh) end

--- Hook par frame : avance le temps de livraison, applique la pénalité issue d'une sauvegarde précédente (toast + addAttributes), rafraîchit chaque seconde les conteneurs proches et met à jour les poids.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/general.lua:420
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulé (s).
---@param dtRaw number Delta temps brut (s).
function career_modules_delivery_general.onUpdate(dtReal, dtSim, dtRaw) end

--- Planifie une mise à jour du poids des conteneurs ; exécutée dans onUpdate quand la simulation n'est pas en pause.
---Source : lua/ge/extensions/career/modules/delivery/general.lua:333
function career_modules_delivery_general.requestUpdateContainerWeights() end

--- Active/désactive la route automatique : activée, appelle cargoScreen.setBestRoute ; désactivée, efface le chemin des marqueurs de sol et de la grande carte. Notifie l'UI (guihooks 'automaticRouteSet').
---Source : lua/ge/extensions/career/modules/delivery/general.lua:1003
---@param enabled boolean Nouvel état.
function career_modules_delivery_general.setAutomaticRoute(enabled) end

--- Met en pause ou relance l'horloge de livraison.
---Source : lua/ge/extensions/career/modules/delivery/general.lua:419
---@param paused boolean true pour geler le temps.
function career_modules_delivery_general.setDeliveryTimePaused(paused) end

--- Définit le réglage detailedDropOff et notifie l'UI (guihooks 'detailedDropOffSet').
---Source : lua/ge/extensions/career/modules/delivery/general.lua:1014
---@param enabled boolean Nouvel état.
function career_modules_delivery_general.setDetailedDropOff(enabled) end

--- Écrit un réglage de livraison (sauvegardé dans logisticsDatabase.json).
---Source : lua/ge/extensions/career/modules/delivery/general.lua:1026
---@param key string Nom du réglage.
---@param value any Valeur.
function career_modules_delivery_general.setSetting(key, value) end

--- Active le mode livraison (sans effet s'il est déjà actif), vide les POI et déclenche le hook onDeliveryModeStarted.
---Source : lua/ge/extensions/career/modules/delivery/general.lua:949
function career_modules_delivery_general.startDeliveryMode() end

--- Temps de livraison courant (secondes de simulation cumulées, sauvegardé).
---Source : lua/ge/extensions/career/modules/delivery/general.lua:165
---@return number  Secondes.
function career_modules_delivery_general.time() end

--- Si une mise à jour est planifiée, calcule pour chaque véhicule/conteneur le volume (poids des colis, volume des fluides et vrac) et la densité, les envoie au véhicule (setCargoContainers), gèle le véhicule (setFreeze), lit le délai de mise en charge, puis appelle delayCallback avec le délai par véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/delivery/general.lua:334
---@param delayCallback function|nil Reçoit {[vehId] = délai en secondes} ; par défaut affiche une popup de chargement et dégèle les véhicules.
function career_modules_delivery_general.updateContainerWeights(delayCallback) end

