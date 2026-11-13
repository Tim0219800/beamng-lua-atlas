# `editor_toolUtilities_deckSweep`

*Fichier : `lua/ge/extensions/editor/toolUtilities/deckSweep.lua` · VM : Game Engine (GE) · 180 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_deckSweep` : `extensions.load("editor_toolUtilities_deckSweep")`, puis la globale `editor_toolUtilities_deckSweep`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_deckSweep.build(dp, sec, opts)` | Sweep the deck along the dense line `dp` (vec3s or {x,y,z} tables).<br> sec  = { extL, extR, fwL, fwR (numbers or per-station arrays), crown, flatEnd (m the crown eases out to flat over at each end;<br>          nil/0 = none), slabT, topMat, bodyMat, chamfer = { len, drop, lipT } \| nil }<br> opts = { tol (plan chordal tolerance, m), tolZ (vertical chordal tolerance, m; nil = tol bounds both), maxSeg (longest kept gap, m) }<br> Returns the parts plus the kept dense station indices, or nil for a degenerate line. | 126 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/deckSweep.lua`.*
