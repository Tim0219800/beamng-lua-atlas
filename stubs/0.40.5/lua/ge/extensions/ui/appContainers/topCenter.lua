---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/appContainers/topCenter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Conteneur d'apps « topCenter » (haut-centre de l'interface : arrowGPS, rally, drift, drag, pointsBar, speedTargetBar, flashMessage, countdown, moveOff ; trigger UI setTopCenterAppVisibility). Il délègue la visibilité à ui_appContainers et ajoute une file de messages flash (événement TopCenterAppsFlashMessage), la gestion du compte à rebours de scénario et la cible de vitesse de la barre speedTargetBar. Un moddeur l'utilise surtout pour afficher un message flash ou une cible de vitesse.
--- Accès : extension `ui_appContainers_topCenter` : `extensions.load("ui_appContainers_topCenter")`, puis la globale `ui_appContainers_topCenter`
---@class ui_appContainers_topCenter
---@field dependencies table<integer, string> { "ui_appContainers", "ui_firstDrive_moveOff" } : chargés avant ce module.
ui_appContainers_topCenter = {}

--- Vide la file, le message courant et le message actif, et cache l'app flashMessage.
---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:183
function ui_appContainers_topCenter.clearAllFlashMessages() end

--- Supprime de la file les messages d'une source donnée (drift, drag…) ; si le message en cours en provient, passe au suivant ou cache flashMessage.
---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:166
---@param source string Nom de la source.
function ui_appContainers_topCenter.clearMessagesFromSource(source) end

