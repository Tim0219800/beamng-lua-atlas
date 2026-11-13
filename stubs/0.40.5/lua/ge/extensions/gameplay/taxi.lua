---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/taxi.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Système de taxi en freeroam et carrière : le joueur à pied peut héler un taxi du trafic (ou en appeler un par le menu rapide), monter, choisir une destination sur la grande carte, puis l'IA du taxi le conduit en suivant un itinéraire (accélérer/ralentir, sauter le trajet, arrêter, changer de destination, caméra d'inactivité). En carrière, une course est facturée (tarif de base + par km + supplément nuit). L'extension enregistre un fournisseur de véhicules spéciaux « taxi » auprès de gameplay_traffic (1 garanti, 1 réservé), gère les états visuels des taxis (feux de toit, clignotants, étiquettes flottantes) et bloque les commandes de conduite pendant la course. Désactivée pendant une mission, en multijoueur ou dans le tutoriel freeroam.
--- Accès : extension `gameplay_taxi` : `extensions.load("gameplay_taxi")`, puis la globale `gameplay_taxi`
---@class gameplay_taxi
---@field dependencies string[] Extensions chargées avant : gameplay_util_vehicleSighting.
gameplay_taxi = {}

--- Appelle un taxi vers la route la plus proche du joueur. Essaie d'abord les taxis actifs disponibles (du plus proche au plus lointain) puis une réserve. Affiche un message et émet le hook onTaxiCalled avec 'tooFarFromRoad', 'dispatched' ou 'noTaxiAvailable'.
---Source : lua/ge/extensions/gameplay/taxi.lua:1160
function gameplay_taxi.callForTaxi() end

--- Annule les taxis appelés (pas ceux hélés) et affiche un message ; sans effet si aucun taxi n'a été appelé.
---Source : lua/ge/extensions/gameplay/taxi.lua:1092
function gameplay_taxi.cancelTaxiCall() end

--- Valide la destination choisie (phase choosingDestination avec destination définie) et démarre la course.
---Source : lua/ge/extensions/gameplay/taxi.lua:1765
function gameplay_taxi.confirmTaxiDestination() end

--- Renvoie l'état courant d'un taxi.
---Source : lua/ge/extensions/gameplay/taxi.lua:498
---@param vehId integer Identifiant du véhicule.
---@return string  Clé d'état ('available' par défaut).
function gameplay_taxi.getTaxiState(vehId) end

--- Données pour l'interface du taxi : phase, possibilité d'accélérer/ralentir/passer/arrêter/changer de destination, niveau hurry up, distance restante et totale, etc.
---Source : lua/ge/extensions/gameplay/taxi.lua:356
---@return table  Table pour l'UI (playerCurrentPhase, canHurryUp, canSlowDown, canSkip, canStop, distanceLeft, totalDistance…).
function gameplay_taxi.getTaxiViewData() end

--- Indique si une course est en cours (phases driving ou arriving).
---Source : lua/ge/extensions/gameplay/taxi.lua:1869
---@return boolean  true si en course.
function gameplay_taxi.isTaxiRideActive() end

--- Indique si la vue interface du taxi est active.
---Source : lua/ge/extensions/gameplay/taxi.lua:1870
---@return boolean  true si active.
function gameplay_taxi.isTaxiViewActive() end

--- Hook appelé quand l'IA a fini sa route : passe en phase arriving si c'est le taxi de la course.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/taxi.lua:1698
---@param vehId integer Véhicule IA.
function gameplay_taxi.onAiRouteDone(vehId) end

--- Hook : réévalue l'activation du système (désactivé pendant une mission).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/taxi.lua:841
function gameplay_taxi.onAnyMissionChanged() end

--- Hook (bouton Changer de destination) : repasse en choix de destination et rouvre la grande carte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/taxi.lua:1588
function gameplay_taxi.onChangeDestinationCalled() end

--- Hook : même traitement que onTrafficStopped.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/taxi.lua:866
function gameplay_taxi.onClientEndMission() end

--- Hook : si la carte est fermée sans choix, reprend la route, l'attente de descente ou ré-affiche la vue taxi.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/taxi.lua:1771
function gameplay_taxi.onDeactivateBigMapCallback() end

--- Hook : supprime le moteur d'étiquettes flottantes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/taxi.lua:2048
function gameplay_taxi.onExtensionUnloaded() end

--- Hook de l'action d'interaction : en course, arrête le taxi ; sinon, hèle un taxi disponible proche.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/taxi.lua:1705
function gameplay_taxi.onGameplayInteract() end

--- Hook : monte d'un niveau d'urgence IA.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/taxi.lua:1624
function gameplay_taxi.onHurryUpCalled() end

--- Hook : ajoute au menu rapide les entrées Appeler / Annuler le taxi (et une catégorie Taxi en carrière).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/taxi.lua:1824
function gameplay_taxi.onRegisterQuickAccessMenus() end

--- Hook de la grande carte : mémorise la destination choisie et envoie à l'UI TaxiDestinationPreviewed avec la longueur de route.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/taxi.lua:1752
---@param pos vec3|nil Position choisie, nil pour effacer.
function gameplay_taxi.onSetBigmapNavFocus(pos) end

