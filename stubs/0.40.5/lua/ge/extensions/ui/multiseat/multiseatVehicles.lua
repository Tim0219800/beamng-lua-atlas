---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/multiseat/multiseatVehicles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère les véhicules et les profils (personas) des joueurs en multi-sièges : choix des véhicules suggérés, couleurs automatiques proches de la couleur du joueur, état « préparé » (staged) des réglages (véhicule, icône, préférences de conduite), apparition, remplacement, rassemblement et suppression des véhicules, sélecteurs de véhicule et données du récapitulatif (digest). C'est le moteur derrière ui_multiseat_multiseatSettings et ui_multiseat_freeroam. Il suit les véhicules possédés par persona (ownedByPersona) et survit à un rechargement Lua via onSerialize/onDeserialized.
--- Accès : extension `ui_multiseat_multiseatVehicles` : `extensions.load("ui_multiseat_multiseatVehicles")`, puis la globale `ui_multiseat_multiseatVehicles`
---@class ui_multiseat_multiseatVehicles
---@field dependencies table<integer, string> Extensions chargées avant : core_locales, core_playerPersonas, core_vehicle_configTarget, ui_gridSelectorRouteLifecycleCallbacks, ui_vehicleSelector_general.
ui_multiseat_multiseatVehicles = {}

--- Cesse de suivre le véhicule d'un joueur sans le supprimer, pour qu'il survive à removeAll lors de la sortie du multiseat.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1943
---@param player integer Indice de joueur.
---@return userdata|nil  Objet véhicule, nil si aucun.
function ui_multiseat_multiseatVehicles.abandonPlayerVehicle(player) end

--- Fait adopter à un joueur un véhicule existant : enregistre {model, config} dans sa persona et suit le véhicule comme possédé.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1596
---@param player integer Indice de joueur.
---@param veh userdata Objet véhicule.
---@return boolean  false si le joueur ou le véhicule est invalide.
function ui_multiseat_multiseatVehicles.adoptFreeroamVehicle(player, veh) end

--- Enchaîne prepareStagedChanges, multiseatConfiguration.commitCore, finalizeStagedChanges et completeCommit, avec retour arrière en cas d'échec.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1834
---@return table  {success, reason?, changes?}.
function ui_multiseat_multiseatVehicles.applyStagedChanges() end

--- Indique si tous les véhicules indiqués (ou possédés) existent et sont prêts (veh:isReady).
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1986
---@param spawned table[]|nil Entrées de véhicules.
---@return boolean  true si tous sont prêts.
function ui_multiseat_multiseatVehicles.areVehiclesReady(spawned) end

--- Supprime les véhicules créés par prepareStagedChanges et oublie le plan.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1853
function ui_multiseat_multiseatVehicles.cancelPreparedChanges() end

--- Efface la liste personnalisée et reprend les joueurs inscrits (render_splitScreen.clearCustomPlayers si disponible).
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:683
function ui_multiseat_multiseatVehicles.clearCustomSplitPlayers() end

--- Efface toutes les données de session (sélections, états actifs et préparés, préférences de rechargement).
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1928
function ui_multiseat_multiseatVehicles.clearSession() end

--- Ouvre l'écran de configuration des pièces du véhicule d'un joueur : démarre core_vehicle_configTarget, passe en vue solo (render_splitScreen.beginSoloView) puis navigue vers « pause.vehicle.configurationcombined ». Annule tout si une étape échoue.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1062
---@param vehicle userdata Objet véhicule ; doit être celui possédé par le joueur.
---@param playerId integer Indice de joueur.
---@return boolean  true si l'écran est ouvert.
function ui_multiseat_multiseatVehicles.configurePlayerVehicle(vehicle, playerId) end

--- Délègue à multiseatConfiguration.cycleDevicePlayer puis resynchronise l'état préparé.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1108
---@param deviceId string Identifiant du périphérique.
---@return boolean  true si modifié.
function ui_multiseat_multiseatVehicles.cycleDevicePlayer(deviceId) end

--- Abandonne l'état préparé et force sa reconstruction au prochain accès.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1857
---@return boolean  Toujours true.
function ui_multiseat_multiseatVehicles.discardStagedChanges() end

--- Exécute le bouton du récapitulatif identifié par buttonId.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1057
---@param buttonId any Identifiant donné par getDigestData.
---@param payload any Données transmises au bouton.
---@return boolean  false si buttonId est nil, sinon résultat du bouton.
function ui_multiseat_multiseatVehicles.executeDigestAction(buttonId, payload) end

