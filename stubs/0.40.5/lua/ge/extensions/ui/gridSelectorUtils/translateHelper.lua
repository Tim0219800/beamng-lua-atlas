---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gridSelectorUtils/translateHelper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Lua-side translation helper for the grid selectors. Translates a key with `_tr`, resolves nested Angular-style expressions (`{{ 'key' | translate }}`, `{{ key | translate }}`, `{{key}}`) up to 10 passes, and caches the result per key.
--- Access: extension `ui_gridSelectorUtils_translateHelper`: `extensions.load("ui_gridSelectorUtils_translateHelper")`, then the global `ui_gridSelectorUtils_translateHelper`
---@class ui_gridSelectorUtils_translateHelper
ui_gridSelectorUtils_translateHelper = {}

--- Returns the translation of the key (via _tr, with the key as the default fallback), after resolving nested translations. If the key is not a string, returns it as is, or "Missing Translation Key!" if nil.
---Source: lua/ge/extensions/ui/gridSelectorUtils/translateHelper.lua:85
---@param key string Translation key.
---@param fallback string|nil Fallback text passed to _tr (default: the key).
---@return string  Translated text.
function ui_gridSelectorUtils_translateHelper.translate(key, fallback) end

