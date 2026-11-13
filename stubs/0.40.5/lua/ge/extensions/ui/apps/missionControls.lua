---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/apps/missionControls.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère la liste des indications de commandes (« control hints ») affichées par l'app d'interface missionControls pendant une mission. Chaque indication est repérée par une catégorie, ce qui permet d'en ajouter ou retirer une sans toucher aux autres (par exemple depuis un nœud flowgraph). La liste triée par order est envoyée à l'interface via l'événement SetMissionControls.
--- Accès : extension `ui_apps_missionControls` : `extensions.load("ui_apps_missionControls")`, puis la globale `ui_apps_missionControls`
---@class ui_apps_missionControls
ui_apps_missionControls = {}

--- Supprime toutes les indications et envoie SetMissionControlsResetAll à l'interface.
---Source : lua/ge/extensions/ui/apps/missionControls.lua:54
function ui_apps_missionControls.clearControls() end

--- Hook d'initialisation : place l'extension en déchargement manuel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/apps/missionControls.lua:6
function ui_apps_missionControls.onInit() end

--- Renvoie la liste courante à l'interface (utile au montage de l'app).
---Source : lua/ge/extensions/ui/apps/missionControls.lua:59
function ui_apps_missionControls.sendAllData() end

--- Ajoute, met à jour ou supprime (clear=true) une indication, puis renvoie toute la liste à l'interface.
---Source : lua/ge/extensions/ui/apps/missionControls.lua:22
---@param args table {category|action|uiEvent, action=string|nil, uiEvent=string|nil, label=string|nil, order=number|nil (0 par défaut), clear=boolean|nil}.
function ui_apps_missionControls.setControl(args) end

--- Remplace toutes les indications par la liste fournie, puis l'envoie à l'interface.
---Source : lua/ge/extensions/ui/apps/missionControls.lua:40
---@param list table<integer, table>|nil Indications au même format que setControl.
function ui_apps_missionControls.setControls(list) end

