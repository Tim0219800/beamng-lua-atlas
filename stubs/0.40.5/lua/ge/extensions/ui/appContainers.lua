---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/appContainers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Registre générique des « conteneurs » d'apps d'interface (topLeft, topCenter, topRight) et de la visibilité de chaque app. Les extensions topLeft/topCenter/topRight s'enregistrent avec registerContainer ; ce module garde l'état visible/caché de chaque app et prévient l'interface Vue via guihooks.trigger sur le trigger du conteneur. Il sauvegarde et restaure la visibilité via onSerialize/onDeserialize (rechargement Lua) et propose une fenêtre ImGui de debug.
--- Accès : extension `ui_appContainers` : `extensions.load("ui_appContainers")`, puis la globale `ui_appContainers`
---@class ui_appContainers
ui_appContainers = {}

--- Renvoie la visibilité actuelle d'une app (false si conteneur ou app inconnus).
---Source : lua/ge/extensions/ui/appContainers.lua:78
---@param containerId string Identifiant du conteneur.
---@param appId string Identifiant de l'app.
---@return boolean  true si visible.
function ui_appContainers.getAppVisibility(containerId, appId) end

--- Renvoie une copie de la table des apps d'un conteneur sous la forme {[appId]={visible=boolean}}.
---Source : lua/ge/extensions/ui/appContainers.lua:142
---@param containerId string Conteneur.
---@return table<string, table>  Copie des apps ; vide si conteneur inconnu.
function ui_appContainers.getAvailableApps(containerId) end

--- Liste les identifiants des apps visibles d'un conteneur (ordre non garanti, itération pairs).
---Source : lua/ge/extensions/ui/appContainers.lua:125
---@param containerId string Conteneur.
---@return table<integer, string>  Tableau d'appId ; vide si conteneur inconnu.
function ui_appContainers.getVisibleApps(containerId) end

--- Cache toutes les apps d'un conteneur, envoie {hideAll=true, allApps} à l'interface puis émet le hook onUIContainerAppsHidden(containerId résolu).
---Source : lua/ge/extensions/ui/appContainers.lua:94
---@param containerId string Identifiant du conteneur.
function ui_appContainers.hideAllApps(containerId) end

--- Raccourci pour setAppVisibility(containerId, appId, false).
---Source : lua/ge/extensions/ui/appContainers.lua:117
---@param containerId string Conteneur.
---@param appId string App.
function ui_appContainers.hideApp(containerId, appId) end

--- Hook de restauration après rechargement : réapplique la visibilité sauvegardée via setAppVisibility (accepte les anciens identifiants).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/appContainers.lua:163
---@param data table Table produite par onSerialize.
function ui_appContainers.onDeserialize(data) end

--- Hook de chargement de l'extension ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/appContainers.lua:186
function ui_appContainers.onExtensionLoaded() end

--- Hook de déchargement : vide la table des conteneurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/appContainers.lua:189
function ui_appContainers.onExtensionUnloaded() end

--- Hook de sérialisation (rechargement des extensions) : renvoie {[containerId]={[appId]=visible}}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/appContainers.lua:152
---@return table  Visibilité de toutes les apps.
function ui_appContainers.onSerialize() end

--- Appelé à chaque frame par le système d'extensions ; dessine la fenêtre ImGui de debug uniquement si setDebug(true).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/appContainers.lua:193
function ui_appContainers.onUpdate() end

--- Enregistre un nouveau conteneur. Exige config.id ; refuse (avec avertissement) un identifiant déjà enregistré. Copie la table apps (visible forcé en booléen).
---Source : lua/ge/extensions/ui/appContainers.lua:35
---@param config table {id=string, trigger=string (nom du guihook), debugLabel=string|nil, apps={[appId]={visible=boolean}}}.
---@return boolean  true si enregistré, false sinon.
function ui_appContainers.registerContainer(config) end

--- Convertit un ancien identifiant de conteneur (utilityApps, gameplayApps, secondaryApps) en identifiant actuel ; renvoie l'argument tel quel sinon.
---Source : lua/ge/extensions/ui/appContainers.lua:18
---@param containerId string Identifiant de conteneur, ancien ou nouveau.
---@return string  Identifiant actuel.
function ui_appContainers.resolveContainerId(containerId) end

--- Affiche ou cache une app d'un conteneur et envoie {appId, visible, allApps} à l'interface via le trigger du conteneur.
---Source : lua/ge/extensions/ui/appContainers.lua:56
---@param containerId string Identifiant du conteneur.
---@param appId string Identifiant de l'app (doit être déclaré dans le conteneur).
---@param visible boolean Nouvelle visibilité.
function ui_appContainers.setAppVisibility(containerId, appId, visible) end

--- Active ou désactive la fenêtre ImGui « App Containers Debug » (boutons Show/Hide par app, Hide All, Show All).
---Source : lua/ge/extensions/ui/appContainers.lua:178
---@param enabled boolean true pour afficher la fenêtre.
function ui_appContainers.setDebug(enabled) end

--- Sans effet réel : renvoie enabled converti en booléen.
---Source : lua/ge/extensions/ui/appContainers.lua:182
---@param enabled boolean Ignoré.
---@return boolean  enabled en booléen.
function ui_appContainers.setVerboseLogging(enabled) end

--- Raccourci pour setAppVisibility(containerId, appId, true).
---Source : lua/ge/extensions/ui/appContainers.lua:113
---@param containerId string Conteneur.
---@param appId string App.
function ui_appContainers.showApp(containerId, appId) end

--- Inverse la visibilité d'une app.
---Source : lua/ge/extensions/ui/appContainers.lua:121
---@param containerId string Conteneur.
---@param appId string App.
function ui_appContainers.toggleApp(containerId, appId) end