--- Dernière étape : supprime les véhicules devenus inutiles, enregistre les sélections de session, assigne chaque joueur à son véhicule, applique les préférences et supprime les véhicules préexistants non possédés (si le multiseat démarre). Remet à zéro l'état préparé.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1793
---@param changes table|nil Résultat de getStagedChanges, renvoyé tel quel.
---@param committedConfig table Configuration appliquée (non utilisée directement).
---@return table  {success = true, changes} ou {success = false, reason}.
function ui_multiseat_multiseatVehicles.finalizeStagedChanges(changes, committedConfig) end

--- Rassemble les véhicules possédés : à côté du véhicule d'un joueur (indice) ou à un point d'apparition (« spawnPoint:nomObjet »), en les alignant l'un après l'autre sur le côté droit.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1370
---@param target integer|string Indice de joueur ou « spawnPoint:nomObjet ».
---@return boolean  true si au moins un véhicule a été déplacé.
function ui_multiseat_multiseatVehicles.gatherVehicles(target) end

--- Indique si la couleur automatique est activée (valeur préparée si elle existe, sinon réglage multiseatAutomaticColor). Voir la note sur le cas nil.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:128
---@return boolean|nil  true si activée.
function ui_multiseat_multiseatVehicles.getAutomaticColorEnabled() end

--- Données du récapitulatif de véhicules pour chaque joueur inscrit (libellé, périphérique, véhicule, actions « changeVehicle » et « configureVehicle » avec leur buttonId). Attribue d'abord des véhicules par défaut aux personas qui n'en ont pas.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:983
---@return table  {players = {...}}.
function ui_multiseat_multiseatVehicles.getDigestData() end

--- Options du champ « rassembler les véhicules » : un joueur comme point de rassemblement, puis les points d'apparition du niveau (valeur « spawnPoint:nomObjet »). Renvoie nil s'il y a moins de 2 véhicules possédés.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1308
---@return table[]|nil  Options {value, label, disabled?}.
function ui_multiseat_multiseatVehicles.getGatherVehicleOptions() end

--- Liste, triée par joueur, des entrées de véhicules possédés encore présents dans la scène.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1951
---@return table[]  Entrées {veh, vehId, player, personaId}.
function ui_multiseat_multiseatVehicles.getOwnedVehicles() end

--- Données du composant « personas » de l'écran de réglages : l'aperçu de multiseatConfiguration avec playerLimit recalculé pour le niveau (playerLimits.getCurrentLevelState).
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:905
---@return table  Aperçu enrichi.
function ui_multiseat_multiseatVehicles.getPersonaSelectorData() end

--- Données du composant « vehicles » : pour chaque joueur préparé, personaId, label, icône et icônes choisissables, couleur, état de connexion, libellé du périphérique, véhicule {model, config, label, paints} et préférences ; plus characterFaceOptions.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:924
---@return table  {players, characterFaceOptions}.
function ui_multiseat_multiseatVehicles.getSettingsData() end

--- Options du champ « même véhicule pour tous » : véhicules distincts déjà préparés (valeur = indice de joueur), puis jusqu'à 8 véhicules récents (valeur « recent:modèle/config ») après un séparateur. Renvoie nil s'il y a moins de 2 joueurs préparés.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1222
---@return table[]|nil  Options {value, label, disabled?}.
---@return integer|nil  Valeur actuellement partagée, nil si les véhicules diffèrent.
function ui_multiseat_multiseatVehicles.getSharedVehicleOptions() end

--- Compare l'état actif à l'état préparé et renvoie {dirty, requiresRestart, rosterChanged, vehicleChanged, colorChanged, iconChanged, preferencesChanged}. Un changement de joueurs ou de modèle/config exige un redémarrage ; une simple couleur est repeinte sur le véhicule en place.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:833
---@return table  Table d'indicateurs.
function ui_multiseat_multiseatVehicles.getStagedChanges() end

--- Liste triée des indices de joueurs inscrits dans l'état préparé.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:896
---@return integer[]  Indices de joueurs.
function ui_multiseat_multiseatVehicles.getStagedPlayers() end

--- Renvoie un véhicule suggéré par joueur en essayant, dans l'ordre : la fonction du niveau mainLevel.getMultiseatSuggestedVehicles, le pool du gamemode, puis getSuggestedVehiclesForLevel.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:70
---@param levelName string|nil Nom du niveau.
---@param playerCount integer Nombre de joueurs ; < 1 renvoie {}.
---@return table[]  Liste de {model, config}.
function ui_multiseat_multiseatVehicles.getSuggestedVehicles(levelName, playerCount) end

