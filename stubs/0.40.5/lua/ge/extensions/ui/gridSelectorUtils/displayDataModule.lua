---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gridSelectorUtils/displayDataModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utilitaire des sélecteurs en grille : gère les options d'affichage (tri, filtres d'affichage, bascules…), la liste des favoris et celle des éléments récents, avec persistance JSON dans un fichier (par défaut /settings/gridSelectorData.json). Une option peut être liée à un réglage du jeu via `settingsKey`. Émet les hooks onGridSelectorDisplayDataChanged et onGridSelectorFavouriteToggled.
--- Accès : extension `ui_gridSelectorUtils_displayDataModule` : `extensions.load("ui_gridSelectorUtils_displayDataModule")`, puis la globale `ui_gridSelectorUtils_displayDataModule`
---@class ui_gridSelectorUtils_displayDataModule
ui_gridSelectorUtils_displayDataModule = {}

--- Crée une instance de gestion des données d'affichage, favoris et récents.
---Source : lua/ge/extensions/ui/gridSelectorUtils/displayDataModule.lua:4
---@param dataFile string|nil Fichier JSON de sauvegarde, défaut /settings/gridSelectorData.json.
---@param displayDataOptions table[]|nil Liste d'options { key, type, default, label, min, max, options, showInModes, description, hideInSimpleMenu, save, settingsKey }.
---@param updateDisplayDataFunction function|nil Migration (displayData, ancienneVersion, nouvelleVersion) -> displayData.
---@param backendName string|nil Nom transmis aux hooks, défaut "gridSelector".
---@param targetVersion integer|nil Version courante du format de données, défaut 1.
---@return table  Instance (voir classes.instance).
function ui_gridSelectorUtils_displayDataModule.create(dataFile, displayDataOptions, updateDisplayDataFunction, backendName, targetVersion) end

--- Objet renvoyé par create().
---@class ui_gridSelectorUtils_displayDataModule_instance
local ui_gridSelectorUtils_displayDataModule_instance = {}

--- Vide les favoris et sauvegarde.
---Source : lua/ge/extensions/ui/gridSelectorUtils/displayDataModule.lua:dyn
function ui_gridSelectorUtils_displayDataModule_instance:clearAllFavourites() end

--- Vide les récents et sauvegarde.
---Source : lua/ge/extensions/ui/gridSelectorUtils/displayDataModule.lua:dyn
function ui_gridSelectorUtils_displayDataModule_instance:clearAllRecentItems() end

--- Renvoie la table clé -> valeur des options, initialisée au premier appel.
---Source : lua/ge/extensions/ui/gridSelectorUtils/displayDataModule.lua:dyn
---@return table<string, any>  Valeurs courantes.
function ui_gridSelectorUtils_displayDataModule_instance:getDisplayData() end

--- Renvoie la liste des options pour l'UI : label, key, type, min, max, value, options, showInModes, description, hideInSimpleMenu. La valeur de `searchText` est toujours nil (gérée par le module appelant).
---Source : lua/ge/extensions/ui/gridSelectorUtils/displayDataModule.lua:dyn
---@return table[]  Options avec leur valeur courante.
function ui_gridSelectorUtils_displayDataModule_instance:getDisplayDataOptions() end

--- Renvoie une copie profonde de la liste des récents.
---Source : lua/ge/extensions/ui/gridSelectorUtils/displayDataModule.lua:dyn
---@return string[]  Clés récentes, la plus récente d'abord.
function ui_gridSelectorUtils_displayDataModule_instance:getRecentItems() end

--- Relit le fichier et reconstruit la table des options à partir des défauts, du fichier et des réglages liés.
---Source : lua/ge/extensions/ui/gridSelectorUtils/displayDataModule.lua:dyn
---@return table<string, any>  Nouvelle table (n'écrase pas le cache interne).
function ui_gridSelectorUtils_displayDataModule_instance:initializeDisplayData() end

--- Renvoie l'horodatage du favori ou nil.
---Source : lua/ge/extensions/ui/gridSelectorUtils/displayDataModule.lua:dyn
---@param itemKey string Clé de l'élément.
---@return integer|nil  os.time() d'ajout.
function ui_gridSelectorUtils_displayDataModule_instance:isFavourite(itemKey) end

--- Renvoie la position dans la liste des récents, ou false.
---Source : lua/ge/extensions/ui/gridSelectorUtils/displayDataModule.lua:dyn
---@param itemKey string Clé de l'élément.
---@return integer|boolean  Index ou false.
function ui_gridSelectorUtils_displayDataModule_instance:isRecentItem(itemKey) end

--- Remet les options `save` à leur valeur par défaut, émet le hook pour chaque changement et sauvegarde.
---Source : lua/ge/extensions/ui/gridSelectorUtils/displayDataModule.lua:dyn
---@return table<string, any>  displayData à jour.
function ui_gridSelectorUtils_displayDataModule_instance:resetDisplayDataToDefaults() end

--- Change une option (convertie en nombre si son type est number), émet onGridSelectorDisplayDataChanged(backendName, key, value), répercute sur le réglage lié et sauvegarde. Les valeurs nil ou "undefined" sont ignorées.
---Source : lua/ge/extensions/ui/gridSelectorUtils/displayDataModule.lua:dyn
---@param key string Clé de l'option.
---@param value any Nouvelle valeur.
---@return table<string, any>  displayData à jour.
function ui_gridSelectorUtils_displayDataModule_instance:setDisplayDataOption(key, value) end

--- Ajoute ou retire un favori, émet onGridSelectorFavouriteToggled(backendName, itemKey, estFavori) et sauvegarde.
---Source : lua/ge/extensions/ui/gridSelectorUtils/displayDataModule.lua:dyn
---@param itemKey string Clé de l'élément.
function ui_gridSelectorUtils_displayDataModule_instance:toggleFavourite(itemKey) end

--- Place l'élément en tête des récents (max 100) et sauvegarde.
---Source : lua/ge/extensions/ui/gridSelectorUtils/displayDataModule.lua:dyn
---@param itemKey string Clé de l'élément.
function ui_gridSelectorUtils_displayDataModule_instance:trackRecentItem(itemKey) end

