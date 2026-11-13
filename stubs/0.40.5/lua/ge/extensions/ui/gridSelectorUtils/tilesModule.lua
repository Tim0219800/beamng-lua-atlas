---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gridSelectorUtils/tilesModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utilitaire des sélecteurs en grille : moteur générique de production des tuiles. À partir d'une config (convertisseur item -> tuile, gestionnaires par type de chemin, regroupement, tri, source de données), il aiguille chaque demande de tuiles vers le gestionnaire correspondant à la première clé du chemin et fournit à ce gestionnaire un « contexte » d'aides (finalisation des groupes, sélection par défaut, clustering, groupes favoris/récents).
--- Accès : extension `ui_gridSelectorUtils_tilesModule` : `extensions.load("ui_gridSelectorUtils_tilesModule")`, puis la globale `ui_gridSelectorUtils_tilesModule`
---@class ui_gridSelectorUtils_tilesModule
ui_gridSelectorUtils_tilesModule = {}

--- Crée une instance de production de tuiles.
---Source : lua/ge/extensions/ui/gridSelectorUtils/tilesModule.lua:4
---@param config table { itemToTileConverter, pathHandlers (table typeChemin -> function(path, data, context)), clusteringFunction, groupingModule, sortingModule, getDataFunction, filterFunction, backendName (défaut "gridSelector"), profilerName }.
---@return table  Instance avec getTiles et createContext.
function ui_gridSelectorUtils_tilesModule.create(config) end

--- Objet renvoyé par create().
---@class ui_gridSelectorUtils_tilesModule_instance
local ui_gridSelectorUtils_tilesModule_instance = {}

--- Construit le contexte passé aux gestionnaires : itemToTileConverter, filterFunction, clusteringFunction, groupingModule, sortingModule, finalizeGroups, setDefaultSelection, matchesGroup, processClusteredItems, handleSpecialGroups, profiler, backendName, data.
---Source : lua/ge/extensions/ui/gridSelectorUtils/tilesModule.lua:dyn
---@param data table Données de getDataFunction (contient displayData).
---@param overrideDefaultSelectedTile table|nil Voir getTiles.
---@param tileFromClusteredItems table|nil Voir getTiles.
---@return table  Contexte.
function ui_gridSelectorUtils_tilesModule_instance:createContext(data, overrideDefaultSelectedTile, tileFromClusteredItems) end

--- Appelle getDataFunction(), construit le contexte et délègue au gestionnaire du premier segment du chemin. Renvoie le résultat du gestionnaire (liste de groupes) ou {}.
---Source : lua/ge/extensions/ui/gridSelectorUtils/tilesModule.lua:dyn
---@param path table|nil { keys = {...} } (défaut { keys = {} }).
---@param pathChanged boolean|nil Si vrai, émet onGridSelectorGetTiles.
---@param overrideDefaultSelectedTile table|nil Tuile { key } à sélectionner par défaut.
---@param tileFromClusteredItems table<string, function>|nil Fabriques de tuiles de cluster par mode de clustering.
---@return table  Groupes de tuiles.
function ui_gridSelectorUtils_tilesModule_instance:getTiles(path, pathChanged, overrideDefaultSelectedTile, tileFromClusteredItems) end

