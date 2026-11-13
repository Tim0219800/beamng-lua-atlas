# `editor_toolUtilities_terrainPainter`

*Fichier : `lua/ge/extensions/editor/toolUtilities/terrainPainter.lua` · VM : Game Engine (GE) · 221 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_terrainPainter` : `extensions.load("editor_toolUtilities_terrainPainter")`, puis la globale `editor_toolUtilities_terrainPainter`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_terrainPainter.paint(group, runs)` | Paints the given spline: work its footprint out, then paint that. `runs` (optional, divPoint index pairs { i0, i1 }): only<br> those stretches of it, into the one record. | 143 |
| `editor_toolUtilities_terrainPainter.paintPolygon(store, poly, materialIdx, skip)` | Paint one closed world-XY polygon in the given terrain material, recording what was there into `store` so it can be put<br> back. `skip`, if given, is asked about each point and leaves the ground it claims alone. | 83 |
| `editor_toolUtilities_terrainPainter.revert(group)` | Reverts the terrain under whatever was painted back to the state it had before. | 179 |
| `editor_toolUtilities_terrainPainter.revertAll(groups)` | Reverts all terrain painting for all groups. | 207 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/terrainPainter.lua`.*
