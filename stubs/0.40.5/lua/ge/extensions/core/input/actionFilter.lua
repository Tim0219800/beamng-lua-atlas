---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/input/actionFilter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_input_actionFilter` : bloque ou autorise des actions d'entrée par « filtre » nommé (ex. scénario, mode compétitif). Gère des groupes d'actions, des modèles d'actions prédéfinis (téléportation, menus véhicule, caméras, triche…) et des masques de joueurs par ActionMap (pour le split-screen). Un moddeur l'utilise pour désactiver temporairement des touches (reset, menus, caméra libre) pendant une activité.
--- Accès : extension `core_input_actionFilter` : `extensions.load("core_input_actionFilter")`, puis la globale `core_input_actionFilter`
---@class core_input_actionFilter
core_input_actionFilter = {}

--- Ajoute (ou retire si filtered = false) une action ou un groupe au filtre, puis reconstruit entièrement ce filtre côté C++ et émet onActionFilterUpdated.
---Source : lua/ge/extensions/core/input/actionFilter.lua:96
---@param filter string Nom du filtre.
---@param actionName string Nom d'action, ou nom d'un groupe défini par setGroup.
---@param filtered boolean true = bloquer, false/nil = ne plus bloquer.
function core_input_actionFilter.addAction(filter, actionName, filtered) end

--- Supprime tous les blocages d'un filtre (ActionMap.clearFilters). N'émet pas onActionFilterUpdated.
---Source : lua/ge/extensions/core/input/actionFilter.lua:102
---@param filter string Nom du filtre.
function core_input_actionFilter.clear(filter) end

--- Retire le masque d'un propriétaire pour une ActionMap et réapplique.
---Source : lua/ge/extensions/core/input/actionFilter.lua:146
---@param owner string Propriétaire.
---@param mapName string Nom de l'ActionMap.
function core_input_actionFilter.clearActionMapPlayerMask(owner, mapName) end

--- Retire tous les masques d'un propriétaire sur toutes les ActionMap.
---Source : lua/ge/extensions/core/input/actionFilter.lua:155
---@param owner string Propriétaire.
function core_input_actionFilter.clearActionMapPlayerMasks(owner) end

--- Fabrique une liste d'actions à partir de modèles existants. Voir notes : les noms des paramètres facultatifs sont inversés par rapport à leur effet.
---Source : lua/ge/extensions/core/input/actionFilter.lua:13
---@param templateNames string[] Noms de modèles à concaténer.
---@param actionWhitelist string[]|nil Si fourni : actions à EXCLURE des modèles (déduit du code).
---@param actionBlackList string[]|nil Actions ajoutées à la fin du résultat.
---@return string[]  Liste d'actions.
function core_input_actionFilter.createActionTemplate(templateNames, actionWhitelist, actionBlackList) end

--- Renvoie la table des modèles d'actions (clé = nom du modèle, valeur = liste d'actions).
---Source : lua/ge/extensions/core/input/actionFilter.lua:212
---@return table<string, string[]>  Modèles.
function core_input_actionFilter.getActionTemplates() end

--- Debug : table filtre -> {action = true} des actions réellement bloquées côté C++.
---Source : lua/ge/extensions/core/input/actionFilter.lua:216
---@return table<string, table<string, boolean>>  Blocages.
function core_input_actionFilter.getBlockedActions() end

--- Renvoie la liste d'un groupe.
---Source : lua/ge/extensions/core/input/actionFilter.lua:111
---@param name string Nom du groupe.
---@return string[]|nil  Actions du groupe.
function core_input_actionFilter.getGroup(name) end

--- Indique si une action est bloquée par au moins un filtre.
---Source : lua/ge/extensions/core/input/actionFilter.lua:115
---@param actionName string Nom d'action (pas un groupe).
---@return boolean|nil  true si bloquée, sinon nil.
function core_input_actionFilter.isActionBlocked(actionName) end

--- Hook de restauration : recharge les données sauvegardées et réapplique les masques de joueurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/input/actionFilter.lua:190
---@param v table Table renvoyée par onSerialize.
function core_input_actionFilter.onDeserialized(v) end

--- Hook de déchargement de l'extension : remet playerMask à -1 sur les ActionMap touchées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/input/actionFilter.lua:205
function core_input_actionFilter.onExtensionUnloaded() end

--- Hook appelé quand les bindings changent : réapplique les masques de joueurs (les ActionMap ont pu être recréées).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/input/actionFilter.lua:199
function core_input_actionFilter.onInputBindingsChanged() end

--- Hook de sauvegarde avant rechargement : renvoie groupes, blocages et masques.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/input/actionFilter.lua:182
---@return table  {actionGroups, blockedActionGroups, actionMapPlayerMasks}.
function core_input_actionFilter.onSerialize() end

--- Bloque ou débloque un joueur (un bit) dans le masque d'un propriétaire pour une ActionMap.
---Source : lua/ge/extensions/core/input/actionFilter.lua:168
---@param owner string Propriétaire.
---@param mapName string Nom de l'ActionMap.
---@param player integer Indice du joueur (0, 1…).
---@param blocked boolean true = retire le bit du joueur, false = le remet.
---@return boolean  false si arguments invalides.
function core_input_actionFilter.setActionMapPlayerBlocked(owner, mapName, player, blocked) end

--- Définit le masque de joueurs autorisés d'une ActionMap pour un propriétaire et applique le ET de tous les masques à actionMap.playerMask.
---Source : lua/ge/extensions/core/input/actionFilter.lua:137
---@param owner string Nom du propriétaire du masque.
---@param mapName string Nom de l'ActionMap (suffixe 'ActionMap' ajouté si absent).
---@param playerMask integer Masque binaire (bit n = joueur n), -1 = tous.
---@return boolean  false si un argument est invalide.
function core_input_actionFilter.setActionMapPlayerMask(owner, mapName, playerMask) end

--- Définit un groupe d'actions nommé, utilisable ensuite dans addAction.
---Source : lua/ge/extensions/core/input/actionFilter.lua:107
---@param name string Nom du groupe.
---@param arrayValues string[] Noms d'actions du groupe.
function core_input_actionFilter.setGroup(name, arrayValues) end

