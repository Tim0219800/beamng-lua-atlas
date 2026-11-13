# `ui_gameplaySelector_tiles`

*Fichier : `lua/ge/extensions/ui/gameplaySelector/tiles.lua` · VM : Game Engine (GE) · 606 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_gameplaySelector_tiles` : `extensions.load("ui_gameplaySelector_tiles")`, puis la globale `ui_gameplaySelector_tiles`

Cœur du backend « gameplaySelector » : il choisit les tuiles à afficher selon le chemin de navigation (toutes les activités, détail d'un système ou d'un niveau, points d'apparition d'un niveau, page « découverte »). Au chargement il scanne le dossier tileGenerators/ et déclare chaque générateur (ui_gameplaySelector_tileGenerators_<nom>) comme dépendance. Il s'appuie sur les modules tileClustering et tileSorting et fournit les fonctions de regroupement et de tri du sélecteur.

## Remarques

- Les tuiles viennent de backend.getUiData(routeName).items, remplies par les hooks onGameplaySelectorGetTiles des générateurs ; getTiles ne les recalcule pas.
- Pour le backend freeroamSelector, la liste validItems est construite en filtrant sur validBackends mais n'est jamais utilisée ensuite : les handlers reçoivent la liste complète items (incohérence probable).
- Types de chemin reconnus (path.keys[1]) : allGameplay (défaut et chemin inconnu), detailGameplay, spawnPointsForLevel, discoverPage.

**Dépendances (chargées avant) :** `core_locales`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_gameplaySelector_tiles.getTiles(path, _backend, routeName)` | Renvoie les tuiles ou groupes à afficher pour un chemin. Mémorise le backend, met à jour showFavouriteIconPercent de chaque tuile (1 si favori) et le cornerIcon « road » des points d'apparition freeroam sélectionnés, puis route vers le gestionnaire correspondant à path.keys[1]. | 548 |
| `ui_gameplaySelector_tiles.getUiData()` | Renvoie les données d'interface du backend : backendName (« gameplaySelector »), les fonctions de regroupement (Type, Category, Difficulty, Source, System), les fonctions de tri (Name, Difficulty, Duration, Popularity) et le module tileSorting. | 594 |

### Détail des paramètres

#### `ui_gameplaySelector_tiles.getTiles(path, _backend, routeName)`

Renvoie les tuiles ou groupes à afficher pour un chemin. Mémorise le backend, met à jour showFavouriteIconPercent de chaque tuile (1 si favori) et le cornerIcon « road » des points d'apparition freeroam sélectionnés, puis route vers le gestionnaire correspondant à path.keys[1].

- `path` (*table*) : Chemin de navigation : table avec keys (liste de chaînes).
- `_backend` (*table*) : Backend appelant (gameplaySelector ou freeroamSelector), avec getUiData, isFavourite, backendName.
- `routeName` (*string|nil*) : Nom de la route passé à backend.getUiData.
- **renvoie** : table Tuiles ou groupes selon le gestionnaire de chemin.

#### `ui_gameplaySelector_tiles.getUiData()`

Renvoie les données d'interface du backend : backendName (« gameplaySelector »), les fonctions de regroupement (Type, Category, Difficulty, Source, System), les fonctions de tri (Name, Difficulty, Duration, Popularity) et le module tileSorting.

- **renvoie** : table Table backendName, groupModeFunctions, sortModeFunctions, tileSorting.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | core_locales plus une extension par fichier trouvé dans lua/ge/extensions/ui/gameplaySelector/tileGenerators/ (liste construite au chargement du fichier). |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/gameplaySelector/tiles.lua`.*
