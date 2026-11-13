---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Modèle transactionnel de la configuration multi-sièges : quels périphériques d'entrée (ou groupes de périphériques gérés par la plateforme) appartiennent à quel joueur/persona. begin() ouvre une transaction (copie de l'état actuel ou du cache d'affectations), les fonctions d'édition la modifient, getPreview() fournit l'état à l'interface, puis commit() (ou commitCore + completeCommit) l'applique via core_multiseat.applyConfiguration ; discard() l'abandonne. Utilisé par l'écran de réglages multiseat.
--- Accès : extension `ui_multiseat_multiseatConfiguration` : `extensions.load("ui_multiseat_multiseatConfiguration")`, puis la globale `ui_multiseat_multiseatConfiguration`
---@class ui_multiseat_multiseatConfiguration
---@field AUTOMATIC_COLOR_DEFAULT boolean Valeur par défaut (true) du réglage multiseatAutomaticColor.
---@field dependencies table<integer, string> Extensions chargées avant : core_playerPersonas.
ui_multiseat_multiseatConfiguration = {}

--- Ouvre la transaction de configuration si elle n'existe pas (copie de la configuration active ou du cache), sinon réconcilie l'inventaire des périphériques. Appelle core_multiseat.beginConfigurationEdit.
---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:328
---@param options table|nil Options ; source = origine de l'ouverture (par exemple « settings »).
---@return table  Aperçu, voir getPreview.
function ui_multiseat_multiseatConfiguration.begin(options) end

--- Vide le cache d'affectations de joueurs (core_multiseat.cachePlayerAssignments avec des listes vides). Sans effet si le multiseat est déjà actif.
---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:823
---@return boolean  Résultat du vidage, false si impossible.
function ui_multiseat_multiseatConfiguration.clearCachedAssignments() end

--- commitCore puis completeCommit.
---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:895
---@return boolean  Succès.
---@return table|string  Configuration appliquée, ou raison de l'échec.
function ui_multiseat_multiseatConfiguration.commit() end

--- Applique la configuration via core_multiseat.applyConfiguration (notification des participants différée) et mémorise le journal des changements ; la transaction reste ouverte pour permettre rollbackCommit.
---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:860
---@return boolean  Succès.
---@return table|string  Configuration appliquée, ou raison de l'échec (par exemple « no_players »).
function ui_multiseat_multiseatConfiguration.commitCore() end

--- Termine un commit réussi : appelle core_multiseat.finalizeConfiguration, ferme la transaction et journalise les changements.
---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:873
---@return boolean  false si aucun commitCore réussi.
function ui_multiseat_multiseatConfiguration.completeCommit() end

--- Mode manuel : sans joueur, assigne le périphérique à la première persona libre ; sinon le déplace vers la persona précédente (ou le désassigne s'il n'y en a pas).
---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:506
---@param deviceId string Identifiant du périphérique ou du groupe.
---@return boolean  true si modifié.
function ui_multiseat_multiseatConfiguration.cycleDevicePlayer(deviceId) end

--- Abandonne la transaction ; si elle avait déjà été appliquée (commitCore), restaure la configuration de départ. Termine l'édition côté core_multiseat.
---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:367
---@return boolean  false s'il n'y avait pas de transaction.
function ui_multiseat_multiseatConfiguration.discard() end

--- Construit la configuration à appliquer : platformManagesPlayers, personaOptInMode, manualAssignments (deviceId vers joueur, -1 si aucun), manualDeviceMetadata, groupAssignments, platformDeviceGroups, participants {playerIndex, personaNumber, persona} et adoptVehicleId.
---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:658
---@return table|nil  Configuration, nil sans transaction.
function ui_multiseat_multiseatConfiguration.getCommitConfiguration() end

--- Renvoie une copie de la persona de la transaction.
---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:575
---@param personaNumber integer Numéro de persona.
---@return table|nil  Persona ou nil.
function ui_multiseat_multiseatConfiguration.getPersona(personaNumber) end

--- Renvoie la liste des indices de joueurs (0 à n-1).
---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:651
---@return integer[]  Indices ; vide sans transaction.
function ui_multiseat_multiseatConfiguration.getPlayers() end

