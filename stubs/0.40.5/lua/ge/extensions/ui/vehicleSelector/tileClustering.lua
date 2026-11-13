---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/vehicleSelector/tileClustering.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Regroupe les configurations de véhicules en « clusters » (une tuile par modèle ou par marque + sous-modèle) pour la grille du sélecteur de véhicules, et fabrique la tuile de chaque cluster : nom, aperçu, chemin de navigation, favoris et récents, statistiques de la config représentative, icônes de source. Il est appelé par ui_vehicleSelector_tiles ; un moddeur s'en sert peu directement.
--- Accès : extension `ui_vehicleSelector_tileClustering` : `extensions.load("ui_vehicleSelector_tileClustering")`, puis la globale `ui_vehicleSelector_tileClustering`
---@class ui_vehicleSelector_tileClustering
ui_vehicleSelector_tileClustering = {}

--- Regroupe des configs selon le mode de cluster. Chaque cluster contient configsByKey, count, list, ainsi que years et value (minimums des configs, pour le tri).
---Source : lua/ge/extensions/ui/vehicleSelector/tileClustering.lua:280
---@param configs table Configs à regrouper (chacune avec key et model_key).
---@param clusterMode string 'brandSubModelOrModel' ou 'model'.
---@return table<string, table>  Clusters indexés par nom de groupe.
function ui_vehicleSelector_tileClustering.clusterItems(configs, clusterMode) end

--- Crée la tuile d'un cluster selon le mode demandé.
---Source : lua/ge/extensions/ui/vehicleSelector/tileClustering.lua:309
---@param clusteredItems table Un cluster issu de clusterItems.
---@param group table Groupe parent (key, gotoParams).
---@param clusterMode string 'brandSubModelOrModel' ou 'model'.
---@return table|nil  Tuile (key, name, preview, subElementCount, favouriteIdx, recentIdx, gotoPath, doubleClickDetails, sourceIcons, Value, Weight, Top Speed, Power, Power/Weight, 0-60 mph, 0-100 km/h, isAuxiliary...), ou nil si mode inconnu.
function ui_vehicleSelector_tileClustering.createTileFromClusteredItems(clusteredItems, group, clusterMode) end

--- Renvoie la fonction qui calcule le nom de cluster d'une config pour un mode donné.
---Source : lua/ge/extensions/ui/vehicleSelector/tileClustering.lua:318
---@param clusterMode string Mode de cluster.
---@return function|nil  Fonction (config) -> string, ou nil.
function ui_vehicleSelector_tileClustering.getClusterModeFunction(clusterMode) end

--- Parcourt un cluster pour déterminer les favoris et récents qu'il contient.
---Source : lua/ge/extensions/ui/vehicleSelector/tileClustering.lua:24
---@param clusteredItems table Cluster (configsByKey, count).
---@return number  Plus grand indice de favori (0 si aucun).
---@return number  Plus petit indice de récent (math.huge si aucun).
---@return number  Part des configs favorites, entre 0 et 1.
---@return table|nil  Config favorite d'indice le plus haut.
---@return table|nil  Config la plus récente.
function ui_vehicleSelector_tileClustering.getClusteredItemsFavouriteIconPercent(clusteredItems) end

--- Choisit l'aperçu, le modèle, la config et la config représentative d'un cluster selon sortMode.
---Source : lua/ge/extensions/ui/vehicleSelector/tileClustering.lua:46
---@param clusteredItems table Cluster.
---@param sortMode string Mode de tri (Automatic, Name, Value, Weight, ...).
---@return string  Chemin de l'image d'aperçu.
---@return string  Clé du modèle.
---@return string  Clé de la config représentative.
---@return table  Config représentative.
function ui_vehicleSelector_tileClustering.getClusteredItemsStats(clusteredItems, sortMode) end

--- Renvoie les étiquettes et icônes de provenance d'une config : officielle BeamNG ('beamNG'), personnalisée ('wrench'), Automation (logo SVG), mod ('puzzleModule'), fichiers jbeam manquants ('danger').
---Source : lua/ge/extensions/ui/vehicleSelector/tileClustering.lua:92
---@param config table Config du véhicule.
---@param model table Données du modèle.
---@param onlyIcons boolean true pour ne renvoyer que les icônes, sans le texte traduit.
---@return string[]  Liste d'icônes (et textes si onlyIcons est faux).
function ui_vehicleSelector_tileClustering.getSources(config, model, onlyIcons) end

