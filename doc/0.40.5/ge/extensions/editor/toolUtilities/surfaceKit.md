# `editor_toolUtilities_surfaceKit`

*Fichier : `lua/ge/extensions/editor/toolUtilities/surfaceKit.lua` · VM : Game Engine (GE) · 140 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_surfaceKit` : `extensions.load("editor_toolUtilities_surfaceKit")`, puis la globale `editor_toolUtilities_surfaceKit`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_surfaceKit.buildGrid(stamps)` | Build a uniform spatial hash over the stamps so a per-quad lookup is ~O(1) instead of O(#stamps). Cell size = the largest<br> brush radius, so any stamp covering a query point has its centre within one cell of the point's cell (3x3 neighbourhood).<br> Returns nil when there's nothing painted (callers then treat every quad as base). Cheap: rebuilt per full mesh build only. | 84 |
| `editor_toolUtilities_surfaceKit.colOf(i)` |  | 41 |
| `editor_toolUtilities_surfaceKit.count()` | Palette accessors. | 37 |
| `editor_toolUtilities_surfaceKit.get(i)` |  | 38 |
| `editor_toolUtilities_surfaceKit.isAvailable(i, baseMat)` | Whether surface `i` can be painted on a road with this base material (Dry always; others only when a variant material exists). | 62 |
| `editor_toolUtilities_surfaceKit.isBase(i)` |  | 39 |
| `editor_toolUtilities_surfaceKit.labelOf(i)` |  | 40 |
| `editor_toolUtilities_surfaceKit.materialAt(grid, stamps, px, py)` | Palette index of the surface painted at world (px, py): the HIGHEST-index (last-painted) stamp covering the point wins, so a<br> later stroke -- including a Dry erase stroke -- overrides earlier ones. Returns baseIndex when nothing covers it. Orphan<br> stamps far from the road live in cells no quad ever queries, so they cost nothing here. | 101 |
| `editor_toolUtilities_surfaceKit.materialExists(name)` | True when a material of this name is present in the level. | 44 |
| `editor_toolUtilities_surfaceKit.materialOf(i, baseMat)` | Material actually applied to a painted quad of surface `i`: the variant when it exists, else the base material (so a missing<br> variant degrades to base rather than referencing a material that isn't there). | 69 |
| `editor_toolUtilities_surfaceKit.resolveMaterials(baseMat)` | Resolve every surface's material against one base material in a single pass (called once per mesh build, so the per-quad<br> routing is a plain array lookup rather than a scene-tree query). | 75 |
| `editor_toolUtilities_surfaceKit.variantMaterial(i, baseMat)` | Resolved variant material name for surface `i` given the road's base (carriageway) material, or nil when this state has no<br> existing variant (so it isn't paintable on this road). Dry (base) always resolves to the base material itself. | 50 |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/surfaceKit.lua`.*
