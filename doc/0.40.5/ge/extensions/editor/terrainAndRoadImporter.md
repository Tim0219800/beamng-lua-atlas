# `editor_terrainAndRoadImporter`

*Fichier : `lua/ge/extensions/editor/terrainAndRoadImporter.lua` · VM : Game Engine (GE) · 795 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_terrainAndRoadImporter` : `extensions.load("editor_terrainAndRoadImporter")`, puis la globale `editor_terrainAndRoadImporter`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_terrainAndRoadImporter.conformTerrainToPeaks(filepath)` | Conforms the local terrain to some given peaks | 75 |
| `editor_terrainAndRoadImporter.importRoads(roadPath, DOI, margin)` | Imports a set of roads from the given paths. | 584 |
| `editor_terrainAndRoadImporter.importTerrain(terrPath, zMax)` | Imports a terrain from the given path. | 537 |
| `editor_terrainAndRoadImporter.onEditorGui()` | World editor main callback for rendering the UI. *(hook)* | 673 |
| `editor_terrainAndRoadImporter.onEditorInitialized()` | Called upon world editor initialization. *(hook)* | 767 |
| `editor_terrainAndRoadImporter.reset()` | Removes all decal roads and resets the heightmap/terrain (sets it flat everywhere ie z=0). | 633 |
| `editor_terrainAndRoadImporter.toggleWorldEditor(isOpen)` | Opens/closes the world editor. | 670 |

## Appels vers le moteur (C++)

- `be:` `reloadCollision`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/terrainAndRoadImporter.lua`.*