--- Choisit un véhicule par joueur dans le pool multiseat.suggestedVehicles du niveau (info.json), sinon dans les véhicules de repli ; le pool est mélangé puis parcouru en boucle.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:61
---@param levelName string|nil Nom du niveau.
---@param playerCount integer Nombre de joueurs ; < 1 renvoie {}.
---@return table[]  Liste de {model, config}, une entrée par joueur.
function ui_multiseat_multiseatVehicles.getSuggestedVehiclesForLevel(levelName, playerCount) end

--- Renvoie une copie du véhicule {model, config, ...} de la persona d'un joueur.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1874
---@param player integer Indice de joueur.
---@return table|nil  Véhicule, nil si le joueur est absent.
function ui_multiseat_multiseatVehicles.getVehicleForPlayer(player) end

--- Indique si l'état préparé diffère de l'état initial pris à l'ouverture de l'écran.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:891
---@return boolean  true si l'utilisateur a modifié quelque chose.
function ui_multiseat_multiseatVehicles.hasUserChanges() end

--- Indique si un instantané est en construction, si des changements sont en cours d'application ou si une préparation est en attente.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1996
---@return boolean  true si en cours.
function ui_multiseat_multiseatVehicles.isSynchronizing() end

--- Délègue à multiseatConfiguration.joinDeviceGroup puis resynchronise.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1138
---@param groupId integer Identifiant de groupe.
---@return boolean  true si modifié.
function ui_multiseat_multiseatVehicles.joinDeviceGroup(groupId) end

--- Retire un joueur via multiseatConfiguration.leavePlayer puis resynchronise.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1144
---@param player integer Indice de joueur.
---@return boolean  true si modifié.
function ui_multiseat_multiseatVehicles.leaveDeviceGroup(player) end

--- Délègue à multiseatConfiguration.moveDevicePlayer puis resynchronise l'état préparé.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1120
---@param deviceId string Identifiant du périphérique.
---@param direction integer -1 ou 1.
---@return boolean  true si modifié.
function ui_multiseat_multiseatVehicles.moveDevicePlayer(deviceId, direction) end

--- Hook appelé à la fin du niveau ; vide tout l'état (les véhicules partent avec le niveau).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:2107
function ui_multiseat_multiseatVehicles.onClientEndMission() end

--- Hook appelé après un rechargement Lua ; relie les véhicules sérialisés aux joueurs et programme une réconciliation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:2038
---@param data table Données renvoyées par onSerialize.
function ui_multiseat_multiseatVehicles.onDeserialized(data) end

--- Hook appelé au déchargement de l'extension ; supprime les véhicules possédés sauf si un rechargement Lua est en cours (preserveVehiclesOnUnload), puis vide l'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:2131
function ui_multiseat_multiseatVehicles.onExtensionUnloaded() end

--- Callback d'entrée de la route du sélecteur rapide ; délègue à ui_gridSelectorRouteLifecycleCallbacks.onRouteEnter.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1581
---@param context table Contexte de route.
---@param toRoute table Route d'arrivée.
---@param fromRoute table Route de départ.
---@param data any Données de navigation.
function ui_multiseat_multiseatVehicles.onQuickVehicleSelectorEnter(context, toRoute, fromRoute, data) end

--- Callback de sortie de la route du sélecteur rapide ; délègue à gridSelector puis oublie le joueur en attente si on quitte la route.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1589
---@param context table Contexte de route.
---@param toRoute table Route d'arrivée.
---@param fromRoute table Route de départ.
---@param data any Données de navigation.
function ui_multiseat_multiseatVehicles.onQuickVehicleSelectorLeave(context, toRoute, fromRoute, data) end

--- Callback de montage de la route du sélecteur rapide ; délègue à ui_gridSelectorRouteLifecycleCallbacks.onRouteMount.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1585
---@param context table Contexte de route.
---@param toRoute table Route d'arrivée.
---@param fromRoute table Route de départ.
---@param data any Données de navigation.
function ui_multiseat_multiseatVehicles.onQuickVehicleSelectorMount(context, toRoute, fromRoute, data) end

--- Hook appelé avant un rechargement Lua ; si le multiseat est actif, renvoie les véhicules possédés, les sélections de session et les préférences, et empêche la suppression des véhicules au déchargement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:2000
---@param reason string Raison (log).
---@return table|nil  {ownedVehicles, sessionByPersona, preferencesByPersona}.
function ui_multiseat_multiseatVehicles.onSerialize(reason) end

