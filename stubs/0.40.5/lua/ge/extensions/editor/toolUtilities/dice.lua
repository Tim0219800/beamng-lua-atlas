---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/dice.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tirage pseudo-aléatoire déterministe pour les outils de l'éditeur : à partir d'une graine (seed), d'un sel (salt) qui distingue plusieurs décisions à une même adresse, et de jusqu'à cinq nombres (a à e) qui disent « où » (volume, étage, index de pièce…), renvoie toujours la même valeur. Utile pour des variations reproductibles (jitter) sans état.
--- Accès : extension `editor_toolUtilities_dice` : `extensions.load("editor_toolUtilities_dice")`, puis la globale `editor_toolUtilities_dice`
---@class editor_toolUtilities_dice
editor_toolUtilities_dice = {}

--- Tirage déterministe dans [0,1) pour l'adresse (seed, salt, a..e).
---Source : lua/ge/extensions/editor/toolUtilities/dice.lua:12
---@param seed number|nil Graine
---@param salt number|nil Sel distinguant les décisions d'une même adresse
---@param a number|nil Composante d'adresse 1
---@param b number|nil Composante d'adresse 2
---@param c number|nil Composante d'adresse 3
---@param d number|nil Composante d'adresse 4
---@param e number|nil Composante d'adresse 5
---@return number  Valeur dans [0,1).
function editor_toolUtilities_dice.roll(seed, salt, a, b, c, d, e) end

--- Même tirage que roll, ramené à l'intervalle -1..1 (écart dans un sens ou l'autre, pratique pour un jitter).
---Source : lua/ge/extensions/editor/toolUtilities/dice.lua:24
---@param seed number|nil Graine
---@param salt number|nil Sel
---@param a number|nil Composante d'adresse 1
---@param b number|nil Composante d'adresse 2
---@param c number|nil Composante d'adresse 3
---@param d number|nil Composante d'adresse 4
---@param e number|nil Composante d'adresse 5
---@return number  Valeur dans [-1,1).
function editor_toolUtilities_dice.spread(seed, salt, a, b, c, d, e) end

