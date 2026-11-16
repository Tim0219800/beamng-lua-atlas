# `core_locales`

*File: `lua/ge/extensions/core/locales.lua` · VM: Game Engine (GE) · 478 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_locales`: `extensions.load("core_locales")`, then the global `core_locales`

GE extension `core_locales`: translation of texts on the Lua side. It loads the *.translation(s).json files from the /locales/translations/<language>/ folder (English en-US is always loaded as the fallback language), translates keys like 'ui.radialmenu2.Save', handles nested sub-translations ({{ 'key' | translate }}), context variables, and the separator between number and unit (according to /locales/unit_spacing_policies.json). A modder uses it to display translated texts; the global alias `_tr` points to translate.

## Example

```lua
local txt = core_locales.translate('ui.common.default', 'Default')
local t2 = core_locales.contextTranslate('ui.some.key', { name = 'Bob' })
local s = core_locales.withUnit('120', 'km/h')
```

## Notes

- On load (onExtensionLoaded), the module loads English (en-US), defines the global `_tr = translate` and calls dump(parseArgs): this dump is leftover debugging that writes the startup arguments to the log.
- Search order for a key: current language (all its files, in alphabetical order), then en-US, then the fallback parameter, then the key itself. translate caches the result (clearTranslateCache empties it, which a language change and the reloading of the files also do).
- For a given language id, getLocale merges the files from last to first: files whose name is alphabetically earlier win. If no *.translation.json / *.translations.json file is found, the old file <id>/<id>.json is used.
- The 'scramble debug' mode (startup argument translationScrambleDebug or setScrambleTranslationDebugEnabled) replaces the first letters of each word with random letters and adds '✓', to spot untranslated texts. It is kept across a Lua reload. Texts already cached on the Lua side require a Lua reload to be updated.
- The old variable names {{ name }} in contextTranslate: the ' | translate' and ' | contextTranslate' filters are removed, a name between apostrophes is translated as a key if it is not in varsTable; a missing variable gives an empty string.
- translateWithOrWithoutContext accepts a string (key) or a table { txt, prefix, ctx|context } and returns '' if data is nil/false. With prefix, the key prefix..txt is tried first.
- The available languages are the subfolders of /locales/translations/. The current language comes from Lua:getSelectedLanguage() (user setting), otherwise en-US.
- Minor inconsistency: onUpdate and reloadChangedFiles use a 0.1 s delay (real time) to group translation file changes (hot reload).

## Functions

| Function | Description | Line |
|---|---|---|
| `core_locales.clearTranslateCache()` | Clears the translation cache. | 330 |
| `core_locales.contextTranslate(key, varsTable)` | Translates a key containing variables {{name}} and replaces them with the values of varsTable (themselves translated). A table value { txt, prefix, ctx\|context } is translated recursively. | 151 |
| `core_locales.getAvailableLanguages()` | Lists the available languages (subfolders of /locales/translations/), sorted by key. | 274 |
| `core_locales.getLanguage()` | Returns the current language: the stored one, otherwise that of the user setting, otherwise en-US. | 292 |
| `core_locales.getLocale(id)` | Returns all the translations of a language merged into a single table key -> text (loads the language if needed). | 260 |
| `core_locales.getScrambleTranslationDebugEnabled()` | Indicates whether the translation 'scramble' debug mode is active. | 334 |
| `core_locales.getUnitSeparator(unit, locale)` | Returns the separator to put between a number and its unit according to the language's policy: space, non-breaking space (U+00A0) or nothing. | 319 |
| `core_locales.onDeserialized(data)` | After a Lua reload: restores the scramble mode. *(internal)* *(hook)* | 472 |
| `core_locales.onExtensionLoaded()` | Load hook: reads the startup argument translationScrambleDebug, loads en-US and defines the global _tr. *(internal)* *(hook)* | 351 |
| `core_locales.onFilesChanged(files)` | File change hook: invalidates the unit policies if their file changes, and schedules (0.1 s delay) the reload of the modified .json files of /locales/translations/. *(internal)* *(hook)* | 399 |
| `core_locales.onSerialize()` | Before a Lua reload: stores the scramble mode state. *(internal)* *(hook)* | 467 |
| `core_locales.onSettingsChanged()` | Hook called when the settings change: loads the new language; if it changed, clears the cache and emits the onLanguageChanged hook. *(internal)* *(hook)* | 423 |
| `core_locales.onUpdate(_, _, dtRaw)` | Per-frame hook: counts down the hot reload delay of the translation files then reloads them (emits onReloadLocales and onTranslationsReloaded). *(internal)* *(hook)* | 412 |
| `core_locales.selfTest(lang)` | Internal test tool: runs extensions.test_locales_run.run(lang) if the test file exists, then unloads it. | 433 |
| `core_locales.setScrambleTranslationDebugEnabled(enabled)` | Enables or disables the scramble mode, clears the cache and notifies the interface (onTranslationsReloaded). | 338 |
| `core_locales.translate(key, fallback)` | Translates a key in the current language (with en-US fallback), resolves nested translations and caches the result. | 120 |
| `core_locales.translateWithOrWithoutContext(data)` | Translates a string or a table { txt, prefix, ctx\|context } by choosing the right function. | 182 |
| `core_locales.translateWithPrefixFallback(name, prefix)` | Tries the key prefix..name; if it does not exist (empty result), translates name alone. | 143 |
| `core_locales.withUnit(formattedValue, unit, locale)` | Joins an already formatted value and its unit with the right separator. | 326 |

### Parameter details

#### `core_locales.contextTranslate(key, varsTable)`

Translates a key containing variables {{name}} and replaces them with the values of varsTable (themselves translated). A table value { txt, prefix, ctx|context } is translated recursively.

- `key` (*string*) : Translation key.
- `varsTable` (*table|nil*) : Variables name -> value.
- **returns**: string Translated text with variables.

#### `core_locales.getAvailableLanguages()`

Lists the available languages (subfolders of /locales/translations/), sorted by key.

- **returns**: table[] Elements { key, path }.

#### `core_locales.getLanguage()`

Returns the current language: the stored one, otherwise that of the user setting, otherwise en-US.

- **returns**: string Language identifier.

#### `core_locales.getLocale(id)`

Returns all the translations of a language merged into a single table key -> text (loads the language if needed).

- `id` (*string*) : Language identifier, e.g. 'fr-FR'.
- **returns**: table<string, string> Merged table; {} if id is not a string.

#### `core_locales.getScrambleTranslationDebugEnabled()`

Indicates whether the translation 'scramble' debug mode is active.

- **returns**: boolean true if active.

#### `core_locales.getUnitSeparator(unit, locale)`

Returns the separator to put between a number and its unit according to the language's policy: space, non-breaking space (U+00A0) or nothing.

- `unit` (*string*) : Unit, e.g. 'km/h'.
- `locale` (*string|nil*) : Language; default the current language.
- **returns**: string ' ', non-breaking space or ''.

#### `core_locales.onDeserialized(data)`

After a Lua reload: restores the scramble mode.

- `data` (*table|nil*) : Table returned by onSerialize.

#### `core_locales.onFilesChanged(files)`

File change hook: invalidates the unit policies if their file changes, and schedules (0.1 s delay) the reload of the modified .json files of /locales/translations/.

- `files` (*table[]*) : Elements with a filename field.

#### `core_locales.onSerialize()`

Before a Lua reload: stores the scramble mode state.

- **returns**: table { scrambleTranslationDebugEnabled }

#### `core_locales.onUpdate(_, _, dtRaw)`

Per-frame hook: counts down the hot reload delay of the translation files then reloads them (emits onReloadLocales and onTranslationsReloaded).

- `_` (*number*) : dtReal, unused.
- `_` (*number*) : dtReal, unused.
- `dtRaw` (*number*) : Raw elapsed time in seconds.

#### `core_locales.selfTest(lang)`

Internal test tool: runs extensions.test_locales_run.run(lang) if the test file exists, then unloads it.

- `lang` (*string|boolean|nil*) : Language to test, or true for all; nil does nothing.
- **returns**: any Test result, nil on failure or if the test is absent.

#### `core_locales.setScrambleTranslationDebugEnabled(enabled)`

Enables or disables the scramble mode, clears the cache and notifies the interface (onTranslationsReloaded).

- `enabled` (*boolean*) : true to enable (any other value disables).
- **returns**: boolean New state.

#### `core_locales.translate(key, fallback)`

Translates a key in the current language (with en-US fallback), resolves nested translations and caches the result.

- `key` (*string*) : Translation key. A non-string value is returned as is (or 'Missing Translation Key!' if nil).
- `fallback` (*string|nil*) : Text returned if the key is not found (otherwise the key).
- **returns**: string Translated text.

#### `core_locales.translateWithOrWithoutContext(data)`

Translates a string or a table { txt, prefix, ctx|context } by choosing the right function.

- `data` (*string|table|nil*) : Key or description table.
- **returns**: string Translated text, '' if data is empty.

#### `core_locales.translateWithPrefixFallback(name, prefix)`

Tries the key prefix..name; if it does not exist (empty result), translates name alone.

- `name` (*string*) : Base key.
- `prefix` (*string|nil*) : Prefix to try first.
- **returns**: string Translated text.

#### `core_locales.withUnit(formattedValue, unit, locale)`

Joins an already formatted value and its unit with the right separator.

- `formattedValue` (*string*) : Formatted number.
- `unit` (*string*) : Unit.
- `locale` (*string|nil*) : Language; default the current language.
- **returns**: string Value + separator + unit.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onLanguageChanged` — listened to by 9 module(s)
- `onReloadLocales` — listened to by 2 module(s)

**UI events (guihooks.trigger):** `onTranslationsReloaded`

## Calls into the engine (C++)

- `FS:` `directoryExists`, `directoryList`, `fileExists`, `findFiles`
- `Lua:` `getSelectedLanguage`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/locales.lua`.*