--- Hook appelé quand l'interface affiche l'état d'attente ; exécute le remplacement de véhicule différé par le sélecteur rapide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:2098
function ui_multiseat_multiseatVehicles.onUiWaitingState() end

--- Hook appelé à chaque image ; après un rechargement, réconcilie les véhicules (preserveOwned), restaure les préférences et dégèle les véhicules dès que des participants sont présents.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:2068
function ui_multiseat_multiseatVehicles.onUpdate() end

--- Appelé par multiseatSettings à la sortie de la route du sélecteur ; annule la sélection en attente si on quitte vraiment cette route.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1466
---@param toRoute table|nil Route d'arrivée.
function ui_multiseat_multiseatVehicles.onVehicleSelectorLeave(toRoute) end

--- Ouvre le sélecteur rapide (route pause.multiseatVehicleSelector) depuis le menu pause ; au choix, revient à « pause » puis remplace le véhicule après l'événement onUiWaitingState.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1557
---@param player integer Indice de joueur.
---@return boolean  false si le multiseat est inactif ou le joueur absent.
function ui_multiseat_multiseatVehicles.openQuickVehicleSelectorForPlayer(player) end

--- Ouvre le sélecteur de véhicule et applique le choix à tous les joueurs préparés (au moins 2 requis).
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1440
---@return boolean  false s'il y a moins de 2 joueurs.
function ui_multiseat_multiseatVehicles.openVehicleSelectorForAllPlayers() end

--- Ouvre le sélecteur de véhicule pour un joueur préparé (route pause.multiseatSettings.vehicleSelector). Au choix, le véhicule est préparé et on revient à l'écran de réglages.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1415
---@param player integer Indice de joueur.
---@return boolean  false si le joueur n'est pas inscrit.
function ui_multiseat_multiseatVehicles.openVehicleSelectorForPlayer(player) end

--- Première étape d'application : vérifie joueurs et limite, écrit les données préparées dans les personas et fait apparaître les véhicules nouveaux ou différents (les autres sont repeints). Les véhicules créés sont gardés dans un plan jusqu'à finalizeStagedChanges ou cancelPreparedChanges.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1711
---@return table  {success = true, changes} ou {success = false, reason}.
function ui_multiseat_multiseatVehicles.prepareStagedChanges() end

--- Met les véhicules possédés en accord avec les joueurs inscrits : supprime ceux des joueurs partis, remplace les véhicules différents de la sélection (sauf options.preserveOwned) et fait apparaître les manquants derrière un véhicule existant sur la route (core_multiSpawn « roadBehind »), sinon à côté. Assigne ensuite chaque joueur et resynchronise l'écran partagé.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1635
---@param options table|nil preserveOwned = true conserve les véhicules existants tels quels.
---@return boolean  Succès.
---@return string|nil  vehicle_replace_failed ou vehicle_spawn_failed.
function ui_multiseat_multiseatVehicles.reconcileFreeroamVehicles(options) end

--- Fait correspondre les véhicules à un plan d'apparition en les réutilisant ou les remplaçant si besoin, et supprime les autres sauf si options.removeMissing == false. options.customPlayers fixe la liste de joueurs en écran partagé.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1893
---@param spawnPlan table[] Liste de {player, parkingSpot|pos+rot}.
---@param options table|nil removeMissing, customPlayers.
---@return table[]  Entrées réconciliées.
---@return string|nil  Raison de l'arrêt (player_unavailable, vehicle_replace_failed, vehicle_spawn_failed).
function ui_multiseat_multiseatVehicles.reconcileSpawnPlan(spawnPlan, options) end

