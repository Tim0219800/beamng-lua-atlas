---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/multiseatPlayerMarkers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_multiseatPlayerMarkers` : lit et écrit le réglage 'multiseatTags' qui contrôle l'affichage des marqueurs (étiquettes) de joueurs en multi-joueur local. Trois modes : 'always', 'smart' (défaut) et 'never'. Les anciennes valeurs booléennes sont converties (true devient 'smart', false devient 'never').
--- Accès : extension `core_multiseatPlayerMarkers` : `extensions.load("core_multiseatPlayerMarkers")`, puis la globale `core_multiseatPlayerMarkers`
---@class core_multiseatPlayerMarkers
core_multiseatPlayerMarkers = {}

--- Renvoie le mode courant du réglage multiseatTags (défaut 'smart'), en le normalisant et en corrigeant le réglage si besoin.
---Source : lua/ge/extensions/core/multiseatPlayerMarkers.lua:19
---@return string  'always', 'smart' ou 'never'.
function core_multiseatPlayerMarkers.getMode() end

--- Indique si les marqueurs sont actifs, c'est-à-dire si le mode normalisé n'est pas 'never'.
---Source : lua/ge/extensions/core/multiseatPlayerMarkers.lua:32
---@param mode string|boolean|nil Mode à tester.
---@return boolean  true sauf pour 'never'.
function core_multiseatPlayerMarkers.isEnabled(mode) end

--- Convertit une valeur de réglage en mode valide : true devient 'smart', false devient 'never', 'always'/'smart'/'never' restent, toute autre valeur devient 'smart'.
---Source : lua/ge/extensions/core/multiseatPlayerMarkers.lua:13
---@param mode string|boolean|nil Valeur à normaliser.
---@return string  'always', 'smart' ou 'never'.
function core_multiseatPlayerMarkers.normalize(mode) end

--- Normalise puis enregistre le mode dans le réglage multiseatTags.
---Source : lua/ge/extensions/core/multiseatPlayerMarkers.lua:26
---@param mode string|boolean|nil Mode souhaité.
---@return string  Le mode réellement enregistré.
function core_multiseatPlayerMarkers.setMode(mode) end

