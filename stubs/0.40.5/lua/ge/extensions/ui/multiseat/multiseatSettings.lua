---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/multiseat/multiseatSettings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Logique de l'écran de réglages multi-sièges (routes « pause.multiseatSettings » et « pause.multiseatSettings.vehicleSelector »). Il collecte les fournisseurs de réglages des autres extensions (hook onGetMultiseatGameSettings), garde des valeurs actives et des valeurs préparées (staged), construit les données de l'écran pour l'interface Vue, applique ou abandonne les changements et gère la confirmation de sortie. Les actions sur les joueurs/périphériques sont déléguées à ui_multiseat_multiseatVehicles. Un moddeur ajoute des réglages en répondant au hook onGetMultiseatGameSettings.
--- Accès : extension `ui_multiseat_multiseatSettings` : `extensions.load("ui_multiseat_multiseatSettings")`, puis la globale `ui_multiseat_multiseatSettings`
---@class ui_multiseat_multiseatSettings
---@field dependencies table<integer, string> Extensions chargées avant : ui_multiseat_generalSettings, ui_multiseat_multiseatConfiguration, ui_multiseat_multiseatVehicles, ui_gridSelectorRouteLifecycleCallbacks, ui_pause_routeLifecycleCallbacks.
ui_multiseat_multiseatSettings = {}

--- Applique les changements préparés : valide (hook onValidateMultiseatGameSettings), prépare les véhicules, applique la configuration des joueurs (commitCore), finalise les véhicules, appelle onApplyMultiseatGameSettings puis onMultiseatSettingsApplied. En cas d'échec la configuration est restaurée (rollbackCommit).
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:319
---@param options table|nil exitAfterApply = true transmet l'indicateur aux hooks (result.exitAfterApply).
---@return table  {success, reason?, requiresRestart?, exitAfterApply?, ...} ; {success = true} s'il n'y a aucun changement.
function ui_multiseat_multiseatSettings.applyStagedSettings(options) end

--- Annule la navigation de sortie en attente.
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:516
function ui_multiseat_multiseatSettings.cancelExit() end

--- Garde de sortie de route : s'il y a des changements non appliqués, mémorise la navigation visée et affiche une boîte (annuler, abandonner, appliquer) puis renvoie false pour bloquer la sortie. Renvoie true si la sortie est autorisée.
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:470
---@param route table Route visée (champ name).
---@param params table|nil Paramètres de navigation.
---@param context table|nil Contexte (routeName, options).
---@return boolean  true pour autoriser la sortie.
function ui_multiseat_multiseatSettings.confirmExit(route, params, context) end

--- Applique les réglages préparés puis reprend la navigation en attente ; en cas d'échec, annule la navigation et renvoie le résultat.
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:525
---@return table|any  Résultat d'échec, sinon résultat de la navigation.
function ui_multiseat_multiseatSettings.confirmExitApplying() end

--- Reprend la navigation en attente sans appliquer ; les valeurs préparées sont perdues à la fermeture (closeSettings).
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:521
---@return any  Résultat de ui_router.navigate, ou false.
function ui_multiseat_multiseatSettings.confirmExitDiscarding() end

--- Quitte le multiseat : met en cache les affectations s'il n'y a plus de joueurs préparés, applique les changements en attente s'il ne reste qu'un joueur, appelle ui_multiseat_freeroam.exitMultiseat puis ferme le menu.
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:432
---@return boolean  true si la sortie et la fermeture du menu ont réussi.
function ui_multiseat_multiseatSettings.confirmMultiseatExit() end

--- Fait passer un périphérique au joueur suivant (délégué à multiseatVehicles).
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:543
---@param deviceId string Identifiant du périphérique.
---@return table  {success, data}.
function ui_multiseat_multiseatSettings.cycleDevicePlayer(deviceId) end

--- Abandonne les valeurs préparées (retour aux valeurs actives), vide le cache d'affectations si le multiseat n'est pas actif, abandonne la configuration et les changements de véhicules.
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:399
---@return table|nil  Données d'écran à jour.
function ui_multiseat_multiseatSettings.discardStagedSettings() end

--- Construit les données de l'écran : composants « personas », « settings » (un par fournisseur), « vehicles », titre, indicateurs active, dirty, discardDirty, applyMode (« none », « apply » ou « restart »), readyToPlay et busy. Ouvre la transaction multiseatConfiguration si besoin. Renvoie nil si l'écran n'est pas ouvert.
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:213
---@return table|nil  Données d'écran.
function ui_multiseat_multiseatSettings.getScreenData() end

--- Fait rejoindre un groupe de périphériques géré par la plateforme.
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:583
---@param groupId integer Identifiant de groupe.
---@return table  {success, data}.
function ui_multiseat_multiseatSettings.joinDeviceGroup(groupId) end

--- Retire un joueur (et son groupe).
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:591
---@param player integer Indice de joueur.
---@return table  {success, data}.
function ui_multiseat_multiseatSettings.leaveDeviceGroup(player) end

--- Déplace un périphérique vers le joueur précédent ou suivant.
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:559
---@param deviceId string Identifiant du périphérique.
---@param direction integer -1 ou 1.
---@return table  {success, data}.
function ui_multiseat_multiseatSettings.moveDevicePlayer(deviceId, direction) end

--- Envoie l'événement UI MultiseatSettingsChanged pour que l'écran se recharge.
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:625
function ui_multiseat_multiseatSettings.notifyScreenChanged() end

--- Hook appelé à la fin du niveau ; réinitialise tout l'état (valeurs, pause, sorties en attente).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:661
function ui_multiseat_multiseatSettings.onClientEndMission() end

--- Hook appelé au déchargement de l'extension ; relâche la demande de pause.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:671
function ui_multiseat_multiseatSettings.onExtensionUnloaded() end

