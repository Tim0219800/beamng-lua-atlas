---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gameplaySelector/tileGenerators/scenarioTiles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Générateur de tuiles du sélecteur de gameplay pour les scénarios (système hérité). Il ajoute une tuile par scénario renvoyé par scenario_scenariosLoader.getList et construit le panneau de détails avec un bouton « Start Scenario ». Les scénarios multijoueur local sont classés dans le système scenariosMultiplayer.
--- Accès : extension `ui_gameplaySelector_tileGenerators_scenarioTiles` : `extensions.load("ui_gameplaySelector_tileGenerators_scenarioTiles")`, puis la globale `ui_gameplaySelector_tileGenerators_scenarioTiles`
---@class ui_gameplaySelector_tileGenerators_scenarioTiles
ui_gameplaySelector_tileGenerators_scenarioTiles = {}

--- Hook appelé à l'ouverture des détails d'une tuile. Si itemDetails.scenarioSourceFile existe, charge le scénario et ajoute dans details un bloc (titre, description, aperçu, favori, spécifications, étiquettes officiel, auxiliaire, multijoueur, mod) avec un bouton « Start Scenario » qui enregistre l'élément comme récent puis appelle scenario_scenariosLoader.start.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/gameplaySelector/tileGenerators/scenarioTiles.lua:148
---@param itemDetails table Données showDetails de la tuile (scenarioSourceFile, key).
---@param details table Liste de blocs de détails à compléter.
---@param buttonInstance table Objet fournissant addButton.
---@param backend table Backend offrant isFavourite et trackRecent.
function ui_gameplaySelector_tileGenerators_scenarioTiles.onGameplaySelectorGetDetails(itemDetails, details, buttonInstance, backend) end

--- Hook appelé quand le sélecteur collecte ses tuiles. Pour le backend gameplaySelector, ajoute une tuile par scénario (nom traduit, aperçu, niveau, clé scenario_<sourceFile>). Un scénario dont playersCountRange.max dépasse 1 reçoit l'icône helmets et le type scenarioMultiplayer ; les icônes beamNG et bug signalent les scénarios officiels et auxiliaires.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/gameplaySelector/tileGenerators/scenarioTiles.lua:7
---@param items table Liste de tuiles à compléter (modifiée en place).
---@param backend table Backend appelant ; backendName doit valoir « gameplaySelector ».
function ui_gameplaySelector_tileGenerators_scenarioTiles.onGameplaySelectorGetTiles(items, backend) end

