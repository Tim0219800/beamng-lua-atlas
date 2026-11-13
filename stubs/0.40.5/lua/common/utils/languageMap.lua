---@meta
-- tim19Atlas stub generated from lua/common/utils/languageMap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tables de correspondance pour les langues : codes pays ISO 3166-1, codes de langue ISO 639-1, et codes spécifiques de Weblate (la plateforme de traduction de BeamNG). La fonction resolve() transforme un code de langue du jeu (ex. 'fr-FR', 'de_at') en nom lisible en anglais (ex. 'French (France)'). Se charge avec require('utils/languageMap'). Utile pour afficher le nom d'une langue dans un menu.
--- Accès : `require("utils/languageMap")`
---@class utils_languageMap
---@field countries table<string, string> ISO 3166-1 : code pays à 2 lettres majuscules -> nom anglais (ex. ['FR']).
---@field languages table<string, string> ISO 639-1 (et quelques codes à 3 lettres) : code langue minuscule -> nom anglais.
---@field weblateCodes table<string, string> Codes Weblate en minuscules (ex. 'de_at', 'kokr_com', 'zhhans_com') -> nom lisible ; prioritaires dans resolve.
local utils_languageMap = {}

--- Convertit un code de langue en nom lisible. Cherche d'abord dans weblateCodes, sinon compose 'Langue (Pays)'.
---Source : lua/common/utils/languageMap.lua:544
---@param key string Code de langue, ex. 'en-US', 'fr_FR', 'de_at'
---@return string  Nom lisible, ou le code d'origine si le découpage échoue
function utils_languageMap.resolve(key) end

return utils_languageMap
