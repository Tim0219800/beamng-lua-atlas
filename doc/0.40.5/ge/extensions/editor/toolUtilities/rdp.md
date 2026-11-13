# `editor_toolUtilities_rdp`

*Fichier : `lua/ge/extensions/editor/toolUtilities/rdp.lua` · VM : Game Engine (GE) · 197 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_rdp` : `extensions.load("editor_toolUtilities_rdp")`, puis la globale `editor_toolUtilities_rdp`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_rdp.rdpIndices(nodes, startIdx, endIdx, tol, retListP)` | Performs a Ramer-Douglas-Peucker (RDP) simplification of the given polyline.<br> [Uses line segment instead of infinite line]. | 24 |
| `editor_toolUtilities_rdp.simplifyNodes(nodes, tol)` | Simplifies the given nodes, in place. | 69 |
| `editor_toolUtilities_rdp.simplifyNodesVels(nodes, velocities, tol)` | Simplifies the given nodes (and their corresponding velocities), in place. | 140 |
| `editor_toolUtilities_rdp.simplifyNodesWidths(nodes, widths, tol)` | Simplifies the given nodes (and their corresponding widths), in place. | 92 |
| `editor_toolUtilities_rdp.simplifyNodesWidthsNormals(nodes, widths, normals, tol)` | Simplifies the given nodes (and their corresponding widths and normal vectors), in place. | 116 |
| `editor_toolUtilities_rdp.simplifyNodesWidthsVelVelLimits(nodes, widths, velocities, velLimits, tol)` | Simplifies the given nodes (and their corresponding widths, velocities and velocity limits), in place. | 164 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/rdp.lua`.*
