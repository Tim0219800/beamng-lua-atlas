# `editor_toolUtilities_curveWiden`

*Fichier : `lua/ge/extensions/editor/toolUtilities/curveWiden.lua` · VM : Game Engine (GE) · 226 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_curveWiden` : `extensions.load("editor_toolUtilities_curveWiden")`, puis la globale `editor_toolUtilities_curveWiden`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_curveWiden.applyDivWidthWiden(group)` | Bakes the per-station curve widening into group.divWidths in place (call once per dirty pass, right after the base widths are<br> sampled). For tools whose mesh is built symmetrically from divWidths this widens the tarmac itself; heroRoad widens its mesh<br> carriageway separately and uses this only to move markings/ribbon out to the widened edge. No-op when nothing widens. | 161 |
| `editor_toolUtilities_curveWiden.arcLengths(div, n)` | Cumulative arc-length along the divPoints (s[1] = 0). Used so runoff is a real distance, not a station count<br> (Catmull-Rom clusters stations at corners, so an index-space window physically collapses exactly at the node). | 44 |
| `editor_toolUtilities_curveWiden.edgeWiden(group, div, s, n, lanesL, lanesR, divided)` | Real-world corner widening (m) per station on each edge, travel-left and travel-right: every lane takes the design<br> vehicle's offtracking on the bend's sustained radius, R - sqrt(R^2 - L^2), dropped under minLaneWidenM, the whole capped<br> at the road's Corner Widening. It goes on the inside edge of the bend; a divided road widens each carriageway on its outer<br> edge, the median having no room for it. Engineered roads only (their curvature is exact). | 175 |
| `editor_toolUtilities_curveWiden.signedCurvatureAt(div, i, n)` | Signed horizontal curvature at station i (0 at endpoints / degenerate). +ve = left turn, -ve = right turn. | 28 |
| `editor_toolUtilities_curveWiden.smoothByDistance(arr, s, n, hw)` | Box-smooths a signed array in place over a PHYSICAL half-window hw (meters), using the arc-length table s.<br> Each sample is weighted by the arc length it stands for, never counted. The window was already made physical so it<br> couldn't collapse at a node, but an unweighted mean over it is still whatever the DENSE side says: the engineered<br> sampler steps curves at R*MAX_CURVE_STEP_RAD (sub-metre, ~0.2 m round a hairpin) and straights at up to 5 m, so a<br> window straddling a tangent point holds tens of corner stations against one or two straight ones and hands the<br> corner ~95% of the average. The runoff that is supposed to ease the width in over curveWidenRunoffM then collapses<br> into a step at the corner boundary -- a lateral kink where the straight meets the arc. Weighting by run length is<br> what engineeredGeom's grade smoothers already do for the same reason. | 62 |
| `editor_toolUtilities_curveWiden.stationWiden(group, div, s, n)` | Per-station TOTAL curve widening (m, split both sides): the auto curvature widening plus any engineered per-corner extraWidenM,<br> arc-length smoothed. Zero on straights / when curveWidenMaxM = 0 with no corner overrides, and zero unless engineered mode. | 125 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `DEFAULT_MAX` | number | Public interface. |
| `DEFAULT_RUNOFF` | number |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/curveWiden.lua`.*
