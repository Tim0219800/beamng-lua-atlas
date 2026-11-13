# `editor_toolUtilities_roadsideProps`

*Fichier : `lua/ge/extensions/editor/toolUtilities/roadsideProps.lua` · VM : Game Engine (GE) · 538 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_roadsideProps` : `extensions.load("editor_toolUtilities_roadsideProps")`, puis la globale `editor_toolUtilities_roadsideProps`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_roadsideProps.addPresets(t)` | The stock-art presets above are all a roadside tool asks for. The kit-baked furniture and civic pieces are cut by the<br> prop kit, which is not part of a release, so they live over there and register themselves through here. | 517 |
| `editor_toolUtilities_roadsideProps.beginPointBatch(minGap)` | Point-prop declustering. | 244 |
| `editor_toolUtilities_roadsideProps.commitPool(poolId)` | Burn: flip one pool's transient props, and the lights its lamps throw, to persistent (canSave=true) and detach them from<br> the pool. | 301 |
| `editor_toolUtilities_roadsideProps.endPointBatch()` |  | 248 |
| `editor_toolUtilities_roadsideProps.lampLight(presetKey, px, py, pz, q, scale, col, bright, reach)` | The light record (see siteLights) for a lamp preset standing at (px, py, pz) turned by `q`, or nil for a preset that is<br> not a lamp. `scale`, `col`, `bright` and `reach` are optional, the last three overriding the catalogue's. | 210 |
| `editor_toolUtilities_roadsideProps.orientation(along, up, preIdx, sideSign)` | The rotation a placement gets (see orient), for a tool that stands its own pieces. Shared: use or copy before the next call. | 179 |
| `editor_toolUtilities_roadsideProps.placePoints(opts)` | Place a preset at each supplied world point. `keepPool` and `ownerTag` work as they do in runLine.<br> A point may carry `scl` (a number, or {x,y,z} in the piece's frame) to fit that one instance. | 314 |
| `editor_toolUtilities_roadsideProps.placeScatter(opts)` | Scatter loose meshes at world points (random shape, yaw, lean, size, burial), into a pool. Deterministic in opts.seed.<br>   poolId, folder, shapePaths, points ({x=,y=,z=}), seed, base, var, tiltMax, buryBase, buryVar, collidable, outPositions | 340 |
| `editor_toolUtilities_roadsideProps.poolCount(poolId)` | Number of placed pieces currently in a pool (0 if empty / not built / committed). O(1) array length -- cheap enough to read<br> every frame for a stats readout. | 289 |
| `editor_toolUtilities_roadsideProps.poolList(poolId)` | A pool's placed pieces, for a bake reading them back off the scene. Read only. | 295 |
| `editor_toolUtilities_roadsideProps.removePool(poolId)` | Deletes a caller's pool of placed pieces. | 278 |
| `editor_toolUtilities_roadsideProps.runLine(opts)` | Build (or rebuild) one line of props along a rail. `keepPool` adds to the pool instead of replacing it, which is how<br> a run made of several rails is built -- a parapet broken by its flights arrives as a handful of open spans. | 372 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `presets` | table | Public interface. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/roadsideProps.lua`.*