--- Hook appelé quand les participants locaux changent ; notifie l'écran sauf pendant une synchronisation des véhicules.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:629
function ui_multiseat_multiseatSettings.onLocalParticipantsChanged() end

--- Callback d'entrée de la route de réglages : marque l'écran ouvert et met le jeu en pause.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:634
function ui_multiseat_multiseatSettings.onSettingsEnter() end

--- Callback de sortie de la route de réglages : appelle ui_pause_routeLifecycleCallbacks.onPauseLeave puis ferme les réglages si la route visée n'en fait plus partie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:639
---@param context table Contexte de route.
---@param toRoute table Route d'arrivée.
---@param fromRoute table Route de départ.
---@param data any Données de navigation.
function ui_multiseat_multiseatSettings.onSettingsLeave(context, toRoute, fromRoute, data) end

--- Callback d'entrée de la route du sélecteur de véhicule : marque l'écran ouvert, pause le jeu et délègue à ui_gridSelectorRouteLifecycleCallbacks.onRouteEnter.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:644
---@param context table Contexte de route.
---@param toRoute table Route d'arrivée.
---@param fromRoute table Route de départ.
---@param data any Données de navigation.
function ui_multiseat_multiseatSettings.onVehicleSelectorEnter(context, toRoute, fromRoute, data) end

--- Callback de sortie de la route du sélecteur : délègue à gridSelector et pause, prévient multiseatVehicles puis ferme les réglages si la route visée n'en fait plus partie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:654
---@param context table Contexte de route.
---@param toRoute table Route d'arrivée.
---@param fromRoute table Route de départ.
---@param data any Données de navigation.
function ui_multiseat_multiseatSettings.onVehicleSelectorLeave(context, toRoute, fromRoute, data) end

--- Callback de montage de la route du sélecteur ; délègue à ui_gridSelectorRouteLifecycleCallbacks.onRouteMount.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:650
---@param context table Contexte de route.
---@param toRoute table Route d'arrivée.
---@param fromRoute table Route de départ.
---@param data any Données de navigation.
function ui_multiseat_multiseatSettings.onVehicleSelectorMount(context, toRoute, fromRoute, data) end

--- Ouvre le sélecteur de véhicule pour un joueur (délégué à multiseatVehicles).
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:599
---@param player integer Indice de joueur.
---@return any  Résultat de multiseatVehicles.openVehicleSelectorForPlayer.
function ui_multiseat_multiseatSettings.openVehicleSelectorForPlayer(player) end

--- Émet le hook onPlayMultiseatGameSettings ; un mode de jeu peut y démarrer la partie en mettant result.success = true.
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:619
---@return table  {success = boolean}.
function ui_multiseat_multiseatSettings.play() end

--- Oublie un périphérique déconnecté.
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:575
---@param deviceId string Identifiant du périphérique.
---@return table  {success, data}.
function ui_multiseat_multiseatSettings.removeDevice(deviceId) end

--- Affiche une boîte de confirmation pour quitter le multiseat (bouton de confirmation : confirmMultiseatExit). Ne fait rien si le multiseat n'est pas actif.
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:410
---@return boolean  false si le multiseat n'est pas actif.
function ui_multiseat_multiseatSettings.requestMultiseatExit() end

--- Exécute un champ de type « action » ou « actionSelect » via le hook onMultiseatGameSettingAction. Recharge l'écran si l'action a réussi.
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:298
---@param providerId string Identifiant du fournisseur.
---@param fieldId string Identifiant du champ.
---@param value any Option choisie (actionSelect uniquement).
---@return table  {success = boolean, data = données d'écran}.
function ui_multiseat_multiseatSettings.runSettingAction(providerId, fieldId, value) end

--- Assigne un périphérique à une persona donnée.
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:567
---@param deviceId string Identifiant du périphérique.
---@param personaNumber integer|nil Numéro de persona, nil ou 0 pour désassigner.
---@return table  {success, data}.
function ui_multiseat_multiseatSettings.setDevicePlayer(deviceId, personaNumber) end

--- Prépare l'icône d'un joueur.
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:611
---@param player integer Indice de joueur.
---@param icon string Identifiant d'icône (déduit du code).
---@return table  {success, data}.
function ui_multiseat_multiseatSettings.stagePlayerIcon(player, icon) end

--- Prépare l'inscription ou la sortie d'un joueur (via ui_multiseat_multiseatVehicles.stagePlayerOptIn).
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:535
---@param player integer Indice de joueur.
---@param optedIn boolean true pour inscrire.
---@return table  {success, data}.
function ui_multiseat_multiseatSettings.stagePlayerOptIn(player, optedIn) end

--- Prépare les préférences de véhicule d'un joueur.
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:603
---@param player integer Indice de joueur.
---@param preferences table Préférences (déduit du code).
---@return table  {success, data}.
function ui_multiseat_multiseatSettings.stagePlayerVehiclePreferences(player, preferences) end

--- Prépare la valeur d'un champ (normalisée selon ses options) et émet onMultiseatGameSettingChanged. Valeur ou champ invalide : l'écran est simplement renvoyé inchangé.
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:275
---@param providerId string Identifiant du fournisseur.
---@param fieldId string Identifiant du champ.
---@param value any Nouvelle valeur.
---@return table|nil  Données d'écran à jour.
function ui_multiseat_multiseatSettings.stageSetting(providerId, fieldId, value) end

--- Assigne/désassigne un périphérique (délégué à multiseatVehicles).
---Source : lua/ge/extensions/ui/multiseat/multiseatSettings.lua:551
---@param deviceId string Identifiant du périphérique.
---@return table  {success, data}.
function ui_multiseat_multiseatSettings.toggleDevicePlayer(deviceId) end

