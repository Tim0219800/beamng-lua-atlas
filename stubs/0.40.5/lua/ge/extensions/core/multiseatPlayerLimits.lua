---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/multiseatPlayerLimits.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_multiseatPlayerLimits` : calcule les limites du nombre de joueurs en multi-joueur local (multiseat). Deux sources : la limite 'douce' (recommandation matériel ou niveau, champ multiseat.maxPlayers du info.json du niveau, 4 par défaut via core_levels) et la limite 'dure' du mode de jeu multiseat en cours (gameplay_multiseat_gamemodeManager). Elle renvoie un état prêt pour l'interface : limite, atteinte, dépassée, avertissement.
--- Accès : extension `core_multiseatPlayerLimits` : `extensions.load("core_multiseatPlayerLimits")`, puis la globale `core_multiseatPlayerLimits`
---@class core_multiseatPlayerLimits
core_multiseatPlayerLimits = {}

--- Renvoie le nombre maximal de joueurs recommandé par le niveau courant (level.multiseat.maxPlayers).
---Source : lua/ge/extensions/core/multiseatPlayerLimits.lua:17
---@return integer|nil  Limite, ou nil si aucun niveau ou valeur invalide.
function core_multiseatPlayerLimits.getCurrentLevelLimit() end

--- Raccourci : getState avec la limite du niveau courant et la limite du mode courant.
---Source : lua/ge/extensions/core/multiseatPlayerLimits.lua:51
---@param playerCount number Nombre de joueurs actuel.
---@param softIsHard boolean|nil Voir getState.
---@return table  Même structure que getState.
function core_multiseatPlayerLimits.getCurrentLevelState(playerCount, softIsHard) end

--- Renvoie le nombre maximal de joueurs du mode de jeu multiseat actif (gameplay_multiseat_gamemodeManager.getMaxPlayers) : limite dure sur toutes les plateformes.
---Source : lua/ge/extensions/core/multiseatPlayerLimits.lua:24
---@return integer|nil  Limite, ou nil.
function core_multiseatPlayerLimits.getCurrentModeLimit() end

--- Calcule l'état des limites de joueurs. La limite effective est celle du mode, abaissée par la limite douce si softIsHard (ou menu simple), sinon la limite douce seule si aucune limite de mode.
---Source : lua/ge/extensions/core/multiseatPlayerLimits.lua:31
---@param softLimit number|nil Limite recommandée (matériel ou niveau).
---@param playerCount number Nombre de joueurs actuel (négatif ou invalide devient 0).
---@param modeLimit number|nil Limite du mode de jeu.
---@param softIsHard boolean|nil Si vrai, la limite douce est aussi imposée.
---@return table  { limit = integer|nil, hard = boolean, atLimit = boolean, exceeded = boolean, warning = table|nil }
function core_multiseatPlayerLimits.getState(softLimit, playerCount, modeLimit, softIsHard) end

--- Indique si l'interface est en mode de menu simplifié (plateformes console/Steam Deck, selon Engine.UI.isSimpleMenu).
---Source : lua/ge/extensions/core/multiseatPlayerLimits.lua:13
---@return boolean  true si menu simple.
function core_multiseatPlayerLimits.isSimpleMenu() end

