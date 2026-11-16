# `ui_gridSelectorUtils_tilesModule`

*Fichier : `lua/ge/extensions/ui/gridSelectorUtils/tilesModule.lua` · VM : Game Engine (GE) · 249 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_gridSelectorUtils_tilesModule` : `extensions.load("ui_gridSelectorUtils_tilesModule")`, puis la globale `ui_gridSelectorUtils_tilesModule`

Utilitaire des sélecteurs en grille : moteur générique de production des tuiles. À partir d'une config (convertisseur item -> tuile, gestionnaires par type de chemin, regroupement, tri, source de données), il aiguille chaque demande de tuiles vers le gestionnaire correspondant à la première clé du chemin et fournit à ce gestionnaire un « contexte » d'aides (finalisation des groupes, sélection par défaut, clustering, groupes favoris/récents).

## Remarques

- Le gestionnaire est cherché dans config.pathHandlers[path.keys[1]] ; s'il n'existe pas, getTiles renvoie une table vide.
- Le hook `onGridSelectorGetTiles(backendName, pathType)` n'est émis que si `pathChanged` est vrai.
- finalizeGroups : limite le groupe « récents » à 15 tuiles, retire les groupes vides et trie par `order` puis par nom (sortingModule.sortByNameButOtherAlwaysLast).
- setDefaultSelection : tuile par défaut = default_pc du modèle, sinon la tuile imposée par overrideDefaultSelectedTile (forceAutoFocus = true), sinon la dernière tuile du groupe ; elle reçoit isDefaultSelected = true.
- Dans matchesGroup, la variable locale groupName masque le paramètre du même nom (`local groupName, _ = ...`) ; le test final `validGroups[groupName]` utilise le paramètre d'origine, donc il reste cohérent mais le code est trompeur. Les modes Favourites/Recent renvoient toujours true (filtrage laissé à l'appelant).
- Le profileur est désactivé (fonctions vides) ; une ligne commentée permet de l'activer.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_gridSelectorUtils_tilesModule.create(config)` | Crée une instance de production de tuiles. | 4 |

### Détail des paramètres

#### `ui_gridSelectorUtils_tilesModule.create(config)`

Crée une instance de production de tuiles.

- `config` (*table*) : { itemToTileConverter, pathHandlers (table typeChemin -> function(path, data, context)), clusteringFunction, groupingModule, sortingModule, getDataFunction, filterFunction, backendName (défaut "gridSelector"), profilerName }.
- **renvoie** : table Instance avec getTiles et createContext.

## Classe `instance`

Objet renvoyé par create().

| Méthode | Description | Ligne |
|---|---|---|
| `instance:createContext(data, overrideDefaultSelectedTile, tileFromClusteredItems)` | Construit le contexte passé aux gestionnaires : itemToTileConverter, filterFunction, clusteringFunction, groupingModule, sortingModule, finalizeGroups, setDefaultSelection, matchesGroup, processClusteredItems, handleSpecialGroups, profiler, backendName, data. | dyn |
| `instance:getTiles(path, pathChanged, overrideDefaultSelectedTile, tileFromClusteredItems)` | Appelle getDataFunction(), construit le contexte et délègue au gestionnaire du premier segment du chemin. Renvoie le résultat du gestionnaire (liste de groupes) ou {}. | dyn |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onGridSelectorGetTiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/gridSelectorUtils/tilesModule.lua`.*
