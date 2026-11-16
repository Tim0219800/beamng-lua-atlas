---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/locales.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_locales`: translation of texts on the Lua side. It loads the *.translation(s).json files from the /locales/translations/<language>/ folder (English en-US is always loaded as the fallback language), translates keys like 'ui.radialmenu2.Save', handles nested sub-translations ({{ 'key' | translate }}), context variables, and the separator between number and unit (according to /locales/unit_spacing_policies.json). A modder uses it to display translated texts; the global alias `_tr` points to translate.
--- Access: extension `core_locales`: `extensions.load("core_locales")`, then the global `core_locales`
---@class core_locales
core_locales = {}

--- Clears the translation cache.
---Source: lua/ge/extensions/core/locales.lua:330
function core_locales.clearTranslateCache() end

--- Translates a key containing variables {{name}} and replaces them with the values of varsTable (themselves translated). A table value { txt, prefix, ctx|context } is translated recursively.
---Source: lua/ge/extensions/core/locales.lua:151
---@param key string Translation key.
---@param varsTable table|nil Variables name -> value.
---@return string  Translated text with variables.
function core_locales.contextTranslate(key, varsTable) end

--- Lists the available languages (subfolders of /locales/translations/), sorted by key.
---Source: lua/ge/extensions/core/locales.lua:274
---@return table[]  Elements { key, path }.
function core_locales.getAvailableLanguages() end

--- Returns the current language: the stored one, otherwise that of the user setting, otherwise en-US.
---Source: lua/ge/extensions/core/locales.lua:292
---@return string  Language identifier.
function core_locales.getLanguage() end

--- Returns all the translations of a language merged into a single table key -> text (loads the language if needed).
---Source: lua/ge/extensions/core/locales.lua:260
---@param id string Language identifier, e.g. 'fr-FR'.
---@return table<string, string>  Merged table; {} if id is not a string.
function core_locales.getLocale(id) end

--- Indicates whether the translation 'scramble' debug mode is active.
---Source: lua/ge/extensions/core/locales.lua:334
---@return boolean  true if active.
function core_locales.getScrambleTranslationDebugEnabled() end

--- Returns the separator to put between a number and its unit according to the language's policy: space, non-breaking space (U+00A0) or nothing.
---Source: lua/ge/extensions/core/locales.lua:319
---@param unit string Unit, e.g. 'km/h'.
---@param locale string|nil Language; default the current language.
---@return string  ' ', non-breaking space or ''.
function core_locales.getUnitSeparator(unit, locale) end

--- After a Lua reload: restores the scramble mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/locales.lua:472
---@param data table|nil Table returned by onSerialize.
function core_locales.onDeserialized(data) end

--- Load hook: reads the startup argument translationScrambleDebug, loads en-US and defines the global _tr.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/locales.lua:351
function core_locales.onExtensionLoaded() end

--- File change hook: invalidates the unit policies if their file changes, and schedules (0.1 s delay) the reload of the modified .json files of /locales/translations/.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/locales.lua:399
---@param files table[] Elements with a filename field.
function core_locales.onFilesChanged(files) end

--- Before a Lua reload: stores the scramble mode state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/locales.lua:467
---@return table  { scrambleTranslationDebugEnabled }
function core_locales.onSerialize() end

--- Hook called when the settings change: loads the new language; if it changed, clears the cache and emits the onLanguageChanged hook.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/locales.lua:423
function core_locales.onSettingsChanged() end

--- Per-frame hook: counts down the hot reload delay of the translation files then reloads them (emits onReloadLocales and onTranslationsReloaded).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/locales.lua:412
---@param _ number dtReal, unused.
---@param _ number dtReal, unused.
---@param dtRaw number Raw elapsed time in seconds.
function core_locales.onUpdate(_, _, dtRaw) end

--- Internal test tool: runs extensions.test_locales_run.run(lang) if the test file exists, then unloads it.
---Source: lua/ge/extensions/core/locales.lua:433
---@param lang string|boolean|nil Language to test, or true for all; nil does nothing.
---@return any  Test result, nil on failure or if the test is absent.
function core_locales.selfTest(lang) end

--- Enables or disables the scramble mode, clears the cache and notifies the interface (onTranslationsReloaded).
---Source: lua/ge/extensions/core/locales.lua:338
---@param enabled boolean true to enable (any other value disables).
---@return boolean  New state.
function core_locales.setScrambleTranslationDebugEnabled(enabled) end

--- Translates a key in the current language (with en-US fallback), resolves nested translations and caches the result.
---Source: lua/ge/extensions/core/locales.lua:120
---@param key string Translation key. A non-string value is returned as is (or 'Missing Translation Key!' if nil).
---@param fallback string|nil Text returned if the key is not found (otherwise the key).
---@return string  Translated text.
function core_locales.translate(key, fallback) end

--- Translates a string or a table { txt, prefix, ctx|context } by choosing the right function.
---Source: lua/ge/extensions/core/locales.lua:182
---@param data string|table|nil Key or description table.
---@return string  Translated text, '' if data is empty.
function core_locales.translateWithOrWithoutContext(data) end

--- Tries the key prefix..name; if it does not exist (empty result), translates name alone.
---Source: lua/ge/extensions/core/locales.lua:143
---@param name string Base key.
---@param prefix string|nil Prefix to try first.
---@return string  Translated text.
function core_locales.translateWithPrefixFallback(name, prefix) end

--- Joins an already formatted value and its unit with the right separator.
---Source: lua/ge/extensions/core/locales.lua:326
---@param formattedValue string Formatted number.
---@param unit string Unit.
---@param locale string|nil Language; default the current language.
---@return string  Value + separator + unit.
function core_locales.withUnit(formattedValue, unit, locale) end

