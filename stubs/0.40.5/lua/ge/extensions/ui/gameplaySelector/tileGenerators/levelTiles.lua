---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gameplaySelector/tileGenerators/levelTiles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Générateur de tuiles du sélecteur freeroam : une tuile par point d'apparition (spawn point) de chaque niveau de core_levels.getList(). Il construit aussi le panneau de détails d'un niveau (taille, biome, routes, pays…), les boutons « Start Freeroam » et « Configure », le filtrage par texte de recherche et l'ouverture de la fenêtre de configuration de niveau. Un moddeur peut y brancher ses propres boutons via le hook onFreeroamSelectorGetDetails.
--- Accès : extension `ui_gameplaySelector_tileGenerators_levelTiles` : `extensions.load("ui_gameplaySelector_tileGenerators_levelTiles")`, puis la globale `ui_gameplaySelector_tileGenerators_levelTiles`
---@class ui_gameplaySelector_tileGenerators_levelTiles
ui_gameplaySelector_tileGenerators_levelTiles = {}

--- Hook de filtre déclaré par les tuiles (filterHook). Si le texte de recherche, sans tenir compte de la casse, apparaît dans le biome, l'usage conseillé, les caractéristiques, les routes ou le pays du niveau, met result.match à true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/gameplaySelector/tileGenerators/levelTiles.lua:280
---@param item table Tuile testée (champ levelName utilisé).
---@param searchText string|nil Texte saisi ; vide ou nil, la fonction ne fait rien.
---@param result table Table dont le champ match est mis à true en cas de correspondance.
function ui_gameplaySelector_tileGenerators_levelTiles.onFilterCustomLevelTiles(item, searchText, result) end

--- Hook appelé quand le sélecteur freeroam s'ouvre avec des détails mémorisés. Rouvre la fenêtre de configuration du niveau avec le niveau, le point d'apparition et itemDetails.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/gameplaySelector/tileGenerators/levelTiles.lua:335
---@param itemDetails table|nil Détails mémorisés ; sans effet si nil.
---@param backend table Backend appelant (non utilisé, le nom « freeroamSelector » est fixé dans le code).
function ui_gameplaySelector_tileGenerators_levelTiles.onFreeroamSelectorOpenedWithItemDetails(itemDetails, backend) end

--- Hook appelé à l'ouverture des détails d'une tuile de niveau. Cherche le niveau et son point d'apparition, remplit titre, description, aperçu, favori, spécifications et étiquettes, puis ajoute les boutons « Start Freeroam » (freeroam_freeroam.startFreeroamByName) et « Configure » (ouvre menu.freeroamconfigurator). Émet le hook onFreeroamSelectorGetDetails pour que d'autres extensions modifient les données.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/gameplaySelector/tileGenerators/levelTiles.lua:185
---@param itemDetails table Données showDetails (levelName, spawnPointObjectName, key).
---@param details table Liste de blocs de détails à compléter.
---@param buttonInstance table Objet fournissant addButton.
---@param backend table Backend offrant isFavourite, trackRecent, getUiData et getCustomDetailsButtons.
function ui_gameplaySelector_tileGenerators_levelTiles.onGameplaySelectorGetDetails(itemDetails, details, buttonInstance, backend) end

--- Hook appelé quand le sélecteur collecte ses tuiles. Parcourt les niveaux et, pour chaque point d'apparition, ajoute une tuile (nom « point (niveau) », aperçu, clé spawnPoint_<niveau>_<objet>, région, taille de carte, icônes beamNG, Camshaft ou bug).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/gameplaySelector/tileGenerators/levelTiles.lua:43
---@param items table Liste de tuiles à compléter (modifiée en place).
function ui_gameplaySelector_tileGenerators_levelTiles.onGameplaySelectorGetTiles(items) end

--- Déclenche l'évènement UI openLevelConfigurationPopup avec les données du niveau pour afficher la fenêtre de configuration.
---Source : lua/ge/extensions/ui/gameplaySelector/tileGenerators/levelTiles.lua:330
---@param levelData table Table avec levelName, spawnPointObjectName, level, spawnPoint, backendName, itemDetails.
function ui_gameplaySelector_tileGenerators_levelTiles.openLevelConfigurationPopup(levelData) end

--- Règle l'action par défaut du backend : « configureFreeroam » si newValue est vrai, sinon « startFreeroam » (via ui_gridSelector.setDisplayDataOption). Journalise une erreur si backendName est absent.
---Source : lua/ge/extensions/ui/gameplaySelector/tileGenerators/levelTiles.lua:321
---@param backendName string Nom du backend du sélecteur.
---@param newValue boolean true pour toujours montrer la fenêtre de configuration.
function ui_gameplaySelector_tileGenerators_levelTiles.setAlwaysShowDialogue(backendName, newValue) end

