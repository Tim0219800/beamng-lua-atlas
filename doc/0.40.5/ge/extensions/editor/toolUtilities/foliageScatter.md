# `editor_toolUtilities_foliageScatter`

*Fichier : `lua/ge/extensions/editor/toolUtilities/foliageScatter.lua` · VM : Game Engine (GE) · 659 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_foliageScatter` : `extensions.load("editor_toolUtilities_foliageScatter")`, puis la globale `editor_toolUtilities_foliageScatter`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_foliageScatter.addDraped(fn)` | A tool whose plants stand straight on the terrain hands its item lists over here, so the ground moving under them sets<br>them back on it. `fn(out)` appends each list; a slot may be false. | 602 |
| `editor_toolUtilities_foliageScatter.defaultShrubSelection()` | Like defaultSpeciesSelection but biased to a low shrub. | 124 |
| `editor_toolUtilities_foliageScatter.defaultSpeciesSelection()` | Picks a sensible default species selection from what the level actually has. | 111 |
| `editor_toolUtilities_foliageScatter.ensureForest()` | Returns the level's Forest object, creating an (empty) one if the level has none. | 81 |
| `editor_toolUtilities_foliageScatter.getClassOrder()` | Returns the stable class ordering (for UI). | 545 |
| `editor_toolUtilities_foliageScatter.getClassPresets()` | Returns the class preset table. | 542 |
| `editor_toolUtilities_foliageScatter.getDefaultDistribution()` | Returns a fresh copy of the default distribution params (for seeding a new zone). | 539 |
| `editor_toolUtilities_foliageScatter.itemCrownR(fd, obj)` | How far a ForestItemData mesh reaches out from its origin across the ground at scale 1 (the AABB's widest horizontal<br> side), so it holds whichever way the item is turned. Only a planted item has a box, so one is planted and taken up again. | 70 |
| `editor_toolUtilities_foliageScatter.lift(lists)` | A tool's live planting taken out of the forest for a level save, which writes the forest as it finds it. Each list keeps<br>its slots, and `relay` puts the same items back into them once the save is done. | 169 |
| `editor_toolUtilities_foliageScatter.listForestItemData()` | Lists the ForestItemData names available in the level (sorted). These are the species the tools can plant. | 96 |
| `editor_toolUtilities_foliageScatter.plantOne(it, fd, byName)` | One of them, or nil when its species is not in the level. `byName` caches the species across calls. | 551 |
| `editor_toolUtilities_foliageScatter.redrape(x0, y0, x1, y1)` | Every draped plant inside the world box set back on the terrain under it, seated the way it was planted. A moved item is<br>written back into its list, so the tool holding it holds the moved one. Returns how many moved. | 606 |
| `editor_toolUtilities_foliageScatter.relay(held)` |  | 188 |
| `editor_toolUtilities_foliageScatter.removeItems(fd, items)` | Removes a list of planted forest items (from a previous scatter of the same zone). | 159 |
| `editor_toolUtilities_foliageScatter.scatterArea(params)` | Scatters forest instances inside a polygon and returns the array of placed item handles. | 243 |
| `editor_toolUtilities_foliageScatter.scatterLine(params)` | Scatters an evenly-spaced ROW of forest instances along a resampled centreline. | 372 |
| `editor_toolUtilities_foliageScatter.scatterPoints(params)` | Places exactly one instance at each supplied world point and returns the placed handles. | 489 |
| `editor_toolUtilities_foliageScatter.sowGroups(groups, fd)` | Sow a whole PLAN: a list of anchor groups. A group either names its points and lets the scatter choose what goes on them,<br>or carries the plants themselves already chosen. Both are here because both are what a site honestly has: a bed of shrubs<br>is a recipe, and a wood that was scattered over an area once and must come up the same way again is not. | 581 |

## Appels vers le moteur (C++)

- `obj:` `getObjBox`
- `scenetree.` `findClassObjects`, `findObject`
- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/foliageScatter.lua`.*