--- Oublie la cible de vitesse mémorisée (sans prévenir l'interface).
---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:60
function ui_appContainers_topCenter.clearSpeedTarget() end

--- Utilisé par l'app HUD pour rattraper un message envoyé avant son montage : renvoie le message actif avec le ttl restant, ou nil s'il n'y en a pas ou si l'app flashMessage est cachée.
---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:200
---@return table|nil  {msg, ttl (restant), big}.
function ui_appContainers_topCenter.getActiveFlashMessage() end

--- Passe-plat vers ui_appContainers.getAppVisibility.
---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:27
---@param containerId string Conteneur.
---@param appId string App.
---@return boolean  true si visible.
function ui_appContainers_topCenter.getAppVisibility(containerId, appId) end

--- Renvoie la copie des apps déclarées du conteneur avec leur visibilité.
---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:64
---@param containerId string Conteneur.
---@return table<string, table>  {[appId]={visible=boolean}}.
function ui_appContainers_topCenter.getAvailableApps(containerId) end

--- Alias déprécié de getAvailableApps.
---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:64
---@param containerId string Conteneur.
---@return table<string, table>  Voir getAvailableApps.
function ui_appContainers_topCenter.getAvailableContexts(containerId) end

--- Déprécié : renvoie la première app visible de la liste (l'ordre n'est pas garanti s'il y en a plusieurs).
---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:87
---@param containerId string Conteneur.
---@return string|nil  appId ou nil.
function ui_appContainers_topCenter.getContainerContext(containerId) end

--- Renvoie la dernière cible de vitesse mémorisée.
---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:56
---@return table|nil  Dernière valeur passée à setSpeedTarget.
function ui_appContainers_topCenter.getSpeedTarget() end

--- Liste les apps visibles du conteneur (via ui_appContainers).
---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:47
---@param containerId string Conteneur.
---@return table<integer, string>  Identifiants des apps visibles.
function ui_appContainers_topCenter.getVisibleApps(containerId) end

--- Cache toutes les apps du conteneur (via ui_appContainers).
---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:31
---@param containerId string Conteneur.
function ui_appContainers_topCenter.hideAllApps(containerId) end

--- Cache une app du conteneur.
---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:39
---@param containerId string Conteneur.
---@param appId string App.
function ui_appContainers_topCenter.hideApp(containerId, appId) end

--- Hook de chargement : enregistre le conteneur topCenter et ses neuf apps (toutes cachées au départ).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:267
function ui_appContainers_topCenter.onExtensionLoaded() end

--- Hook de déchargement : vide la file et les messages actifs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:285
function ui_appContainers_topCenter.onExtensionUnloaded() end

--- Hook : message flash de gameplay. Accepte seulement les sources 'drift' et 'drag', et seulement si l'app du même nom est visible ; met alors le message en file et lance le suivant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:206
---@param data table {source='drift'|'drag', data=liste de messages (data[1][2] = durée)}.
function ui_appContainers_topCenter.onGameplayFlashMessage(data) end

--- Hook : message flash de scénario. Affiche flashMessage si la liste n'est pas vide, et countdown si un élément commence par un nombre ou 'ui.scenarios.go' (dans ce dernier cas, masque countdown après le ttl).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:103
---@param data table Liste de messages {texte|nombre, ttl, …}.
function ui_appContainers_topCenter.onScenarioFlashMessage(data) end

--- Hook : cache l'app flashMessage quand le scénario efface ses messages.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:130
function ui_appContainers_topCenter.onScenarioFlashMessageClear() end

--- Hook : cache flashMessage quand aucun scénario ne tourne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:134
function ui_appContainers_topCenter.onScenarioNotRunning() end

--- Hook de frame : décompte le message actif, fait avancer la file de messages, gère le masquage différé du compte à rebours et dessine la fenêtre de debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:229
---@param dtReal number Temps réel écoulé (s).
---@param dtSim number Temps de simulation écoulé (s).
---@param dtRaw number Temps brut (non utilisé).
function ui_appContainers_topCenter.onUpdate(dtReal, dtSim, dtRaw) end

--- Déprécié : équivaut à hideAllApps.
---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:80
---@param containerId string Conteneur.
function ui_appContainers_topCenter.resetContainerContext(containerId) end

--- Passe-plat vers ui_appContainers.setAppVisibility.
---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:23
---@param containerId string Conteneur (normalement 'topCenter').
---@param appId string App.
---@param visible boolean Visibilité.
function ui_appContainers_topCenter.setAppVisibility(containerId, appId, visible) end

--- Déprécié. Cache toutes les apps puis affiche seulement l'app nommée par context (si context est nil, tout est caché).
---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:68
---@param containerId string Conteneur.
---@param context string|nil appId à afficher.
function ui_appContainers_topCenter.setContainerContext(containerId, context) end

--- Active une petite fenêtre ImGui « TopCenter App Containers Debug » (taille de la file, message actif).
---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:95
---@param enabled boolean true pour afficher.
function ui_appContainers_topCenter.setDebug(enabled) end

--- Mémorise la cible de vitesse active et l'envoie à l'interface via guihooks.trigger('TechDriverTrainingSpeedBarTarget', data) pour la barre speedTargetBar.
---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:51
---@param data table Données de la cible, transmises telles quelles à l'interface (structure non définie ici).
function ui_appContainers_topCenter.setSpeedTarget(data) end

--- Active les avertissements de dépréciation et les logs de messages invalides.
---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:99
---@param enabled boolean true pour activer.
function ui_appContainers_topCenter.setVerboseLogging(enabled) end

--- Affiche une app du conteneur.
---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:35
---@param containerId string Conteneur.
---@param appId string App.
function ui_appContainers_topCenter.showApp(containerId, appId) end

--- Affiche un message flash unique, affiche l'app flashMessage et envoie {msg, ttl, big} sur l'événement TopCenterAppsFlashMessage. Le message est mémorisé pendant ttl pour qu'une app montée en retard puisse le récupérer.
---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:191
---@param msg string Texte (ou clé de traduction) du message.
---@param ttl number|nil Durée en secondes, 3 par défaut.
---@param big boolean|nil Affichage en grand.
function ui_appContainers_topCenter.showFlashMessage(msg, ttl, big) end

--- Inverse la visibilité d'une app du conteneur.
---Source : lua/ge/extensions/ui/appContainers/topCenter.lua:43
---@param containerId string Conteneur.
---@param appId string App.
function ui_appContainers_topCenter.toggleApp(containerId, appId) end

