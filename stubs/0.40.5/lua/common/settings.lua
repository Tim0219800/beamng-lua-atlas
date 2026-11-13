---@meta
-- tim19Atlas stub generated from lua/common/settings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès en lecture aux réglages du jeu depuis Lua (les deux VM). Au chargement il lit /settings/defaults.json (définitions : chaque réglage est un tableau dont l'élément [2] est la valeur par défaut), le fichier deprecated.json (réglages renommés/obsolètes), applique des préréglages (unités selon la langue de l'OS, fichier de plateforme, valeurs internes hors build shipping), puis getValues() fusionne défauts + réglages cloud + réglages locaux. C'est ce qu'un mod interroge avec settings.getValue('clé', valeurParDéfaut).
--- Accès : globale `impl`, `settings`
---@class impl
---@field defaultValues table<string, any> valeurs par défaut précalculées (clé -> defaults[clé][2])
---@field defaults table<string, table> définitions des réglages lues dans defaults.json ; chaque entrée est un tableau dont [2] est la valeur par défaut
---@field deprecated table<string, table> réglages obsolètes (champs replacement ou obsolete)
---@field deprecatedPathTorquescript string '/settings/game-settings.cs' (ancien format TorqueScript)
---@field path string '/settings/'
---@field pathCloud string '/settings/cloud/settings.json'
---@field pathDefaults string '/settings/defaults.json'
---@field pathDeprecated string '/settings/deprecated.json'
---@field pathInternal string '/settings/not-shipping.internal.json' (valeurs internes, lues hors build shipping)
---@field pathLocal string '/settings/settings.json' (réglages de l'utilisateur)
---@field pathPersona string '/settings/persona-settings.tmp.json'
---@field pathVariables string '/settings/game-settings.json'
---@field personaScopedSettings table<string, boolean> réglages pouvant avoir une valeur par persona
impl = {}

--- Valeur d'un réglage par persona. Si key n'est pas un réglage 'persona' ou s'il n'y a pas de persona, renvoie fallbackValue ; sinon la valeur stockée pour ce persona, ou à défaut la première fallbackValue mémorisée pour ce persona et cette clé.
---Source : lua/common/settings.lua:223
---@param key string nom du réglage
---@param fallbackValue any valeur par défaut
---@param persona table|string|number|nil persona ou id
---@return any  valeur
function impl.getPersonaValue(key, fallbackValue, persona) end

--- Renvoie la valeur du réglage `key` (fusion défauts/cloud/local), ou defaultValue si elle est nil ; puis applique la valeur de persona le cas échéant (si key est dans personaScopedSettings et qu'un persona est fourni).
---Source : lua/common/settings.lua:248
---@param key string nom du réglage
---@param defaultValue any valeur de repli si le réglage n'existe pas
---@param persona table|string|number|nil persona (ou son id) pour les réglages par persona
---@return any  valeur du réglage
function impl.getValue(key, defaultValue, persona) end

--- Renvoie la table complète des réglages fusionnés (mise en cache). Ne pas modifier la table renvoyée (c'est le cache).
---Source : lua/common/settings.lua:188
---@return table<string, any>  tous les réglages
function impl.getValues() end

--- Oublie le cache des réglages et des réglages persona : le prochain getValue/getValues relira les fichiers. Mêmes fonctions : refresh et settingsChanged (compatibilité).
---Source : lua/common/settings.lua:260
function impl.invalidateCache() end

--- Oublie le cache des valeurs par persona (relu au prochain accès).
---Source : lua/common/settings.lua:256
function impl.invalidatePersonaCache() end

--- Alias d'invalidateCache (rétrocompatibilité).
---Source : lua/common/settings.lua:260
function impl.refresh() end

--- Alias d'invalidateCache, à appeler (par le moteur ou l'UI) quand des réglages viennent de changer.
---Source : lua/common/settings.lua:260
function impl.settingsChanged() end

