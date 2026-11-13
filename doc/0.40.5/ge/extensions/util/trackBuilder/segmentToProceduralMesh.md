# `util_trackBuilder_segmentToProceduralMesh`

*Fichier : `lua/ge/extensions/util/trackBuilder/segmentToProceduralMesh.lua` · VM : Game Engine (GE) · 106 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_trackBuilder_segmentToProceduralMesh` : `extensions.load("util_trackBuilder_segmentToProceduralMesh")`, puis la globale `util_trackBuilder_segmentToProceduralMesh`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_trackBuilder_segmentToProceduralMesh.calculatePointCoordinateSystem(segment)` | This function calculates the rotated and scaled vertices, normals and uv X values for this subspline. | 55 |
| `util_trackBuilder_segmentToProceduralMesh.clearShapes()` |  | 48 |
| `util_trackBuilder_segmentToProceduralMesh.compileMeshInfo(segment, lod)` | This function compiles the vertices, normals etc. so that it can be sent to the engine side and create the actual mesh.<br> Also creates caps on the front and or end of the spline if needed. | 76 |
| `util_trackBuilder_segmentToProceduralMesh.getReferences()` |  | 95 |
| `util_trackBuilder_segmentToProceduralMesh.materialize(segment)` | This is the main function which will create the mesh road along the control points. | 16 |
| `util_trackBuilder_segmentToProceduralMesh.rotateVectorByQuat(v, q)` | Rotates a vector by a given quat. | 92 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `settings` | any |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/trackBuilder/segmentToProceduralMesh.lua`.*
