# `editor_toolUtilities_skeleton`

*Fichier : `lua/ge/extensions/editor/toolUtilities/skeleton.lua` · VM : Game Engine (GE) · 718 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_skeleton` : `extensions.load("editor_toolUtilities_skeleton")`, puis la globale `editor_toolUtilities_skeleton`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_skeleton.estimateWidths(paths, mask)` | Estimates the widths from the original .png file. | 451 |
| `editor_toolUtilities_skeleton.extractPaths(mask)` | Extracts all paths from given skeletonised mask. | 331 |
| `editor_toolUtilities_skeleton.getPathsFromPng(filepath)` | Converts a .png file to a skeletonised mask and then vectorises it into a series of polylines.<br> [filepath should direct to a .png file of a supported format.]<br> [Returns an array of paths, where each contains a table of 2D points as vec3() and a corresponding widths table.] | 652 |
| `editor_toolUtilities_skeleton.skeletonise(mask)` | Skeletonises a mask using the Guo-Hall algorithm.<br> [The given mask is processed in place, and returned.] | 155 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/skeleton.lua`.*
