# `util_forestGenerator`

*Fichier : `lua/ge/extensions/util/forestGenerator.lua` · VM : Game Engine (GE) · 198 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_forestGenerator` : `extensions.load("util_forestGenerator")`, puis la globale `util_forestGenerator`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_forestGenerator.clearForest()` | deletes all forest items (except for template items) | 176 |
| `util_forestGenerator.createForestItem(itemType, pos, rotDeg, scl)` | creates a single forest item | 57 |
| `util_forestGenerator.createRandomForestRadial(itemTypeArray, amount, pos, radius, rotSteps, minScl, maxScl)` | creates a forest with some randomized parameters (within a radius) | 109 |
| `util_forestGenerator.createRandomForestRect(itemTypeArray, amount, pos, minX, maxX, minY, maxY, rotSteps, minScl, maxScl)` | creates a forest with some randomized parameters (within rectangle bounds) | 68 |
| `util_forestGenerator.deleteForestItem(item)` | deletes a single forest item | 171 |
| `util_forestGenerator.getForestItemDict()` | returns the forest item template | 52 |
| `util_forestGenerator.getForestItemTypes()` | returns an array of all forest item types | 47 |
| `util_forestGenerator.getForestItemsPolygon(polygon)` | returns an array of forest items found within a given polygon (or if none given, returns all items) | 148 |
| `util_forestGenerator.getForestItemsRadius(pos, radius)` | returns an array of forest items found within a given position and radius | 164 |
| `util_forestGenerator.initForest()` | initialize forest data | 23 |
| `util_forestGenerator.updateForestItem(item, pos, rotDeg, scl)` | updates an existing forest item | 141 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/forestGenerator.lua`.*
