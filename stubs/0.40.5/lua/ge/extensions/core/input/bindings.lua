---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/input/bindings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_input_bindings` : charge, fusionne, sauvegarde et envoie au moteur les associations touches/axes -> actions (bindings) de tous les périphériques branchés, pour chaque joueur. Il lit les inputmaps par défaut (JSON du jeu et des véhicules) puis les différences utilisateur (*.diff dans settings/inputmaps), applique les courbes de réponse FFB, notifie l'UI, le moteur, les véhicules (config force feedback) et les autres extensions. Il gère aussi l'activation des ActionMap de menu selon les écrans ouverts. Un moddeur s'en sert surtout pour connaître la touche d'une action, réinitialiser les contrôles ou activer/désactiver des actions de menu.
--- Accès : extension `core_input_bindings` : `extensions.load("core_input_bindings")`, puis la globale `core_input_bindings`
---@class core_input_bindings
---@field assignedPlayers table<string, integer> Nom de périphérique -> indice de joueur.
---@field autoAssignPlayersToDevices boolean true (défaut) : l'assignation joueur<->périphérique est calculée automatiquement par core_multiseat.
---@field bindings table[] Bindings courants par périphérique (voir notes).
---@field defaultBindings table[] Bindings par défaut officiels, même structure que bindings ; sert de référence pour calculer les diffs.
---@field dependencies string[] {'core_input_actions', 'core_input_categories', 'core_multiseat', 'license', 'core_versionUpdate'}.
---@field devices table<string, table> Périphériques branchés : nom (ex. 'xinput0') -> {guid, productName, vidpid, playerNumber, platformUserNumber}.
---@field isMenuActive boolean true quand l'ActionMap de menu est active (écran de menu ou popup ouvert).
core_input_bindings = {}

--- Applique en une fois une table d'assignations (périphérique -> joueur ; absent = -1).
---Source : lua/ge/extensions/core/input/bindings.lua:959
---@param assignments table<string, integer> Assignations.
---@param reason string|nil Texte pour les notifications.
---@return boolean  false si assignments n'est pas une table.
function core_input_bindings.applyPlayerAssignments(assignments, reason) end

--- Active ou désactive un modificateur personnalisé de l'ActionMap pour un joueur (ActionMap.enableCustomModifier).
---Source : lua/ge/extensions/core/input/bindings.lua:1368
---@param player integer Indice du joueur.
---@param enabled boolean Activer.
---@param modifier any Modificateur (valeur du moteur).
function core_input_bindings.enableCustomModifier(player, enabled, modifier) end

--- Autres actions utilisées (non 'unused') sur les mêmes contrôles que actionName, sur le même périphérique.
---Source : lua/ge/extensions/core/input/bindings.lua:684
---@param actionName string Nom unique de l'action.
---@return string[]  Noms d'actions triés.
function core_input_bindings.getActionsSharingControls(actionName) end

--- Renvoie M.assignedPlayers.
---Source : lua/ge/extensions/core/input/bindings.lua:1293
---@return table<string, integer>  Périphérique -> joueur.
function core_input_bindings.getAssignedPlayers() end

--- Renvoie le premier contrôle (touche/axe) trouvé pour une action, tous périphériques confondus. Le résultat est mis en cache jusqu'au prochain notifyGE.
---Source : lua/ge/extensions/core/input/bindings.lua:669
---@param actionName string Nom unique de l'action.
---@return string|nil  Nom du contrôle (ex. 'keyboard0' contrôle, 'axis1').
function core_input_bindings.getControlForAction(actionName) end

--- Lit la configuration force feedback d'une action (steering, accelerate, brake) pour le conducteur d'un véhicule : décode le JSON renvoyé par be:getFFBConfig puis ffbParamsJson dans ffbConfig.ffbParams.
---Source : lua/ge/extensions/core/input/bindings.lua:764
---@param veh userdata Objet véhicule.
---@param action string Nom de l'action.
---@return table|nil  Config FFB, nil s'il n'y a pas de conducteur ni de contrôleur FFB ou en cas d'erreur de décodage.
---@return integer  FFBID.
function core_input_bindings.getFFBConfigForAction(veh, action) end

--- Renvoie isMenuActive.
---Source : lua/ge/extensions/core/input/bindings.lua:1231
---@return boolean  État.
function core_input_bindings.getMenuActionMapEnabled() end

--- Indique si la surveillance est active.
---Source : lua/ge/extensions/core/input/bindings.lua:1125
---@return boolean  État.
function core_input_bindings.getMenuActionMapWatchEnabled() end

--- État actuel (activé ou non) de chaque action de menu indépendante.
---Source : lua/ge/extensions/core/input/bindings.lua:1108
---@return table<string, boolean>  Action -> activée.
function core_input_bindings.getMenuActionStates() end

--- État de la MenuScrollActionMap.
---Source : lua/ge/extensions/core/input/bindings.lua:1141
---@return boolean  true si poussée.
function core_input_bindings.getMenuScrollActionMapEnabled() end

--- Liste des périphériques triés par activité récente (mise en cache, getDevicesByRecentActivity).
---Source : lua/ge/extensions/core/input/bindings.lua:1459
---@return table  Périphériques récents.
function core_input_bindings.getRecentDevices() end

--- Recharge les bindings en enregistrant les chemins de fichiers lus (utile pour lister les inputmaps utilisés).
---Source : lua/ge/extensions/core/input/bindings.lua:1362
---@return string[]  Chemins lus.
function core_input_bindings.getUsedBindingsFiles() end

--- Indique si un popup modal est ouvert (état d'UI '/popup/...' hors '/popup/activity/').
---Source : lua/ge/extensions/core/input/bindings.lua:1288
---@return boolean  État.
function core_input_bindings.isModalPopupOpen() end

--- Déprécié : loggue une erreur avec la pile d'appel et appelle setMenuActionMapEnabled(enabled).
---Source : lua/ge/extensions/core/input/bindings.lua:1347
---@param enabled boolean État voulu.
function core_input_bindings.menuActive(enabled) end

--- Envoie à l'UI les contrôleurs, les joueurs assignés et un paquet InputBindingsChanged (catégories, actions du véhicule courant, template de binding, bindings, defaultBindings, reason).
---Source : lua/ge/extensions/core/input/bindings.lua:702
---@param reason string Texte indiquant la cause.
function core_input_bindings.notifyUI(reason) end

--- Hook de changement de route UI : mémorise le nom de la route et met à jour l'état de l'ActionMap de menu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/input/bindings.lua:1262
---@param context table Contexte avec toRoute.name.
function core_input_bindings.onAfterRouteChange(context) end

--- Hook quand un périphérique est branché/débranché : met à jour la liste (avec toasts UI), les assignations et notifie tout.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/input/bindings.lua:1325
function core_input_bindings.onDeviceChanged() end

--- Hook au chargement : exécute les migrations (popup de disposition v37 ; conversion des diffs manette PlayStation avant 0.38).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/input/bindings.lua:1455
function core_input_bindings.onExtensionLoaded() end

--- Hook de changement de fichier : si un fichier d'actions ou d'inputmap (settings/inputmaps, vehicles/.../inputmaps, *.inputmap.json) change, programme un rechargement dans 0,1 s.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/input/bindings.lua:1316
---@param filename string Chemin modifié.
---@param t any Non utilisé (déduit du code).
function core_input_bindings.onFileChanged(filename, t) end

--- Hook au premier update : liste les périphériques, assigne les joueurs, calcule tous les bindings et notifie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/input/bindings.lua:1353
function core_input_bindings.onFirstUpdate() end

--- Hook quand un joueur entre ou quitte un véhicule : renvoie la config force feedback aux véhicules.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/input/bindings.lua:828
---@param player integer Indice du joueur.
function core_input_bindings.onPlayerVehiclePresenceChanged(player) end

--- Hook appelé quand l'ordre d'activité des périphériques change : met en cache et envoie RecentDevicesChanged à l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/input/bindings.lua:1464
---@param _recentDevices table Nouvelle liste.
function core_input_bindings.onRecentDevicesChanged(_recentDevices) end

--- Hook de changement de réglages : si le réglage 'multiseat' a changé, recalcule assignations et bindings.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/input/bindings.lua:1335
function core_input_bindings.onSettingsChanged() end

--- Hook à l'initialisation de l'UI : remet l'état de popup modal à faux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/input/bindings.lua:1284
function core_input_bindings.onUIInitialised() end

--- Hook de changement d'état d'UI : détecte les popups ouverts ('/popup/...') et met à jour l'ActionMap de menu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/input/bindings.lua:1269
---@param stateName string État UI.
---@param opened boolean Ouvert ou fermé.
---@param stateStack string[] Pile des états ouverts.
function core_input_bindings.onUIStateTriggered(stateName, opened, stateStack) end

--- Hook à la création d'un véhicule : recalcule assignations et bindings sans notification.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/input/bindings.lua:1016
---@param vehId integer Id du véhicule.
---@param veh userdata Objet véhicule.
function core_input_bindings.onVehicleSpawned(vehId, veh) end

--- Hook au changement de véhicule d'un joueur : recalcule assignations et bindings (les actions spécifiques changent) et notifie tout.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/input/bindings.lua:996
---@param oldId integer Ancien véhicule.
---@param newId integer Nouveau véhicule.
---@param player integer Indice du joueur.
function core_input_bindings.onVehicleSwitched(oldId, newId, player) end

--- Recalcule l'assignation automatique via core_multiseat (si autoAssign) et notifie seulement si elle a changé.
---Source : lua/ge/extensions/core/input/bindings.lua:973
---@param logEnabled boolean|nil Active les logs de core_multiseat.
---@param seatPlayers boolean|nil Transmis à core_multiseat.getAssignedPlayers.
---@return table<string, integer>  Assignations courantes.
function core_input_bindings.refreshAssignedPlayers(logEnabled, seatPlayers) end

--- Supprime les bindings personnalisés (inputmaps/diff utilisateur) d'un périphérique ou de tous, génériques et du véhicule joueur, et recharge.
---Source : lua/ge/extensions/core/input/bindings.lua:926
---@param desiredDevName string|nil Nom de périphérique ; nil = tous les périphériques branchés.
function core_input_bindings.resetBindings(desiredDevName) end

--- Sauvegarde les bindings envoyés par l'UI : les sépare par véhicule/génériques, compare à la version par défaut et écrit un fichier .diff par périphérique et véhicule, puis force un rechargement.
---Source : lua/ge/extensions/core/input/bindings.lua:894
---@param data table Inputmap complète d'un périphérique : {bindings, devicetype, guid, name, vidpid, …}.
function core_input_bindings.saveBindingsToDisk(data) end

--- Active ou désactive une ActionMap de menu : soit par nom d'action ('menu_item_up' -> MenuIndependent_menu_item_upActionMap), soit directement par nom d'ActionMap. Refuse (log d'erreur) les ActionMap non liées aux menus ou inconnues.
---Source : lua/ge/extensions/core/input/bindings.lua:1147
---@param enabled boolean Nouvel état.
---@param actionName string|nil Nom d'action ; peut être nil si actionMapName est donné.
---@param actionMapName string|nil Nom complet de l'ActionMap.
---@return boolean|nil  Nouvel état effectif (am.enabled), nil en cas d'échec.
function core_input_bindings.setMenuActionEnabled(enabled, actionName, actionMapName) end

--- Active ou désactive l'ActionMap de menu principale (et, à la désactivation, toutes les ActionMap de menu indépendantes), met à jour isMenuActive et notifie l'UI/extensions.
---Source : lua/ge/extensions/core/input/bindings.lua:1204
---@param enabled boolean true = menus actifs.
function core_input_bindings.setMenuActionMapEnabled(enabled) end

--- Active/désactive la notification UI MenuActionMapStateChanged à chaque modification d'une ActionMap de menu.
---Source : lua/ge/extensions/core/input/bindings.lua:1120
---@param enabled boolean true = surveiller.
---@return boolean  Nouvel état.
function core_input_bindings.setMenuActionMapWatchEnabled(enabled) end

--- Applique en lot un état pour plusieurs actions de menu : {menu_item_up = true, menu_item_down = false}. Ignore les valeurs non booléennes.
---Source : lua/ge/extensions/core/input/bindings.lua:1183
---@param actionStates table<string, boolean> Action -> état voulu.
---@return table<string, boolean>|boolean  Action -> état effectif ; false si l'argument n'est pas une table.
function core_input_bindings.setMenuActionsEnabled(actionStates) end

--- Pousse (push) ou retire (pop) la 'MenuScrollActionMap' sur la pile des ActionMap.
---Source : lua/ge/extensions/core/input/bindings.lua:1131
---@param enabled boolean true = pousser.
---@return boolean  État résultant ; false si l'ActionMap n'existe pas.
function core_input_bindings.setMenuScrollActionMapEnabled(enabled) end

--- Assigne un joueur à un périphérique (assignPlayerToDevice), recalcule les bindings et notifie tout le monde.
---Source : lua/ge/extensions/core/input/bindings.lua:952
---@param devname string Nom du périphérique.
---@param player integer Indice du joueur.
function core_input_bindings.setPlayerToDevice(devname, player) end

--- Hook par image : exécute le rechargement différé des bindings ; désactive la 'VehicleSpecificActionMap' quand le joueur marche (unicycle en caméra monde) hors split-screen.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/input/bindings.lua:1298
---@param dtRaw number Delta temps brut en secondes.
function core_input_bindings.updateGFX(dtRaw) end

