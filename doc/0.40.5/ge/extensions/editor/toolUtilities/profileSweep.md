# `editor_toolUtilities_profileSweep`

*Fichier : `lua/ge/extensions/editor/toolUtilities/profileSweep.lua` · VM : Game Engine (GE) · 83 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_profileSweep` : `extensions.load("editor_toolUtilities_profileSweep")`, puis la globale `editor_toolUtilities_profileSweep`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_profileSweep.at(a, y, z)` | World point of section point (y, z) at station a. | 22 |
| `editor_toolUtilities_profileSweep.build(st, strips, opts)` | Sweep `strips` along the stations `st` ({ x, y, z, bx, by, bz (across), nx, ny, nz (up), s (arc) } each).<br> strip = { pts = { { y, z }, ... }, nrm = { { ny, nz }, ... } (unit, toward the visible side), mat }<br> opts  = { tol, tolZ, maxSeg (the decimation, as deckSweep), keyL, keyR (the section points it watches, { y, z }) }<br> Returns the parts (one per material) and the kept station indices, or nil for fewer than two stations. | 45 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/profileSweep.lua`.*
