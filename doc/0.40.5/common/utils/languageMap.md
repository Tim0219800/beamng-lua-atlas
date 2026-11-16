# `utils_languageMap`

*File: `lua/common/utils/languageMap.lua` · VM: Common (GE + vehicle) · 575 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("utils/languageMap")`

Mapping tables for languages: ISO 3166-1 country codes, ISO 639-1 language codes, and Weblate-specific codes (BeamNG's translation platform). The resolve() function turns a game language code (e.g. 'fr-FR', 'de_at') into a readable English name (e.g. 'French (France)'). Loaded with require('utils/languageMap'). Useful to display a language name in a menu.

## Example

```lua
local lm = require('utils/languageMap')
print(lm.resolve('de-AT'))   -- readable name
print(lm.countries['FR'])
```

## Notes

- The keys of weblateCodes are lowercase only (the file's comment insists on it); resolve lowercases the key and replaces '-' with '_'.
- countries is keyed by UPPERCASE country code, languages by lowercase code.
- If the code is not in weblateCodes, resolve splits it on '_': language (via languages) then optional country in parentheses (via countries). An unknown code is returned as is.
- The function uses the global split() from utils.lua.

## Functions

| Function | Description | Line |
|---|---|---|
| `utils_languageMap.resolve(key)` | Converts a language code to a readable name. Looks in weblateCodes first, otherwise composes 'Language (Country)'. | 544 |

### Parameter details

#### `utils_languageMap.resolve(key)`

Converts a language code to a readable name. Looks in weblateCodes first, otherwise composes 'Language (Country)'.

- `key` (*string*) : Language code, e.g. 'en-US', 'fr_FR', 'de_at'
- **returns**: string Readable name, or the original code if the split fails

## Fields

| Field | Type | Description |
|---|---|---|
| `countries` | table<string, string> | ISO 3166-1: 2-letter uppercase country code -> English name (e.g. ['FR']). |
| `languages` | table<string, string> | ISO 639-1 (and a few 3-letter codes): lowercase language code -> English name. |
| `weblateCodes` | table<string, string> | Weblate codes in lowercase (e.g. 'de_at', 'kokr_com', 'zhhans_com') -> readable name; take priority in resolve. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/utils/languageMap.lua`.*
