# `ui_vehicleSelector_tileClustering`

*Fichier : `lua/ge/extensions/ui/vehicleSelector/tileClustering.lua` · VM : Game Engine (GE) · 328 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_vehicleSelector_tileClustering` : `extensions.load("ui_vehicleSelector_tileClustering")`, puis la globale `ui_vehicleSelector_tileClustering`

Regroupe les configurations de véhicules en « clusters » (une tuile par modèle ou par marque + sous-modèle) pour la grille du sélecteur de véhicules, et fabrique la tuile de chaque cluster : nom, aperçu, chemin de navigation, favoris et récents, statistiques de la config représentative, icônes de source. Il est appelé par ui_vehicleSelector_tiles ; un moddeur s'en sert peu directement.

## Remarques

- Deux modes de cluster : 'brandSubModelOrModel' (clé = « Marque SousModèle », le sous-modèle valant à défaut la clé du modèle) et 'model' (clé = model_key, suivie du vehicleSelectorSubCluster si useSubCluster est vrai).
- L'aperçu d'un cluster est /vehicles/<modèle>/default.png s'il existe, sinon model.preview, sinon default.jpg. La config représentative est default_pc du modèle (tri Automatic ou Name) ; sinon la dernière de la liste triée selon sortMode.
- getClusteredItemsStats trie clusteredItems.list en place quand sortMode n'est ni 'Automatic' ni 'Name'.
- clusterItems : un mode de cluster inconnu provoque une erreur (clusterModeFunctions[clusterMode] est appelé sans vérification).
- Les tuiles de cluster portent doubleClickMode = 'capture' et un champ gotoPath {'configsForBrandSubModelOrModel', modèle, sous-modèle, marque} suivi de group.gotoParams.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_vehicleSelector_tileClustering.clusterItems(configs, clusterMode)` | Regroupe des configs selon le mode de cluster. Chaque cluster contient configsByKey, count, list, ainsi que years et value (minimums des configs, pour le tri). | 280 |
| `ui_vehicleSelector_tileClustering.createTileFromClusteredItems(clusteredItems, group, clusterMode)` | Crée la tuile d'un cluster selon le mode demandé. | 309 |
| `ui_vehicleSelector_tileClustering.getClusterModeFunction(clusterMode)` | Renvoie la fonction qui calcule le nom de cluster d'une config pour un mode donné. | 318 |
| `ui_vehicleSelector_tileClustering.getClusteredItemsFavouriteIconPercent(clusteredItems)` | Parcourt un cluster pour déterminer les favoris et récents qu'il contient. | 24 |
| `ui_vehicleSelector_tileClustering.getClusteredItemsStats(clusteredItems, sortMode)` | Choisit l'aperçu, le modèle, la config et la config représentative d'un cluster selon sortMode. | 46 |
| `ui_vehicleSelector_tileClustering.getSources(config, model, onlyIcons)` | Renvoie les étiquettes et icônes de provenance d'une config : officielle BeamNG ('beamNG'), personnalisée ('wrench'), Automation (logo SVG), mod ('puzzleModule'), fichiers jbeam manquants ('danger'). | 92 |

### Détail des paramètres

#### `ui_vehicleSelector_tileClustering.clusterItems(configs, clusterMode)`

Regroupe des configs selon le mode de cluster. Chaque cluster contient configsByKey, count, list, ainsi que years et value (minimums des configs, pour le tri).

- `configs` (*table*) : Configs à regrouper (chacune avec key et model_key).
- `clusterMode` (*string*) : 'brandSubModelOrModel' ou 'model'.
- **renvoie** : table<string, table> Clusters indexés par nom de groupe.

#### `ui_vehicleSelector_tileClustering.createTileFromClusteredItems(clusteredItems, group, clusterMode)`

Crée la tuile d'un cluster selon le mode demandé.

- `clusteredItems` (*table*) : Un cluster issu de clusterItems.
- `group` (*table*) : Groupe parent (key, gotoParams).
- `clusterMode` (*string*) : 'brandSubModelOrModel' ou 'model'.
- **renvoie** : table|nil Tuile (key, name, preview, subElementCount, favouriteIdx, recentIdx, gotoPath, doubleClickDetails, sourceIcons, Value, Weight, Top Speed, Power, Power/Weight, 0-60 mph, 0-100 km/h, isAuxiliary...), ou nil si mode inconnu.

#### `ui_vehicleSelector_tileClustering.getClusterModeFunction(clusterMode)`

Renvoie la fonction qui calcule le nom de cluster d'une config pour un mode donné.

- `clusterMode` (*string*) : Mode de cluster.
- **renvoie** : function|nil Fonction (config) -> string, ou nil.

#### `ui_vehicleSelector_tileClustering.getClusteredItemsFavouriteIconPercent(clusteredItems)`

Parcourt un cluster pour déterminer les favoris et récents qu'il contient.

- `clusteredItems` (*table*) : Cluster (configsByKey, count).
- **renvoie** : number Plus grand indice de favori (0 si aucun).
- **renvoie** : number Plus petit indice de récent (math.huge si aucun).
- **renvoie** : number Part des configs favorites, entre 0 et 1.
- **renvoie** : table|nil Config favorite d'indice le plus haut.
- **renvoie** : table|nil Config la plus récente.

#### `ui_vehicleSelector_tileClustering.getClusteredItemsStats(clusteredItems, sortMode)`

Choisit l'aperçu, le modèle, la config et la config représentative d'un cluster selon sortMode.

- `clusteredItems` (*table*) : Cluster.
- `sortMode` (*string*) : Mode de tri (Automatic, Name, Value, Weight, ...).
- **renvoie** : string Chemin de l'image d'aperçu.
- **renvoie** : string Clé du modèle.
- **renvoie** : string Clé de la config représentative.
- **renvoie** : table Config représentative.

#### `ui_vehicleSelector_tileClustering.getSources(config, model, onlyIcons)`

Renvoie les étiquettes et icônes de provenance d'une config : officielle BeamNG ('beamNG'), personnalisée ('wrench'), Automation (logo SVG), mod ('puzzleModule'), fichiers jbeam manquants ('danger').

- `config` (*table*) : Config du véhicule.
- `model` (*table*) : Données du modèle.
- `onlyIcons` (*boolean*) : true pour ne renvoyer que les icônes, sans le texte traduit.
- **renvoie** : string[] Liste d'icônes (et textes si onlyIcons est faux).

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/vehicleSelector/tileClustering.lua`.*
