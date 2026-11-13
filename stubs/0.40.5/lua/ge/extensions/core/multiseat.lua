---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/multiseat.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_multiseat` : gestion du multi-joueur local (plusieurs joueurs sur le même PC : clavier/souris et manettes). Elle décide quel joueur (indice 0, 1, 2...) contrôle chaque périphérique d'entrée, soit par attribution manuelle (par périphérique), soit par groupes de périphériques gérés par la plateforme (comptes utilisateur de console). Elle maintient la liste des joueurs 'rejoints' (joinedPlayers) avec leur persona (nom, icône, couleur via core_playerPersonas), place les joueurs dans des véhicules, affiche des étiquettes de joueurs (render_playerTags), colore les périphériques et émet onLocalParticipantsChanged. La majorité des fonctions est appelée par core_input_bindings et par l'interface multiseat.
--- Accès : extension `core_multiseat` : `extensions.load("core_multiseat")`, puis la globale `core_multiseat`
---@class core_multiseat
---@field allowTrafficDebug boolean false. Non utilisé dans ce fichier.
---@field dependencies string[] { 'core_playerPersonas', 'render_playerTags', 'ui_multiseat_assignmentCache' }.
core_multiseat = {}

--- Applique une configuration multiseat : active le réglage 'multiseat' et l'action map, installe les affectations, personas et joueurs, avec restauration automatique en cas d'erreur.
---Source : lua/ge/extensions/core/multiseat.lua:1138
---@param config table Voir resolveConfiguration ; champs en plus : multiseatActive (défaut true), deferParticipantNotification.
---@return boolean  true si appliquée.
---@return string|nil  Raison de l'échec.
function core_multiseat.applyConfiguration(config) end

--- Assigne un groupe de périphériques de la plateforme à un joueur (ou -1 pour le désassigner). Refuse si la plateforme ne gère pas les joueurs, si le groupe n'existe pas ou si le joueur est déjà pris par un autre groupe.
---Source : lua/ge/extensions/core/multiseat.lua:585
---@param groupId integer Identifiant du groupe.
---@param player integer Indice de joueur >= 0, ou -1.
---@return boolean  true si l'affectation a été faite.
function core_multiseat.assignDeviceGroup(groupId, player) end

--- Démarre une session d'édition : getAssignedPlayers renvoie alors des affectations figées au lieu de recalculer.
---Source : lua/ge/extensions/core/multiseat.lua:1496
function core_multiseat.beginConfigurationEdit() end

--- Construit le cache (propriétaires de périphériques/groupes par numéro de persona) à partir d'une configuration et le stocke dans ui_multiseat_assignmentCache.
---Source : lua/ge/extensions/core/multiseat.lua:1022
---@param config table Configuration avec participants et affectations.
---@return boolean  false si config invalide.
function core_multiseat.cachePlayerAssignments(config) end

--- Retire les couleurs de joueurs des périphériques, si elles avaient été appliquées.
---Source : lua/ge/extensions/core/multiseat.lua:1362
function core_multiseat.clearDeviceColors() end

--- Retire tous les joueurs rejoints et efface toutes les personas.
---Source : lua/ge/extensions/core/multiseat.lua:886
---@return boolean  false s'il n'y en avait aucun.
function core_multiseat.clearJoinedPlayers() end

--- Remet la persona d'un joueur rejoint à ses valeurs par défaut et notifie.
---Source : lua/ge/extensions/core/multiseat.lua:1291
---@param player integer Indice de joueur.
---@return boolean  false si le joueur n'a pas rejoint.
function core_multiseat.clearPlayerPersona(player) end

--- Fait passer un périphérique (ou le groupe clavier+souris) au joueur suivant dans le cycle (joueur 0, -1 non assigné, puis joueur précédent...), renumérote les joueurs et met à jour core_input_bindings. Refusé si la plateforme gère les joueurs.
---Source : lua/ge/extensions/core/multiseat.lua:616
---@param deviceId string Id d'un périphérique.
---@return boolean  true si l'affectation a changé.
function core_multiseat.cycleDevicePlayer(deviceId) end

--- Termine l'édition, et mémorise éventuellement l'état des périphériques et des affectations fournis.
---Source : lua/ge/extensions/core/multiseat.lua:1497
---@param devices table|nil Périphériques à mémoriser.
---@param assignments table|nil Affectations à mémoriser.
function core_multiseat.endConfigurationEdit(devices, assignments) end

--- Exporte l'état complet du multiseat (affectations, joueurs rejoints, personas, caches) sous forme de table copiable, utilisée comme instantané pour restauration ou rechargement Lua.
---Source : lua/ge/extensions/core/multiseat.lua:971
---@return table  Instantané.
function core_multiseat.exportConfiguration() end

--- Termine une application différée : met à jour le cache d'affectations en attente et émet la notification des participants.
---Source : lua/ge/extensions/core/multiseat.lua:1228
---@return boolean  false s'il n'y avait rien à finaliser.
function core_multiseat.finalizeConfiguration() end

--- Calcule quel joueur contrôle chaque périphérique, l'applique via assignPlayerToDevice et met à jour l'état interne (joueurs actifs, personas). Pendant une édition de configuration, renvoie des affectations 'sûres' sans les modifier. Appelée par core_input_bindings.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/multiseat.lua:201
---@param devices table nom de périphérique -> { guid, productName, pidvid, playerNumber, platformUserNumber }.
---@param logEnabled boolean|nil Écrit dans le log le nombre de joueurs et les affectations.
---@param seatPlayers boolean|nil Si vrai, fait monter les joueurs à pied dans le véhicule le moins occupé et fait descendre ceux devenus inactifs.
---@return table<string, integer>  Périphérique -> indice de joueur (-1 = aucun).
function core_multiseat.getAssignedPlayers(devices, logEnabled, seatPlayers) end

--- Participants disponibles pour l'interface : pour chaque joueur actif, { id = 'local-player:N', assignment, inputIcon, joined, persona (réelle si rejoint, sinon aperçu) }.
---Source : lua/ge/extensions/core/multiseat.lua:1239
---@return table[]  Participants disponibles.
function core_multiseat.getAvailableParticipants() end

--- Renvoie le cache d'affectations mémorisé dans ui_multiseat_assignmentCache.
---Source : lua/ge/extensions/core/multiseat.lua:1029
---@return table|nil  Cache.
function core_multiseat.getCachedPlayerAssignments() end

--- Liste, pour l'interface, les 'périphériques' (clavier+souris regroupés, manettes) avec leur joueur assigné manuellement : { id, deviceIds, primaryDeviceId, deviceLabel, inputIcon, playerIndex, connected, deviceMetadata }.
---Source : lua/ge/extensions/core/multiseat.lua:469
---@return table[]  Éléments décrits ci-dessus, clavier-souris en premier.
function core_multiseat.getDeviceAssignments() end

--- Version paramétrée de getDeviceAssignments pour des périphériques et affectations fournis.
---Source : lua/ge/extensions/core/multiseat.lua:409
---@param devices table|nil Périphériques.
---@param assignedPlayers table<string, integer>|nil Périphérique -> joueur.
---@param connectedDevices table|nil Périphériques connectés (nil = tous).
---@return table[]  Même format que getDeviceAssignments.
function core_multiseat.getDeviceAssignmentsFor(devices, assignedPlayers, connectedDevices) end

--- Renvoie le groupe de périphériques assigné à un joueur.
---Source : lua/ge/extensions/core/multiseat.lua:609
---@param player integer Indice de joueur.
---@return integer|nil  groupId, ou nil.
function core_multiseat.getDeviceGroupForPlayer(player) end

--- Groupes de périphériques de la plateforme (un par compte utilisateur), avec le joueur assigné ; inclut les groupes assignés mais déconnectés (connected = false).
---Source : lua/ge/extensions/core/multiseat.lua:566
---@return table[]  Éléments { id, groupId, playerIndex, label, devices, connected }.
function core_multiseat.getDeviceGroups() end

--- Version paramétrée de getDeviceGroups.
---Source : lua/ge/extensions/core/multiseat.lua:496
---@param devices table|nil Périphériques.
---@param groupAssignments table<integer, integer>|nil groupId -> joueur.
---@return table[]  Groupes triés par groupId.
function core_multiseat.getDeviceGroupsFor(devices, groupAssignments) end

--- Participants des joueurs rejoints, triés par indice de joueur.
---Source : lua/ge/extensions/core/multiseat.lua:961
---@return table[]  Participants.
function core_multiseat.getJoinedParticipants() end

--- Indices triés des joueurs ayant rejoint (avec persona).
---Source : lua/ge/extensions/core/multiseat.lua:713
---@return integer[]  Indices de joueurs.
function core_multiseat.getJoinedPlayers() end

--- Renvoie le participant d'un joueur.
---Source : lua/ge/extensions/core/multiseat.lua:1272
---@param player integer Indice de joueur.
---@return table|nil  Participant.
function core_multiseat.getParticipant(player) end

--- Renvoie la révision des participants (compteur interne + révision de core_playerPersonas), pour détecter les changements.
---Source : lua/ge/extensions/core/multiseat.lua:62
---@return integer  Révision.
function core_multiseat.getParticipantRevision() end

--- Renvoie les participants (persona + affectation). Sans argument et s'il y a des joueurs rejoints, ce sont les joueurs rejoints ; sinon les joueurs actifs (avec persona en aperçu si non rejoints).
---Source : lua/ge/extensions/core/multiseat.lua:1258
---@param players integer[]|nil Liste d'indices de joueurs.
---@return table[]  Participants.
function core_multiseat.getParticipants(players) end

--- Indique si les étiquettes de joueurs sont activées (réglage 'multiseatTags' booléen, défaut true). Convertit en booléen une ancienne valeur chaîne ('never' = faux). Voir les notes sur l'incohérence avec core_multiseatPlayerMarkers.
---Source : lua/ge/extensions/core/multiseat.lua:49
---@return boolean  true si activées.
function core_multiseat.getPlayerMarkersEnabled() end

--- Remplit et renvoie la liste ordonnée des indices de joueurs actuellement actifs.
---Source : lua/ge/extensions/core/multiseat.lua:322
---@param result integer[]|nil Table à réutiliser (vidée puis remplie).
---@return integer[]  Indices de joueurs.
function core_multiseat.getPlayers(result) end

--- Indique si applyConfiguration est en cours.
---Source : lua/ge/extensions/core/multiseat.lua:1495
---@return boolean  true si en cours.
function core_multiseat.isApplyingConfiguration() end

--- Indique si une édition de configuration est en cours.
---Source : lua/ge/extensions/core/multiseat.lua:1505
---@return boolean  true si en cours.
function core_multiseat.isConfigurationEditActive() end

--- Indique si le multiseat est actif.
---Source : lua/ge/extensions/core/multiseat.lua:1399
---@return boolean  true si actif.
function core_multiseat.isMultiseatActive() end

--- Indique si la plateforme (console, Steam...) gère elle-même les joueurs : Input.getPlatformUserCount() non nil (ou mode de débogage).
---Source : lua/ge/extensions/core/multiseat.lua:120
---@return boolean  true si géré par la plateforme.
function core_multiseat.isPlatformManagingPlayers() end

--- Fait rejoindre un joueur actif : lui attribue le premier numéro de persona libre (persona par défaut), renumérote et notifie. Renvoie true s'il est déjà rejoint.
---Source : lua/ge/extensions/core/multiseat.lua:838
---@param player integer Indice de joueur actif.
---@return boolean  false si le joueur n'est pas actif ou plus de place.
function core_multiseat.joinPlayer(player) end

--- Retire un joueur rejoint : efface sa persona et libère ses périphériques ou son groupe, puis notifie.
---Source : lua/ge/extensions/core/multiseat.lua:852
---@param player integer Indice de joueur.
---@return boolean  false si le joueur n'avait pas rejoint.
function core_multiseat.leavePlayer(player) end

--- Fin de niveau : réinitialise tout l'état multiseat (voir notes, reset()).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/multiseat.lua:1403
function core_multiseat.onClientEndMission() end

--- Après un rechargement Lua : restaure la configuration à partir de l'instantané.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/multiseat.lua:1450
---@param data table Instantané renvoyé par onSerialize.
function core_multiseat.onDeserialized(data) end

--- Au déchargement : détruit les étiquettes de joueurs et retire les couleurs de périphériques.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/multiseat.lua:1518
function core_multiseat.onExtensionUnloaded() end

--- Hook de changement de langue : resynchronise les joueurs rejoints, invalide les personas (noms traduits) et notifie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/multiseat.lua:1511
function core_multiseat.onLanguageChanged() end

--- Avant un rechargement Lua : détruit étiquettes et couleurs, et renvoie un instantané si le multiseat est actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/multiseat.lua:1435
---@param reason string|nil Raison de la sérialisation (log).
---@return table|nil  Instantané, ou nil si le multiseat est inactif.
function core_multiseat.onSerialize(reason) end

--- Hook par frame (seulement quand un niveau est chargé) : synchronise les couleurs de périphériques et affiche/met à jour les étiquettes de joueurs (render_playerTags), sauf si le split-screen est chargé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/multiseat.lua:1379
---@param dtReal number Temps réel écoulé (s).
---@param dtSim number Temps de simulation écoulé (s), non utilisé.
function core_multiseat.onUpdate(dtReal, dtSim) end

--- Affiche sur les périphériques les couleurs des joueurs d'une configuration encore en cours d'édition (core_devices.setPlayerColors).
---Source : lua/ge/extensions/core/multiseat.lua:1348
---@param config table|nil Configuration à prévisualiser ; nil efface les couleurs.
function core_multiseat.previewDeviceColors(config) end

--- Valide et normalise une configuration proposée par l'interface : renumérote les joueurs à partir de 0 selon l'ordre des numéros de persona et traduit les affectations de périphériques/groupes.
---Source : lua/ge/extensions/core/multiseat.lua:1033
---@param config table { participants = [{ playerIndex, personaNumber, persona }], manualAssignments, groupAssignments, platformManagesPlayers, personaOptInMode, manualDeviceMetadata, platformDeviceGroups }.
---@param devices table|nil Périphériques connus.
---@return table|nil  Configuration résolue { platformManagesPlayers, personaOptInMode, manualAssignments, groupAssignments, assignments, participants, personas, ... }.
---@return string|nil  Raison d'échec : 'invalid_configuration', 'invalid_player_count' ou 'invalid_participant'.
function core_multiseat.resolveConfiguration(config, devices) end

--- Restaure un instantané produit par exportConfiguration (protégé par pcall, refusé pendant un applyConfiguration) et notifie.
---Source : lua/ge/extensions/core/multiseat.lua:1125
---@param snapshot table Instantané.
---@return boolean  true si restauré.
function core_multiseat.restoreConfiguration(snapshot) end

--- Marque le multiseat comme actif (session multiseat en cours).
---Source : lua/ge/extensions/core/multiseat.lua:1395
---@param active boolean Nouvel état.
function core_multiseat.setMultiseatActive(active) end

--- Active ou désactive le mode où les joueurs doivent rejoindre explicitement (au lieu d'obtenir une persona automatiquement). L'activer efface les joueurs rejoints.
---Source : lua/ge/extensions/core/multiseat.lua:898
---@param enabled boolean true pour activer.
function core_multiseat.setPersonaOptInMode(enabled) end

--- Enregistre le réglage booléen 'multiseatTags'.
---Source : lua/ge/extensions/core/multiseat.lua:58
---@param enabled boolean true pour activer.
function core_multiseat.setPlayerMarkersEnabled(enabled) end

--- Définit la persona d'un joueur rejoint (nom, icône, couleur, véhicule) et notifie.
---Source : lua/ge/extensions/core/multiseat.lua:1282
---@param player integer Indice de joueur.
---@param data table { id, displayName, icon, color, vehicle }
---@return boolean  false si le joueur n'a pas rejoint ou données invalides.
function core_multiseat.setPlayerPersona(player, data) end

