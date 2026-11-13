---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/providers/routeData/common.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outils partagés par les fournisseurs routeData du menu pause : navigation par séquence d'états, enregistrement de boutons via ui_pause_actions, confirmation de sortie (niveau ou jeu) adaptée à la carrière, exécution d'une sortie avec sauvegarde préalable, et construction de groupes de rail. Les ids de texte de confirmation sont exposés dans ExitLevelTexts et ExitGameTexts.
--- Accès : extension `ui_pause_providers_routeData_common` : `extensions.load("ui_pause_providers_routeData_common")`, puis la globale `ui_pause_providers_routeData_common`
---@class ui_pause_providers_routeData_common
---@field ExitGameTexts table<string, string> Ids de traduction pour quitter le jeu : default, career, notSaved.
---@field ExitLevelTexts table<string, string> Ids de traduction pour quitter le niveau : default, career, notSaved.
ui_pause_providers_routeData_common = {}

--- Crée un groupe de rail {id, actions}, ou nil si la liste est vide.
---Source : lua/ge/extensions/ui/pause/providers/routeData/common.lua:81
---@param id string Id du groupe.
---@param actions table[]|nil Boutons du groupe.
---@return table|nil  Groupe ou nil.
function ui_pause_providers_routeData_common.asRailGroup(id, actions) end

--- Convertit n'importe quelle valeur en booléen (truthy -> true, sinon false).
---Source : lua/ge/extensions/ui/pause/providers/routeData/common.lua:7
---@param value any Valeur à convertir.
---@return boolean  Booléen.
function ui_pause_providers_routeData_common.bool(value) end

--- Enregistre un bouton de pause : extrait button.callback, copie le reste des métadonnées et appelle ui_pause_actions.registerButton. Sans callback, utilise une fonction qui renvoie false.
---Source : lua/ge/extensions/ui/pause/providers/routeData/common.lua:21
---@param button table|nil Métadonnées du bouton plus callback.
---@return table|nil  Métadonnées enregistrées (avec buttonId) ou nil si button est nil.
function ui_pause_providers_routeData_common.registerPauseButton(button) end

--- Exécute la fonction de sortie ; si payload.saveFirst est vrai, sauvegarde d'abord la carrière via ui_pause_actions.saveCareerThen.
---Source : lua/ge/extensions/ui/pause/providers/routeData/common.lua:72
---@param exitFn function Fonction de sortie (returnToMainMenu, quit…).
---@param payload table|nil Charge utile du bouton (champ lu : saveFirst).
function ui_pause_providers_routeData_common.runExit(exitFn, payload) end

--- Essaie de naviguer vers chaque état via ui_router.navigate (dans un pcall) jusqu'à ce qu'un réussisse (result.result ~= false).
---Source : lua/ge/extensions/ui/pause/providers/routeData/common.lua:11
---@param states string|string[]|nil Nom d'état ou liste d'états à essayer dans l'ordre.
---@return boolean  true si une navigation a réussi.
function ui_pause_providers_routeData_common.tryPushStateSequence(states) end

--- Complète un bouton de sortie avec les champs de confirmation (cancelLabel, confirmText, confirmSince, confirmLabel, altLabel…) selon le mode (carrière ou non) et l'état de sauvegarde.
---Source : lua/ge/extensions/ui/pause/providers/routeData/common.lua:49
---@param button table Métadonnées du bouton, modifiées en place.
---@param context table Contexte pause (champ lu : mode).
---@param texts table ExitLevelTexts ou ExitGameTexts.
---@return table  Le même bouton.
function ui_pause_providers_routeData_common.withExitConfirm(button, context, texts) end

