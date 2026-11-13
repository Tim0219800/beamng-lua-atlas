---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gameplaySelector/tileGenerators/discoverTiles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Générateur de tuiles du sélecteur de gameplay pour les « expériences de démarrage rapide » (système quickStartExperiences). Il lit les pages et cartes de gameplay_discover.getDiscoverPages(), crée une tuile par page, regroupe les cartes d'une page en « Experiences » et « Challenges » (missions), et fournit les détails et le bouton de lancement d'une carte.
--- Accès : extension `ui_gameplaySelector_tileGenerators_discoverTiles` : `extensions.load("ui_gameplaySelector_tileGenerators_discoverTiles")`, puis la globale `ui_gameplaySelector_tileGenerators_discoverTiles`
---@class ui_gameplaySelector_tileGenerators_discoverTiles
---@field dependencies string[] Extensions chargées avant celle-ci : gameplay_discover.
ui_gameplaySelector_tileGenerators_discoverTiles = {}

--- Renvoie les groupes de tuiles d'une page découverte : un groupe « discoverExperiences » (cartes non mission) et un groupe « discoverChallenges » (cartes mission), chacun seulement s'il n'est pas vide. Renvoie une table vide si la page est introuvable.
---Source : lua/ge/extensions/ui/gameplaySelector/tileGenerators/discoverTiles.lua:106
---@param pageKey string Clé de la page (page.folder, sinon page.title, sinon son index).
---@return table[]  Liste de groupes {key, label, tiles}.
function ui_gameplaySelector_tileGenerators_discoverTiles.getPageGroups(pageKey) end

--- Hook appelé à l'ouverture des détails. Si itemDetails.discoverId désigne une carte connue, ajoute dans details un bloc (titre, description, aperçu, favori, étiquettes) avec un bouton « play » qui enregistre l'élément comme récent puis lance la carte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/gameplaySelector/tileGenerators/discoverTiles.lua:164
---@param itemDetails table Données showDetails (discoverId, key).
---@param details table Liste de blocs de détails à compléter.
---@param buttonInstance table Objet fournissant addButton.
---@param backend table Backend offrant isFavourite et trackRecent.
function ui_gameplaySelector_tileGenerators_discoverTiles.onGameplaySelectorGetDetails(itemDetails, details, buttonInstance, backend) end

--- Hook appelé quand le sélecteur collecte ses tuiles. Pour le backend gameplaySelector uniquement, ajoute une tuile de type discoverPage par page contenant au moins une carte, avec gotoPath, nombre de sous-éléments et icônes officiel ou mod.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/gameplaySelector/tileGenerators/discoverTiles.lua:142
---@param items table Liste de tuiles à compléter.
---@param backend table Backend appelant.
function ui_gameplaySelector_tileGenerators_discoverTiles.onGameplaySelectorGetTiles(items, backend) end

