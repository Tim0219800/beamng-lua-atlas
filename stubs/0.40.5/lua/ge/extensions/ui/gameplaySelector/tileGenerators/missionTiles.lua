---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gameplaySelector/tileGenerators/missionTiles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Générateur de tuiles du sélecteur de gameplay pour les missions (système « challenges »). Il ajoute une tuile par mission de gameplay_missions_missions.getFilesData(true), calcule son libellé de type (course de dragster, contre-la-montre, gymkhana…) et construit le panneau de détails avec un bouton de démarrage.
--- Accès : extension `ui_gameplaySelector_tileGenerators_missionTiles` : `extensions.load("ui_gameplaySelector_tileGenerators_missionTiles")`, puis la globale `ui_gameplaySelector_tileGenerators_missionTiles`
---@class ui_gameplaySelector_tileGenerators_missionTiles
ui_gameplaySelector_tileGenerators_missionTiles = {}

--- Hook appelé à l'ouverture des détails. Si itemDetails.missionId désigne une mission connue, ajoute un bloc (titre, description, aperçu, favori, spécifications générales et carrière, étiquettes) avec un bouton de démarrage qui appelle gameplay_missions_missionManager.startWithLoadingLevel(mission, nil, nil, "gameplaySelector").
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/gameplaySelector/tileGenerators/missionTiles.lua:213
---@param itemDetails table Données showDetails (missionId, key).
---@param details table Liste de blocs de détails à compléter.
---@param buttonInstance table Objet fournissant addButton.
---@param backend table Backend offrant isFavourite et trackRecent.
function ui_gameplaySelector_tileGenerators_missionTiles.onGameplaySelectorGetDetails(itemDetails, details, buttonInstance, backend) end

--- Hook appelé quand le sélecteur collecte ses tuiles. Pour le backend gameplaySelector, ajoute une tuile par mission (nom, aperçu, type, sous-groupe, niveau, icônes beamNG, bug, cup, clé mission_<id>). Ajoute dans tous les cas la tuile « moreMissions ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/gameplaySelector/tileGenerators/missionTiles.lua:25
---@param items table Liste de tuiles à compléter.
---@param backend table Backend appelant ; backendName doit valoir « gameplaySelector ».
function ui_gameplaySelector_tileGenerators_missionTiles.onGameplaySelectorGetTiles(items, backend) end

