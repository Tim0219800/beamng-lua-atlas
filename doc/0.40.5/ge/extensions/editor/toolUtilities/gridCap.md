# `editor_toolUtilities_gridCap`

*Fichier : `lua/ge/extensions/editor/toolUtilities/gridCap.lua` · VM : Game Engine (GE) · 356 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_gridCap` : `extensions.load("editor_toolUtilities_gridCap")`, puis la globale `editor_toolUtilities_gridCap`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_gridCap.build(rings, cf, zAt, cell)` | The cap over `rings` (the outline, then its holes; open or closed) in world space, as the flat `mesh` (see above), or nil.<br>`cf` is the grain (`ax, ay` along it, `inX, inY` across), `zAt(x, y)` the field, `cell` the grid's pitch. A point on a<br>ring whose nodes carry heights keeps the straight line between them, since that is where its edging is swept; a ring<br>given without heights takes the field's along it. | 206 |
| `editor_toolUtilities_gridCap.reaching(outer, rings, cf, cell)` | Those of `rings` that can reach a cell of the grid a cap over `outer` is laid on. Any other is never clipped into a cell<br>and never holds a cell's centre, so the cap comes out the same without it. | 330 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/gridCap.lua`.*
