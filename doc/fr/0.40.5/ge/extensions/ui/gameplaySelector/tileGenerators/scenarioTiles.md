# `ui_gameplaySelector_tileGenerators_scenarioTiles`

*Fichier : `lua/ge/extensions/ui/gameplaySelector/tileGenerators/scenarioTiles.lua` · VM : Game Engine (GE) · 204 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_gameplaySelector_tileGenerators_scenarioTiles` : `extensions.load("ui_gameplaySelector_tileGenerators_scenarioTiles")`, puis la globale `ui_gameplaySelector_tileGenerators_scenarioTiles`

Générateur de tuiles du sélecteur de gameplay pour les scénarios (système hérité). Il ajoute une tuile par scénario renvoyé par scenario_scenariosLoader.getList et construit le panneau de détails avec un bouton « Start Scenario ». Les scénarios multijoueur local sont classés dans le système scenariosMultiplayer.

## Remarques

- Les tuiles ne sont ajoutées que pour le backend gameplaySelector. La tuile « More Scenarios... » est commentée dans le code et n'existe donc pas.
- Les détails affichent toujours « Scenario system is outdated. » (système hérité).
- Les spécifications incluent difficulté, auteurs, date, carte, nombre de joueurs locaux, objectifs (goals) et attributs additionnels.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_gameplaySelector_tileGenerators_scenarioTiles.onGameplaySelectorGetDetails(itemDetails, details, buttonInstance, backend)` | Hook appelé à l'ouverture des détails d'une tuile. Si itemDetails.scenarioSourceFile existe, charge le scénario et ajoute dans details un bloc (titre, description, aperçu, favori, spécifications, étiquettes officiel, auxiliaire, multijoueur, mod) avec un bouton « Start Scenario » qui enregistre l'élément comme récent puis appelle scenario_scenariosLoader.start. *(interne)* *(hook)* | 148 |
| `ui_gameplaySelector_tileGenerators_scenarioTiles.onGameplaySelectorGetTiles(items, backend)` | Hook appelé quand le sélecteur collecte ses tuiles. Pour le backend gameplaySelector, ajoute une tuile par scénario (nom traduit, aperçu, niveau, clé scenario_<sourceFile>). Un scénario dont playersCountRange.max dépasse 1 reçoit l'icône helmets et le type scenarioMultiplayer ; les icônes beamNG et bug signalent les scénarios officiels et auxiliaires. *(interne)* *(hook)* | 7 |

### Détail des paramètres

#### `ui_gameplaySelector_tileGenerators_scenarioTiles.onGameplaySelectorGetDetails(itemDetails, details, buttonInstance, backend)`

Hook appelé à l'ouverture des détails d'une tuile. Si itemDetails.scenarioSourceFile existe, charge le scénario et ajoute dans details un bloc (titre, description, aperçu, favori, spécifications, étiquettes officiel, auxiliaire, multijoueur, mod) avec un bouton « Start Scenario » qui enregistre l'élément comme récent puis appelle scenario_scenariosLoader.start.

- `itemDetails` (*table*) : Données showDetails de la tuile (scenarioSourceFile, key).
- `details` (*table*) : Liste de blocs de détails à compléter.
- `buttonInstance` (*table*) : Objet fournissant addButton.
- `backend` (*table*) : Backend offrant isFavourite et trackRecent.

#### `ui_gameplaySelector_tileGenerators_scenarioTiles.onGameplaySelectorGetTiles(items, backend)`

Hook appelé quand le sélecteur collecte ses tuiles. Pour le backend gameplaySelector, ajoute une tuile par scénario (nom traduit, aperçu, niveau, clé scenario_<sourceFile>). Un scénario dont playersCountRange.max dépasse 1 reçoit l'icône helmets et le type scenarioMultiplayer ; les icônes beamNG et bug signalent les scénarios officiels et auxiliaires.

- `items` (*table*) : Liste de tuiles à compléter (modifiée en place).
- `backend` (*table*) : Backend appelant ; backendName doit valoir « gameplaySelector ».

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/gameplaySelector/tileGenerators/scenarioTiles.lua`.*
