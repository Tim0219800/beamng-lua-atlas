# `ui_gridSelectorUtils_translateHelper`

*File: `lua/ge/extensions/ui/gridSelectorUtils/translateHelper.lua` · VM: Game Engine (GE) · 105 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_gridSelectorUtils_translateHelper`: `extensions.load("ui_gridSelectorUtils_translateHelper")`, then the global `ui_gridSelectorUtils_translateHelper`

Lua-side translation helper for the grid selectors. Translates a key with `_tr`, resolves nested Angular-style expressions (`{{ 'key' | translate }}`, `{{ key | translate }}`, `{{key}}`) up to 10 passes, and caches the result per key.

## Notes

- The cache (translateCache) is never cleared: a language change during the session is not taken into account for keys already translated.
- The cache only considers the key, not the `fallback`: the first fallback used stays.
- The internal flag debugTranslations (false by default) would randomize the first letter of each word; it cannot be changed from outside.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_gridSelectorUtils_translateHelper.translate(key, fallback)` | Returns the translation of the key (via _tr, with the key as the default fallback), after resolving nested translations. If the key is not a string, returns it as is, or "Missing Translation Key!" if nil. | 85 |

### Parameter details

#### `ui_gridSelectorUtils_translateHelper.translate(key, fallback)`

Returns the translation of the key (via _tr, with the key as the default fallback), after resolving nested translations. If the key is not a string, returns it as is, or "Missing Translation Key!" if nil.

- `key` (*string*) : Translation key.
- `fallback` (*string|nil*) : Fallback text passed to _tr (default: the key).
- **returns**: string Translated text.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/gridSelectorUtils/translateHelper.lua`.*
