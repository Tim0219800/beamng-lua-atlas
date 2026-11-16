# `ui_vehicleSelector_tiles`

*Fichier : `lua/ge/extensions/ui/vehicleSelector/tiles.lua` · VM : Game Engine (GE) · 700 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_vehicleSelector_tiles` : `extensions.load("ui_vehicleSelector_tiles")`, puis la globale `ui_vehicleSelector_tiles`

Construit les tuiles affichées par la grille du sélecteur de véhicules. Il configure un tilesModule (ui/gridSelectorUtils/tilesModule) avec trois « chemins » : allModels (tous les véhicules, groupés puis regroupés en clusters), configsForBrandSubModelOrModel et configsForModel (liste des configs d'un modèle, avec sous-groupes). Il applique filtres, favoris, récents, tri et sélection par défaut, puis les restrictions des tutoriels de première conduite. Il s'appuie sur tileSorting, tileGrouping et tileClustering.

## Remarques

- La tuile d'une config contient notamment key ('modèle/config'), name, preview, model_key, config_key, configType, showDetails, doubleClickDetails, favouriteIdx, recentIdx, sourceIcons, isAuxiliary, ainsi que Value, Weight, Top Speed, Power, Power/Weight, 0-60 mph et 0-100 km/h.
- getTiles utilise tilesInstance, créé dans onExtensionLoaded : appeler getTiles avant le chargement complet de l'extension provoquerait une erreur.
- Modes d'affichage des favoris et récents : 'hidden', 'reducedClusters', 'completeClusters' et 'unclustered' ; 'completeClusters' enlève les configs individuelles du groupe spécial pour ne garder que les clusters.
- Tri 'Automatic' : récents par recentIdx croissant, favoris par favouriteIdx décroissant, sinon par Value ou Years (selon groupMode) ou par nom. Dans la liste des configs d'un modèle, le tri automatique par défaut est par Value.
- La sélection par défaut est marquée par isDefaultSelected, et forceAutoFocus pour la tuile demandée par overrideDefaultSelectedTile (consommée après le premier getTiles).
- Émet le hook onVehicleSelectorGetTiles(chemin, modelKey, modelSubKey, brandKey, groupMode, groupName) lors de l'affichage des configs d'un modèle.
- Les tuiles du freeroam marquent la sélection courante du configurateur (cornerIcon = 'car') via freeroam_freeroamConfigurator.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_vehicleSelector_tiles.clusterItems(configs)` | Regroupe des configs en clusters selon le clusterMode des options d'affichage (délègue à tileClustering.clusterItems). | 120 |
| `ui_vehicleSelector_tiles.configToTile(config, fullName)` | Convertit une config de véhicule en tuile de la grille. | 78 |
| `ui_vehicleSelector_tiles.emptyProfiler()` | Crée un faux profileur sans effet (start, add, finish). | 9 |
| `ui_vehicleSelector_tiles.getTiles(path, pathChanged)` | Renvoie les groupes de tuiles pour un chemin de sélecteur (allModels, configsForModel, configsForBrandSubModelOrModel), puis applique les restrictions éventuelles de gameplay_discover_firstDrive_vehicleSelectorRestriction et freeroamTutorial_vehicleSelectorRestriction. | 661 |
| `ui_vehicleSelector_tiles.onExtensionLoaded()` | Hook appelé au chargement : crée l'instance tilesModule avec les gestionnaires de chemins, les modules de tri, groupement et clustering, et les fonctions de données et de filtrage de ui_vehicleSelector_general. *(interne)* *(hook)* | 632 |
| `ui_vehicleSelector_tiles.overrideDefaultSelectedTile(tile)` | Définit la tuile à sélectionner et focaliser par défaut au prochain getTiles (le champ model_key et config_key ou key identifient la config). | 130 |

### Détail des paramètres

#### `ui_vehicleSelector_tiles.clusterItems(configs)`

Regroupe des configs en clusters selon le clusterMode des options d'affichage (délègue à tileClustering.clusterItems).

- `configs` (*table*) : Configs à regrouper.
- **renvoie** : table Clusters indexés par nom.

#### `ui_vehicleSelector_tiles.configToTile(config, fullName)`

Convertit une config de véhicule en tuile de la grille.

- `config` (*table*) : Config (avec key et model_key).
- `fullName` (*boolean|nil*) : true pour utiliser le nom complet (Name) plutôt que la Configuration.
- **renvoie** : table Tuile.

#### `ui_vehicleSelector_tiles.emptyProfiler()`

Crée un faux profileur sans effet (start, add, finish).

- **renvoie** : table Objet {start, add, finish}.

#### `ui_vehicleSelector_tiles.getTiles(path, pathChanged)`

Renvoie les groupes de tuiles pour un chemin de sélecteur (allModels, configsForModel, configsForBrandSubModelOrModel), puis applique les restrictions éventuelles de gameplay_discover_firstDrive_vehicleSelectorRestriction et freeroamTutorial_vehicleSelectorRestriction.

- `path` (*table*) : Chemin {keys = {...}} ; keys[1] est le type de chemin.
- `pathChanged` (*boolean|nil*) : Indique que le chemin a changé (transmis à tilesModule).
- **renvoie** : table Liste de groupes {key, label, tiles, ...}.

#### `ui_vehicleSelector_tiles.overrideDefaultSelectedTile(tile)`

Définit la tuile à sélectionner et focaliser par défaut au prochain getTiles (le champ model_key et config_key ou key identifient la config).

- `tile` (*table|nil*) : Tuile cible, ou nil.

## Champs

| Champ | Type | Description |
|---|---|---|
| `getClusteredItemsFavouriteIconPercent` | function | Alias de tileClustering.getClusteredItemsFavouriteIconPercent. |
| `getClusteredItemsStats` | function | Alias de tileClustering.getClusteredItemsStats. |
| `getConfigOrModelPropValue` | function | Alias de tileGrouping.getConfigOrModelPropValue. |
| `getSources` | function | Alias de tileClustering.getSources. |
| `groupModeFunctions` | table | Alias de tileGrouping.groupModeFunctions. |
| `sortByNameButOtherAlwaysLast` | function | Alias du comparateur de tileSorting. |
| `sortByValue` | function | Alias du comparateur de tileSorting. |
| `sortByYears` | function | Alias du comparateur de tileSorting. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onVehicleSelectorGetTiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/vehicleSelector/tiles.lua`.*
