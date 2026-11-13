---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gameplaySelector/tileGenerators/campaignTiles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Générateur de tuiles du sélecteur de gameplay pour les campagnes (système hérité). Il ajoute une tuile par campagne renvoyée par campaign_campaignsLoader.getList() et construit le panneau de détails avec un bouton « Start Campaign ». Il est appelé via les hooks onGameplaySelectorGetTiles et onGameplaySelectorGetDetails.
--- Accès : extension `ui_gameplaySelector_tileGenerators_campaignTiles` : `extensions.load("ui_gameplaySelector_tileGenerators_campaignTiles")`, puis la globale `ui_gameplaySelector_tileGenerators_campaignTiles`
---@class ui_gameplaySelector_tileGenerators_campaignTiles
ui_gameplaySelector_tileGenerators_campaignTiles = {}

--- Hook appelé quand l'utilisateur ouvre les détails d'une tuile. Si itemDetails.campaignSourceFile existe, charge la campagne et ajoute dans details un bloc avec titre, description, aperçu, favori, spécifications (difficulté, auteurs, date, joueurs, nombre de scénarios), étiquettes (officiel, auxiliaire, mod) et un bouton « Start Campaign ». Ce bouton enregistre l'élément comme récent, navigue vers « play » et lance campaign_campaignsLoader.start.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/gameplaySelector/tileGenerators/campaignTiles.lua:122
---@param itemDetails table Données showDetails de la tuile (campaignSourceFile, key).
---@param details table Liste de blocs de détails à compléter.
---@param buttonInstance table Objet fournissant addButton pour créer les boutons.
---@param backend table Backend offrant isFavourite et trackRecent.
function ui_gameplaySelector_tileGenerators_campaignTiles.onGameplaySelectorGetDetails(itemDetails, details, buttonInstance, backend) end

--- Hook appelé quand le sélecteur collecte ses tuiles. Pour le backend gameplaySelector, ajoute une tuile par campagne (nom traduit, aperçu, niveau, icônes beamNG ou bug, clé campaign_<sourceFile>). Ajoute dans tous les cas une tuile « More Campaigns... ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/gameplaySelector/tileGenerators/campaignTiles.lua:7
---@param items table Liste de tuiles à compléter (modifiée en place).
---@param backend table Backend appelant ; backendName doit valoir « gameplaySelector » pour les tuiles de campagne.
function ui_gameplaySelector_tileGenerators_campaignTiles.onGameplaySelectorGetTiles(items, backend) end

