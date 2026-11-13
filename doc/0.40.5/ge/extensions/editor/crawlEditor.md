# `editor_crawlEditor`

*Fichier : `lua/ge/extensions/editor/crawlEditor.lua` · VM : Game Engine (GE) · 1444 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_crawlEditor` : `extensions.load("editor_crawlEditor")`, puis la globale `editor_crawlEditor`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_crawlEditor.getAllBoundaries()` |  | 1419 |
| `editor_crawlEditor.getAllMissionBoundaries()` |  | 1420 |
| `editor_crawlEditor.getAllMissionPaths()` |  | 1418 |
| `editor_crawlEditor.getAllMissionTrails()` |  | 1416 |
| `editor_crawlEditor.getAllPaths()` |  | 1417 |
| `editor_crawlEditor.getAllStartingPositions()` |  | 1421 |
| `editor_crawlEditor.getAllTrails()` |  | 1415 |
| `editor_crawlEditor.getSelectedBoundary()` |  | 280 |
| `editor_crawlEditor.getSelectedBoundaryIndex()` |  | 1424 |
| `editor_crawlEditor.getSelectedPath()` |  | 271 |
| `editor_crawlEditor.getSelectedPathIndex()` |  | 1423 |
| `editor_crawlEditor.getSelectedStartingPosition()` |  | 289 |
| `editor_crawlEditor.getSelectedStartingPositionIndex()` |  | 1425 |
| `editor_crawlEditor.getSelectedTrail()` |  | 262 |
| `editor_crawlEditor.getSelectedTrailIndex()` |  | 1422 |
| `editor_crawlEditor.loadAllObjects()` |  | 167 |
| `editor_crawlEditor.markAsDirty(objectType, index)` |  | 304 |
| `editor_crawlEditor.moveTrailToLevel(trail)` |  | 456 |
| `editor_crawlEditor.onDeserialized(data)` | *(hook)* | 860 |
| `editor_crawlEditor.onEditorGui()` | *(hook)* | 873 |
| `editor_crawlEditor.onEditorInitialized()` | *(hook)* | 781 |
| `editor_crawlEditor.onSerialize()` | *(hook)* | 846 |
| `editor_crawlEditor.renameObjectFile(oldFilePath, newFilePath, objectType)` |  | 74 |
| `editor_crawlEditor.setSelectedBoundaryIndex(index)` |  | 1428 |
| `editor_crawlEditor.setSelectedPathIndex(index)` |  | 1427 |
| `editor_crawlEditor.setSelectedStartingPositionIndex(index)` |  | 1429 |
| `editor_crawlEditor.setSelectedTrailIndex(index)` |  | 1426 |

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`, `findFiles`, `removeFile`, `renameFile`, `stat`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/crawlEditor.lua`.*
