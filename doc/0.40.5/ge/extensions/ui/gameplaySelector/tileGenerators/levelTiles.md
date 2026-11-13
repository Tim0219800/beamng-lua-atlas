# `ui_gameplaySelector_tileGenerators_levelTiles`

*Fichier : `lua/ge/extensions/ui/gameplaySelector/tileGenerators/levelTiles.lua` · VM : Game Engine (GE) · 357 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_gameplaySelector_tileGenerators_levelTiles` : `extensions.load("ui_gameplaySelector_tileGenerators_levelTiles")`, puis la globale `ui_gameplaySelector_tileGenerators_levelTiles`

Générateur de tuiles du sélecteur freeroam : une tuile par point d'apparition (spawn point) de chaque niveau de core_levels.getList(). Il construit aussi le panneau de détails d'un niveau (taille, biome, routes, pays…), les boutons « Start Freeroam » et « Configure », le filtrage par texte de recherche et l'ouverture de la fenêtre de configuration de niveau. Un moddeur peut y brancher ses propres boutons via le hook onFreeroamSelectorGetDetails.

## Remarques

- Les tuiles sont valides pour le backend freeroamSelector, pas pour gameplaySelector (validBackends). Elles sont donc ajoutées sans test sur backend.backendName.
- Si plusieurs points d'apparition d'un même niveau sont marqués par défaut, une erreur « Default spawnpoint count is greater than 1 » est journalisée.
- La taille du niveau est affichée en km (métrique) ou en miles selon le réglage uiUnitLength ; une dimension négative signifie « infini ».
- Si backend.getCustomDetailsButtons() renvoie des boutons, ils remplacent entièrement les boutons par défaut.
- La tuile du niveau actuellement sélectionné dans freeroam_freeroamConfigurator reçoit cornerIcon = « road ».

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_gameplaySelector_tileGenerators_levelTiles.onFilterCustomLevelTiles(item, searchText, result)` | Hook de filtre déclaré par les tuiles (filterHook). Si le texte de recherche, sans tenir compte de la casse, apparaît dans le biome, l'usage conseillé, les caractéristiques, les routes ou le pays du niveau, met result.match à true. *(interne)* *(hook)* | 280 |
| `ui_gameplaySelector_tileGenerators_levelTiles.onFreeroamSelectorOpenedWithItemDetails(itemDetails, backend)` | Hook appelé quand le sélecteur freeroam s'ouvre avec des détails mémorisés. Rouvre la fenêtre de configuration du niveau avec le niveau, le point d'apparition et itemDetails. *(interne)* *(hook)* | 335 |
| `ui_gameplaySelector_tileGenerators_levelTiles.onGameplaySelectorGetDetails(itemDetails, details, buttonInstance, backend)` | Hook appelé à l'ouverture des détails d'une tuile de niveau. Cherche le niveau et son point d'apparition, remplit titre, description, aperçu, favori, spécifications et étiquettes, puis ajoute les boutons « Start Freeroam » (freeroam_freeroam.startFreeroamByName) et « Configure » (ouvre menu.freeroamconfigurator). Émet le hook onFreeroamSelectorGetDetails pour que d'autres extensions modifient les données. *(interne)* *(hook)* | 185 |
| `ui_gameplaySelector_tileGenerators_levelTiles.onGameplaySelectorGetTiles(items)` | Hook appelé quand le sélecteur collecte ses tuiles. Parcourt les niveaux et, pour chaque point d'apparition, ajoute une tuile (nom « point (niveau) », aperçu, clé spawnPoint_<niveau>_<objet>, région, taille de carte, icônes beamNG, Camshaft ou bug). *(interne)* *(hook)* | 43 |
| `ui_gameplaySelector_tileGenerators_levelTiles.openLevelConfigurationPopup(levelData)` | Déclenche l'évènement UI openLevelConfigurationPopup avec les données du niveau pour afficher la fenêtre de configuration. | 330 |
| `ui_gameplaySelector_tileGenerators_levelTiles.setAlwaysShowDialogue(backendName, newValue)` | Règle l'action par défaut du backend : « configureFreeroam » si newValue est vrai, sinon « startFreeroam » (via ui_gridSelector.setDisplayDataOption). Journalise une erreur si backendName est absent. | 321 |

