---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/locales.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_locales` : traduction des textes côté Lua. Elle charge les fichiers *.translation(s).json du dossier /locales/translations/<langue>/ (anglais en-US toujours chargé comme langue de repli), traduit des clés comme 'ui.radialmenu2.Save', gère les sous-traductions imbriquées ({{ 'clé' | translate }}), les variables de contexte, et le séparateur entre nombre et unité (selon /locales/unit_spacing_policies.json). Un moddeur s'en sert pour afficher des textes traduits ; l'alias global `_tr` pointe sur translate.
--- Accès : extension `core_locales` : `extensions.load("core_locales")`, puis la globale `core_locales`
---@class core_locales
core_locales = {}

--- Vide le cache des traductions.
---Source : lua/ge/extensions/core/locales.lua:330
function core_locales.clearTranslateCache() end

--- Traduit une clé contenant des variables {{nom}} et les remplace par les valeurs de varsTable (traduites elles-mêmes). Une valeur table { txt, prefix, ctx|context } est traduite récursivement.
---Source : lua/ge/extensions/core/locales.lua:151
---@param key string Clé de traduction.
---@param varsTable table|nil Variables nom -> valeur.
---@return string  Texte traduit avec variables.
function core_locales.contextTranslate(key, varsTable) end

--- Liste les langues disponibles (sous-dossiers de /locales/translations/), triées par clé.
---Source : lua/ge/extensions/core/locales.lua:274
---@return table[]  Éléments { key, path }.
function core_locales.getAvailableLanguages() end

--- Renvoie la langue courante : celle mémorisée, sinon celle du réglage utilisateur, sinon en-US.
---Source : lua/ge/extensions/core/locales.lua:292
---@return string  Identifiant de langue.
function core_locales.getLanguage() end

--- Renvoie toutes les traductions d'une langue fusionnées en une seule table clé -> texte (charge la langue si besoin).
---Source : lua/ge/extensions/core/locales.lua:260
---@param id string Identifiant de langue, ex. 'fr-FR'.
---@return table<string, string>  Table fusionnée ; {} si id n'est pas une chaîne.
function core_locales.getLocale(id) end

--- Indique si le mode de débogage 'scramble' des traductions est actif.
---Source : lua/ge/extensions/core/locales.lua:334
---@return boolean  true si actif.
function core_locales.getScrambleTranslationDebugEnabled() end

--- Renvoie le séparateur à mettre entre un nombre et son unité selon la politique de la langue : espace, espace insécable (U+00A0) ou rien.
---Source : lua/ge/extensions/core/locales.lua:319
---@param unit string Unité, ex. 'km/h'.
---@param locale string|nil Langue ; défaut la langue courante.
---@return string  ' ', espace insécable ou ''.
function core_locales.getUnitSeparator(unit, locale) end

--- Après un rechargement Lua : restaure le mode scramble.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/locales.lua:472
---@param data table|nil Table renvoyée par onSerialize.
function core_locales.onDeserialized(data) end

--- Hook de chargement : lit l'argument de démarrage translationScrambleDebug, charge en-US et définit le global _tr.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/locales.lua:351
function core_locales.onExtensionLoaded() end

--- Hook de changement de fichiers : invalide les politiques d'unités si leur fichier change, et planifie (délai 0.1 s) le rechargement des fichiers .json de /locales/translations/ modifiés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/locales.lua:399
---@param files table[] Éléments avec un champ filename.
function core_locales.onFilesChanged(files) end

--- Avant un rechargement Lua : mémorise l'état du mode scramble.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/locales.lua:467
---@return table  { scrambleTranslationDebugEnabled }
function core_locales.onSerialize() end

--- Hook appelé quand les réglages changent : charge la nouvelle langue ; si elle a changé, vide le cache et émet le hook onLanguageChanged.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/locales.lua:423
function core_locales.onSettingsChanged() end

--- Hook par frame : décompte le délai de rechargement à chaud des fichiers de traduction puis les recharge (émet onReloadLocales et onTranslationsReloaded).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/locales.lua:412
---@param _ number dtReal, non utilisé.
---@param _ number dtReal, non utilisé.
---@param dtRaw number Temps brut écoulé en secondes.
function core_locales.onUpdate(_, _, dtRaw) end

--- Outil de test interne : lance extensions.test_locales_run.run(lang) si le fichier de test existe, puis le décharge.
---Source : lua/ge/extensions/core/locales.lua:433
---@param lang string|boolean|nil Langue à tester, ou true pour toutes ; nil ne fait rien.
---@return any  Résultat du test, nil en cas d'échec ou si le test est absent.
function core_locales.selfTest(lang) end

--- Active ou désactive le mode scramble, vide le cache et prévient l'interface (onTranslationsReloaded).
---Source : lua/ge/extensions/core/locales.lua:338
---@param enabled boolean true pour activer (toute autre valeur désactive).
---@return boolean  Nouvel état.
function core_locales.setScrambleTranslationDebugEnabled(enabled) end

--- Traduit une clé dans la langue courante (avec repli en-US), résout les traductions imbriquées et met le résultat en cache.
---Source : lua/ge/extensions/core/locales.lua:120
---@param key string Clé de traduction. Une valeur non chaîne est renvoyée telle quelle (ou 'Missing Translation Key!' si nil).
---@param fallback string|nil Texte renvoyé si la clé est introuvable (sinon la clé).
---@return string  Texte traduit.
function core_locales.translate(key, fallback) end

--- Traduit une chaîne ou une table { txt, prefix, ctx|context } en choisissant la bonne fonction.
---Source : lua/ge/extensions/core/locales.lua:182
---@param data string|table|nil Clé ou table de description.
---@return string  Texte traduit, '' si data est vide.
function core_locales.translateWithOrWithoutContext(data) end

--- Essaie la clé prefix..name ; si elle n'existe pas (résultat vide), traduit name seul.
---Source : lua/ge/extensions/core/locales.lua:143
---@param name string Clé de base.
---@param prefix string|nil Préfixe à essayer en premier.
---@return string  Texte traduit.
function core_locales.translateWithPrefixFallback(name, prefix) end

--- Colle une valeur déjà formatée et son unité avec le bon séparateur.
---Source : lua/ge/extensions/core/locales.lua:326
---@param formattedValue string Nombre formaté.
---@param unit string Unité.
---@param locale string|nil Langue ; défaut la langue courante.
---@return string  Valeur + séparateur + unité.
function core_locales.withUnit(formattedValue, unit, locale) end

