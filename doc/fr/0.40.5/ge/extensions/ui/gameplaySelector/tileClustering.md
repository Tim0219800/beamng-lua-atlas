# `ui_gameplaySelector_tileClustering`

*Fichier : `lua/ge/extensions/ui/gameplaySelector/tileClustering.lua` · VM : Game Engine (GE) · 344 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_gameplaySelector_tileClustering` : `extensions.load("ui_gameplaySelector_tileClustering")`, puis la globale `ui_gameplaySelector_tileClustering`

Regroupe les éléments du sélecteur de gameplay en « clusters » (par niveau, par type ou automatiquement selon le système) et fabrique la tuile représentant chaque cluster : nom, aperçu, nombre d'éléments, favori/récent le plus haut, chemin de navigation (gotoPath), icônes de source. Utilisé par ui_gameplaySelector_general, qui doit d'abord appeler setBackend avec un backend exposant isFavourite(key) et isRecent(key).

## Remarques

- Modes de clustering : 'level' (item.level), 'type' (item.type), 'automatic' (selon item.system) et 'none' (tout dans « None »). Valeur par défaut d'un groupe : "Other...".
- Mode automatic : campaigns et « Other Gameplay » -> « None » (pas de regroupement) ; freeroam, scenarios, scenariosMultiplayer -> par niveau ; challenges -> par type ; sinon par niveau si présent.
- Un item est de la forme {key, name, preview, system, level, type, ...} ; un cluster est {itemsByKey, count, list}.
- getClusteredItemsStats : si tous les items sont des freeroamSpawnpoint et que l'un est le point de départ par défaut, son aperçu est utilisé ; si tous ont le même missionTypeLabel, l'aperçu par défaut de la mission est utilisé ; avec sortMode 'Name' le premier par nom ; sinon le premier trouvé (ordre de pairs, non déterministe).
- clusterItems appelle clusterModeFunctions[clusterMode] sans test : un mode inconnu lève une erreur Lua.
- Aucun champ non défini ; M.clusterItems, createTileFromClusteredItems et getClusterModeFunction sont définis directement avec function M.x, les trois autres via la section « Public API ».

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_gameplaySelector_tileClustering.clusterItems(items, clusterMode)` | Répartit les items dans des clusters selon le mode donné. | 307 |
| `ui_gameplaySelector_tileClustering.createTileFromClusteredItems(clusteredItems, group, clusterMode)` | Construit la tuile d'un cluster selon le mode (level, type ou automatic). | 326 |
| `ui_gameplaySelector_tileClustering.getClusterModeFunction(clusterMode)` | Renvoie la fonction qui donne le nom de groupe d'un item pour un mode. | 335 |
| `ui_gameplaySelector_tileClustering.getClusteredItemsFavouriteIconPercent(clusteredItems)` | Calcule les statistiques favoris/récents d'un cluster. | 40 |
| `ui_gameplaySelector_tileClustering.getClusteredItemsStats(clusteredItems, sortMode)` | Choisit l'item représentatif d'un cluster et son aperçu (image par défaut /gameplay/default/preview.jpg). | 67 |
| `ui_gameplaySelector_tileClustering.getSourceIcons(clusteredItems)` | Collecte les icônes de source (item.sourceIcons) d'un cluster sans doublon, triées : beamNG, camshaft, puzzleModule, cup, bug d'abord, puis les autres par nom. | 141 |
| `ui_gameplaySelector_tileClustering.setBackend(_backend)` | Enregistre le backend utilisé pour savoir si un item est favori ou récent (backend.isFavourite(key), backend.isRecent(key)). | 4 |

### Détail des paramètres

#### `ui_gameplaySelector_tileClustering.clusterItems(items, clusterMode)`

Répartit les items dans des clusters selon le mode donné.

- `items` (*table*) : Items à regrouper (parcourus avec pairs), chacun avec un champ key.
- `clusterMode` (*string*) : 'level', 'type', 'automatic' ou 'none'.
- **renvoie** : table<string, {itemsByKey: table, count: integer, list: table}> Clusters indexés par nom de groupe.

#### `ui_gameplaySelector_tileClustering.createTileFromClusteredItems(clusteredItems, group, clusterMode)`

Construit la tuile d'un cluster selon le mode (level, type ou automatic).

- `clusteredItems` (*table*) : Un cluster {itemsByKey, count, list}.
- `group` (*table*) : Groupe parent : key, gotoParams, isRecentGroup, isFavouriteGroup.
- `clusterMode` (*string*) : 'level', 'type' ou 'automatic'.
- **renvoie** : table|nil Tuile {key, name, preview, subElementCount, favouriteIdx, recentIdx, gotoPath, showFavouriteIconPercent, doubleClickDetails, doubleClickMode, sourceIcons, isAuxiliary, ...} ; nil pour un mode sans tuile ('none').

#### `ui_gameplaySelector_tileClustering.getClusterModeFunction(clusterMode)`

Renvoie la fonction qui donne le nom de groupe d'un item pour un mode.

- `clusterMode` (*string*) : 'level', 'type', 'automatic' ou 'none'.
- **renvoie** : function|nil function(item) -> string, nil si mode inconnu.

#### `ui_gameplaySelector_tileClustering.getClusteredItemsFavouriteIconPercent(clusteredItems)`

Calcule les statistiques favoris/récents d'un cluster.

- `clusteredItems` (*table*) : Un cluster {itemsByKey, count, list}.
- **renvoie** : number Plus haut indice de favori (0 si aucun).
- **renvoie** : number Plus bas indice de récent (math.huge si aucun).
- **renvoie** : number Part d'items favoris (0 à 1).
- **renvoie** : table|nil Item favori au plus haut indice.
- **renvoie** : table|nil Item le plus récent.

#### `ui_gameplaySelector_tileClustering.getClusteredItemsStats(clusteredItems, sortMode)`

Choisit l'item représentatif d'un cluster et son aperçu (image par défaut /gameplay/default/preview.jpg).

- `clusteredItems` (*table*) : Un cluster {itemsByKey, count, list}.
- `sortMode` (*string|nil*) : 'Name' pour prendre le premier item par ordre alphabétique.
- **renvoie** : string Chemin de l'aperçu.
- **renvoie** : table Item représentatif.

#### `ui_gameplaySelector_tileClustering.getSourceIcons(clusteredItems)`

Collecte les icônes de source (item.sourceIcons) d'un cluster sans doublon, triées : beamNG, camshaft, puzzleModule, cup, bug d'abord, puis les autres par nom.

- `clusteredItems` (*table*) : Un cluster {itemsByKey, count, list}.
- **renvoie** : table[] Liste de {svg = chemin} (si finit par .svg) ou {icon = nom}.

#### `ui_gameplaySelector_tileClustering.setBackend(_backend)`

Enregistre le backend utilisé pour savoir si un item est favori ou récent (backend.isFavourite(key), backend.isRecent(key)).

- `_backend` (*table*) : Backend du sélecteur (ui_gameplaySelector_general ou équivalent).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/gameplaySelector/tileClustering.lua`.*
