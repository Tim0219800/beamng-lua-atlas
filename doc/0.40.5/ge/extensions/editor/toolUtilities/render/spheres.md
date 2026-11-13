# `editor_toolUtilities_render_spheres`

*Fichier : `lua/ge/extensions/editor/toolUtilities/render/spheres.lua` · VM : Game Engine (GE) · 228 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_render_spheres` : `extensions.load("editor_toolUtilities_render_spheres")`, puis la globale `editor_toolUtilities_render_spheres`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_render_spheres.drawHoverNavGraphNode(p)` |  | 122 |
| `editor_toolUtilities_render_spheres.drawPathNode(p)` |  | 112 |
| `editor_toolUtilities_render_spheres.drawSelectedNavGraphNode(p)` |  | 113 |
| `editor_toolUtilities_render_spheres.drawSphereBar(p)` |  | 43 |
| `editor_toolUtilities_render_spheres.drawSphereBarGhost(p)` |  | 191 |
| `editor_toolUtilities_render_spheres.drawSphereBarHover(p)` |  | 49 |
| `editor_toolUtilities_render_spheres.drawSphereCornerHandleGhost(p)` |  | 188 |
| `editor_toolUtilities_render_spheres.drawSphereCulled(p, scale, col)` |  | 31 |
| `editor_toolUtilities_render_spheres.drawSphereCursor(p, isActive)` |  | 154 |
| `editor_toolUtilities_render_spheres.drawSphereCurveHandle(p)` | Footprint default: green so it stands apart from nodes and cyan bar handles. | 76 |
| `editor_toolUtilities_render_spheres.drawSphereCurveHandleCol(p, coreCol, glowCol)` | Curve (edge-bend / corner-radius) apex handle, colour-parametrised so each tool can theme it (footprint = green, the hero-road<br> engineered corner knob = its own palette green). Base is a steady dot with a soft glow; hover pulses a larger, brighter glow. | 61 |
| `editor_toolUtilities_render_spheres.drawSphereCurveHandleHover(p)` |  | 77 |
| `editor_toolUtilities_render_spheres.drawSphereCurveHandleHoverCol(p, coreCol, glowCol)` |  | 66 |
| `editor_toolUtilities_render_spheres.drawSphereHighlight(p)` |  | 163 |
| `editor_toolUtilities_render_spheres.drawSphereHighlightForeground(p)` |  | 177 |
| `editor_toolUtilities_render_spheres.drawSphereHighlightHover(p)` |  | 78 |
| `editor_toolUtilities_render_spheres.drawSphereHighlightHoverFixed(p, radius)` |  | 88 |
| `editor_toolUtilities_render_spheres.drawSphereHighlightSelected(p)` |  | 95 |
| `editor_toolUtilities_render_spheres.drawSphereHighlightSelectedFixed(p, radius)` |  | 105 |
| `editor_toolUtilities_render_spheres.drawSphereImmediate(p, scale, col)` |  | 153 |
| `editor_toolUtilities_render_spheres.drawSphereJunction(p)` |  | 144 |
| `editor_toolUtilities_render_spheres.drawSphereJunctionDull(p)` |  | 150 |
| `editor_toolUtilities_render_spheres.drawSphereJunctionGhost(p)` |  | 185 |
| `editor_toolUtilities_render_spheres.drawSphereNode(p)` |  | 131 |
| `editor_toolUtilities_render_spheres.drawSphereNodeDull(p)` |  | 162 |
| `editor_toolUtilities_render_spheres.drawSphereNodeForeground(p)` |  | 170 |
| `editor_toolUtilities_render_spheres.drawSphereNodeGhost(p)` | X-ray ghosts: no depth test, faint, so only the part of a handle buried in terrain or a mesh reads as a ghost. | 182 |
| `editor_toolUtilities_render_spheres.drawSphereNodeLocked(p)` |  | 137 |
| `editor_toolUtilities_render_spheres.drawSphereRib(p)` |  | 37 |
| `editor_toolUtilities_render_spheres.getSphereScale(d)` | Public interface. | 26 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/render/spheres.lua`.*