--- Renvoie l'état affichable de la configuration (ouvre la transaction si besoin) : availablePlayers (périphériques en mode manuel), availablePersonas et joinedPersonas, deviceGroups (mode plateforme), maxPlayers, platformManagesPlayers, playerLimit {limit, hard, atLimit, exceeded} et revision.
---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:581
---@return table  Table d'aperçu.
function ui_multiseat_multiseatConfiguration.getPreview() end

--- Compare la configuration courante à la base de départ : true si multiseat n'était pas actif, si le nombre de joueurs ou les affectations diffèrent.
---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:834
---@return boolean  true s'il y a des changements.
function ui_multiseat_multiseatConfiguration.hasChanges() end

--- Indique si l'utilisateur a modifié les affectations depuis l'ouverture (ou si elles viennent du cache).
---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:814
---@return boolean  true si modifié.
function ui_multiseat_multiseatConfiguration.hasUserChanges() end

--- Indique si une transaction est ouverte.
---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:363
---@return boolean  true si ouverte.
function ui_multiseat_multiseatConfiguration.isActive() end

--- Mode plateforme : fait rejoindre un groupe de périphériques ; la persona porte le numéro du groupe s'il est libre et valide, sinon la première libre.
---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:531
---@param groupId integer Identifiant de groupe (converti avec tonumber).
---@return boolean  false si déjà rejoint ou limite atteinte.
function ui_multiseat_multiseatConfiguration.joinDeviceGroup(groupId) end

--- Retire un joueur : libère tous ses périphériques/groupes et supprime sa persona.
---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:547
---@param player integer Indice de joueur (à partir de 0).
---@return boolean  false si le joueur n'existe pas.
function ui_multiseat_multiseatConfiguration.leavePlayer(player) end

--- Mode manuel : déplace le périphérique vers la persona précédente (direction -1, ou aucune si c'est la première) ou suivante (direction 1, ou une nouvelle persona si c'est la dernière et qu'elle a plusieurs périphériques).
---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:456
---@param deviceId string Identifiant du périphérique ou du groupe.
---@param direction integer -1 ou 1.
---@return boolean  true si modifié.
function ui_multiseat_multiseatConfiguration.moveDevicePlayer(deviceId, direction) end

--- Hook appelé à la fin du niveau ; abandonne la transaction sans restaurer et efface l'aperçu des couleurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:902
function ui_multiseat_multiseatConfiguration.onClientEndMission() end

--- Hook appelé quand les périphériques ou liaisons changent ; réconcilie l'inventaire et notifie l'interface si la liste a changé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:908
function ui_multiseat_multiseatConfiguration.onInputBindingsChanged() end

--- Mode manuel : oublie un périphérique déconnecté (connected == false), le désassigne et le marque comme supprimé.
---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:437
---@param deviceId string Identifiant du périphérique ou du groupe.
---@return boolean  false si le périphérique est introuvable ou encore connecté.
function ui_multiseat_multiseatConfiguration.removeDevice(deviceId) end

--- Restaure la configuration de départ après un commitCore.
---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:886
---@return boolean  Résultat de core_multiseat.restoreConfiguration, ou false.
function ui_multiseat_multiseatConfiguration.rollbackCommit() end

--- Mode manuel : assigne le périphérique à la persona indiquée (1 à 64), ou le désassigne avec nil ou 0. Renvoie false si rien ne change ou si la limite de joueurs l'interdit.
---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:418
---@param deviceId string Identifiant du périphérique ou du groupe.
---@param personaNumber integer|nil 1..64 pour assigner, nil ou 0 pour désassigner.
---@return boolean  true si modifié.
function ui_multiseat_multiseatConfiguration.setDevicePlayer(deviceId, personaNumber) end

--- Copie les clés de data dans la persona (nom, icône, couleur, véhicule…).
---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:566
---@param personaNumber integer Numéro de persona.
---@param data table Champs à écraser.
---@param emitChange boolean|nil Si false, ne notifie pas l'interface.
---@return boolean  false si pas de transaction, data invalide ou persona inconnue.
function ui_multiseat_multiseatConfiguration.setPersonaData(personaNumber, data, emitChange) end

--- Mode manuel : retire le périphérique de son joueur s'il en a un, sinon l'assigne à la première persona libre.
---Source : lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:397
---@param deviceId string Identifiant du périphérique ou du groupe.
---@return boolean  true si modifié.
function ui_multiseat_multiseatConfiguration.toggleDevicePlayer(deviceId) end