### Détail des paramètres

#### `ui_gameplaySelector_tileGenerators_levelTiles.onFilterCustomLevelTiles(item, searchText, result)`

Hook de filtre déclaré par les tuiles (filterHook). Si le texte de recherche, sans tenir compte de la casse, apparaît dans le biome, l'usage conseillé, les caractéristiques, les routes ou le pays du niveau, met result.match à true.

- `item` (*table*) : Tuile testée (champ levelName utilisé).
- `searchText` (*string|nil*) : Texte saisi ; vide ou nil, la fonction ne fait rien.
- `result` (*table*) : Table dont le champ match est mis à true en cas de correspondance.

#### `ui_gameplaySelector_tileGenerators_levelTiles.onFreeroamSelectorOpenedWithItemDetails(itemDetails, backend)`

Hook appelé quand le sélecteur freeroam s'ouvre avec des détails mémorisés. Rouvre la fenêtre de configuration du niveau avec le niveau, le point d'apparition et itemDetails.

- `itemDetails` (*table|nil*) : Détails mémorisés ; sans effet si nil.
- `backend` (*table*) : Backend appelant (non utilisé, le nom « freeroamSelector » est fixé dans le code).

#### `ui_gameplaySelector_tileGenerators_levelTiles.onGameplaySelectorGetDetails(itemDetails, details, buttonInstance, backend)`

Hook appelé à l'ouverture des détails d'une tuile de niveau. Cherche le niveau et son point d'apparition, remplit titre, description, aperçu, favori, spécifications et étiquettes, puis ajoute les boutons « Start Freeroam » (freeroam_freeroam.startFreeroamByName) et « Configure » (ouvre menu.freeroamconfigurator). Émet le hook onFreeroamSelectorGetDetails pour que d'autres extensions modifient les données.

- `itemDetails` (*table*) : Données showDetails (levelName, spawnPointObjectName, key).
- `details` (*table*) : Liste de blocs de détails à compléter.
- `buttonInstance` (*table*) : Objet fournissant addButton.
- `backend` (*table*) : Backend offrant isFavourite, trackRecent, getUiData et getCustomDetailsButtons.

#### `ui_gameplaySelector_tileGenerators_levelTiles.onGameplaySelectorGetTiles(items)`

Hook appelé quand le sélecteur collecte ses tuiles. Parcourt les niveaux et, pour chaque point d'apparition, ajoute une tuile (nom « point (niveau) », aperçu, clé spawnPoint_<niveau>_<objet>, région, taille de carte, icônes beamNG, Camshaft ou bug).

- `items` (*table*) : Liste de tuiles à compléter (modifiée en place).

#### `ui_gameplaySelector_tileGenerators_levelTiles.openLevelConfigurationPopup(levelData)`

Déclenche l'évènement UI openLevelConfigurationPopup avec les données du niveau pour afficher la fenêtre de configuration.

- `levelData` (*table*) : Table avec levelName, spawnPointObjectName, level, spawnPoint, backendName, itemDetails.

#### `ui_gameplaySelector_tileGenerators_levelTiles.setAlwaysShowDialogue(backendName, newValue)`

Règle l'action par défaut du backend : « configureFreeroam » si newValue est vrai, sinon « startFreeroam » (via ui_gridSelector.setDisplayDataOption). Journalise une erreur si backendName est absent.

- `backendName` (*string*) : Nom du backend du sélecteur.
- `newValue` (*boolean*) : true pour toujours montrer la fenêtre de configuration.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onFreeroamSelectorGetDetails`

**Évènements UI (guihooks.trigger) :** `openLevelConfigurationPopup`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/gameplaySelector/tileGenerators/levelTiles.lua`.*
