---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/seatOccupants.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Système de sièges et d'occupants des véhicules. Il enregistre quel joueur (ou quel occupant factice) occupe quel siège de chaque véhicule (occupancy[vehId][seatId]) et la « présence » de chaque joueur (véhicule, siège éventuel, mode de permission). Il applique le poids des occupants au véhicule, affiche ou masque les maillages d'occupants (selon la caméra et le réglage enableSeatOccupants), gère la caméra de siège, le blocage des commandes de conduite pour un passager (masque d'action maps) et la sortie du véhicule. Les véhicules sans configuration de sièges (occupantSystem / occupantSlotsById dans les données JBeam) ne passent pas par ce système. Utile aux moddeurs pour faire monter un joueur dans un siège précis, ajouter des passagers factices lestés ou connaître qui conduit.
--- Accès : extension `gameplay_seatOccupants` : `extensions.load("gameplay_seatOccupants")`, puis la globale `gameplay_seatOccupants`
---@class gameplay_seatOccupants
---@field debugDisableOccupantSystem boolean Debug : désactive tout le système de sièges et revient au comportement ancien (false par défaut).
---@field debugDisableOccupantWeight boolean Debug : désactive l'ajout du poids des occupants (false par défaut).
---@field dependencies string[] Extensions chargées avant (core_camera, core_vehicle_manager, core_input_actionFilter, core_gamestate, core_multiseat, ui_vehicleSelector_vehicleSpecifications).
---@field enablePresenceDebugMessages boolean Affiche un message à chaque changement de présence (false par défaut).
---@field enableSeatEjection boolean Si true, enterSeat éjecte (mode marche) le joueur déjà assis sur ce siège (false par défaut).
gameplay_seatOccupants = {}

--- Indique si le joueur peut entrer dans le véhicule (changement de véhicule ou marche autorisés).
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:365
---@param vehId integer Identifiant du véhicule.
---@param player integer|nil Indice du joueur (0 par défaut).
---@return boolean  true si l'entrée est possible.
function gameplay_seatOccupants.canEnterVehicle(vehId, player) end

--- Ajoute 10 kg à chaque occupant (borné à 119) et affiche un message avec le poids.
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1497
---@param vehId integer|nil Véhicule ; défaut véhicule du joueur 0.
---@return number|nil  Poids affiché, nil si aucun occupant.
function gameplay_seatOccupants.cheeseburger(vehId) end

--- Retire l'occupant factice d'un siège.
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1422
---@param vehId integer Identifiant du véhicule.
---@param seatId string Siège.
---@return boolean  true si retiré.
---@return string|nil  'notDummy' si rien à retirer.
function gameplay_seatOccupants.clearDummyOccupant(vehId, seatId) end

--- Retire tous les occupants factices d'un véhicule, ou de tous les véhicules si vehId est nil.
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1434
---@param vehId integer|nil Véhicule ciblé.
---@return integer  Nombre d'occupants retirés.
function gameplay_seatOccupants.clearDummyOccupants(vehId) end

--- Libère des sièges. Sans second argument : tous les occupants du véhicule. Avec un nombre : retire ce joueur de tous les véhicules.
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:875
---@param vehId integer|nil Identifiant du véhicule.
---@param seatIdOrPlayer string|integer|nil Nil pour tout le véhicule, un nombre pour un joueur ; un nom de siège est géré par le reste de la fonction (déduit du code).
function gameplay_seatOccupants.clearOccupied(vehId, seatIdOrPlayer) end

--- Point d'entrée du déclencheur « enterSeat » d'un siège : retrouve le siège à partir du trigger puis appelle requestEnterSeat. En mode debug, entre en 'unrestricted' sans siège.
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1597
---@param vehId integer Identifiant du véhicule.
---@param triggerId any Identifiant du trigger de siège.
---@param player integer|nil Joueur (0 par défaut).
---@return boolean|nil  true si assis.
function gameplay_seatOccupants.enterSeat(vehId, triggerId, player) end

--- Plus petit indice de joueur autorisé à conduire le véhicule (mode 'driver' ou 'unrestricted').
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1388
---@param vehId integer Identifiant du véhicule.
---@return integer|nil  Indice du conducteur, nil s'il n'y a que des passagers.
function gameplay_seatOccupants.getDriverPlayer(vehId) end

--- Version déclarée du système d'occupants dans les données du véhicule.
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:80
---@param vehId integer Identifiant du véhicule.
---@return any|nil  Version, ou nil si absente.
function gameplay_seatOccupants.getOccupantSystemVersion(vehId) end

--- Copie de la présence d'un joueur dans un véhicule.
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:287
---@param player integer|nil Indice du joueur (0 par défaut).
---@return table|nil  {vehicleId, seatId?, permissionMode, permissionOverride?} ou nil.
function gameplay_seatOccupants.getPlayerPresence(player) end

--- Calcule où le joueur sort du véhicule : point à côté de la carrosserie, du côté du siège (exitNode/exitSide de l'emplacement, sinon côté déduit de la position), décalé de 0,7 m au-delà de la carrosserie.
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1520
---@param player integer|nil Joueur (0 par défaut).
---@param vehId integer|nil Véhicule ; défaut véhicule du joueur.
---@return vec3|nil  Position de sortie.
---@return vec3|nil  Position du siège.
function gameplay_seatOccupants.getSeatExitData(player, vehId) end

--- Liste les sièges d'un véhicule avec leur état.
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1322
---@param vehId integer Identifiant du véhicule.
---@return table[]  Éléments {seatId, isDriver, occupied, occupantType ('player'|'dummy'), player, weight, color, permissionMode, displayName, defaultPermissionMode, cameraName, actionMaps, seatExitNode, seatExitSide, partPath, seatPartPath}.
function gameplay_seatOccupants.getSeats(vehId) end

--- Liste des présences des joueurs dans un véhicule, triée par joueur.
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1371
---@param vehId integer Identifiant du véhicule.
---@return table[]  Éléments {player, seatId, permissionMode, unseated}.
function gameplay_seatOccupants.getVehiclePresences(vehId) end

--- Hook avant le remplacement d'un véhicule : mémorise s'il n'avait pas de système de sièges.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1809
---@param vehId integer Identifiant du véhicule.
function gameplay_seatOccupants.onBeforeVehicleReplaced(vehId) end

--- Hook avant la bascule du mode marche : si le joueur passe à pied, lève le blocage de conduite.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1878
---@param enabled boolean true si on passe à pied.
---@param _ any Non utilisé.
---@param player integer|nil Indice du joueur.
function gameplay_seatOccupants.onBeforeWalkingModeToggled(enabled, _, player) end

--- Hook : la caméra d'un joueur change ; met à jour la visibilité des occupants (par ex. cacher la tête en vue à la première personne).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1756
---@param player integer|nil Indice du joueur.
---@param camName string Nom de la caméra.
---@param vid integer|nil Véhicule de la caméra.
function gameplay_seatOccupants.onCameraChanged(player, camName, vid) end

--- Hook : efface les forçages d'occupants et occupe le véhicule actuel du joueur 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1865
function gameplay_seatOccupants.onClientStartMission() end

--- Hook : restaure l'état après rechargement Lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1971
---@param data table Données de onSerialize.
function gameplay_seatOccupants.onDeserialized(data) end

--- Hook : restaure l'état sérialisé s'il existe, sinon occupe les joueurs existants.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1939
---@param data table|nil Données sérialisées.
function gameplay_seatOccupants.onExtensionLoaded(data) end

--- Hook : retire les forçages, restaure les caméras et libère le masque d'action maps.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1952
function gameplay_seatOccupants.onExtensionUnloaded() end

--- Hook : recalcule présences et visuels quand les participants locaux changent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1870
function gameplay_seatOccupants.onLocalParticipantsChanged() end

--- Hook : sérialise présences et sièges occupés avant un rechargement Lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1962
---@return table  {version, playerPresence, seatClaims, occupancy}.
function gameplay_seatOccupants.onSerialize() end

--- Hook : réapplique les visuels des occupants (réglage enableSeatOccupants).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1746
function gameplay_seatOccupants.onSettingsChanged() end

--- Hook : recalcule présences et visuels après changement d'écran partagé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1750
function gameplay_seatOccupants.onSplitScreenChanged() end

--- Hook : libère toutes les données d'occupation et de présence du véhicule détruit.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1833
---@param vehId integer Identifiant du véhicule.
function gameplay_seatOccupants.onVehicleDestroyed(vehId) end

--- Hook après remplacement : réapplique l'état et réassigne les joueurs sans siège.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1813
---@param vehId integer Identifiant du véhicule.
function gameplay_seatOccupants.onVehicleReplaced(vehId) end

--- Hook : réapplique poids et visuels après un reset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1826
---@param vehId integer Identifiant du véhicule.
function gameplay_seatOccupants.onVehicleResetted(vehId) end

--- Hook : réapplique poids et visuels pour un véhicule qui vient d'apparaître.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1793
---@param vehId integer Identifiant du véhicule.
function gameplay_seatOccupants.onVehicleSpawned(vehId) end

--- Hook : le joueur change de véhicule ; met à jour son occupation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1612
---@param oldId integer Ancien véhicule.
---@param newId integer Nouveau véhicule.
---@param player integer|nil Indice du joueur.
function gameplay_seatOccupants.onVehicleSwitched(oldId, newId, player) end

--- Hook pour personnaliser le libellé et l'icône de l'action « enterSeat » d'un trigger de siège (« S'asseoir ici », siège conducteur ou passager).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1067
---@param data table Table modifiée (actionName, vehicleId, player, title, icon).
function gameplay_seatOccupants.onVehicleTriggerActionLabel(data) end

--- Réaffirme la visibilité des maillages d'occupants après une modification faite sans passer par les hooks de synchronisation (utilisé par gameplay_traffic).
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:646
---@param vehId integer Identifiant du véhicule.
function gameplay_seatOccupants.refreshOccupantMeshes(vehId) end

--- Choisit un siège libre (en tenant compte de la position de marche éventuelle) et y installe le joueur. Sans siège libre, repasse en présence sans siège si le mode par défaut est 'unrestricted', sinon affiche « véhicule plein ».
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1202
---@param vehId integer Identifiant du véhicule.
---@param player integer|nil Joueur.
---@param walkingPos vec3|nil Position du joueur à pied pour choisir le siège le plus proche.
---@return boolean|nil  nil si le véhicule n'utilise pas le système de sièges.
function gameplay_seatOccupants.requestEnterBestSeat(vehId, player, walkingPos) end

--- Demande à un joueur de s'asseoir sur un siège donné, en entrant dans le véhicule si nécessaire (à pied ou en changeant de véhicule). Si le joueur est déjà sur ce siège, il sort (bascule en mode marche). Affiche un message si le siège est pris, si on ne peut pas quitter son siège, ou si le véhicule n'est pas accessible.
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1138
---@param vehId integer Identifiant du véhicule.
---@param seatId string Siège visé.
---@param player integer|nil Joueur (0 par défaut).
---@param permissionOverride string|nil Mode de permission imposé.
---@return boolean|nil  true si le joueur est au final sur ce siège (ou sort) ; nil si vehId ou seatId manquent.
function gameplay_seatOccupants.requestEnterSeat(vehId, seatId, player, permissionOverride) end

--- Place un joueur dans le véhicule sans siège (présence « non assise »), avec un mode de permission optionnel.
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1217
---@param player integer|nil Joueur.
---@param vehId integer Identifiant du véhicule.
---@param permissionMode string|nil 'driver', 'passenger' ou 'unrestricted'.
---@return boolean  true si la présence sans siège est établie.
---@return string|nil  'invalidVehicle' ou 'invalidPermissionMode' en cas d'échec.
function gameplay_seatOccupants.requestUnseatedPresence(player, vehId, permissionMode) end

--- Retire 10 kg à chaque occupant (borné à 49) et affiche un message avec le poids.
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1501
---@param vehId integer|nil Véhicule ; défaut véhicule du joueur 0.
---@return number|nil  Poids affiché, nil si aucun occupant.
function gameplay_seatOccupants.salad(vehId) end

--- Place un occupant factice (maillage coloré aléatoire) avec un poids sur un siège libre.
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1400
---@param vehId integer Identifiant du véhicule.
---@param seatId string Siège.
---@param weight number|nil Poids ; défaut 89, minimum 0.
---@return boolean  true si placé.
---@return string|nil  'invalidVehicle', 'invalidSeat', 'occupied' ou 'reserved'.
function gameplay_seatOccupants.setDummyOccupant(vehId, seatId, weight) end

--- Place un joueur sur un siège (sans animation ni changement de véhicule). Libère ses autres sièges, enregistre la présence, applique le poids, met à jour les commandes et la caméra.
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:842
---@param vehId integer Identifiant du véhicule.
---@param seatId string|nil Siège ; défaut le siège conducteur.
---@param player integer|nil Joueur (0 par défaut).
---@param weight number|nil Poids de l'occupant (défaut 89).
---@param permissionOverride string|nil Mode de permission imposé.
---@return boolean  false si véhicule invalide, siège invalide ou indisponible.
function gameplay_seatOccupants.setOccupied(vehId, seatId, player, weight, permissionOverride) end

--- Change le mode de permission d'un joueur déjà présent dans un véhicule.
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:478
---@param player integer|nil Indice du joueur (0 par défaut).
---@param permissionMode string 'driver', 'passenger' ou 'unrestricted'.
---@return boolean  true si appliqué.
---@return string|nil  Cause d'échec : 'invalidPermissionMode' ou 'noPresence'.
function gameplay_seatOccupants.setPlayerPermissionMode(player, permissionMode) end

--- Force l'affichage (true) ou le masquage (false) des occupants d'un véhicule, indépendamment du réglage global ; nil retire le forçage.
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1718
---@param vehId integer Identifiant du véhicule.
---@param enabled boolean|nil Forçage.
---@return boolean  false si le véhicule n'existe pas.
function gameplay_seatOccupants.setVehicleOccupantsEnabledOverride(vehId, enabled) end

--- Affiche le message UI « véhicule plein » au joueur.
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:379
---@param player integer|nil Indice du joueur.
function gameplay_seatOccupants.showVehicleFullMessage(player) end

--- Passe au siège libre suivant (direction > 0) ou précédent (direction < 0) du véhicule actuel, le conducteur étant en tête de liste.
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1254
---@param player integer|nil Joueur.
---@param direction integer|nil Sens ; 1 par défaut.
---@return boolean  true si un siège a été pris.
function gameplay_seatOccupants.switchSeat(player, direction) end

--- Bascule entre « assis » et « sans siège » dans le véhicule actuel.
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:1300
---@param player integer|nil Joueur.
---@return boolean  Succès.
function gameplay_seatOccupants.toggleUnseated(player) end

--- Indique si le véhicule utilise le système de sièges (occupantSystem.enabled, sinon présence d'emplacements d'occupants dans les données du véhicule). Toujours false si debugDisableOccupantSystem.
---Source : lua/ge/extensions/gameplay/seatOccupants.lua:85
---@param vehId integer Identifiant du véhicule.
---@return boolean  true si le véhicule a des sièges gérés.
function gameplay_seatOccupants.usesSeatSystem(vehId) end

