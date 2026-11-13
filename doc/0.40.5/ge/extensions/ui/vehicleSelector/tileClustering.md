# `ui_vehicleSelector_tileClustering`

*Fichier : `lua/ge/extensions/ui/vehicleSelector/tileClustering.lua` · VM : Game Engine (GE) · 328 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_vehicleSelector_tileClustering` : `extensions.load("ui_vehicleSelector_tileClustering")`, puis la globale `ui_vehicleSelector_tileClustering`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_vehicleSelector_tileClustering.clusterItems(configs, clusterMode)` | Cluster configs by the specified cluster mode | 280 |
| `ui_vehicleSelector_tileClustering.createTileFromClusteredItems(clusteredItems, group, clusterMode)` | Create tile from clustered items | 309 |
| `ui_vehicleSelector_tileClustering.getClusterModeFunction(clusterMode)` | Get cluster mode function | 318 |
| `ui_vehicleSelector_tileClustering.getClusteredItemsFavouriteIconPercent(clusteredItems)` | Get favourite and recent vehicle statistics for clustered items | 24 |
| `ui_vehicleSelector_tileClustering.getClusteredItemsStats(clusteredItems, sortMode)` | Get statistics for clustered items (preview, model, config selection) | 46 |
| `ui_vehicleSelector_tileClustering.getSources(config, model, onlyIcons)` | Get sources for a config | 92 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/vehicleSelector/tileClustering.lua`.*
