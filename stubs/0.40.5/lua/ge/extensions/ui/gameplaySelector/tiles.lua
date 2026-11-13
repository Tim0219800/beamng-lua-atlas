---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gameplaySelector/tiles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Cœur du backend « gameplaySelector » : il choisit les tuiles à afficher selon le chemin de navigation (toutes les activités, détail d'un système ou d'un niveau, points d'apparition d'un niveau, page « découverte »). Au chargement il scanne le dossier tileGenerators/ et déclare chaque générateur (ui_gameplaySelector_tileGenerators_<nom>) comme dépendance. Il s'appuie sur les modules tileClustering et tileSorting et fournit les fonctions de regroupement et de tri du sélecteur.
--- Accès : extension `ui_gameplaySelector_tiles` : `extensions.load("ui_gameplaySelector_tiles")`, puis la globale `ui_gameplaySelector_tiles`
---@class ui_gameplaySelector_tiles
---@field dependencies string[] core_locales plus une extension par fichier trouvé dans lua/ge/extensions/ui/gameplaySelector/tileGenerators/ (liste construite au chargement du fichier).
ui_gameplaySelector_tiles = {}

--- Renvoie les tuiles ou groupes à afficher pour un chemin. Mémorise le backend, met à jour showFavouriteIconPercent de chaque tuile (1 si favori) et le cornerIcon « road » des points d'apparition freeroam sélectionnés, puis route vers le gestionnaire correspondant à path.keys[1].
---Source : lua/ge/extensions/ui/gameplaySelector/tiles.lua:548
---@param path table Chemin de navigation : table avec keys (liste de chaînes).
---@param _backend table Backend appelant (gameplaySelector ou freeroamSelector), avec getUiData, isFavourite, backendName.
---@param routeName string|nil Nom de la route passé à backend.getUiData.
---@return table  Tuiles ou groupes selon le gestionnaire de chemin.
function ui_gameplaySelector_tiles.getTiles(path, _backend, routeName) end

--- Renvoie les données d'interface du backend : backendName (« gameplaySelector »), les fonctions de regroupement (Type, Category, Difficulty, Source, System), les fonctions de tri (Name, Difficulty, Duration, Popularity) et le module tileSorting.
---Source : lua/ge/extensions/ui/gameplaySelector/tiles.lua:594
---@return table  Table backendName, groupModeFunctions, sortModeFunctions, tileSorting.
function ui_gameplaySelector_tiles.getUiData() end

