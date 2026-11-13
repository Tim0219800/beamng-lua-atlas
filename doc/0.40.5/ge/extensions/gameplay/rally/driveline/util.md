# `gameplay_rally_driveline_util`

*Fichier : `lua/ge/extensions/gameplay/rally/driveline/util.lua` · VM : Game Engine (GE) · 16 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_driveline_util` : `extensions.load("gameplay_rally_driveline_util")`, puis la globale `gameplay_rally_driveline_util`

Constantes d'édition de la driveline de rallye (spline éditable construite à partir de l'enregistrement de reconnaissance). Utilisées par drivelineV3 : largeur par défaut des nœuds, tolérance de simplification RDP, nombre minimal de subdivisions et espacement minimal de la spline.

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultSimplificationTolerance` | number | Tolérance de l'algorithme RDP lors de la simplification des points enregistrés : 1.0 (m). |
| `defaultSplineWidth` | number | Largeur par défaut d'un nœud de spline : 10.0 m. |
| `minSplineDivisions` | number | Nombre minimal de subdivisions de la spline : 10. |
| `minSplineSpacing` | number | Espacement minimal entre points subdivisés : 2.0 m. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/driveline/util.lua`.*
