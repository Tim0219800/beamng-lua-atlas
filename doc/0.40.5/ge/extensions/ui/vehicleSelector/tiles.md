# `ui_vehicleSelector_tiles`

*Fichier : `lua/ge/extensions/ui/vehicleSelector/tiles.lua` · VM : Game Engine (GE) · 700 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_vehicleSelector_tiles` : `extensions.load("ui_vehicleSelector_tiles")`, puis la globale `ui_vehicleSelector_tiles`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_vehicleSelector_tiles.clusterItems(configs)` | Use clustering module function | 120 |
| `ui_vehicleSelector_tiles.configToTile(config, fullName)` |  | 78 |
| `ui_vehicleSelector_tiles.emptyProfiler()` |  | 9 |
| `ui_vehicleSelector_tiles.getTiles(path, pathChanged)` | Main getTiles function - now delegates to the tilesModule | 661 |
| `ui_vehicleSelector_tiles.onExtensionLoaded()` | *(hook)* | 632 |
| `ui_vehicleSelector_tiles.overrideDefaultSelectedTile(tile)` |  | 130 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `getClusteredItemsFavouriteIconPercent` | any | Use clustering module function |
| `getClusteredItemsStats` | any | Use clustering module function |
| `getConfigOrModelPropValue` | any |  |
| `getSources` | any | Use clustering module function |
| `groupModeFunctions` | any | Use grouping module functions |
| `sortByNameButOtherAlwaysLast` | any | Export sorting functions from module |
| `sortByValue` | any |  |
| `sortByYears` | any |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onVehicleSelectorGetTiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/vehicleSelector/tiles.lua`.*