--- Supprime tous les véhicules possédés (les joueurs en sortent d'abord).
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1922
function ui_multiseat_multiseatVehicles.removeAll() end

--- Délègue à multiseatConfiguration.removeDevice (périphérique déconnecté) puis resynchronise.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1132
---@param deviceId string Identifiant du périphérique.
---@return boolean  true si modifié.
function ui_multiseat_multiseatVehicles.removeDevice(deviceId) end

--- Repeint les véhicules possédés avec les peintures de leur persona (mise à jour en direct des couleurs).
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1973
function ui_multiseat_multiseatVehicles.repaintOwnedVehicles() end

--- Remplace en direct le véhicule d'un joueur multiseat actif (met à jour la persona, remplace ou fait apparaître le véhicule, assigne le joueur et réinitialise la caméra). Restaure l'ancienne persona en cas d'échec.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1509
---@param player integer Indice de joueur.
---@param model string Modèle.
---@param config string Configuration.
---@param additionalData table|nil Données du sélecteur ; paint, paint2, paint3 donnent les peintures choisies.
---@return table  {success = true} ou {success = false, reason}.
function ui_multiseat_multiseatVehicles.replacePlayerVehicle(player, model, config, additionalData) end

--- Remet chaque joueur dans son véhicule possédé s'il n'y est plus.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1403
---@return boolean  true si au moins un joueur a été replacé.
function ui_multiseat_multiseatVehicles.reseatAllPlayers() end

--- Réinitialise les instantanés de l'écran de réglages (appelé à sa fermeture).
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1866
function ui_multiseat_multiseatVehicles.resetSettingsSnapshots() end

--- Définit la liste de joueurs affichés en écran partagé (copie) et la transmet à render_splitScreen.setCustomPlayers.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:678
---@param players integer[] Indices de joueurs.
function ui_multiseat_multiseatVehicles.setCustomSplitPlayers(players) end

--- Délègue à multiseatConfiguration.setDevicePlayer puis resynchronise l'état préparé.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1126
---@param deviceId string Identifiant du périphérique.
---@param personaNumber integer|nil Numéro de persona, nil ou 0 pour désassigner.
---@return boolean  true si modifié.
function ui_multiseat_multiseatVehicles.setDevicePlayer(deviceId, personaNumber) end

--- Gèle ou dégèle des véhicules via core_vehicleBridge (action setFreeze).
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1962
---@param spawned table[]|nil Entrées de véhicules ; tous les véhicules possédés si nil.
---@param frozen boolean true pour geler.
function ui_multiseat_multiseatVehicles.setFrozen(spawned, frozen) end

--- Enregistre {model, config} comme véhicule de la persona d'un joueur (sans faire apparaître de véhicule).
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1614
---@param player integer Indice de joueur.
---@param vehicle table {model, config}.
---@return boolean  true si la persona a été mise à jour.
function ui_multiseat_multiseatVehicles.setPlayerVehicleSelection(player, vehicle) end

--- Supprime tous les véhicules possédés puis fait apparaître le véhicule de chaque joueur du plan à sa position (place de parking ou pos/rot), assigne le joueur et suit le véhicule.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1880
---@param spawnPlan table[] Liste de {player, parkingSpot} ou {player, pos, rot}.
---@return table[]  Entrées de véhicules créées.
function ui_multiseat_multiseatVehicles.spawnAll(spawnPlan) end

--- Prépare le mode couleur automatique pour tous les joueurs et recalcule la peinture de leur véhicule préparé.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1204
---@param automaticColor boolean true pour la couleur automatique.
---@return boolean  true si au moins un véhicule a changé.
function ui_multiseat_multiseatVehicles.stageAutomaticColorForAllPlayers(automaticColor) end

--- Prépare l'icône d'un joueur ; refusée si ce n'est pas une icône de persona, si elle est inchangée ou déjà prise par un autre joueur.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1189
---@param player integer Indice de joueur.
---@param icon string Identifiant d'icône.
---@return boolean  true si modifiée.
function ui_multiseat_multiseatVehicles.stagePlayerIcon(player, icon) end

--- Prépare la sortie d'un joueur (seul optedIn = false est accepté ; true renvoie false).
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1101
---@param player integer Indice de joueur.
---@param optedIn boolean Doit être false.
---@return boolean  true si le joueur a été retiré.
function ui_multiseat_multiseatVehicles.stagePlayerOptIn(player, optedIn) end

--- Prépare les préférences de conduite d'un joueur après validation (gearbox arcade/realistic, ignitionLevel entier 0 à 3, characterFace valide).
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1167
---@param player integer Indice de joueur.
---@param preferences table {gearbox, clutchAssist, throttleAssist, ignitionLevel, characterFace}.
---@return boolean  false si le joueur est absent ou si une valeur est invalide.
function ui_multiseat_multiseatVehicles.stagePlayerVehiclePreferences(player, preferences) end

--- Prépare le même véhicule pour tous les joueurs, à partir de « recent:modèle/config » ou de l'indice d'un joueur dont on copie le véhicule.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1296
---@param source string|integer Source du véhicule.
---@return boolean  true si au moins un véhicule a changé.
function ui_multiseat_multiseatVehicles.stageSameVehicleForAllPlayers(source) end

--- Délègue à multiseatConfiguration.toggleDevicePlayer puis resynchronise l'état préparé.
---Source : lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1114
---@param deviceId string Identifiant du périphérique.
---@return boolean  true si modifié.
function ui_multiseat_multiseatVehicles.toggleDevicePlayer(deviceId) end