--- Hook (bouton Passer) : fondu au noir, téléporte le taxi à skipPosition, relance la route et accélère la physique 1 s ; une seule fois par course.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/taxi.lua:1627
function gameplay_taxi.onSkipCalled() end

--- Hook : descend d'un niveau d'urgence IA.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/taxi.lua:1625
function gameplay_taxi.onSlowDownCalled() end

--- Hook (bouton Arrêter) : lent, passe à l'arrivée ; sinon, fait se ranger le taxi pendant la conduite.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/taxi.lua:1677
function gameplay_taxi.onStopTaxiCalled() end

--- Hook du routeur UI : ajoute data.taxi = getTaxiViewData().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/taxi.lua:1799
---@param context any Contexte du routeur.
---@param toRoute string Route d'arrivée.
---@param fromRoute string Route de départ.
---@param data table Table de données de la vue (modifiée).
function gameplay_taxi.onTaxiViewEnter(context, toRoute, fromRoute, data) end

--- Hook émis par gameplay_traffic lors de la préparation du trafic : enregistre le fournisseur 'taxi' (priorité 5, 1 garanti, 1 réservé) si le système est activé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/taxi.lua:250
function gameplay_taxi.onTrafficSpecialVehiclesProviders() end

--- Hook : réévalue l'activation du système.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/taxi.lua:837
function gameplay_taxi.onTrafficStarted() end

--- Hook : termine la course (onTaxiRideEnded raison 'trafficStopped'), vide les états et supprime les étiquettes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/taxi.lua:866
function gameplay_taxi.onTrafficStopped() end

--- Hook : si le véhicule est un taxi IA non réservé, lui attribue un état de disponibilité.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/taxi.lua:845
---@param id integer Identifiant du véhicule.
function gameplay_taxi.onTrafficVehicleAdded(id) end

--- Hook : un taxi accidenté est écarté (pickup annulé ou marqué indisponible) et son feu passe en « driverDistress ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/taxi.lua:1804
---@param vehId integer Identifiant du véhicule.
function gameplay_taxi.onTrafficVehicleCrashed(vehId) end

--- Hook : oublie le taxi retiré du trafic.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/taxi.lua:854
---@param id integer Identifiant du véhicule.
function gameplay_taxi.onTrafficVehicleRemoved(id) end

--- Hook appelé chaque frame : détecte le taxi le plus proche, met à jour pull over, arrivées, attente et blocage des pickups, étiquettes, caméra d'inactivité, approche d'arrivée, tarif, éjection et interface.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/taxi.lua:1470
---@param dtReal number Temps réel (s).
---@param dtSim number Temps simulé (s).
---@param dtRaw number Temps brut (s).
function gameplay_taxi.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook : retire au hasard l'état d'un taxi réinitialisé (sauf taxi de la course ou de pickup).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/taxi.lua:1791
---@param id integer Identifiant du véhicule.
function gameplay_taxi.onVehicleResetted(id) end

--- Hook : quand le joueur monte dans un taxi de pickup, démarre la course (hook onTaxiRideStarted), choisit le calculateur de tarif, bloque les actions de conduite, passe en caméra orbite et ouvre la carte de destination ; à la sortie du taxi, termine la course.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/taxi.lua:1519
---@param oldId integer Ancien véhicule.
---@param newId integer Nouveau véhicule.
function gameplay_taxi.onVehicleSwitched(oldId, newId) end

--- Hook : le joueur a actionné un déclencheur du taxi pendant la course ; trois avertissements mènent à l'arrêt et à l'éjection.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/taxi.lua:1713
---@param lnk any Lien du déclencheur.
---@param actionValue number 1 à l'appui.
---@param vehicleId integer Véhicule concerné.
function gameplay_taxi.onVehicleTriggersExecuteLink(lnk, actionValue, vehicleId) end

--- Active ou désactive (préférence utilisateur) la caméra d'inactivité (démarre après 15 s sans action pendant la course).
---Source : lua/ge/extensions/gameplay/taxi.lua:1665
---@param enabled boolean true pour autoriser.
function gameplay_taxi.setIdleCameraEnabled(enabled) end

--- Active ou désactive les étiquettes flottantes d'état (« TAXI » + état) au-dessus des taxis quand le joueur est à pied ; visibles jusqu'à environ 45 m.
---Source : lua/ge/extensions/gameplay/taxi.lua:1907
---@param enabled boolean true pour afficher.
function gameplay_taxi.setUseBillboards(enabled) end

--- Ferme la grande carte, calcule l'itinéraire jusqu'à player.destinationPos puis lance l'IA du taxi (ai.driveUsingPath, 1 tour, évitement activé) et passe en phase driving. Exécuté dans un job. Ne fait rien sans destination ou sans route.
---Source : lua/ge/extensions/gameplay/taxi.lua:764
---@param skipWait boolean|nil true pour ne pas attendre 2 s avant le départ (défaut false).
function gameplay_taxi.startTaxiWithCurrentRoute(skipWait) end

--- À appeler quand le réglage enableTaxiInFreeroam change : réévalue si le système doit être actif.
---Source : lua/ge/extensions/gameplay/taxi.lua:833
function gameplay_taxi.taxiSettingChanged() end

