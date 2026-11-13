---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utilitaire des sélecteurs en grille : gère l'état des filtres (filtres à ensemble de valeurs « set » et filtres de plage « range »), le texte de recherche, le verrouillage de filtres et le calcul de la liste des filtres actifs affichée en pastilles. Les backends (véhicules, gameplay, etc.) créent une instance via `create` en lui fournissant la fonction qui construit les filtres à partir de leur liste d'éléments.
--- Accès : extension `ui_gridSelectorUtils_filterModule` : `extensions.load("ui_gridSelectorUtils_filterModule")`, puis la globale `ui_gridSelectorUtils_filterModule`
---@class ui_gridSelectorUtils_filterModule
ui_gridSelectorUtils_filterModule = {}

--- Crée une instance de gestion de filtres.
---Source : lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:4
---@param createFiltersFunction function|nil (configList) -> filterList, filterByProp, commonFilters ; appelée par initializeFilters.
---@param commonFilters table[]|nil Liste de paires { propName, option } considérées comme filtres « communs ».
---@param rangeFilters table|nil Accepté mais non utilisé dans le code.
---@param dictFilters table|nil Accepté mais non utilisé dans le code.
---@param backendName string|nil Nom du backend, défaut "gridSelector" (non utilisé ensuite).
---@param customPassesFiltersFunction function|nil (itemData, validFilters, searchText) -> boolean ; utilisée par passesFilters.
---@return table  Instance (voir classes.instance).
function ui_gridSelectorUtils_filterModule.create(createFiltersFunction, commonFilters, rangeFilters, dictFilters, backendName, customPassesFiltersFunction) end

--- Objet renvoyé par create().
---@class ui_gridSelectorUtils_filterModule_instance
local ui_gridSelectorUtils_filterModule_instance = {}

--- Calcule les filtres différents des valeurs par défaut.
---Source : lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@return table[]  Filtres actifs.
---@return boolean  true s'il existe au moins un filtre actif non commun.
function ui_gridSelectorUtils_filterModule_instance:calculateActiveFilters() end

--- Réinitialise tous les filtres range et set puis vide le texte de recherche.
---Source : lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
function ui_gridSelectorUtils_filterModule_instance:clearAllFilters() end

--- Supprime tous les verrous.
---Source : lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
function ui_gridSelectorUtils_filterModule_instance:clearLockedFilters() end

--- Renvoie la liste des filtres actifs (displayText, propName, propValue, isActive, iconType, type).
---Source : lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@return table[]  Filtres actifs, dans l'ordre de filterList.
function ui_gridSelectorUtils_filterModule_instance:getActiveFilters() end

--- Renvoie l'état complet pour l'UI.
---Source : lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@return table  { filterList, filterByProp, commonFilters, lockedFiltersByProp, activeFilters, onlyCommonFilters }.
function ui_gridSelectorUtils_filterModule_instance:getFilters() end

--- Renvoie le texte de recherche.
---Source : lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@return string  Texte ("" par défaut).
function ui_gridSelectorUtils_filterModule_instance:getSearchText() end

--- Renvoie la liste des filtres restrictifs (recalculée si nécessaire).
---Source : lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@return table[]  Filtres valides avec valeurs courantes.
function ui_gridSelectorUtils_filterModule_instance:getValidFilters() end

--- Appelle createFiltersFunction(configList) et remplace filterList, filterByProp et éventuellement commonFilters.
---Source : lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@param configList any Données passées à la fonction de création.
function ui_gridSelectorUtils_filterModule_instance:initializeFilters(configList) end

--- Indique si une option (ou n'importe quelle option si option est nil) d'une propriété est verrouillée.
---Source : lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@param propName string Propriété.
---@param option any Option précise ou nil.
---@return boolean  true si verrouillé.
function ui_gridSelectorUtils_filterModule_instance:isFilterLocked(propName, option) end

--- Verrouille l'état courant d'un filtre (range : min/max ; set : options données ou toutes).
---Source : lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@param propName string Propriété.
---@param options table|nil Liste d'options à verrouiller (set).
function ui_gridSelectorUtils_filterModule_instance:lockFilter(propName, options) end

--- Verrouille un filtre dans un mode : range -> fixe min/max donnés ; set -> toutes les options à false puis celles de `options` (table option -> bool) à la valeur donnée, toutes verrouillées.
---Source : lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@param propName string Propriété.
---@param options table {min, max} pour range ou { [option] = bool } pour set.
function ui_gridSelectorUtils_filterModule_instance:lockFilterMode(propName, options) end

--- Filtres set uniquement : toutes les options à false et verrouillées, sauf celles de allowedOptions mises à true et non verrouillées.
---Source : lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@param propName string Propriété.
---@param allowedOptions table|nil Liste d'options autorisées.
function ui_gridSelectorUtils_filterModule_instance:lockFilterModeExclusive(propName, allowedOptions) end

--- Teste un élément avec customPassesFiltersFunction(itemData, validFilters, searchText) ; true si aucune fonction fournie.
---Source : lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@param itemData any Élément à tester.
---@return boolean  true si l'élément passe.
function ui_gridSelectorUtils_filterModule_instance:passesFilters(itemData) end

--- Remet un filtre de plage à ses bornes par défaut.
---Source : lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@param propName string Propriété.
function ui_gridSelectorUtils_filterModule_instance:resetRangeFilter(propName) end

--- Réactive toutes les options d'un filtre set.
---Source : lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@param propName string Propriété.
function ui_gridSelectorUtils_filterModule_instance:resetSetFilter(propName) end

--- Définit le texte de recherche (nil devient "") et invalide le cache.
---Source : lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@param val string|nil Texte.
function ui_gridSelectorUtils_filterModule_instance:setSearchText(val) end

--- Reconstruit la liste interne des filtres effectivement restrictifs (utilisée par passesFilters).
---Source : lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
function ui_gridSelectorUtils_filterModule_instance:setupValidFilters() end

--- Bascule une option d'un filtre set (voir notes). Ignorée si l'option est verrouillée.
---Source : lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@param propName string Propriété filtrée.
---@param option string|number Valeur de l'option.
function ui_gridSelectorUtils_filterModule_instance:toggleFilter(propName, option) end

--- Destinée à déverrouiller un filtre ; sans effet à cause d'un bug (voir notes).
---Source : lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@param propName string Propriété.
---@param options table|nil Non utilisé.
function ui_gridSelectorUtils_filterModule_instance:unlockFilter(propName, options) end

--- Remplace filterByProp par newFilters en conservant les valeurs verrouillées.
---Source : lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@param newFilters table Nouvel état filterByProp.
function ui_gridSelectorUtils_filterModule_instance:updateFilters(newFilters) end

--- Fixe min et max d'un filtre de plage (ignoré si verrouillé).
---Source : lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua:dyn
---@param propName string Propriété.
---@param min number Minimum.
---@param max number Maximum.
function ui_gridSelectorUtils_filterModule_instance:updateRangeFilter(propName, min, max) end

