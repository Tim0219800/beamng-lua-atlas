# `editor_toolUtilities_polyOffset`

*Fichier : `lua/ge/extensions/editor/toolUtilities/polyOffset.lua` · VM : Game Engine (GE) · 96 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_polyOffset` : `extensions.load("editor_toolUtilities_polyOffset")`, puis la globale `editor_toolUtilities_polyOffset`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_polyOffset.lineIntersect(px, py, dx, dy, qx, qy, ex, ey)` |  | 15 |
| `editor_toolUtilities_polyOffset.mitrePt(cx, cy, n1, n2, d)` | One offset point for a vertex turning between two edge normals: the mitre, clamped back along its own bisector where the<br> corner is too sharp to cut. | 24 |
| `editor_toolUtilities_polyOffset.polyline(pts, nrm, d, join)` | Offset a polyline sideways by signed distance d. | 37 |
| `editor_toolUtilities_polyOffset.run(pts, nrm, d, join, overlap)` | A closed ribbon from the line out to its offset. `overlap` is how far the base is sunk into the mass behind it. | 75 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `MITER_LIMIT` | number | Public interface. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/polyOffset.lua`.*
