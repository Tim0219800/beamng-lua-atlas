---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/freeformDelivery/setup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mise en place et démontage d'une livraison libre. Associe les véhicules déjà spawnés par le chargeur (delivery._vehicleIndex, par internalName) aux ID de la livraison, applique leur état de départ (mode de boîte, rapport, moteur, niveau d'allumage), enregistre des aperçus, planifie les attelages (couplings) via util_stepHandler, place le joueur (dans un véhicule, à pied ou sur une place de parking) et mémorise les positions initiales pour un reset.
--- Accès : extension `gameplay_freeformDelivery_setup` : `extensions.load("gameplay_freeformDelivery_setup")`, puis la globale `gameplay_freeformDelivery_setup`
---@class gameplay_freeformDelivery_setup
gameplay_freeformDelivery_setup = {}

--- Démonte la livraison : si keepVehicles, extrait les véhicules des préfabs (explosion du préfab) et les remet dans MissionGroup ; supprime les préfabs créés (et recharge la collision si besoin) ; sinon supprime les véhicules. Vide ensuite tout l'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/freeformDelivery/setup.lua:568
---@param delivery table|nil Données de livraison (_prefabIds, _hasColliders).
---@param keepVehicles boolean|nil true pour conserver les véhicules (faux par défaut).
function gameplay_freeformDelivery_setup.cleanup(delivery, keepVehicles) end

--- Gèle ou dégèle tous les véhicules de la livraison (action setFreeze via core_vehicleBridge).
---Source : lua/ge/extensions/gameplay/freeformDelivery/setup.lua:557
---@param freeze boolean|nil true par défaut ; false pour dégeler.
function gameplay_freeformDelivery_setup.freezeAllVehicles(freeze) end

--- Renvoie la liste des attelages collectés lors du dernier setup.
---Source : lua/ge/extensions/gameplay/freeformDelivery/setup.lua:549
---@return table[]  Entrées {vehId, nodeTag, targetVehId}.
function gameplay_freeformDelivery_setup.getAllCouplingSetup() end

--- Liste des ID de véhicules dont un attelage est en attente.
---Source : lua/ge/extensions/gameplay/freeformDelivery/setup.lua:541
---@return integer[]  ID d'objets.
function gameplay_freeformDelivery_setup.getPendingCouplings() end

--- Renvoie les véhicules indexés par ID d'objet.
---Source : lua/ge/extensions/gameplay/freeformDelivery/setup.lua:553
---@return table<integer, table>  Entrées {vehicleId, vehicle, deliveryVehicle}.
function gameplay_freeformDelivery_setup.getSpawnedVehicles() end

--- Convertit un ID de véhicule de livraison en ID d'objet du jeu.
---Source : lua/ge/extensions/gameplay/freeformDelivery/setup.lua:529
---@param deliveryVehicleId string ID du véhicule dans la définition de livraison.
---@return integer|nil  ID d'objet ou nil.
function gameplay_freeformDelivery_setup.getVehicleId(deliveryVehicleId) end

--- Indique si la mise en place asynchrone est terminée (tous les véhicules prêts et aucun attelage en attente). Quand c'est le cas, remet setupInProgress à false.
---Source : lua/ge/extensions/gameplay/freeformDelivery/setup.lua:466
---@return boolean  true si terminée ou non démarrée.
function gameplay_freeformDelivery_setup.isSetupComplete() end

--- Renvoie le drapeau interne de mise en place en cours.
---Source : lua/ge/extensions/gameplay/freeformDelivery/setup.lua:533
---@return boolean  true tant que setup/reset n'est pas terminé.
function gameplay_freeformDelivery_setup.isSetupInProgress() end

--- Remet chaque véhicule à sa position/rotation initiale (reset physique, flexmesh réparé), réapplique l'état de départ puis relance la séquence d'attelages.
---Source : lua/ge/extensions/gameplay/freeformDelivery/setup.lua:490
function gameplay_freeformDelivery_setup.restoreVehicleTransforms() end

--- Prépare la livraison : résout les images des zones cibles, indexe les véhicules spawnés, applique l'état de départ, blacklist les véhicules non enterables, collecte et lance les attelages, place le joueur et stocke les transformations initiales.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/freeformDelivery/setup.lua:394
---@param delivery table Données de livraison (vehicles, targetAreas, playerStart, _vehicleIndex, _basePath...).
---@return boolean  false si delivery est nil, sinon true (les opérations asynchrones continuent ensuite).
function gameplay_freeformDelivery_setup.setup(delivery) end

--- Place le joueur selon delivery.playerStart (véhicule, marche à une position, ou marche sur une place de parking).
---Source : lua/ge/extensions/gameplay/freeformDelivery/setup.lua:537
---@param delivery table Données de livraison contenant playerStart.
function gameplay_freeformDelivery_setup.setupPlayer(delivery) end

