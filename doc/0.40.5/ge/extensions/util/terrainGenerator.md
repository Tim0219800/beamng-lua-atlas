# `util_terrainGenerator`

*Fichier : `lua/ge/extensions/util/terrainGenerator.lua` · VM : Game Engine (GE) · 478 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_terrainGenerator` : `extensions.load("util_terrainGenerator")`, puis la globale `util_terrainGenerator`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_terrainGenerator.new(data)` |  | 468 |

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:centerTerrain()` |  | 105 |
| `C:createTerrain()` |  | 380 |
| `C:exportTerrainMaps(dir, prefix)` |  | 188 |
| `C:getMaxHeight()` |  | 90 |
| `C:getTextureMap(path, matName)` |  | 184 |
| `C:init(data)` |  | 39 |
| `C:loadBitmap(path)` |  | 73 |
| `C:resetTerrain(deleteOnly)` |  | 172 |
| `C:resetUserDir(dir)` |  | 159 |
| `C:saveBitmap(path)` |  | 57 |
| `C:setBitmapFromArray(array)` |  | 118 |
| `C:setDefaultMaterial()` |  | 233 |
| `C:setMaterials(matData)` |  | 249 |
| `C:setPngData(path, size, height, scale, flipY)` |  | 203 |
| `C:setPoint(x, y, z)` |  | 112 |
| `C:setTerrainOffset(vec)` |  | 98 |
| `C:setTextureMaps()` |  | 339 |
| `C:setUserDir(dir)` |  | 211 |

## Appels vers le moteur (C++)

- `FS:` `directoryExists`, `fileExists`, `findFiles`, `removeFile`
- `be:` `reloadCollision`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/terrainGenerator.lua`.*
