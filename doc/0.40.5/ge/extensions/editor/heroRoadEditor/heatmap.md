# `editor_heroRoadEditor_heatmap`

*Fichier : `lua/ge/extensions/editor/heroRoadEditor/heatmap.lua` · VM : Game Engine (GE) · 188 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_heroRoadEditor_heatmap` : `extensions.load("editor_heroRoadEditor_heatmap")`, puis la globale `editor_heroRoadEditor_heatmap`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_heroRoadEditor_heatmap.compute(group)` | Fills group.heatGrade[i] / group.heatRadius[i] (0 = compliant .. 1 = full violation). | 40 |
| `editor_heroRoadEditor_heatmap.draw(group, metric)` | Draws the filled violation ribbon for the selected road only (matches Master Spline; bounds cost). Two half-panels per<br> segment (outer-left -> crown, crown -> outer-right) so it hugs the cambered/banked deck. Colour per near station via<br> Master Spline's blue->red ramp; both windings so it reads from any angle. `metric` is 'grade' or 'radius'. | 159 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `classOrder` | table |  |
| `classes` | table | Public interface. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/heroRoadEditor/heatmap.lua`.*
