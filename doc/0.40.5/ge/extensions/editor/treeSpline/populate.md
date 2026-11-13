# `editor_treeSpline_populate`

*Fichier : `lua/ge/extensions/editor/treeSpline/populate.lua` · VM : Game Engine (GE) · 96 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_treeSpline_populate` : `extensions.load("editor_treeSpline_populate")`, puis la globale `editor_treeSpline_populate`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_treeSpline_populate.adopt(spline, kept)` | Takes back the trees release() let go of (those still in the forest), as they are. | 78 |
| `editor_treeSpline_populate.populateTreeSpline(spline)` | (Re)plants the spline: clears its previous instances, then scatters a fresh evenly-spaced row along the<br> current centreline from the spline's foliage params. | 31 |
| `editor_treeSpline_populate.release(spline)` | Lua reload: the tool lets go of a locked spline's trees without removing them (they are the level's) and returns their keys<br> and positions, for adopt() to find again. | 67 |
| `editor_treeSpline_populate.tryRemove(spline)` | Removes the forest instances previously planted for this spline. | 21 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/treeSpline/populate.lua`.*
