---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gameplaySelector/tileClustering.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Regroupe les éléments du sélecteur de gameplay en « clusters » (par niveau, par type ou automatiquement selon le système) et fabrique la tuile représentant chaque cluster : nom, aperçu, nombre d'éléments, favori/récent le plus haut, chemin de navigation (gotoPath), icônes de source. Utilisé par ui_gameplaySelector_general, qui doit d'abord appeler setBackend avec un backend exposant isFavourite(key) et isRecent(key).
--- Accès : extension `ui_gameplaySelector_tileClustering` : `extensions.load("ui_gameplaySelector_tileClustering")`, puis la globale `ui_gameplaySelector_tileClustering`
---@class ui_gameplaySelector_tileClustering
ui_gameplaySelector_tileClustering = {}

--- Répartit les items dans des clusters selon le mode donné.
---Source : lua/ge/extensions/ui/gameplaySelector/tileClustering.lua:307
---@param items table Items à regrouper (parcourus avec pairs), chacun avec un champ key.
---@param clusterMode string 'level', 'type', 'automatic' ou 'none'.
---@return table<string, {itemsByKey: table, count: integer, list: table}>  Clusters indexés par nom de groupe.
function ui_gameplaySelector_tileClustering.clusterItems(items, clusterMode) end

--- Construit la tuile d'un cluster selon le mode (level, type ou automatic).
---Source : lua/ge/extensions/ui/gameplaySelector/tileClustering.lua:326
---@param clusteredItems table Un cluster {itemsByKey, count, list}.
---@param group table Groupe parent : key, gotoParams, isRecentGroup, isFavouriteGroup.
---@param clusterMode string 'level', 'type' ou 'automatic'.
---@return table|nil  Tuile {key, name, preview, subElementCount, favouriteIdx, recentIdx, gotoPath, showFavouriteIconPercent, doubleClickDetails, doubleClickMode, sourceIcons, isAuxiliary, ...} ; nil pour un mode sans tuile ('none').
function ui_gameplaySelector_tileClustering.createTileFromClusteredItems(clusteredItems, group, clusterMode) end

--- Renvoie la fonction qui donne le nom de groupe d'un item pour un mode.
---Source : lua/ge/extensions/ui/gameplaySelector/tileClustering.lua:335
---@param clusterMode string 'level', 'type', 'automatic' ou 'none'.
---@return function|nil  function(item) -> string, nil si mode inconnu.
function ui_gameplaySelector_tileClustering.getClusterModeFunction(clusterMode) end

--- Calcule les statistiques favoris/récents d'un cluster.
---Source : lua/ge/extensions/ui/gameplaySelector/tileClustering.lua:40
---@param clusteredItems table Un cluster {itemsByKey, count, list}.
---@return number  Plus haut indice de favori (0 si aucun).
---@return number  Plus bas indice de récent (math.huge si aucun).
---@return number  Part d'items favoris (0 à 1).
---@return table|nil  Item favori au plus haut indice.
---@return table|nil  Item le plus récent.
function ui_gameplaySelector_tileClustering.getClusteredItemsFavouriteIconPercent(clusteredItems) end

--- Choisit l'item représentatif d'un cluster et son aperçu (image par défaut /gameplay/default/preview.jpg).
---Source : lua/ge/extensions/ui/gameplaySelector/tileClustering.lua:67
---@param clusteredItems table Un cluster {itemsByKey, count, list}.
---@param sortMode string|nil 'Name' pour prendre le premier item par ordre alphabétique.
---@return string  Chemin de l'aperçu.
---@return table  Item représentatif.
function ui_gameplaySelector_tileClustering.getClusteredItemsStats(clusteredItems, sortMode) end

--- Collecte les icônes de source (item.sourceIcons) d'un cluster sans doublon, triées : beamNG, camshaft, puzzleModule, cup, bug d'abord, puis les autres par nom.
---Source : lua/ge/extensions/ui/gameplaySelector/tileClustering.lua:141
---@param clusteredItems table Un cluster {itemsByKey, count, list}.
---@return table[]  Liste de {svg = chemin} (si finit par .svg) ou {icon = nom}.
function ui_gameplaySelector_tileClustering.getSourceIcons(clusteredItems) end

--- Enregistre le backend utilisé pour savoir si un item est favori ou récent (backend.isFavourite(key), backend.isRecent(key)).
---Source : lua/ge/extensions/ui/gameplaySelector/tileClustering.lua:4
---@param _backend table Backend du sélecteur (ui_gameplaySelector_general ou équivalent).
function ui_gameplaySelector_tileClustering.setBackend(_backend) end

