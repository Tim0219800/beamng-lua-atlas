# `editor_meshSpline_populationEngine`

*Fichier : `lua/ge/extensions/editor/meshSpline/populationEngine.lua` · VM : Game Engine (GE) · 102 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_meshSpline_populationEngine` : `extensions.load("editor_meshSpline_populationEngine")`, puis la globale `editor_meshSpline_populationEngine`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_meshSpline_populationEngine.clearDerivedGeometry(spline)` |  | 10 |
| `editor_meshSpline_populationEngine.intervalFrame(positions, tangents, normals, index, outPosition, outTangent, outUp, previousAcross)` |  | 75 |
| `editor_meshSpline_populationEngine.sample(spline, spacing, outPositions, outTangents, outNormals, useEvenFit)` | When `useEvenFit` is true, `spacing` is treated as a TARGET: an item is locked to both ends and the interior is spaced<br> as evenly as possible near that target (see geom.sampleSplineEvenFit). Otherwise it's the usual fixed-period walk. | 46 |
| `editor_meshSpline_populationEngine.updateGeometry(spline, minimumDivisions)` |  | 19 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/meshSpline/populationEngine.lua`.*
