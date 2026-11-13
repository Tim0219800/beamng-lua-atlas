---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/actions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Registre des actions du menu pause. Il enregistre des boutons (via ui/gridSelectorUtils/buttonModule) exécutables par id, gère l'enchaînement « sauvegarder la carrière puis exécuter un callback », et maintient les onglets et boutons ajoutés par des mods au menu pause. Un mod peut y déclarer un onglet et des boutons ; le module notifie l'UI par le hook GUI PauseModActionsChanged.
--- Accès : extension `ui_pause_actions` : `extensions.load("ui_pause_actions")`, puis la globale `ui_pause_actions`
---@class ui_pause_actions
ui_pause_actions = {}

--- Efface tous les boutons enregistrés via registerButton et annule le callback de sauvegarde en attente. Ne touche pas aux onglets/boutons de mods.
---Source : lua/ge/extensions/ui/pause/actions.lua:24
function ui_pause_actions.clearActions() end

--- Exécute le bouton enregistré portant cet id.
---Source : lua/ge/extensions/ui/pause/actions.lua:42
---@param buttonId any Id attribué par registerButton.
---@param payload any Données transmises au callback du bouton.
---@return any  Résultat de buttonInstance.executeButton.
function ui_pause_actions.executeAction(buttonId, payload) end

--- Renvoie les infos de tous les boutons enregistrés.
---Source : lua/ge/extensions/ui/pause/actions.lua:50
---@return table  Résultat de buttonInstance.getAllButtonInfos.
function ui_pause_actions.getAllButtonInfos() end

--- Renvoie les onglets de mods non vides, au format attendu par buildPauseTabs (tabId "mod:<id>", isModTab, label, icon, buttons, visible, enabled).
---Source : lua/ge/extensions/ui/pause/actions.lua:194
---@return table[]  Liste d'onglets.
function ui_pause_actions.getVisibleModTabs() end

--- Hook appelé au chargement ; met le mode de déchargement en manuel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/actions.lua:54
function ui_pause_actions.onExtensionLoaded() end

--- Hook appelé quand une sauvegarde de carrière se termine ; exécute le callback en attente de saveCareerThen s'il n'a pas expiré.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/actions.lua:34
function ui_pause_actions.onSaveFinished() end

--- Enregistre un bouton d'action et renvoie une copie des métadonnées avec buttonId. Si metadata.visible == false, rien n'est enregistré et les métadonnées sont renvoyées telles quelles.
---Source : lua/ge/extensions/ui/pause/actions.lua:46
---@param metadata table|nil Description du bouton (nil devient {}).
---@param callback function|nil Fonction appelée à l'exécution ; défaut : fonction renvoyant false.
---@return table  Copie des métadonnées, avec buttonId si enregistré.
function ui_pause_actions.registerButton(metadata, callback) end

--- Ajoute ou met à jour un bouton de mod dans un onglet (déplace le bouton si son tabId change) et notifie l'UI.
---Source : lua/ge/extensions/ui/pause/actions.lua:133
---@param button table Champs : id et tabId (requis), label, icon, componentName, props, card2ComponentName, card2Props.
---@return table  {success = true} ou {success = false, reason = "missing_id_or_tab" | "unknown_tab"}.
function ui_pause_actions.registerModButton(button) end

--- Crée ou met à jour un onglet de mod (conserve l'ordre des boutons existants) et notifie l'UI.
---Source : lua/ge/extensions/ui/pause/actions.lua:102
---@param tab table Champs : id (requis), label (défaut id), icon, card2ComponentName, card2Props.
---@return table  {success = true} ou {success = false, reason = "missing_id"}.
function ui_pause_actions.registerModTab(tab) end

--- Mémorise un callback puis lance career_saveSystem.saveCurrent(). Le callback est appelé dans onSaveFinished s'il n'a pas plus de 30 s.
---Source : lua/ge/extensions/ui/pause/actions.lua:29
---@param callback function Fonction sans argument appelée après la sauvegarde.
function ui_pause_actions.saveCareerThen(callback) end

--- Retire un bouton de mod ; supprime l'onglet "mods" s'il devient vide ; notifie l'UI.
---Source : lua/ge/extensions/ui/pause/actions.lua:173
---@param id string Id du bouton.
---@return table  {success = true} ou {success = false, reason = "not_found"}.
function ui_pause_actions.unregisterModButton(id) end

--- Supprime un onglet de mod et ses boutons, puis notifie l'UI.
---Source : lua/ge/extensions/ui/pause/actions.lua:124
---@param id string Id de l'onglet.
---@return table  {success = true} ou {success = false, reason = "not_found"}.
function ui_pause_actions.unregisterModTab(id) end

