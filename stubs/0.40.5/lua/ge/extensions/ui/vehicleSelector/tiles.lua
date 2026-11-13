---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/vehicleSelector/tiles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Construit les tuiles affichées par la grille du sélecteur de véhicules. Il configure un tilesModule (ui/gridSelectorUtils/tilesModule) avec trois « chemins » : allModels (tous les véhicules, groupés puis regroupés en clusters), configsForBrandSubModelOrModel et configsForModel (liste des configs d'un modèle, avec sous-groupes). Il applique filtres, favoris, récents, tri et sélection par défaut, puis les restrictions des tutoriels de première conduite. Il s'appuie sur tileSorting, tileGrouping et tileClustering.
--- Accès : extension `ui_vehicleSelector_tiles` : `extensions.load("ui_vehicleSelector_tiles")`, puis la globale `ui_vehicleSelector_tiles`
---@class ui_vehicleSelector_tiles
---@field getClusteredItemsFavouriteIconPercent function Alias de tileClustering.getClusteredItemsFavouriteIconPercent.
---@field getClusteredItemsStats function Alias de tileClustering.getClusteredItemsStats.
---@field getConfigOrModelPropValue function Alias de tileGrouping.getConfigOrModelPropValue.
---@field getSources function Alias de tileClustering.getSources.
---@field groupModeFunctions table Alias de tileGrouping.groupModeFunctions.
---@field sortByNameButOtherAlwaysLast function Alias du comparateur de tileSorting.
---@field sortByValue function Alias du comparateur de tileSorting.
---@field sortByYears function Alias du comparateur de tileSorting.
ui_vehicleSelector_tiles = {}

--- Regroupe des configs en clusters selon le clusterMode des options d'affichage (délègue à tileClustering.clusterItems).
---Source : lua/ge/extensions/ui/vehicleSelector/tiles.lua:120
---@param configs table Configs à regrouper.
---@return table  Clusters indexés par nom.
function ui_vehicleSelector_tiles.clusterItems(configs) end

--- Convertit une config de véhicule en tuile de la grille.
---Source : lua/ge/extensions/ui/vehicleSelector/tiles.lua:78
---@param config table Config (avec key et model_key).
---@param fullName boolean|nil true pour utiliser le nom complet (Name) plutôt que la Configuration.
---@return table  Tuile.
function ui_vehicleSelector_tiles.configToTile(config, fullName) end

--- Crée un faux profileur sans effet (start, add, finish).
---Source : lua/ge/extensions/ui/vehicleSelector/tiles.lua:9
---@return table  Objet {start, add, finish}.
function ui_vehicleSelector_tiles.emptyProfiler() end

--- Renvoie les groupes de tuiles pour un chemin de sélecteur (allModels, configsForModel, configsForBrandSubModelOrModel), puis applique les restrictions éventuelles de gameplay_discover_firstDrive_vehicleSelectorRestriction et freeroamTutorial_vehicleSelectorRestriction.
---Source : lua/ge/extensions/ui/vehicleSelector/tiles.lua:661
---@param path table Chemin {keys = {...}} ; keys[1] est le type de chemin.
---@param pathChanged boolean|nil Indique que le chemin a changé (transmis à tilesModule).
---@return table  Liste de groupes {key, label, tiles, ...}.
function ui_vehicleSelector_tiles.getTiles(path, pathChanged) end

--- Hook appelé au chargement : crée l'instance tilesModule avec les gestionnaires de chemins, les modules de tri, groupement et clustering, et les fonctions de données et de filtrage de ui_vehicleSelector_general.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/vehicleSelector/tiles.lua:632
function ui_vehicleSelector_tiles.onExtensionLoaded() end

--- Définit la tuile à sélectionner et focaliser par défaut au prochain getTiles (le champ model_key et config_key ou key identifient la config).
---Source : lua/ge/extensions/ui/vehicleSelector/tiles.lua:130
---@param tile table|nil Tuile cible, ou nil.
function ui_vehicleSelector_tiles.overrideDefaultSelectedTile(tile) end

