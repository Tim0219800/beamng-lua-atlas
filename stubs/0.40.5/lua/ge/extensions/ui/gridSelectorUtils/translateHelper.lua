---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gridSelectorUtils/translateHelper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Aide de traduction côté Lua pour les sélecteurs en grille. Traduit une clé avec `_tr`, résout les expressions imbriquées de style Angular (`{{ 'clé' | translate }}`, `{{ clé | translate }}`, `{{clé}}`) jusqu'à 10 passes, et met le résultat en cache par clé.
--- Accès : extension `ui_gridSelectorUtils_translateHelper` : `extensions.load("ui_gridSelectorUtils_translateHelper")`, puis la globale `ui_gridSelectorUtils_translateHelper`
---@class ui_gridSelectorUtils_translateHelper
ui_gridSelectorUtils_translateHelper = {}

--- Renvoie la traduction de la clé (via _tr, avec la clé comme repli par défaut), après résolution des traductions imbriquées. Si la clé n'est pas une chaîne, la renvoie telle quelle ou "Missing Translation Key!" si nil.
---Source : lua/ge/extensions/ui/gridSelectorUtils/translateHelper.lua:85
---@param key string Clé de traduction.
---@param fallback string|nil Texte de repli passé à _tr (défaut : la clé).
---@return string  Texte traduit.
function ui_gridSelectorUtils_translateHelper.translate(key, fallback) end

