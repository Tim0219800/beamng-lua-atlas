# `editor_api_terrain`

*Fichier : `lua/ge/extensions/editor/api/terrain.lua` · VM : Game Engine (GE) · 259 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_terrain` : `extensions.load("editor_api_terrain")`, puis la globale `editor_api_terrain`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_terrain.initialize(editorInstance)` |  | 205 |

## Classe `editor`

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.addFoliageBrushToGroup(groupName, foliageBrush)` |  | 157 |
| `editor.alignTerrainWithMesh(x, y, topOrBottom, amount)` |  | 97 |
| `editor.applyTerrainHeightBrushPreset(name)` |  | 41 |
| `editor.averageSmoothTerrain(x, y, amount)` |  | 73 |
| `editor.clearTerrain(x, y)` |  | 89 |
| `editor.createFoliageGroup(name)` |  | 137 |
| `editor.createFoliageMesh(foliageMesh)` |  | 145 |
| `editor.createTerrain(terrainInfo)` |  | 17 |
| `editor.createTerrainPaintMaterial(mtl)` |  | 109 |
| `editor.deleteFoliageBrush(name)` |  | 161 |
| `editor.deleteFoliageGroup(name)` |  | 141 |
| `editor.deleteFoliageMesh(foliageMeshName)` |  | 149 |
| `editor.deleteTerrain(terrainObjectId)` |  | 21 |
| `editor.deleteTerrainHeightBrushPreset(name)` |  | 45 |
| `editor.deleteTerrainPaintBrushPreset(name)` |  | 129 |
| `editor.eraseFoliage(x, y)` |  | 181 |
| `editor.eraseSetFoliageBrushOrGroup(x, y)` |  | 185 |
| `editor.exportTerrainHeightmap(terrainObjectId, filename)` |  | 29 |
| `editor.flattenTerrain(x, y, amount)` |  | 81 |
| `editor.getFoliageMeshes()` |  | 153 |
| `editor.getTerrainHeightBrushPresets()` |  | 49 |
| `editor.getTerrainPaintBrushPresets()` |  | 133 |
| `editor.grabTerrain(x, y, amount)` |  | 53 |
| `editor.importTerrainHeightmap(importInfo)` |  | 25 |
| `editor.loadTerrainPaintBrushPreset(name)` |  | 125 |
| `editor.lowerTerrain(x, y, amount)` |  | 61 |
| `editor.noiseTerrain(x, y, amount)` |  | 77 |
| `editor.paintFoliage(x, y)` |  | 177 |
| `editor.paintTerrain(x, y)` |  | 113 |
| `editor.raiseTerrain(x, y, amount)` |  | 57 |
| `editor.restoreTerrain(x, y)` |  | 93 |
| `editor.rotateFoliageSelection(delta)` |  | 193 |
| `editor.saveTerrainHeightBrushPreset(name)` |  | 37 |
| `editor.saveTerrainPaintBrushPreset(name)` |  | 121 |
| `editor.scaleFoliageSelection(delta)` |  | 197 |
| `editor.selectFoliage(x, y)` |  | 201 |
| `editor.selectTerrainPaintMaterial(mtl)` |  | 105 |
| `editor.setFoliageBrush(brushName)` |  | 169 |
| `editor.setFoliageBrushGroup(name)` |  | 165 |
| `editor.setFoliagePaintBrushSettings(brush)` |  | 173 |
| `editor.setTerrainHeight(x, y, amount)` |  | 85 |
| `editor.setTerrainHeightBrush(brush)` |  | 33 |
| `editor.setTerrainPaintBrush(brush)` |  | 117 |
| `editor.smoothSlopeTerrain(x, y, amount)` |  | 69 |
| `editor.smoothTerrain(x, y, amount)` |  | 65 |
| `editor.subtractMeshFromTerrain(x, y)` |  | 101 |
| `editor.translateFoliageSelection(delta)` |  | 189 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/terrain.lua`.*
