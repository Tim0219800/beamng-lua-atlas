---@meta
-- tim19Atlas stub generated from lua/common/utils/languageMap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mapping tables for languages: ISO 3166-1 country codes, ISO 639-1 language codes, and Weblate-specific codes (BeamNG's translation platform). The resolve() function turns a game language code (e.g. 'fr-FR', 'de_at') into a readable English name (e.g. 'French (France)'). Loaded with require('utils/languageMap'). Useful to display a language name in a menu.
--- Access: `require("utils/languageMap")`
---@class utils_languageMap
---@field countries table<string, string> ISO 3166-1: 2-letter uppercase country code -> English name (e.g. ['FR']).
---@field languages table<string, string> ISO 639-1 (and a few 3-letter codes): lowercase language code -> English name.
---@field weblateCodes table<string, string> Weblate codes in lowercase (e.g. 'de_at', 'kokr_com', 'zhhans_com') -> readable name; take priority in resolve.
local utils_languageMap = {}

--- Converts a language code to a readable name. Looks in weblateCodes first, otherwise composes 'Language (Country)'.
---Source: lua/common/utils/languageMap.lua:544
---@param key string Language code, e.g. 'en-US', 'fr_FR', 'de_at'
---@return string  Readable name, or the original code if the split fails
function utils_languageMap.resolve(key) end

return utils_languageMap
